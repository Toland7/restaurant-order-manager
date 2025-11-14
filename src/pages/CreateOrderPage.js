import React, { useState, useEffect } from 'react';
import { Trash2, Lock, ArrowLeft, Calendar, Send, CheckCircle } from 'lucide-react';
import { toast } from 'react-hot-toast';
import Header from '../components/ui/Header';
import { usePrefill } from '../PrefillContext';
import useSubscriptionStatus from '../hooks/useSubscriptionStatus';
import { useProfileContext } from '../ProfileContext';
import OrderFlow, { useOrderFlow } from '../components/OrderFlow';
import { supabase, supabaseHelpers } from '../supabase'; // Import supabase for functions.invoke

import ExitConfirmationModal from '../components/modals/ExitConfirmationModal';

import { useNavigate } from 'react-router-dom';

const openLinkInNewTab = (url) => {
    const newWindow = window.open(url, '_blank', 'noopener,noreferrer');
    if (newWindow) newWindow.opener = null;
};

const isMobile = () => {
    return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) || window.innerWidth < 768;
};

const generateEmailLink = (to, subject, body, preferredClient) => {
    const encodedSubject = encodeURIComponent(subject);
    const encodedBody = encodeURIComponent(body);

    switch (preferredClient) {
        case 'gmail': return isMobile() ? `googlegmail://co?to=${to}&subject=${encodedSubject}&body=${encodedBody}` : `https://mail.google.com/mail/?view=cm&fs=1&to=${to}&su=${encodedSubject}&body=${encodedBody}`;
        case 'outlook': return isMobile() ? `ms-outlook://compose?to=${to}&subject=${encodedSubject}&body=${encodedBody}` : `https://outlook.live.com/owa/?path=/mail/action/compose&to=${to}&subject=${encodedSubject}&body=${encodedBody}`;
        default: return `mailto:${to}?subject=${encodedSubject}&body=${encodedBody}`;
    }
};

