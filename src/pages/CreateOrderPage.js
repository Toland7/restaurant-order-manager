import React, { useState, useEffect } from 'react';
import { Trash2 } from 'lucide-react';
import { toast } from 'react-hot-toast';
import Header from '../components/ui/Header';
import { usePrefill } from '../PrefillContext';
import { supabaseHelpers } from '../supabase';
import ScheduleOrderModal from '../components/modals/ScheduleOrderModal';
import ConfirmOrderModal from '../components/modals/ConfirmOrderModal';
import OrderTypeModal from '../components/modals/OrderTypeModal';
import WizardModal from '../components/modals/WizardModal';

import { useNavigate } from 'react-router-dom';

const openLinkInNewTab = (url) => {
  const newWindow = window.open(url, '_blank', 'noopener,noreferrer');
  if (newWindow) newWindow.opener = null;
};

const CreateOrderPage = ({ scheduledOrders, setScheduledOrders, onOrderSent, batchMode, setBatchMode, multiOrders, setMultiOrders, suppliers, setOrders, showWizard, setShowWizard, wizardOrders, setWizardOrders, wizardStep, setWizardStep, user }) => {
    const navigate = useNavigate();
    const { prefilledData, setPrefilledData } = usePrefill();
    const [selectedSupplier, setSelectedSupplier] = useState('');
    const [orderItems, setOrderItems] = useState({});
    const [additionalItems, setAdditionalItems] = useState('');
    const [emailSubject, setEmailSubject] = useState('');
    const [showConfirm, setShowConfirm] = useState(false);
    const [confirmMessages, setConfirmMessages] = useState(null);
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [showScheduleModal, setShowScheduleModal] = useState(false);
    const [showTypeModal, setShowTypeModal] = useState(false);

    const [newlyCreatedOrders, setNewlyCreatedOrders] = useState([]);

    const removeSupplierOrder = (id) => {
      if (multiOrders.length > 1) {
        setMultiOrders(prev => prev.filter(order => order.id !== id));
      }
    };

    const updateSupplierOrder = (id, field, value) => {
      setMultiOrders(prev => prev.map(order => order.id === id ? { ...order, [field]: value } : order));
    };

    useEffect(() => {
      if (prefilledData && prefilledData.type === 'order') {
        const newSelectedSupplierId = prefilledData.data.supplier_id;
        setSelectedSupplier(newSelectedSupplierId);
        const supplier = suppliers.find(s => s.id.toString() === newSelectedSupplierId);
        if (supplier) {
          setEmailSubject(supplier.email_subject || '');
        }

        let newOrderItems = {};
        let newAdditionalItems = '';
        if (prefilledData.data.order_data) {
          try {
            const data = JSON.parse(prefilledData.data.order_data);
            newOrderItems = data.items || {};
            newAdditionalItems = data.additional_items || '';
            setOrderItems(newOrderItems);
            setAdditionalItems(newAdditionalItems);
          } catch (e) {
            console.error("Failed to parse order_data", e);
          }
        }

        if (prefilledData.immediateSend) {
          const supplier = suppliers.find(s => s.id.toString() === newSelectedSupplierId);
          if (supplier) {
            // Re-implement generateOrderMessage locally to avoid dependency
            let message = supplier.message_template + `\n\n`;
            Object.entries(newOrderItems).forEach(([product, quantity]) => {
              if (quantity && quantity !== '0') message += `• ${product}: ${quantity}\n`;
            });
            if (newAdditionalItems.trim()) message += newAdditionalItems + '\n';
            message += '\nGrazie!';
            
            setConfirmMessages([{ supplier: supplier.name, message: message }]);
            setShowConfirm(true);
          } else {
            toast.error("Fornitore non trovato per l'ordine programmato.");
          }
          setPrefilledData(p => ({...p, immediateSend: false}));
        }
      }
    }, [prefilledData, setPrefilledData, suppliers, setConfirmMessages, setShowConfirm]);

    const handleProductSelectionChange = (product, isSelected) => {
        setOrderItems(prev => {
            const newItems = { ...prev };
            if (isSelected) {
                newItems[product] = '';
            } else {
                delete newItems[product];
            }
            return newItems;
        });
    };

    const handleQuantityChange = (product, quantity) => {
      setOrderItems(prev => ({ ...prev, [product]: quantity }));
    };

    const generateOrderMessage = (supplier, items = orderItems, additional = additionalItems) => {
      if (!supplier) return '';
      let message = supplier.message_template + `\n\n`;
      Object.entries(items).forEach(([product, quantity]) => {
        if (quantity && quantity !== '0') message += `• ${product}: ${quantity}\n`;
      });
      if (additional.trim()) message += additional + '\n';
      message += '\nGrazie!';
      return message;
    };

    const handlePreviewOrder = () => {
        if (batchMode) {
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
        } else {
            const itemsWithMissingQuantity = Object.keys(orderItems)
                .filter(product => orderItems.hasOwnProperty(product) && orderItems[product] === '');

            if (itemsWithMissingQuantity.length > 0) {
                toast.error(`Inserire la quantità per i seguenti prodotti: ${itemsWithMissingQuantity.join(', ')}`);
                return;
            }
            const supplier = suppliers.find(s => s.id.toString() === selectedSupplier);
            const orderMessage = generateOrderMessage(supplier);
            setConfirmMessages([{ supplier: supplier.name, message: orderMessage }]);
            setShowConfirm(true);
        }
    };

    const sendOrder = async () => {
      if (batchMode) {
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
      } else {
        const itemsWithMissingQuantity = Object.keys(orderItems)
            .filter(product => orderItems.hasOwnProperty(product) && orderItems[product] === '');

        if (itemsWithMissingQuantity.length > 0) {
            toast.error(`Inserire la quantità per i seguenti prodotti: ${itemsWithMissingQuantity.join(', ')}`);
            setShowConfirm(false);
            return;
        }

        if (isSubmitting) return;
        setIsSubmitting(true);
        try {
          const supplier = suppliers.find(s => s.id.toString() === selectedSupplier);
          const orderMessage = generateOrderMessage();
          const orderData = { user_id: user.id, supplier_id: selectedSupplier, order_message: orderMessage, additional_items: additionalItems || null, status: 'sent' };
          const orderItemsToInsert = Object.entries(orderItems).filter(([_, quantity]) => quantity && quantity !== '0').map(([productName, quantity]) => ({ product_name: productName, quantity: parseInt(quantity, 10) || 0 }));
          const newOrder = await supabaseHelpers.createOrder(orderData, orderItemsToInsert);
                  const encodedMessage = encodeURIComponent(orderMessage);

                  let contactLink = '';
                  switch (supplier.contact_method) {
                    case 'whatsapp': {
                      // eslint-disable-next-line no-useless-escape
                      if (!supplier.contact) return toast.error('Numero di telefono del fornitore non impostato.');
                      const sanitizedContact = supplier.contact.replace(/\D/g, '');
                      // eslint-disable-next-line no-useless-escape
                      if (!supplier.contact) return toast.error('Numero di telefono del fornitore non valido.');
                      contactLink = `https://wa.me/${sanitizedContact}?text=${encodedMessage}`;
                      break;
                    }
                    case 'whatsapp_group': {
                      contactLink = `whatsapp://send?text=${encodedMessage}`;
                      break;
                    }
                    case 'email': {
                      if (!supplier.contact) return toast.error('Indirizzo email del fornitore non impostato.');
                      contactLink = `mailto:${supplier.contact}?subject=${encodeURIComponent(emailSubject || `Ordine Fornitore - ${supplier.name}`)}&body=${encodedMessage}`;
                      break;
                    }
                    case 'sms': {
                      // eslint-disable-next-line no-useless-escape
                      if (!supplier.contact) return toast.error('Numero di telefono del fornitore non impostato.');
                      const sanitizedContact = supplier.contact.replace(/\D/g, '');
                      // eslint-disable-next-line no-useless-escape
                      if (!sanitizedContact) return toast.error('Numero di telefono del fornitore non valido.');
                      contactLink = `sms:${sanitizedContact}?body=${encodedMessage}`;
                      break;
                    }
                    default: {
                      return toast.error('Metodo di contatto non supportato: ' + supplier.contact_method);
                    }
                  }

                  openLinkInNewTab(contactLink);

          let scheduledOrderMessagePart = '';
          if (prefilledData && prefilledData.type === 'order' && prefilledData.data.id && prefilledData.data.scheduled_at) {
              try {
                  await supabaseHelpers.deleteScheduledOrder(prefilledData.data.id);
                  setScheduledOrders(prev => prev.filter(order => order.id !== prefilledData.data.id));
                  setPrefilledData(null);
                  scheduledOrderMessagePart = ' L\'ordine programmato è stato rimosso.';
              } catch (error) {
                  console.error('Error deleting scheduled order:', error);
                  toast.error("Errore durante l\'eliminazione dell\'ordine programmato");
              }
          }

          toast.success(`Ordine inviato via ${supplier.contact_method} a ${supplier.name}!${scheduledOrderMessagePart}`);
          setOrders(prev => [{ ...newOrder, suppliers: supplier, order_items: orderItemsToInsert }, ...prev]);
          setSelectedSupplier('');
          setOrderItems({});
          setAdditionalItems('');
          setShowConfirm(false);
          if (onOrderSent) onOrderSent();
          else { setTimeout(() => { if (!window.confirm('Ordine inviato con successo! Vuoi creare un altro ordine?')) navigate('/'); }, 1000); } 
        } catch (error) {
          console.error('Error sending order:', error);
          toast.error("Errore durante l\'invio dell\'ordine");
        } finally {
          setIsSubmitting(false);
        }
      }
    };

    const selectedSupplierData = suppliers.find(s => s.id.toString() === selectedSupplier);

    return (
      <div className="min-h-screen app-background">
        <Header title="Crea Ordine" onBack={() => navigate(-1)} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-6">

          <div className="glass-card p-4">
            <div className="flex justify-between items-center mb-4">
              <h3 className="font-medium text-gray-900 dark:text-gray-100">Tipo Ordine</h3>
              <button onClick={() => setShowTypeModal(true)} className={`btn text-sm ${batchMode ? 'btn-purple' : 'btn-primary'}`}>
                {batchMode ? 'Più Fornitori' : 'Singolo Fornitore'}
              </button>
            </div>
            {!batchMode && (
              <>
                <label htmlFor="supplier-select" className="block text-sm font-medium text-gray-700 mb-2">Seleziona Fornitore</label>
                <select id="supplier-select" name="supplier-select" value={selectedSupplier} onChange={(e) => setSelectedSupplier(e.target.value)} className="select" disabled={!!(prefilledData && prefilledData.type === 'order')}> 
                  <option value="">Scegli un fornitore...</option>
                  {suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}
                </select>
              </>
            )}
          </div>
          {suppliers.length === 0 && <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 text-center"><p className="text-yellow-800 text-sm mb-3">Non hai ancora fornitori configurati</p><button onClick={() => navigate('/suppliers')} className="text-yellow-600 hover:text-yellow-800 font-medium text-sm">Aggiungi il primo fornitore →</button></div>}
          {selectedSupplierData && (
            <div className="glass-card p-4">
              <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Prodotti Disponibili</h3>
              {selectedSupplierData.products.length === 0 ? (
                <div className="text-center py-4"><p className="text-gray-500 text-sm">Nessun prodotto configurato</p></div>
              ) : (
                <div className="space-y-3">
                  {selectedSupplierData.products.map(product => (
                    <div key={product} className="flex items-center justify-between p-2 border border-gray-100 rounded-lg">
                      <label className="flex items-center space-x-3 flex-1">
                        <input
                          type="checkbox"
                          id={`product-checkbox-${product}`}
                          name={`product-checkbox-${product}`}
                          checked={orderItems.hasOwnProperty(product)}
                          onChange={(e) => handleProductSelectionChange(product, e.target.checked)}
                          className="rounded border-gray-300 dark:border-gray-600 text-blue-600 dark:text-blue-400 focus:ring-blue-500 accent-blue-600 dark:accent-blue-400 transition-transform active:scale-95"
                        />
                        <span className="text-sm text-gray-700">{product}</span>
                      </label>
                      <input
                        type="text"
                        id={`quantity-${product}`}
                        name={`quantity-${product}`}
                        placeholder="Qt."
                        value={orderItems[product] || ''}
                        onChange={(e) => handleQuantityChange(product, e.target.value)}
                        className="input-sm w-16 text-center"
                      />
                    </div>
                  ))}
                </div>
              )}
            </div>
          )}
          {selectedSupplierData && selectedSupplierData.contact_method === 'email' && <div className="glass-card p-4"><label htmlFor="email-subject" className="block text-sm font-medium text-gray-700 mb-2">Oggetto Email</label><input id="email-subject" name="email-subject" type="text" value={emailSubject} onChange={(e) => setEmailSubject(e.target.value)} className="input" placeholder="Oggetto dell\'email" /></div>}
          {selectedSupplierData && <div className="glass-card p-4"><label htmlFor="additional-items" className="block text-sm font-medium text-gray-700 mb-2">Prodotti Aggiuntivi</label><textarea id="additional-items" name="additional-items" value={additionalItems} onChange={(e) => setAdditionalItems(e.target.value)} placeholder="Inserisci prodotti non in lista..." className="input" rows="3" /></div>}
            <div className="flex space-x-3">
              <button onClick={handlePreviewOrder} className="btn btn-primary w-full">Anteprima Ordine</button>
              <button onClick={() => setShowScheduleModal(true)} className="btn btn-warning w-full">Programma per dopo</button>
            </div>

          {batchMode && (
            <div className="space-y-6">
              {multiOrders.map((order, index) => {
                const supplierData = suppliers.find(s => s.id.toString() === order.supplier);
                return (
                  <div key={order.id} className="glass-card p-4">
                    <div className="flex justify-between items-center mb-4">
                      <h3 className="font-medium text-gray-900 dark:text-gray-100">Ordine {index + 1}: {supplierData ? supplierData.name : 'Seleziona Fornitore'}</h3>
                      {multiOrders.length > 1 && (
                        <button onClick={() => removeSupplierOrder(order.id)} className="p-1 text-red-500 hover:bg-red-50 rounded"><Trash2 size={16} /></button>
                      )}
                    </div>
                    <div className="space-y-4">
                      <div>
                        <label htmlFor={`supplier-select-${order.id}`} className="block text-sm font-medium text-gray-700 mb-2">Seleziona Fornitore</label>
                        <select id={`supplier-select-${order.id}`} name={`supplier-select-${order.id}`} value={order.supplier} onChange={(e) => updateSupplierOrder(order.id, 'supplier', e.target.value)} className="select">
                          <option value="">Scegli un fornitore...</option>
                          {suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}
                        </select>
                      </div>
                      {supplierData && (
                        <>
                          <div>
                            <h4 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Prodotti Disponibili</h4>
                            {supplierData.products.length === 0 ? (
                              <div className="text-center py-4"><p className="text-gray-500 text-sm">Nessun prodotto configurato</p></div>
                            ) : (
                              <div className="space-y-3">
                                {supplierData.products.map(product => (
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
                            )}
                          </div>
                          <div>
                            <label htmlFor={`additional-items-${order.id}`} className="block text-sm font-medium text-gray-700 mb-2">Prodotti Aggiuntivi</label>
                            <textarea id={`additional-items-${order.id}`} name={`additional-items-${order.id}`} value={order.additional} onChange={(e) => updateSupplierOrder(order.id, 'additional', e.target.value)} placeholder="Inserisci prodotti non in lista..." className="input" rows="3" />
                          </div>
                          {supplierData.contact_method === 'email' && <div className="glass-card p-4"><label htmlFor={`email-subject-${order.id}`} className="block text-sm font-medium text-gray-700 mb-2">Oggetto Email</label><input id={`email-subject-${order.id}`} name={`email-subject-${order.id}`} type="text" value={order.email_subject} onChange={(e) => updateSupplierOrder(order.id, 'email_subject', e.target.value)} className="input" placeholder="Oggetto dell\'email" /></div>}
                        </>
                      )}
                    </div>
                  </div>
                );
              })}
              <label htmlFor="add-supplier-select" className="block text-sm font-medium text-gray-700 mb-2">Aggiungi Fornitore</label>
              <select id="add-supplier-select" name="add-supplier-select" onChange={(e) => {
                const supplierId = e.target.value;
                if (supplierId) {
                  setMultiOrders(prev => [...prev, { id: Date.now(), supplier: supplierId, items: {}, additional: '' }]);
                  e.target.value = '';
                }
              }} className="select mb-4">
                <option value="">Aggiungi Fornitore...</option>
                {suppliers.filter(s => !multiOrders.some(o => o.supplier === s.id.toString())).map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}
              </select>
              {multiOrders.some(order => order.supplier && (Object.keys(order.items).length > 0 || order.additional.trim())) && (
                <div className="flex space-x-3">
                  <button onClick={handlePreviewOrder} className="btn btn-primary w-full">Anteprima Ordini</button>
                  <button onClick={() => setShowScheduleModal(true)} className="btn btn-warning w-full">Programma per dopo</button>
                </div>
              )}
            </div>
          )}
        </div>
        <ConfirmOrderModal
            showConfirm={showConfirm}
            confirmMessages={confirmMessages}
            isSubmitting={isSubmitting}
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
        />
        {showScheduleModal && <ScheduleOrderModal
            onClose={() => setShowScheduleModal(false)}
            batchMode={batchMode}
            supplierId={selectedSupplier}
            orderItems={orderItems}
            additionalItems={additionalItems}
            multiOrders={multiOrders}
            scheduledOrders={scheduledOrders}
            setScheduledOrders={setScheduledOrders}
            onSchedule={() => {
              if (batchMode) {
                setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '' }]);
              } else {
                setSelectedSupplier('');
                setOrderItems({});
                setAdditionalItems('');
              }
              setShowScheduleModal(false);
              navigate('/');
            }}
            suppliers={suppliers}
          />}
        <OrderTypeModal
            showTypeModal={showTypeModal}
            setBatchMode={setBatchMode}
            setShowTypeModal={setShowTypeModal}
        />
      </div>
    );
  };

export default CreateOrderPage;