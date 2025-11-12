import React, { useState, useEffect, useCallback } from 'react';
import { Calendar, ChevronDown, Send, Edit3, Trash2, Lock } from 'lucide-react';
import { toast } from 'react-hot-toast';
import Header from '../components/ui/Header';
import { usePrefill } from '../PrefillContext';
import { supabaseHelpers } from '../supabase';
import ScheduledOrderPreview from '../components/ui/ScheduledOrderPreview';
import { useNavigate } from 'react-router-dom';
import useSubscriptionStatus from '../hooks/useSubscriptionStatus';
import { useProfileContext } from '../ProfileContext';

const groupOrdersByScheduledAt = (orders) => {
    return orders.reduce((acc, order) => {
        const key = order.scheduled_at;
        if (!acc[key]) {
            acc[key] = [];
        }
        acc[key].push(order);
        return acc;
    }, {});
};

const SchedulePage = ({ multiOrders, setMultiOrders, suppliers, scheduledOrders, setScheduledOrders, setWizardOrders, showWizard, setShowWizard, wizardOrders, wizardStep, setWizardStep, user }) => {
    const navigate = useNavigate();
    const { isProUser, loadingSubscription } = useSubscriptionStatus();
    const { hasPermission } = useProfileContext();
    const canScheduleOrders = hasPermission('orders:schedule');
    const { prefilledData, setPrefilledData } = usePrefill();
    const getRoundedTime = (date = new Date()) => { const minutes = date.getMinutes(); const roundedMinutes = Math.ceil(minutes / 15) * 15; date.setMinutes(roundedMinutes); return date.toTimeString().slice(0, 5); };
    const [selectedDate, setSelectedDate] = useState(new Date().toISOString().split('T')[0]);
    const [selectedTime, setSelectedTime] = useState(getRoundedTime());
    const [selectedSupplier, setSelectedSupplier] = useState('');
    const [orderItems, setOrderItems] = useState({});
    const [additionalItems, setAdditionalItems] = useState('');
    const [emailSubject, setEmailSubject] = useState('');
    const [searchTerm, setSearchTerm] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [editingOrder, setEditingOrder] = useState(null);
    const [editingMultiOrders, setEditingMultiOrders] = useState([]);

    const resetForm = useCallback(() => {
      setSelectedDate(new Date().toISOString().split('T')[0]);
      setSelectedTime(getRoundedTime());
      setSelectedSupplier('');
      setOrderItems({});
      setAdditionalItems('');
      setEmailSubject('');
      setSearchTerm('');
      setEditingOrder(null);
      setEditingMultiOrders([]);
    }, []);

    useEffect(() => {
      // On mount, reset the form state, unless there's prefilled data
      if (!prefilledData) {
        resetForm();
      }
    }, [prefilledData, resetForm]);

    const timeSlots = [];
    for (let h = 0; h < 24; h++) { for (let m = 0; m < 60; m += 15) { const hour = h.toString().padStart(2, '0'); const minute = m.toString().padStart(2, '0'); timeSlots.push(`${hour}:${minute}`); } }

    const now = new Date();
    const fortyEightHoursAgo = new Date(now.getTime() - 48 * 60 * 60 * 1000);
    const readyToSendOrders = scheduledOrders.filter(o => {
        const scheduledAt = new Date(o.scheduled_at);
        return scheduledAt <= now && scheduledAt >= fortyEightHoursAgo;
    }).sort((a,b) => new Date(a.scheduled_at) - new Date(b.scheduled_at));

    const futureOrders = scheduledOrders.filter(o => new Date(o.scheduled_at) > now).sort((a,b) => new Date(a.scheduled_at) - new Date(b.scheduled_at));

    const groupedReadyToSendOrders = groupOrdersByScheduledAt(readyToSendOrders);
    const groupedFutureOrders = groupOrdersByScheduledAt(futureOrders);

    const isLimitReached = !isProUser && !editingOrder && scheduledOrders.length >= 3;

    const handleScheduleOrderClick = () => {
      if (!canScheduleOrders) {
        toast.error("Non hai i permessi per programmare ordini.");
        return;
      }
      if (isLimitReached) {
        toast.error('Hai raggiunto il limite di 3 ordini programmati per il piano Base. Esegui l\'upgrade a PRO per programmarne altri.');
      } else {
        scheduleOrder();
      }
    };

    useEffect(() => {
      if (prefilledData && prefilledData.type === 'schedule') {
        setSelectedSupplier(prefilledData.data.supplier_id);
        if (prefilledData.data.order_data) {
          try {
            const data = JSON.parse(prefilledData.data.order_data);
            setOrderItems(data.items || {});
            setAdditionalItems(data.additional_items || '');
          } catch (e) {
            console.error("Failed to parse order_data", e);
          }
        }
      }
    }, [prefilledData]);

    useEffect(() => {
      if (editingOrder) {
        const scheduledAt = new Date(editingOrder.scheduled_at);
        setSelectedDate(scheduledAt.toISOString().split('T')[0]);
        setSelectedTime(scheduledAt.toTimeString().slice(0, 5));
        
        // Find all orders with the same scheduled time to support multi-supplier editing
        const sameTimeOrders = scheduledOrders.filter(order => {
          const orderScheduledAt = new Date(order.scheduled_at);
          return orderScheduledAt.getTime() === scheduledAt.getTime();
        });
        
        if (sameTimeOrders.length > 0) {
          // Initialize editingMultiOrders with all orders at the same time
          const multiOrdersData = sameTimeOrders.map(order => {
            let orderItems = {};
            let additionalItems = '';
            let emailSubject = '';
            if (order.order_data) {
              try {
                const data = JSON.parse(order.order_data);
                orderItems = data.items || {};
                additionalItems = data.additional_items || '';
                emailSubject = data.email_subject || '';
              } catch (e) {
                console.error("Failed to parse order_data", e);
              }
            }
            return {
              id: order.id,
              supplier: order.supplier_id.toString(),
              items: orderItems,
              additional: additionalItems,
              email_subject: emailSubject,
              searchTerm: ''
            };
          });
          setEditingMultiOrders(multiOrdersData);
        }
        
        // For backward compatibility, also set single supplier state
        setSelectedSupplier(editingOrder.supplier_id);
        if (editingOrder.order_data) {
          try {
            const data = JSON.parse(editingOrder.order_data);
            setOrderItems(data.items || {});
            setAdditionalItems(data.additional_items || '');
          } catch (e) {
            console.error("Failed to parse order_data", e);
          }
        }
      }
    }, [editingOrder, scheduledOrders]);

    const scheduleOrder = async () => {
      if (!canScheduleOrders) {
        toast.error("Non hai i permessi per programmare o modificare ordini.");
        return;
      }
      if (!selectedDate) { toast.error('Seleziona data'); return; }
      const scheduledDateTime = new Date(`${selectedDate}T${selectedTime}`);
      if (scheduledDateTime < new Date() && !editingOrder) { toast.error('Non puoi programmare un ordine nel passato.'); return; }
      setIsSubmitting(true);
      try {
        if (editingOrder && editingMultiOrders.length > 0) {
          // Handle multi-supplier editing
          const validOrders = editingMultiOrders.filter(order => order.supplier && Object.keys(order.items).some(key => order.items[key] && order.items[key] !== '0'));
          if (validOrders.length === 0) { toast.error('Nessun ordine valido da aggiornare'); return; }
          
          // Delete existing orders at this time
          const existingOrdersAtTime = scheduledOrders.filter(order => {
            const orderScheduledAt = new Date(order.scheduled_at);
            return orderScheduledAt.getTime() === scheduledDateTime.getTime();
          });
          
          for (const existingOrder of existingOrdersAtTime) {
            await supabaseHelpers.deleteScheduledOrder(existingOrder.id);
          }
          
          // Create new orders with updated data
          for (const order of validOrders) {
            const orderData = {
              user_id: user.id,
              supplier_id: order.supplier,
              scheduled_at: scheduledDateTime.toISOString(),
              order_data: JSON.stringify({ items: order.items, additional_items: order.additional, email_subject: order.email_subject })
            };
            const newScheduledOrder = await supabaseHelpers.createScheduledOrder(orderData);
            setScheduledOrders(prev => [...prev.filter(o => !existingOrdersAtTime.some(eo => eo.id === o.id)), { ...newScheduledOrder, suppliers: suppliers.find(s => s.id.toString() === order.supplier) }]);
          }
          toast.success(`${validOrders.length} ordini aggiornati con successo`);
        } else {
          // Handle single supplier creation (existing logic)
          if (!selectedSupplier) { toast.error('Seleziona fornitore'); return; }
          const currentOrder = { supplier: selectedSupplier, items: orderItems, additional: additionalItems, email_subject: emailSubject };
          setMultiOrders([currentOrder]);
          const validOrders = [currentOrder].filter(order => order.supplier && Object.keys(order.items).some(key => order.items[key] && order.items[key] !== '0'));
          if (validOrders.length === 0) { toast.error('Nessun ordine valido da programmare'); return; }
          for (const order of validOrders) {
            const orderData = {
              user_id: user.id,
              supplier_id: order.supplier,
              scheduled_at: scheduledDateTime.toISOString(),
              order_data: JSON.stringify({ items: order.items, additional_items: order.additional, email_subject: order.email_subject })
            };
            const newScheduledOrder = await supabaseHelpers.createScheduledOrder(orderData);
              setScheduledOrders(prev => [...prev, { ...newScheduledOrder, suppliers: suppliers.find(s => s.id.toString() === order.supplier) }]);
            }
            toast.success(`${validOrders.length} ordini programmati con successo`);
        }

        setEditingOrder(null);
        setEditingMultiOrders([]);
        setSelectedDate(new Date().toISOString().split('T')[0]);
        setSelectedTime(getRoundedTime());
        setSelectedSupplier('');
        setOrderItems({});
        setAdditionalItems('');
        setEmailSubject('');
        if (!editingOrder) {
          setTimeout(() => { if (!window.confirm('Ordini programmati con successo! Vuoi programmarne altri?')) navigate('/'); }, 1000);
        }
      } catch (error) {
        console.error('Error saving scheduled order:', error);
        toast.error('Errore durante il salvataggio degli ordini programmati');
      } finally {
        setIsSubmitting(false);
      }
    };

    const handleCancelEdit = () => {
      setEditingOrder(null);
      setEditingMultiOrders([]);
      setSelectedDate(new Date().toISOString().split('T')[0]);
      setSelectedTime(getRoundedTime());
      setSelectedSupplier('');
      setOrderItems({});
      setAdditionalItems('');
    };

    const removeEditingSupplierOrder = (id) => {
      if (editingMultiOrders.length > 1) {
        setEditingMultiOrders(prev => prev.filter(order => order.id !== id));
      }
    };

    const updateEditingSupplierOrder = (id, field, value) => {
      setEditingMultiOrders(prev => prev.map(order => order.id === id ? { ...order, [field]: value } : order));
    };

    const addEditingSupplierOrder = (supplierId) => {
      if (supplierId) {
        setEditingMultiOrders(prev => [...prev, { id: Date.now(), supplier: supplierId, items: {}, additional: '', email_subject: '', searchTerm: '' }]);
      }
    };

    const deleteScheduledOrder = async (id) => {
      if (!canScheduleOrders) {
        toast.error("Non hai i permessi per eliminare ordini programmati.");
        return;
      }
      if (!window.confirm('Sei sicuro di voler eliminare questo ordine programmato?')) return;
      try {
        await supabaseHelpers.deleteScheduledOrder(id);
        setScheduledOrders(prev => prev.filter(order => order.id !== id));
        toast.success('Ordine programmato eliminato');
      } catch (error) {
        console.error('Error deleting scheduled order:', error);
        toast.error("Errore durante l'eliminazione");
      }
    };

    const handleDeleteBatch = async (ordersToDelete) => {
      if (!canScheduleOrders) {
        toast.error("Non hai i permessi per eliminare ordini programmati.");
        return;
      }
      if (!window.confirm(`Sei sicuro di voler eliminare questo lotto di ${ordersToDelete.length} ordini programmati? Questa azione è irreversibile.`)) return;
      try {
        for (const order of ordersToDelete) {
          await supabaseHelpers.deleteScheduledOrder(order.id);
        }
        setScheduledOrders(prev => prev.filter(order => !ordersToDelete.some(deletedOrder => deletedOrder.id === order.id)));
        toast.success(`${ordersToDelete.length} ordini programmati eliminati`);
      } catch (error) {
        console.error('Error deleting scheduled order batch:', error);
        toast.error("Errore durante l'eliminazione del lotto di ordini");
      }
    };

    const handleSendBatch = (orders) => {
        const ordersForWizard = orders.map(order => {
            const supplier = suppliers.find(s => s.id === order.supplier_id);
            if (!supplier) {
                console.warn(`Supplier with ID ${order.supplier_id} not found for scheduled order. Skipping.`);
                return null;
            }
            let orderItems = {};
            let additionalItems = '';
            let emailSubject = '';
            if (order.order_data) {
                try {
                    const parsedData = JSON.parse(order.order_data);
                    orderItems = parsedData.items || {};
                    additionalItems = parsedData.additional_items || '';
                    emailSubject = parsedData.email_subject || '';
                } catch (e) {
                    console.error("Failed to parse order_data for scheduled order", e);
                }
            }
            let message = supplier.message_template + `\n\n`;
            Object.entries(orderItems).forEach(([product, quantity]) => {
                if (quantity && quantity !== '0') message += `• ${product}: ${quantity}\n`;
            });
            if (additionalItems.trim()) message += '\nProdotti aggiuntivi:\n' + additionalItems + '\n';
            message += '\nGrazie!';

            return { ...order, supplier, items: orderItems, additional: additionalItems, message, emailSubject };
        }).filter(Boolean);

        if (ordersForWizard.length === 0) {
            toast.error('Nessun ordine programmato valido con fornitore trovato da inviare.');
            return;
        }

        setWizardOrders(ordersForWizard);
        setWizardStep(0);
        setShowWizard(true);
        navigate('/create-order');
    }

    const selectedSupplierData = suppliers.find(s => s.id.toString() === selectedSupplier);

    useEffect(() => {
      if (selectedSupplierData) {
        setEmailSubject(selectedSupplierData.email_subject || '');
      }
    }, [selectedSupplierData]);

    return (
      <div className="min-h-screen app-background">
        <Header title="Programma Ordini" onBack={() => navigate('/')} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-6">

          <div className="glass-card p-4"><label htmlFor="schedule-date" className="block text-sm font-medium text-gray-700 mb-2">Data Programmazione</label><input id="schedule-date" name="schedule-date" type="date" value={selectedDate} onChange={(e) => setSelectedDate(e.target.value)} min={new Date().toISOString().split('T')[0]} className="input" /></div>
          <div className="glass-card p-4"><label htmlFor="schedule-time" className="block text-sm font-medium text-gray-700 mb-2">Ora Invio</label><select id="schedule-time" name="schedule-time" value={selectedTime} onChange={(e) => setSelectedTime(e.target.value)} className="select">{timeSlots.map(time => <option key={time} value={time}>{time}</option>)}</select></div>
          {editingOrder && editingMultiOrders.length > 0 ? (
            <div className="space-y-6">
              {editingMultiOrders.map((order, index) => {
                const supplierData = suppliers.find(s => s.id.toString() === order.supplier);
                return (
                  <div key={order.id} className="glass-card p-4">
                    <div className="flex justify-between items-center mb-4">
                      <h3 className="font-medium text-gray-900 dark:text-gray-100">Ordine {index + 1}: {supplierData ? supplierData.name : 'Seleziona Fornitore'}</h3>
                      {editingMultiOrders.length > 1 && (
                        <button onClick={() => removeEditingSupplierOrder(order.id)} className="p-1 text-red-500 hover:bg-red-50 rounded"><Trash2 size={16} /></button>
                      )}
                    </div>
                    <div className="space-y-4">
                      <div>
                        <label htmlFor={`edit-supplier-select-${order.id}`} className="block text-sm font-medium text-gray-700 mb-2">Seleziona Fornitore</label>
                        <select id={`edit-supplier-select-${order.id}`} name={`edit-supplier-select-${order.id}`} value={order.supplier} onChange={(e) => updateEditingSupplierOrder(order.id, 'supplier', e.target.value)} className="select">
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
                                      onChange={(e) => updateEditingSupplierOrder(order.id, 'searchTerm', e.target.value)}
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
                                        id={`edit-product-checkbox-${order.id}-${product}`}
                                        name={`edit-product-checkbox-${order.id}-${product}`}
                                        checked={order.items.hasOwnProperty(product)}
                                        onChange={(e) => {
                                          const newItems = { ...order.items };
                                          if (e.target.checked) {
                                            newItems[product] = '';
                                          } else {
                                            delete newItems[product];
                                          }
                                          updateEditingSupplierOrder(order.id, 'items', newItems);
                                        }}
                                        className="rounded border-gray-300 dark:border-gray-600 text-blue-600 dark:text-blue-400 focus:ring-blue-500 accent-blue-600 dark:accent-blue-400 transition-transform active:scale-95"
                                      />
                                      <span className="text-sm text-gray-700">{product}</span>
                                    </label>
                                    <input
                                      type="text"
                                      id={`edit-quantity-${order.id}-${product}`}
                                      name={`edit-quantity-${order.id}-${product}`}
                                      placeholder="Qt."
                                      value={order.items[product] || ''}
                                      onChange={(e) => updateEditingSupplierOrder(order.id, 'items', { ...order.items, [product]: e.target.value })}
                                      className="input-sm w-16 text-center"
                                    />
                                  </div>
                                ))}
                                </div>
                              </>
                            )}
                          </div>
                          <div>
                            <label htmlFor={`edit-additional-items-${order.id}`} className="block text-sm font-medium text-gray-700 mb-2">Prodotti Aggiuntivi</label>
                            <textarea id={`edit-additional-items-${order.id}`} name={`edit-additional-items-${order.id}`} value={order.additional} onChange={(e) => updateEditingSupplierOrder(order.id, 'additional', e.target.value)} placeholder="Inserisci prodotti non in lista..." className="input" rows="3" />
                          </div>
                          {supplierData.contact_method === 'email' && <div className="glass-card p-4"><label htmlFor={`edit-email-subject-${order.id}`} className="block text-sm font-medium text-gray-700 mb-2">Oggetto Email</label><input id={`edit-email-subject-${order.id}`} name={`edit-email-subject-${order.id}`} type="text" value={order.email_subject} onChange={(e) => updateEditingSupplierOrder(order.id, 'email_subject', e.target.value)} className="input" placeholder="Oggetto dell'email" /></div>}
                        </>
                      )}
                    </div>
                  </div>
                );
              })}
              <label htmlFor="edit-add-supplier-select" className="block text-sm font-medium text-gray-700 mb-2">Aggiungi Fornitore</label>
              <select id="edit-add-supplier-select" name="edit-add-supplier-select" onChange={(e) => {
                const supplierId = e.target.value;
                if (supplierId) {
                  addEditingSupplierOrder(supplierId);
                  e.target.value = '';
                }
              }} className="select mb-4">
                <option value="">Aggiungi Fornitore...</option>
                {suppliers.filter(s => !editingMultiOrders.some(o => o.supplier === s.id.toString())).map(supplier => <option key={supplier.id} value={supplier.id}>{supplier?.name || 'Fornitore senza nome'}</option>)}
              </select>
            </div>
          ) : (
            <>
              <div className="glass-card p-4"><label htmlFor="schedule-supplier" className="block text-sm font-medium text-gray-700 mb-2">Seleziona Fornitore</label><select id="schedule-supplier" name="schedule-supplier" value={selectedSupplier} onChange={(e) => { setSelectedSupplier(e.target.value); setSearchTerm(''); }} className="select"><option value="">Scegli un fornitore...</option>                  {suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier?.name || 'Fornitore senza nome'}</option>)}</select></div>
               {selectedSupplierData && selectedSupplierData.products && (
                <div className="glass-card p-4">
                  <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Prodotti</h3>
                  {isProUser && (
                    <div className="mb-4">
                      <input
                        type="text"
                        placeholder="Cerca prodotto..."
                        value={searchTerm}
                        onChange={(e) => setSearchTerm(e.target.value)}
                        className="input"
                      />
                    </div>
                  )}
                  <div className="space-y-3">
                    {selectedSupplierData.products
                      .filter(product => !isProUser || product.toLowerCase().includes(searchTerm.toLowerCase()))
                      .map(product => (
                        <div key={product} className="flex items-center justify-between p-2 border border-gray-100 rounded-lg">
                          <label className="flex items-center space-x-3 flex-1">
                            <input
                              type="checkbox"
                              id={`schedule-product-checkbox-${product}`}
                              name={`schedule-product-checkbox-${product}`}
                              checked={!!(orderItems[product] && orderItems[product] !== '0')}
                              onChange={(e) => { if (!e.target.checked) setOrderItems(prev => ({ ...prev, [product]: '0' })); }}
                              className="rounded border-gray-300 dark:border-gray-600 text-blue-600 dark:text-blue-400 focus:ring-blue-500 accent-blue-600 dark:accent-blue-400 transition-transform active:scale-95"
                            />
                            <span className="text-sm text-gray-700">{product}</span>
                          </label>
                          <input
                            type="text"
                            id={`scheduled-quantity-${product}`}
                            name={`scheduled-quantity-${product}`}
                            placeholder="Qt."
                            value={orderItems[product] || ''}
                            onChange={(e) => setOrderItems(prev => ({ ...prev, [product]: e.target.value }))}
                            className="input-sm w-16 text-center"
                          />
                        </div>
                      ))}
                  </div>
                </div>
              )}
              {selectedSupplierData && selectedSupplierData.contact_method === 'email' && <div className="glass-card p-4"><label htmlFor="schedule-email-subject" className="block text-sm font-medium text-gray-700 mb-2">Oggetto Email</label><input id="schedule-email-subject" name="schedule-email-subject" type="text" value={emailSubject} onChange={(e) => setEmailSubject(e.target.value)} className="input" placeholder="Oggetto dell'email" /></div>}
              {selectedSupplierData && <div className="glass-card p-4"><label htmlFor="schedule-additional-items" className="block text-sm font-medium text-gray-700 mb-2">Prodotti Aggiuntivi</label><textarea id="schedule-additional-items" name="schedule-additional-items" value={additionalItems} onChange={(e) => setAdditionalItems(e.target.value)} placeholder="Inserisci prodotti non in lista..." className="input" rows="3" /></div>}
            </>
          )}
          
          {scheduledOrders.length > 0 ? (<div className="space-y-4">
            {Object.keys(groupedReadyToSendOrders).length > 0 && (
                <details className="glass-card group" open>
                    <summary className="font-medium text-green-800 dark:text-green-300 bg-green-50 dark:bg-green-900/30 rounded-md p-4 cursor-pointer flex justify-between items-center list-none">
                        <span>Pronti per l\'invio ({readyToSendOrders.length})</span>
                        <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" />
                    </summary>
                    <div className="p-4 space-y-3 border-t border-gray-100">
                        {Object.values(groupedReadyToSendOrders).map((orders, groupIndex) => {
                            const isBatch = orders.length > 1;
                            const firstOrder = orders[0];
                            const scheduledAt = new Date(firstOrder.scheduled_at);
                            return (
                                <details key={groupIndex} className="bg-green-50/50 dark:bg-green-900/20 rounded-lg">
                                    <summary className="font-medium text-sm p-3 cursor-pointer flex justify-between items-center list-none">
                                        {isBatch ? (
                                            <div className="w-full flex justify-between items-center">
                                                <span>Lotto di {orders.length} ordini per le {scheduledAt.toLocaleTimeString()}</span>
                                                <div className="flex items-center space-x-2">
                                                    <button onClick={() => handleSendBatch(orders)} className="p-1 text-green-500 hover:bg-green-100 rounded"><Send size={14} /></button>
                                                    <button onClick={() => handleDeleteBatch(orders)} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button>
                                                </div>
                                            </div>
                                        ) : (
                                            <span>Ordine per {suppliers.find(s => s.id === firstOrder.supplier_id)?.name || 'sconosciuto'} alle {scheduledAt.toLocaleTimeString()}</span>
                                        )}
                                        <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" />
                                    </summary>
                                    <div className="p-3 border-t">
                                        {orders.map(order => {
                                            const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers;
                                            return (
                                                 <div key={order.id} className="w-full text-left p-3 rounded-lg bg-white dark:bg-green-900/30 mb-2">
                                                     <div className="flex justify-between items-center">
                                                         <div>
                                                             <p className="font-medium text-sm text-green-900 dark:text-green-200">{supplier?.name || 'Fornitore eliminato'}</p>
                                                         </div>
                                                         <div className="flex items-center space-x-2">
                                                             <button onClick={() => {
                                                               const supplierExists = suppliers.find(s => s.id === order.supplier_id);
                                                               if (!supplierExists) {
                                                                 toast.error("Fornitore non trovato, impossibile inviare l'ordine.");
                                                                 return;
                                                               }
                                                               setPrefilledData({ type: 'order', data: order, immediateSend: true });
                                                               navigate('/create-order');
                                                             }} className="p-1 text-green-500 hover:bg-green-100 rounded"><Send size={14} /></button>
                                                             <button onClick={() => {
                                                               if (!canScheduleOrders) {
                                                                 toast.error("Non hai i permessi per modificare ordini programmati.");
                                                                 return;
                                                               }
                                                               const supplierExists = suppliers.find(s => s.id === order.supplier_id);
                                                               if (!supplierExists) {
                                                                 toast.error("Fornitore non trovato, modifica limitata.");
                                                               }
                                                               setEditingOrder(order);
                                                             }} className="p-1 text-blue-500 hover:bg-blue-100 rounded"><Edit3 size={14} /></button>
                                                             <button onClick={(e) => { e.stopPropagation(); deleteScheduledOrder(order.id); }} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button>
                                                         </div>
                                                     </div>
                                                    <ScheduledOrderPreview order={order} suppliers={suppliers} />
                                                </div>
                                            )
                                        })}
                                    </div>
                                </details>
                            )
                        })}
                    </div>
                </details>
            )}

            {Object.keys(groupedFutureOrders).length > 0 && (
                <details className="glass-card group">
                    <summary className="font-medium text-purple-800 dark:text-purple-300 bg-purple-50 dark:bg-purple-900/30 rounded-md p-4 cursor-pointer flex justify-between items-center list-none">
                        <span>Ordini Programmati ({futureOrders.length})</span>
                        <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" />
                    </summary>
                    <div className="p-4 space-y-3 border-t border-gray-100">
                        {Object.values(groupedFutureOrders).map((orders, groupIndex) => {
                            const isBatch = orders.length > 1;
                            const firstOrder = orders[0];
                            const scheduledAt = new Date(firstOrder.scheduled_at);
                            return (
                                <details key={groupIndex} className="bg-purple-50/50 dark:bg-purple-900/20 rounded-lg">
                                    <summary className="font-medium text-sm p-3 cursor-pointer flex justify-between items-center list-none">
                                        {isBatch ? (
                                            <div className="w-full flex justify-between items-center">
                                                <span>Lotto di {orders.length} ordini per le {scheduledAt.toLocaleTimeString()}</span>
                                                <div className="flex items-center space-x-2">
                                                    <button onClick={() => handleSendBatch(orders)} className="p-1 text-green-500 hover:bg-green-100 rounded"><Send size={14} /></button>
                                                    <button onClick={() => handleDeleteBatch(orders)} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button>
                                                </div>
                                            </div>
                                        ) : (
                                            <span>Ordine per {suppliers.find(s => s.id === firstOrder.supplier_id)?.name || 'sconosciuto'} alle {scheduledAt.toLocaleTimeString()}</span>
                                        )}
                                        <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" />
                                    </summary>
                                    <div className="p-3 border-t">
                                        {orders.map(order => {
                                            const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers;
                                            return (
                                                 <div key={order.id} className={`w-full text-left p-3 rounded-lg ${editingOrder?.id === order.id ? 'bg-purple-200' : 'bg-white'} dark:bg-purple-900/30 mb-2`}>
                                                     <div className="flex justify-between items-center">
                                                         <div>
                                                             <p className="font-medium text-sm text-purple-900">{supplier?.name || 'Fornitore eliminato'}</p>
                                                         </div>
                                                         <div className="flex items-center space-x-2">
                                                             <button onClick={() => {
                                                               const supplierExists = suppliers.find(s => s.id === order.supplier_id);
                                                               if (!supplierExists) {
                                                                 toast.error("Fornitore non trovato, impossibile inviare l'ordine.");
                                                                 return;
                                                               }
                                                               setPrefilledData({ type: 'order', data: order, immediateSend: true });
                                                               navigate('/create-order');
                                                             }} className="p-1 text-green-500 hover:bg-green-100 rounded"><Send size={14} /></button>
                                                             <button onClick={() => {
                                                               if (!canScheduleOrders) {
                                                                 toast.error("Non hai i permessi per modificare ordini programmati.");
                                                                 return;
                                                               }
                                                               const supplierExists = suppliers.find(s => s.id === order.supplier_id);
                                                               if (!supplierExists) {
                                                                 toast.error("Fornitore non trovato, modifica limitata.");
                                                               }
                                                               setEditingOrder(order);
                                                             }} className="p-1 text-blue-500 hover:bg-blue-100 rounded"><Edit3 size={14} /></button>
                                                             <button onClick={(e) => { e.stopPropagation(); deleteScheduledOrder(order.id); }} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button>
                                                         </div>
                                                     </div>
                                                    <ScheduledOrderPreview order={order} suppliers={suppliers} />
                                                </div>
                                            )
                                        })}
                                    </div>
                                </details>
                            )
                        })}
                    </div>
                </details>
            )}
        </div>
        ) : (
                <div className="glass-card p-4">
                    <div className="text-center py-12">
                        <Calendar size={48} className="mx-auto text-gray-300 mb-4" />
                        <p className="text-gray-500">Nessun ordine programmato.</p>
                    </div>
                </div>
            )}

           <div className="flex space-x-3">
            {editingOrder && <button onClick={handleCancelEdit} className="w-full py-3 border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-50">Annulla</button>}
            {selectedDate && ((editingOrder && editingMultiOrders.some(order => order.supplier && (Object.keys(order.items).some(key => order.items[key] && order.items[key] !== '0') || order.additional.trim()))) || (!editingOrder && selectedSupplierData && (Object.keys(orderItems).some(key => orderItems[key] && orderItems[key] !== '0') || additionalItems.trim()))) && (
              <button 
                onClick={handleScheduleOrderClick} 
                disabled={isSubmitting || (isLimitReached && !editingOrder) || !canScheduleOrders || loadingSubscription} 
                className="w-full bg-purple-500 text-white py-3 rounded-lg font-medium hover:bg-purple-600 transition-colors flex items-center justify-center space-x-2 disabled:bg-purple-300 disabled:cursor-not-allowed"
              >
                {isSubmitting ? <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" /> : (isLimitReached || !canScheduleOrders ? <Lock size={20} /> : <Calendar size={20} />)}
                <span>{isSubmitting ? (editingOrder ? 'Aggiornando...' : 'Programmando...') : (editingOrder ? 'Aggiorna Ordini' : 'Programma Ordini')}</span>
              </button>
            )}
          </div>
          {isLimitReached && (
            <div className="text-center text-xs text-red-600 dark:text-red-400 mt-2 p-2 bg-red-100 dark:bg-red-900/20 rounded-md">
              Limite di 3 ordini programmati raggiunto per il piano Base. <button className="font-bold underline" onClick={() => { /* TODO: Upgrade logic */ }}>Upgrade a PRO</button>
            </div>
          )}
        </div>

      </div>
    );
}

export default SchedulePage;