const CreateOrderPage = ({ scheduledOrders, setScheduledOrders, onOrderSent, multiOrders, setMultiOrders, suppliers, setOrders, user }) => {
    const navigate = useNavigate();
    const { isProUser } = useSubscriptionStatus();
    const { hasPermission } = useProfileContext();
    const canSendOrders = hasPermission('orders:send');
    const canScheduleOrders = hasPermission('orders:schedule');
    const { prefilledData, setPrefilledData } = usePrefill();
    
    // State
    const [showExitConfirm, setShowExitConfirm] = useState(false);
    const [orderMessages, setOrderMessages] = useState(null);
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [wizardOrders, setWizardOrders] = useState([]);
    const [wizardStep, setWizardStep] = useState(0);
    const [newlyCreatedOrders, setNewlyCreatedOrders] = useState([]);

    const futureScheduledOrders = scheduledOrders.filter(o => new Date(o.scheduled_at) > new Date());

    // Effects
    useEffect(() => {
      if (!prefilledData) {
        setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '', email_subject: '', searchTerm: '' }]);
      }
    }, [setMultiOrders, prefilledData]);

    // Functions
    const removeSupplierOrder = (id) => {
      if (multiOrders.length > 1) setMultiOrders(prev => prev.filter(order => order.id !== id));
    };

    const updateSupplierOrder = (id, field, value) => {
      setMultiOrders(prev => prev.map(order => order.id === id ? { ...order, [field]: value } : order));
    };

    const handleAddSupplier = (supplierId) => {
      if (!isProUser && multiOrders.length >= 1 && multiOrders.some(o => o.supplier)) {
        toast.error("Aggiungere più fornitori in un unico ordine è una funzionalità PRO.");
        return;
      }
      if (supplierId) {
        if (multiOrders.length === 1 && !multiOrders[0].supplier) {
          updateSupplierOrder(multiOrders[0].id, 'supplier', supplierId);
        } else {
          setMultiOrders(prev => [...prev, { id: Date.now(), supplier: supplierId, items: {}, additional: '', email_subject: '', searchTerm: '' }]);
        }
      }
    };

    const generateOrderMessage = (supplier, items, additional) => {
      if (!supplier) return '';
      let message = supplier.message_template + `\n\n`;
      Object.entries(items).forEach(([product, quantity]) => {
        if (quantity && quantity !== '0') message += `• ${product}: ${quantity}\n`;
      });
      if (additional.trim()) message += additional + '\n';
      message += '\nGrazie!';
      return message;
    };

    const hasUnsavedChanges = () => multiOrders.some(order => order.supplier && (Object.keys(order.items).some(key => order.items[key] && order.items[key] !== '0') || order.additional.trim() || order.email_subject?.trim()));

    const onConfirmExit = () => {
      setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '', email_subject: '', searchTerm: '' }]);
      setShowExitConfirm(false);
      navigate(-1);
    };

    const prepareAndValidateOrders = () => {
        if (!canSendOrders) {
          toast.error("Non hai i permessi per inviare ordini.");
          return null;
        }
        const invalidOrders = [];
        const messages = [];
        const validWizardOrders = [];

        multiOrders.forEach((order, index) => {
            if (!order.supplier) {
                invalidOrders.push(`Ordine ${index + 1}: Seleziona un fornitore`);
                return;
            }
            const supplier = suppliers.find(s => s.id.toString() === order.supplier);
            if (!supplier) return;
            const itemsWithMissingQuantity = Object.keys(order.items).filter(product => order.items[product] === '');
            if (itemsWithMissingQuantity.length > 0) {
                invalidOrders.push(`Ordine ${index + 1} (${supplier.name}): Inserire quantità per ${itemsWithMissingQuantity.join(', ')}`);
                return;
            }
            const message = generateOrderMessage(supplier, order.items, order.additional);
            messages.push({ supplier: supplier.name, message });
            validWizardOrders.push({ ...order, supplier, message, email_subject: order.email_subject });
        });

        if (invalidOrders.length > 0) {
            toast.error(invalidOrders.join('; '));
            return null;
        }
        
        setOrderMessages(messages);
        setWizardOrders(validWizardOrders);
        setWizardStep(0);
        setNewlyCreatedOrders([]);
        return 'ok';
    };

    const handleSendSingleOrder = async (goToNext) => {
        setIsSubmitting(true);
        const order = wizardOrders[wizardStep];

        try {
            const orderData = { user_id: user.id, supplier_id: order.supplier.id, order_message: order.message, additional_items: order.additional || null, status: 'sent' };
            const orderItemsToInsert = Object.entries(order.items).filter(([_, quantity]) => quantity && quantity !== '0').map(([productName, quantity]) => ({ product_name: productName, quantity: parseInt(quantity, 10) || 0 }));
            const newOrder = await supabaseHelpers.createOrder(orderData, orderItemsToInsert);
            setNewlyCreatedOrders(prev => [...prev, { ...newOrder, supplier: order.supplier, message: order.message }]);
            toast.success(`Ordine per ${order.supplier.name} salvato.`);
        } catch (error) {
            console.error('Error saving order:', error);
            toast.error('Errore durante il salvataggio dell\'ordine.');
        } finally {
            setIsSubmitting(false);
        }

        const encodedMessage = encodeURIComponent(order.message);
        let contactLink = '';
        switch (order.supplier.contact_method) {
            case 'whatsapp': {
                const sanitizedContact = order.supplier?.contact?.replace(/\D/g, '') || '';
                contactLink = `https://wa.me/${sanitizedContact}?text=${encodedMessage}`;
                break;
            }
            case 'whatsapp_group': {
                contactLink = `whatsapp://send?text=${encodedMessage}`;
                break;
            }
            case 'email': {
                contactLink = generateEmailLink(
                    order.supplier?.contact || '',
                    order.email_subject || order.supplier?.email_subject || `Ordine Fornitore - ${order.supplier?.name || 'Sconosciuto'}`,
                    order.message,
                    order.supplier?.preferred_email_client
                );
                break;
            }
            case 'sms': {
                const sanitizedContact = order.supplier?.contact?.replace(/\D/g, '') || '';
                contactLink = `sms:${sanitizedContact}?body=${encodedMessage}`;
                break;
            }
            default:
                break;
        }
        openLinkInNewTab(contactLink);

        goToNext();
    };
    
    const handleFinishFlow = () => {
        setOrders(prev => [...newlyCreatedOrders, ...prev]);
        // Reset all local states
        setNewlyCreatedOrders([]);
        setWizardOrders([]);
        setWizardStep(0);
        setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '', email_subject: '', searchTerm: '' }]);
        
        toast.success("Tutti gli Ordini inviati!");
        // Always navigate to home
        navigate('/');
    };

    const linkToScheduledOrder = async (scheduledOrderId) => {
      if (!hasPermission('orders:schedule')) {
        toast.error("Non hai i permessi per programmare ordini.");
        return;
      }
      if (isSubmitting) return;
      setIsSubmitting(true);
      try {
        const targetScheduledOrder = scheduledOrders.find(o => o.id === scheduledOrderId);
        if (!targetScheduledOrder) {
          toast.error("L'ordine programmato selezionato non è stato trovato.");
          setIsSubmitting(false);
          return;
        }
        const scheduledDateTime = new Date(targetScheduledOrder.scheduled_at);

        const newScheduledOrders = [];
        for (const order of multiOrders) {
          if (!order.supplier) continue;

          const orderData = {
            user_id: targetScheduledOrder.user_id,
            supplier_id: order.supplier,
            scheduled_at: scheduledDateTime.toISOString(),
            order_data: JSON.stringify({ items: order.items, additional_items: order.additional, email_subject: order.email_subject })
          };
          
          const newScheduledOrder = await supabaseHelpers.createScheduledOrder(orderData);
          newScheduledOrders.push({ ...newScheduledOrder, suppliers: suppliers.find(s => s.id.toString() === order.supplier) });
        }

        if (newScheduledOrders.length > 0) {
          setScheduledOrders(prev => [...prev, ...newScheduledOrders]);
          toast.success(`${newScheduledOrders.length} nuovi ordini aggiunti alla programmazione.`);
        } else {
          toast.warn("Nessun nuovo ordine valido da aggiungere.");
        }
        
        setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '', email_subject: '', searchTerm: '' }]);
        navigate('/');
      } catch (error) {
        console.error('Error linking to scheduled order:', error);
        toast.error("Errore durante l'aggiunta alla programmazione");
      } finally {
        setIsSubmitting(false);
      }
    };

    const handleCreateNewScheduledOrder = () => {
      if (!hasPermission('orders:schedule')) {
        toast.error("Non hai i permessi per programmare ordini.");
        return;
      }
      const currentOrder = multiOrders[0] || { supplier: '', items: {}, additional: '' };
      setPrefilledData({
        type: 'schedule',
        data: {
          supplier_id: currentOrder.supplier,
          order_data: JSON.stringify({ items: currentOrder.items, additional_items: currentOrder.additional })
        }
      });
      navigate('/schedule');
    };

    return (
      <div className="min-h-screen app-background">
        <Header title="Crea Ordine" onBack={() => { hasUnsavedChanges() ? setShowExitConfirm(true) : navigate(-1); }} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-6">
          <OrderFlow initialStep="selection">
            {/* STEP 1: SELECTION */}
            <OrderFlow.Step name="selection">
              {suppliers.length === 0 && <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 text-center"><p className="text-yellow-800 text-sm mb-3">Non hai ancora fornitori configurati</p><button onClick={() => navigate('/suppliers')} className="text-yellow-600 hover:text-yellow-800 font-medium text-sm">Aggiungi il primo fornitore →</button></div>}
              <div className="space-y-6">
                  {multiOrders.map((order, index) => {
                    const supplierData = suppliers.find(s => s.id.toString() === order.supplier);
                    return (
                      <div key={order.id} className="glass-card p-4">
                        <div className="flex justify-between items-center mb-4">
                          <h3 className="font-medium text-gray-900 dark:text-gray-100">Ordine {index + 1}: {supplierData ? supplierData.name : 'Seleziona Fornitore'}</h3>
                          {isProUser && multiOrders.length > 1 && (
                            <button onClick={() => removeSupplierOrder(order.id)} className="p-1 text-red-500 hover:bg-red-50 rounded" disabled={isSubmitting}><Trash2 size={16} /></button>
                          )}
                        </div>
                        <div className="space-y-4">
                          <div>
                            <label htmlFor={`supplier-select-${order.id}`} className="block text-sm font-medium text-gray-700 mb-2">Seleziona Fornitore</label>
                             <select id={`supplier-select-${order.id}`} name={`supplier-select-${order.id}`} value={order.supplier} onChange={(e) => updateSupplierOrder(order.id, 'supplier', e.target.value)} className="select" disabled={isSubmitting}>
                               <option value="">Scegli un fornitore...</option>
                               {suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier?.name || 'Fornitore senza nome'}</option>)}
                             </select>
                          </div>
                          {supplierData && (
                            <>
                              <div>
                                <h4 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Prodotti Disponibili</h4>
                                {supplierData.products.length === 0 ? (
                                  <div className="text-center py-4"><p className="text-gray-500 text-sm">Nessun prodotto configurato</p></div>
                                ) : (
                                  <>
                                    {isProUser && (
                                      <div className="mb-4">
                                        <input type="text" placeholder="Cerca prodotto..." value={order.searchTerm || ''} onChange={(e) => updateSupplierOrder(order.id, 'searchTerm', e.target.value)} className="input" disabled={isSubmitting}/>
                                      </div>
                                    )}
                                    <div className="space-y-3">
                                      {supplierData.products
                                        .filter(product => !isProUser || product.toLowerCase().includes((order.searchTerm || '').toLowerCase()))
                                        .map(product => (
                                      <div key={product} className="flex items-center justify-between p-2 border border-gray-100 rounded-lg">
                                        <label className="flex items-center space-x-3 flex-1">
                                          <input type="checkbox" checked={order.items.hasOwnProperty(product)} onChange={(e) => {
                                              const newItems = { ...order.items };
                                              if (e.target.checked) { newItems[product] = ''; } else { delete newItems[product]; }
                                              updateSupplierOrder(order.id, 'items', newItems);
                                            }} className="rounded border-gray-300 text-blue-600 focus:ring-blue-500 accent-blue-600 transition-transform active:scale-95" disabled={isSubmitting}/>
                                          <span className="text-sm text-gray-700">{product}</span>
                                        </label>
                                         <input type="text" placeholder="Qt." defaultValue={order.items[product] || ''} onBlur={(e) => updateSupplierOrder(order.id, 'items', { ...order.items, [product]: e.target.value })} className="input-sm w-16 text-center" disabled={isSubmitting}/>
                                      </div>
                                    ))}
                                    </div>
                                  </>
                                )}
                              </div>
                              <div>
                                <label htmlFor={`additional-items-${order.id}`} className="block text-sm font-medium text-gray-700 mb-2">Prodotti Aggiuntivi</label>
                                <textarea id={`additional-items-${order.id}`} value={order.additional} onChange={(e) => updateSupplierOrder(order.id, 'additional', e.target.value)} placeholder="Inserisci prodotti non in lista..." className="input" rows="3" disabled={isSubmitting} />
                              </div>
                            </>
                          )}
                        </div>
                      </div>
                    );
                  })}
                  <div className="relative">
                    <label htmlFor="add-supplier-select" className="block text-sm font-medium text-gray-700 mb-2">Aggiungi Fornitore</label>
                    <select 
                      id="add-supplier-select" 
                      name="add-supplier-select" 
                      onChange={(e) => {
                        handleAddSupplier(e.target.value);
                        e.target.value = '';
                      }} 
                      disabled={(!isProUser && multiOrders.length >= 1 && multiOrders.some(o => o.supplier)) || isSubmitting}
                      className="select mb-4 disabled:bg-gray-200 disabled:cursor-not-allowed"
                    >
                      <option value="">Aggiungi Fornitore...</option>
                      {suppliers.filter(s => !multiOrders.some(o => o.supplier === s.id.toString())).map(supplier => <option key={supplier.id} value={supplier.id}>{supplier?.name || 'Fornitore senza nome'}</option>)}
                    </select>
                    {!isProUser && multiOrders.length >= 1 && multiOrders.some(o => o.supplier) && (
                      <div className="absolute inset-0 bg-white/70 dark:bg-gray-800/70 flex items-center justify-center rounded-lg cursor-pointer" onClick={() => toast.error('Aggiungere più fornitori in un unico ordine è una funzionalità PRO.')}>
                        <span className="text-center text-xs font-bold text-yellow-600 p-2"><Lock className="inline-block mr-1" size={12}/>Funzionalità PRO</span>
                      </div>
                    )}
                  </div>
              </div>

              {multiOrders.some(order => order.supplier && (Object.keys(order.items).some(key => order.items[key] && order.items[key] !== '0') || order.additional.trim())) && (
                <div className="flex space-x-3">
                  <OrderFlow.GoToStepButton stepName="review" onClick={prepareAndValidateOrders} className="btn btn-primary w-full" disabled={!canSendOrders || isSubmitting}>
                    {isSubmitting ? 'Preparazione...' : 'Anteprima e Invia'}
                    {!canSendOrders && <Lock size={12} className="inline-block ml-2" />}
                  </OrderFlow.GoToStepButton>
                  <OrderFlow.GoToStepButton stepName="schedule" onClick={prepareAndValidateOrders} className="btn btn-warning w-full" disabled={!canScheduleOrders || isSubmitting}>
                    {isSubmitting ? 'Preparazione...' : 'Programma'}
                    {!canScheduleOrders && <Lock size={12} className="inline-block ml-2" />}
                  </OrderFlow.GoToStepButton>
                </div>
              )}
            </OrderFlow.Step>

            {/* STEP 2: REVIEW */}
            <OrderFlow.Step name="review">
              <div className="glass-card p-4">
                <h3 className="text-lg font-semibold text-gray-900 dark:text-gray-100 mb-4">Riepilogo Ordine</h3>
                {orderMessages && orderMessages.map((msg, index) => (
                  <div key={index} className="mb-4">
                    <h4 className="font-medium text-gray-800 dark:text-gray-200">{msg.supplier}</h4>
                    <pre className="whitespace-pre-wrap text-sm text-gray-600 dark:text-gray-300 bg-gray-50 dark:bg-gray-700/50 p-3 rounded-lg mt-2">{msg.message}</pre>
                  </div>
                ))}
                <div className="flex space-x-3 mt-6">
                    <OrderFlow.PrevButton className="btn btn-secondary w-full" disabled={isSubmitting}><ArrowLeft size={16} className="inline-block mr-2"/> Modifica</OrderFlow.PrevButton>
                    <OrderFlow.GoToStepButton stepName="send" className="btn btn-primary w-full" disabled={isSubmitting}><Send size={16} className="inline-block mr-2"/> Inizia Invio</OrderFlow.GoToStepButton>
                </div>
              </div>
            </OrderFlow.Step>

            {/* STEP 3: SCHEDULE */}
            <OrderFlow.Step name="schedule">
                <div className="glass-card p-4">
                    <h3 className="text-lg font-semibold text-gray-900 dark:text-gray-100 mb-4">Associa a un ordine programmato</h3>
                    <div className="overflow-y-auto space-y-3 max-h-64">
                      {futureScheduledOrders.length > 0 ? (
                        futureScheduledOrders.map(order => (
                          <button 
                            key={order.id} 
                            onClick={() => linkToScheduledOrder(order.id)}
                            disabled={isSubmitting}
                            className="w-full text-left p-3 bg-gray-100 dark:bg-gray-700 rounded-lg hover:bg-gray-200 dark:hover:bg-gray-600 disabled:opacity-50"
                          >
                            <p className="font-medium text-sm text-blue-600 dark:text-blue-400">{isSubmitting ? 'Associazione...' : suppliers.find(s => s.id === order.supplier_id)?.name || 'Fornitore eliminato'}</p>
                            <p className="text-xs text-gray-600 dark:text-gray-300">{new Date(order.scheduled_at).toLocaleString('it-IT', { dateStyle: 'short', timeStyle: 'short' })}</p>
                          </button>
                        ))
                      ) : (
                        <div className="text-center py-8">
                          <p className="text-gray-600 dark:text-gray-400 mb-4">Nessun ordine futuro programmato.</p>
                          <button
                            onClick={handleCreateNewScheduledOrder}
                            className="btn btn-primary w-full"
                            disabled={isSubmitting}
                          >
                            Crea un nuovo ordine programmato
                          </button>
                        </div>
                      )}
                    </div>
                    <div className="flex space-x-3 mt-6">
                        <OrderFlow.PrevButton className="btn btn-secondary w-full" disabled={isSubmitting}><ArrowLeft size={16} className="inline-block mr-2"/> Annulla</OrderFlow.PrevButton>
                    </div>
                </div>
            </OrderFlow.Step>

            {/* STEP 4: SEND */}
            <OrderFlow.Step name="send">
                <SendOrderComponent 
                    wizardOrders={wizardOrders} 
                    wizardStep={wizardStep} 
                    isSubmitting={isSubmitting}
                    onSend={handleSendSingleOrder}
                    setWizardStep={setWizardStep}
                />
            </OrderFlow.Step>

            {/* STEP 5: SUMMARY */}
            <OrderFlow.Step name="summary">
                <div className="glass-card p-4">
                    <h3 className="font-medium text-dark-gray dark:text-gray-100 mb-4">Riepilogo Invio</h3>
                    <div className="space-y-3">
                        {newlyCreatedOrders.map(order => (
                            <div key={order.id} className="p-3 bg-gray-50 dark:bg-gray-700/50 rounded-lg border border-gray-200 dark:border-gray-600">
                                <div className="flex items-center justify-between mb-2">
                                    <span className="text-sm font-medium text-gray-800 dark:text-gray-200">{order.supplier.name}</span>
                                    <CheckCircle className="text-green-500" size={20} />
                                </div>
                                <pre className="whitespace-pre-wrap text-xs text-gray-600 dark:text-gray-300">{order.message}</pre>
                            </div>
                        ))}
                    </div>
                    <div className="mt-6">
                        <button onClick={handleFinishFlow} className="btn btn-primary w-full" disabled={isSubmitting}>Fine</button>
                    </div>
                </div>
            </OrderFlow.Step>
          </OrderFlow>
        </div>
         <ExitConfirmationModal showExitConfirm={showExitConfirm} setShowExitConfirm={setShowExitConfirm} onConfirmExit={onConfirmExit}/>
      </div>
    );
};

