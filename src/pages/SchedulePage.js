import React, { useState, useEffect } from 'react';
import { Calendar, ChevronDown, Send, Edit3, Trash2 } from 'lucide-react';
import { toast } from 'react-hot-toast';
import Header from '../components/ui/Header';
import { usePrefill } from '../PrefillContext';
import { supabaseHelpers } from '../supabase';
import ScheduledOrderPreview from '../components/ui/ScheduledOrderPreview';
import { useNavigate } from 'react-router-dom';

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

const SchedulePage = ({ batchMode, setBatchMode, multiOrders, setMultiOrders, suppliers, scheduledOrders, setScheduledOrders, setWizardOrders, showWizard, setShowWizard, wizardOrders, wizardStep, setWizardStep, user }) => {
    const navigate = useNavigate();
    const { prefilledData, setPrefilledData } = usePrefill();
    const getRoundedTime = (date = new Date()) => { const minutes = date.getMinutes(); const roundedMinutes = Math.ceil(minutes / 15) * 15; date.setMinutes(roundedMinutes); return date.toTimeString().slice(0, 5); };
    const [selectedDate, setSelectedDate] = useState(new Date().toISOString().split('T')[0]);
    const [selectedTime, setSelectedTime] = useState(getRoundedTime());
    const [selectedSupplier, setSelectedSupplier] = useState('');
    const [orderItems, setOrderItems] = useState({});
    const [additionalItems, setAdditionalItems] = useState('');
    const [emailSubject, setEmailSubject] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [editingOrder, setEditingOrder] = useState(null);
    const [showTypeModal, setShowTypeModal] = useState(false);
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
    }, [editingOrder]);

    const scheduleOrder = async () => {
      if (!selectedDate) { toast.error('Seleziona data'); return; }
      if (!batchMode && !selectedSupplier) { toast.error('Seleziona fornitore'); return; }
      const scheduledDateTime = new Date(`${selectedDate}T${selectedTime}`);
      if (scheduledDateTime < new Date() && !editingOrder) { toast.error('Non puoi programmare un ordine nel passato.'); return; }
      setIsSubmitting(true);
      try {
        if (batchMode) {
          const validOrders = multiOrders.filter(order => order.supplier && Object.keys(order.items).some(key => order.items[key] && order.items[key] !== '0'));
          if (validOrders.length === 0) { toast.error('Nessun ordine valido da programmare'); return; }
          for (const order of validOrders) {
            const orderData = {
              user_id: user.id,
              supplier_id: order.supplier,
              scheduled_at: scheduledDateTime.toISOString(),
              order_data: JSON.stringify({ items: order.items, additional_items: order.additional })
            };
            const newScheduledOrder = await supabaseHelpers.createScheduledOrder(orderData);
            setScheduledOrders(prev => [...prev, { ...newScheduledOrder, suppliers: suppliers.find(s => s.id.toString() === order.supplier) }]);
          }
          toast.success(`${validOrders.length} ordini programmati con successo`);
        } else {
          const orderData = {
            user_id: user.id,
            supplier_id: selectedSupplier,
            scheduled_at: scheduledDateTime.toISOString(),
            order_data: JSON.stringify({ items: orderItems, additional_items: additionalItems, email_subject: emailSubject })
          };

          if (editingOrder) {
            const updatedOrder = await supabaseHelpers.updateScheduledOrder(editingOrder.id, orderData);
            setScheduledOrders(prev => prev.map(o => o.id === editingOrder.id ? { ...o, ...updatedOrder } : o));
            toast.success('Ordine programmato aggiornato con successo');
          } else {
            const newScheduledOrder = await supabaseHelpers.createScheduledOrder(orderData);
            setScheduledOrders(prev => [...prev, { ...newScheduledOrder, suppliers: suppliers.find(s => s.id.toString() === selectedSupplier) }]);
            toast.success(`Ordine programmato creato con successo`);
          }
        }

        setEditingOrder(null);
        setSelectedDate(new Date().toISOString().split('T')[0]);
        setSelectedTime(getRoundedTime());
        if (!batchMode) {
          setSelectedSupplier('');
          setOrderItems({});
          setAdditionalItems('');
        }
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
      setSelectedDate(new Date().toISOString().split('T')[0]);
      setSelectedTime(getRoundedTime());
      setSelectedSupplier('');
      setOrderItems({});
      setAdditionalItems('');
    };

    const deleteScheduledOrder = async (id) => {
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
          <div className="glass-card p-4">
            <div className="flex justify-between items-center mb-4">
              <h3 className="font-medium text-gray-900 dark:text-gray-100">Tipo Ordine</h3>
              <button onClick={() => setShowTypeModal(true)} className={`btn text-sm ${batchMode ? 'btn-purple' : 'btn-primary'}`}>
                {batchMode ? 'Più Fornitori' : 'Singolo Fornitore'}
              </button>
            </div>
          </div>
          <div className="glass-card p-4"><label htmlFor="schedule-date" className="block text-sm font-medium text-gray-700 mb-2">Data Programmazione</label><input id="schedule-date" name="schedule-date" type="date" value={selectedDate} onChange={(e) => setSelectedDate(e.target.value)} min={new Date().toISOString().split('T')[0]} className="input" /></div>
          <div className="glass-card p-4"><label htmlFor="schedule-time" className="block text-sm font-medium text-gray-700 mb-2">Ora Invio</label><select id="schedule-time" name="schedule-time" value={selectedTime} onChange={(e) => setSelectedTime(e.target.value)} className="select">{timeSlots.map(time => <option key={time} value={time}>{time}</option>)}</select></div>
          {!batchMode && <div className="glass-card p-4"><label htmlFor="schedule-supplier" className="block text-sm font-medium text-gray-700 mb-2">Seleziona Fornitore</label><select id="schedule-supplier" name="schedule-supplier" value={selectedSupplier} onChange={(e) => setSelectedSupplier(e.target.value)} className="select"><option value="">Scegli un fornitore...</option>{suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}</select></div>}
          {selectedSupplierData && selectedSupplierData.products && <div className="glass-card p-4"><h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Prodotti</h3><div className="space-y-3">{selectedSupplierData.products.map(product => <div key={product} className="flex items-center justify-between p-2 border border-gray-100 rounded-lg"><label className="flex items-center space-x-3 flex-1"><input type="checkbox" id={`schedule-product-checkbox-${product}`} name={`schedule-product-checkbox-${product}`} checked={!!(orderItems[product] && orderItems[product] !== '0')} onChange={(e) => { if (!e.target.checked) setOrderItems(prev => ({ ...prev, [product]: '0' })); }} className="rounded border-gray-300 dark:border-gray-600 text-blue-600 dark:text-blue-400 focus:ring-blue-500 accent-blue-600 dark:accent-blue-400 transition-transform active:scale-95" /><span className="text-sm text-gray-700">{product}</span></label><input type="tel" inputMode="decimal" id={`scheduled-quantity-${product}`} name={`scheduled-quantity-${product}`} placeholder="Qt." value={orderItems[product] || ''} onChange={(e) => setOrderItems(prev => ({ ...prev, [product]: e.target.value }))} className="input-sm w-16 text-center" /></div>)}</div></div>}
          {selectedSupplierData && selectedSupplierData.contact_method === 'email' && <div className="glass-card p-4"><label htmlFor="schedule-email-subject" className="block text-sm font-medium text-gray-700 mb-2">Oggetto Email</label><input id="schedule-email-subject" name="schedule-email-subject" type="text" value={emailSubject} onChange={(e) => setEmailSubject(e.target.value)} className="input" placeholder="Oggetto dell'email" /></div>}
          {selectedSupplierData && <div className="glass-card p-4"><label htmlFor="schedule-additional-items" className="block text-sm font-medium text-gray-700 mb-2">Prodotti Aggiuntivi</label><textarea id="schedule-additional-items" name="schedule-additional-items" value={additionalItems} onChange={(e) => setAdditionalItems(e.target.value)} placeholder="Inserisci prodotti non in lista..." className="input" rows="3" /></div>}
          
          {scheduledOrders.length > 0 && !batchMode ? (<div className="space-y-4">
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
                                                            <button onClick={() => { setPrefilledData({ type: 'order', data: order, immediateSend: true }); navigate('/create-order'); }} className="p-1 text-green-500 hover:bg-green-100 rounded"><Send size={14} /></button>
                                                            <button onClick={() => setEditingOrder(order)} className="p-1 text-blue-500 hover:bg-blue-100 rounded"><Edit3 size={14} /></button>
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
                                                            <button onClick={() => { setPrefilledData({ type: 'order', data: order, immediateSend: true }); navigate('/create-order'); }} className="p-1 text-green-500 hover:bg-green-100 rounded"><Send size={14} /></button>
                                                            <button onClick={() => setEditingOrder(order)} className="p-1 text-blue-500 hover:bg-blue-100 rounded"><Edit3 size={14} /></button>
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
            {selectedDate && (batchMode || (selectedSupplierData && (Object.keys(orderItems).some(key => orderItems[key] && orderItems[key] !== '0') || additionalItems.trim()))) && <button onClick={scheduleOrder} disabled={isSubmitting} className="w-full bg-purple-500 text-white py-3 rounded-lg font-medium hover:bg-purple-600 transition-colors flex items-center justify-center space-x-2 disabled:bg-purple-300">{isSubmitting ? <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" /> : <Calendar size={20} />}<span>{isSubmitting ? (editingOrder ? 'Aggiornando...' : (batchMode ? 'Programmando...' : 'Programmando...')) : (editingOrder ? 'Aggiorna Ordine' : (batchMode ? 'Programma Ordini' : 'Programma Ordine'))}</span></button>}
          </div>
        </div>
        {showTypeModal && (
          <div className="modal-overlay">
            <div className="glass-card p-6 max-w-sm w-full">
              <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Scegli Tipo Ordine</h3>
              <div className="space-y-3">
                <button onClick={() => { setBatchMode(false); setShowTypeModal(false); }} className="btn btn-primary w-full">Singolo Fornitore</button>
                <button onClick={() => { setBatchMode(true); setShowTypeModal(false); }} className="btn btn-purple w-full">Più Fornitori</button>
              </div>
            </div>
          </div>
        )}
      </div>
    );
}

export default SchedulePage;
