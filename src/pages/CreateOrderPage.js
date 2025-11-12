import React, { useState, useEffect } from 'react';
import { Trash2, Lock } from 'lucide-react';
import { toast } from 'react-hot-toast';
import Header from '../components/ui/Header';
import { usePrefill } from '../PrefillContext';
import useSubscriptionStatus from '../hooks/useSubscriptionStatus';
import { useProfileContext } from '../ProfileContext'; // Import the profile context

import ScheduleOrderModal from '../components/modals/ScheduleOrderModal';
import ConfirmOrderModal from '../components/modals/ConfirmOrderModal';
import ExitConfirmationModal from '../components/modals/ExitConfirmationModal';

import WizardModal from '../components/modals/WizardModal';

import { useNavigate } from 'react-router-dom';



const CreateOrderPage = ({ scheduledOrders, setScheduledOrders, onOrderSent, multiOrders, setMultiOrders, suppliers, setOrders, showWizard, setShowWizard, wizardOrders, setWizardOrders, wizardStep, setWizardStep, user }) => {
    const navigate = useNavigate();
    const { isProUser } = useSubscriptionStatus();
    const { hasPermission } = useProfileContext(); // Use the profile context
    const canSendOrders = hasPermission('orders:send');
    const canScheduleOrders = hasPermission('orders:schedule');
    const { prefilledData, setPrefilledData } = usePrefill();
    const [showConfirm, setShowConfirm] = useState(false);
    const [confirmMessages, setConfirmMessages] = useState(null);
    const [showScheduleModal, setShowScheduleModal] = useState(false);
    const [showExitConfirm, setShowExitConfirm] = useState(false);

    const [newlyCreatedOrders, setNewlyCreatedOrders] = useState([]);

    useEffect(() => {
      // On mount, reset the order form, unless there's prefilled data
      // This ensures a clean state when navigating back to the page
      if (!prefilledData) {
        setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '', email_subject: '', searchTerm: '' }]);
      }
    }, [setMultiOrders, prefilledData]); // Run on mount and if prefilledData changes

    const removeSupplierOrder = (id) => {
      if (multiOrders.length > 1) {
        setMultiOrders(prev => prev.filter(order => order.id !== id));
      }
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

    useEffect(() => {
      if (prefilledData && prefilledData.type === 'order') {
        let orderData;
        try {
          if (typeof prefilledData.data.order_data === 'string') {
            orderData = JSON.parse(prefilledData.data.order_data);
          } else {
            orderData = prefilledData.data.order_data;
          }
        } catch (e) {
          console.error("Failed to parse order_data", e);
          return;
        }

        // Always treat as batch format
        const batchOrder = {
          id: Date.now(),
          supplier: prefilledData.data.supplier_id,
          items: orderData.items || {},
          additional: orderData.additional_items || '',
          email_subject: orderData.email_subject || '',
          searchTerm: ''
        };
        const batchOrders = [batchOrder];
        setMultiOrders(batchOrders);
        setPrefilledData(null);

        if (prefilledData.immediateSend) {
          const messages = batchOrders.map(order => {
            const supplier = suppliers.find(s => s.id.toString() === order.supplier);
            if (!supplier) return null;

            let message = supplier.message_template + `\n\n`;
            Object.entries(order.items).forEach(([product, quantity]) => {
              if (quantity && quantity !== '0') message += `• ${product}: ${quantity}\n`;
            });
            if (order.additional.trim()) message += order.additional + '\n';
            message += '\nGrazie!';

            return { supplier: supplier.name, message };
          }).filter(Boolean);

          if (messages.length > 0) {
            setConfirmMessages(messages);
            setShowConfirm(true);
          } else {
            toast.error("Fornitore non trovato per l'ordine programmato.");
          }
          setPrefilledData(p => ({...p, immediateSend: false}));
        }
      }
    }, [prefilledData, setPrefilledData, suppliers, setConfirmMessages, setShowConfirm, setMultiOrders]);

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

    const hasUnsavedChanges = () => {
      return multiOrders.some(order =>
        order.supplier &&
        (Object.keys(order.items).some(key => order.items[key] && order.items[key] !== '0') ||
         order.additional.trim() ||
         order.email_subject?.trim())
      );
    };

    const onConfirmExit = () => {
      setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '', email_subject: '', searchTerm: '' }]);
      setShowExitConfirm(false);
      navigate(-1);
    };

    const handlePreviewOrder = () => {
        if (!canSendOrders) {
          toast.error("Non hai i permessi per inviare ordini.");
          return;
        }
        const invalidOrders = [];
        const orderMessages = [];
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
            orderMessages.push({ supplier: supplier.name, message });
        });
        if (invalidOrders.length > 0) {
            toast.error(invalidOrders.join('; '));
            return;
        }
        setConfirmMessages(orderMessages);
        setShowConfirm(true);
    };

    const handleScheduleClick = () => {
      if (!canScheduleOrders) {
        toast.error("Non hai i permessi per programmare ordini.");
        return;
      }
      setShowScheduleModal(true);
    };

    const sendOrder = async () => {
      const validOrders = multiOrders.filter(order => order.supplier && Object.keys(order.items).some(key => order.items[key] && order.items[key] !== '0'));
      if (validOrders.length === 0) {
        toast.error('Nessun ordine valido da inviare');
        setShowConfirm(false);
        setConfirmMessages(null);
        return;
      }
      const ordersWithSuppliers = validOrders.map(order => {
        const supplier = suppliers.find(s => s.id.toString() === order.supplier);
        if (!supplier) {
          console.warn(`Supplier with ID ${order.supplier} not found for order. Skipping.`);
          return null; // Mark for removal
        }
        return { ...order, supplier, message: generateOrderMessage(supplier, order.items, order.additional), email_subject: order.email_subject };
      }).filter(Boolean); // Remove null entries

      if (ordersWithSuppliers.length === 0) {
        toast.error('Nessun ordine valido con fornitore trovato da inviare.');
        setShowConfirm(false);
        setConfirmMessages(null);
        return;
      }
      setWizardOrders(ordersWithSuppliers);
      setWizardStep(0);
      setShowWizard(true);
      setShowConfirm(false);
      setConfirmMessages(null);
    };



    return (
      <div className="min-h-screen app-background">
        <Header title="Crea Ordine" onBack={() => {
          if (hasUnsavedChanges()) {
            setShowExitConfirm(true);
          } else {
            navigate(-1);
          }
        }} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-6">

          {suppliers.length === 0 && <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 text-center"><p className="text-yellow-800 text-sm mb-3">Non hai ancora fornitori configurati</p><button onClick={() => navigate('/suppliers')} className="text-yellow-600 hover:text-yellow-800 font-medium text-sm">Aggiungi il primo fornitore →</button></div>}

          <div className="space-y-6">
              {multiOrders.map((order, index) => {
                const supplierData = suppliers.find(s => s.id.toString() === order.supplier);
                return (
                  <div key={order.id} className="glass-card p-4">
                    <div className="flex justify-between items-center mb-4">
                      <h3 className="font-medium text-gray-900 dark:text-gray-100">Ordine {index + 1}: {supplierData ? supplierData.name : 'Seleziona Fornitore'}</h3>
                      {isProUser && multiOrders.length > 1 && (
                        <button onClick={() => removeSupplierOrder(order.id)} className="p-1 text-red-500 hover:bg-red-50 rounded"><Trash2 size={16} /></button>
                      )}
                    </div>
                    <div className="space-y-4">
                      <div>
                        <label htmlFor={`supplier-select-${order.id}`} className="block text-sm font-medium text-gray-700 mb-2">Seleziona Fornitore</label>
                         <select id={`supplier-select-${order.id}`} name={`supplier-select-${order.id}`} value={order.supplier} onChange={(e) => updateSupplierOrder(order.id, 'supplier', e.target.value)} className="select">
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
                                    <input
                                      type="text"
                                      placeholder="Cerca prodotto..."
                                      value={order.searchTerm || ''}
                                      onChange={(e) => updateSupplierOrder(order.id, 'searchTerm', e.target.value)}
                                      className="input"
                                    />
                                  </div>
                                )}
                                <div className="space-y-3">
                                  {supplierData.products
                                    .filter(product => !isProUser || product.toLowerCase().includes((order.searchTerm || '').toLowerCase()))
                                    .map(product => (
                                  <div key={product} className="flex items-center justify-between p-2 border border-gray-100 rounded-lg">
                                    <label className="flex items-center space-x-3 flex-1">
                                      <input
                                        type="checkbox"
                                        id={`product-checkbox-${order.id}-${product}`}
                                        name={`product-checkbox-${order.id}-${product}`}
                                        checked={order.items.hasOwnProperty(product)}
                                        onChange={(e) => {
                                          const newItems = { ...order.items };
                                          if (e.target.checked) {
                                            newItems[product] = '';
                                          } else {
                                            delete newItems[product];
                                          }
                                          updateSupplierOrder(order.id, 'items', newItems);
                                        }}
                                        className="rounded border-gray-300 dark:border-gray-600 text-blue-600 dark:text-blue-400 focus:ring-blue-500 accent-blue-600 dark:accent-blue-400 transition-transform active:scale-95"
                                      />
                                      <span className="text-sm text-gray-700">{product}</span>
                                    </label>
                                     <input
                                       type="text"
                                       id={`quantity-${order.id}-${product}`}
                                       name={`quantity-${order.id}-${product}`}
                                       placeholder="Qt."
                                       defaultValue={order.items[product] || ''}
                                       onBlur={(e) => updateSupplierOrder(order.id, 'items', { ...order.items, [product]: e.target.value })}
                                       className="input-sm w-16 text-center"
                                     />
                                  </div>
                                ))}
                                </div>
                              </>
                            )}
                          </div>
                          <div>
                            <label htmlFor={`additional-items-${order.id}`} className="block text-sm font-medium text-gray-700 mb-2">Prodotti Aggiuntivi</label>
                            <textarea id={`additional-items-${order.id}`} name={`additional-items-${order.id}`} value={order.additional} onChange={(e) => updateSupplierOrder(order.id, 'additional', e.target.value)} placeholder="Inserisci prodotti non in lista..." className="input" rows="3" />
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
                  disabled={!isProUser && multiOrders.length >= 1 && multiOrders.some(o => o.supplier)}
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

            {multiOrders.some(order =>
              order.supplier &&
              (Object.keys(order.items).some(key => order.items[key] && order.items[key] !== '0') ||
               order.additional.trim() ||
               order.email_subject?.trim())
            ) && (
              <div className="flex space-x-3">
                <button onClick={handlePreviewOrder} className="btn btn-primary w-full" disabled={!canSendOrders}>
                  Anteprima {multiOrders.length > 1 ? 'Ordini' : 'Ordine'}
                  {!canSendOrders && <Lock size={12} className="inline-block ml-2" />}
                </button>
                <button onClick={handleScheduleClick} className="btn btn-warning w-full" disabled={!canScheduleOrders}>
                  Programma per dopo
                  {!canScheduleOrders && <Lock size={12} className="inline-block ml-2" />}
                </button>
              </div>
            )}
        </div>
        <ConfirmOrderModal
            showConfirm={showConfirm}
            confirmMessages={confirmMessages}
            isSubmitting={false}
            setShowConfirm={setShowConfirm}
            setConfirmMessages={setConfirmMessages}
            sendOrder={sendOrder}
            generateOrderMessage={generateOrderMessage}
        />

                 <WizardModal
             showWizard={showWizard}
             wizardOrders={wizardOrders}
             wizardStep={wizardStep}
             setWizardStep={setWizardStep}
             user={user}
             setNewlyCreatedOrders={setNewlyCreatedOrders}
             setOrders={setOrders}
             newlyCreatedOrders={newlyCreatedOrders}
             setShowWizard={setShowWizard}
             setWizardOrders={setWizardOrders}
             onOrderSent={onOrderSent}
             setMultiOrders={setMultiOrders}
             onBackToEdit={() => setShowWizard(false)}
         />
         <ExitConfirmationModal
             showExitConfirm={showExitConfirm}
             setShowExitConfirm={setShowExitConfirm}
             onConfirmExit={onConfirmExit}
         />
        {showScheduleModal && <ScheduleOrderModal
            onClose={() => setShowScheduleModal(false)}
            multiOrders={multiOrders}
            scheduledOrders={scheduledOrders}
            setScheduledOrders={setScheduledOrders}
            onSchedule={() => {
              setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '', email_subject: '', searchTerm: '' }]);
              setShowScheduleModal(false);
              navigate('/');
            }}
            suppliers={suppliers}
          />}

      </div>
    );
  };

export default CreateOrderPage;