// Helper component for the Send step to consume context
const SendOrderComponent = ({ wizardOrders, wizardStep, isSubmitting, onSend, setWizardStep }) => {
    const { goToStep } = useOrderFlow();
    if (!wizardOrders || wizardOrders.length === 0) return null;

    const order = wizardOrders[wizardStep];
    const isLastStep = wizardStep === wizardOrders.length - 1;

    const handleNext = () => {
        if (isLastStep) {
            goToStep('summary');
        } else {
            setWizardStep(wizardStep + 1);
        }
    };

    return (
        <div className="glass-card p-4">
            <h3 className="font-medium text-dark-gray dark:text-gray-100 mb-4">Invio Ordine {wizardStep + 1} di {wizardOrders.length}</h3>
            <div className="bg-surface p-3 rounded-lg shadow-sm border border-border mb-4">
                <h4 className="font-medium text-dark-gray mb-2">{order.supplier?.name || 'Fornitore sconosciuto'}</h4>
                <pre className="text-sm text-dark-gray whitespace-pre-wrap">{order.message}</pre>
            </div>
            <div className="flex space-x-3">
                <button onClick={() => onSend(handleNext)} disabled={isSubmitting} className="btn btn-primary w-full">
                    {isSubmitting ? <div className="w-4 h-4 border-2 border-blue-600 border-t-transparent rounded-full animate-spin" /> : <Send size={16} />}
                    <span>{isSubmitting ? 'Invio...' : 'Invia e Apri App'}</span>
                </button>
            </div>
        </div>
    );
};

export default CreateOrderPage;