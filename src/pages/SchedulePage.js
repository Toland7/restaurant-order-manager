import React, { useState, useEffect, useCallback } from 'react';
import { Calendar, ChevronDown, Edit3, Trash2, Lock, PlusCircle, Send, CheckCircle } from 'lucide-react';
import { toast } from 'react-hot-toast';
import Header from '../components/ui/Header';

import { supabaseHelpers } from '../supabase';
import ScheduledOrderPreview from '../components/ui/ScheduledOrderPreview';
import { useNavigate, useLocation } from 'react-router-dom';
import useSubscriptionStatus from '../hooks/useSubscriptionStatus';
import { useProfileContext } from '../ProfileContext';
import OrderFlow from '../components/OrderFlow';
import SendOrderComponent, { generateOrderMessage, openLinkInNewTab, generateEmailLink } from '../components/ui/SendOrderComponent';
import ConfirmModal from '../components/ui/ConfirmModal';

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

const SchedulePage = ({ suppliers, scheduledOrders, setScheduledOrders, user }) => {
    const navigate = useNavigate();
    const location = useLocation();
    const { state } = location;
    const initialOrdersArray = state?.ordersToSchedule;
    const { isProUser } = useSubscriptionStatus();
    const { hasPermission } = useProfileContext();
    const canScheduleOrders = hasPermission('orders:schedule');


    const [view, setView] = useState('list'); // 'list', 'create', 'edit'
    const [multiOrders, setMultiOrders] = useState([]);
    const [selectedDate, setSelectedDate] = useState('');
    const [selectedTime, setSelectedTime] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [editingOrder, setEditingOrder] = useState(null);

    const [showSendWizard, setShowSendWizard] = useState(false);
    const [wizardOrders, setWizardOrders] = useState([]);
    const [wizardStep, setWizardStep] = useState(0);
    const [newlyCreatedOrders, setNewlyCreatedOrders] = useState([]);

    // State for delete confirmation modal
    const [deleteModalOpen, setDeleteModalOpen] = useState(false);
    const [ordersToDelete, setOrdersToDelete] = useState([]);

    const getRoundedTime = useCallback((date = new Date()) => {
        const minutes = date.getMinutes();
        const roundedMinutes = Math.ceil(minutes / 5) * 5;
        date.setMinutes(roundedMinutes);
        return date.toTimeString().slice(0, 5);
    }, []);

    const resetForm = useCallback(() => {
        setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '', email_subject: '', searchTerm: '' }]);
        setSelectedDate(new Date().toISOString().split('T')[0]);
        setSelectedTime(getRoundedTime());
        setEditingOrder(null);
    }, [getRoundedTime]);

    useEffect(() => {
        if (initialOrdersArray && initialOrdersArray.length > 0) {
            setEditingOrder(null); // Ensure no old edit state interferes
            setView('create'); // Switch to the create view

            // Map the incoming array into the multiOrders structure
            const formattedMultiOrders = initialOrdersArray.map(order => ({
                id: Date.now() + Math.random(), // Ensure unique ID for each order in the array
                supplier: order.supplier.toString(), // Use order.supplier directly (string ID)
                items: order.items || {},
                additional: order.additional || '',
                email_subject: order.email_subject || '',
                searchTerm: ''
            }));
            setMultiOrders(formattedMultiOrders); // Set the array

            // Set scheduled date and time - always default to current as it's not passed from CreateOrderPage
            setSelectedDate(new Date().toISOString().split('T')[0]);
            setSelectedTime(getRoundedTime());
        }
    }, [initialOrdersArray, setEditingOrder, setView, setMultiOrders, setSelectedDate, setSelectedTime, getRoundedTime]);

    const timeSlots = Array.from({ length: 24 * 12 }, (_, i) => {
        const h = Math.floor(i / 12).toString().padStart(2, '0');
        const m = ((i % 12) * 5).toString().padStart(2, '0');
        return `${h}:${m}`;
    });



    const handleSaveNewOrder = async () => {
        if (!canScheduleOrders) { toast.error("Non hai i permessi."); return null; }
        const scheduledDateTime = new Date(`${selectedDate}T${selectedTime}`);
        if (scheduledDateTime < new Date()) { toast.error('Non puoi programmare nel passato.'); return null; }

        const validOrders = multiOrders.filter(o => o.supplier);
        if (validOrders.length === 0) { toast.error('Nessun ordine valido.'); return null; }

        setIsSubmitting(true);
        try {
            const newScheduledOrders = [];
            for (const order of validOrders) {
                const orderData = { user_id: user.id, supplier_id: order.supplier, scheduled_at: scheduledDateTime.toISOString(), order_data: JSON.stringify({ items: order.items, additional_items: order.additional, email_subject: order.email_subject }) };
                const newScheduledOrder = await supabaseHelpers.createScheduledOrder(orderData);
                newScheduledOrders.push({ ...newScheduledOrder, supplier: suppliers.find(s => s.id.toString() === order.supplier) });
            }
            setScheduledOrders(prev => [...prev, ...newScheduledOrders]);
            toast.success(`${validOrders.length} ordini programmati!`);
            resetForm();
            setView('list');
        } catch (error) {
            console.error('Error saving scheduled order:', error);
            toast.error('Errore durante il salvataggio.');
        } finally {
            setIsSubmitting(false);
        }
    };

    const handleUpdateOrder = async () => {
        if (!canScheduleOrders) { toast.error("Non hai i permessi."); return null; }
        const scheduledDateTime = new Date(`${selectedDate}T${selectedTime}`);
        const validOrders = multiOrders.filter(o => o.supplier);
        if (validOrders.length === 0) { toast.error('Nessun ordine valido.'); return null; }

        setIsSubmitting(true);
        try {
            const originalBatch = scheduledOrders.filter(o => new Date(o.scheduled_at).getTime() === new Date(editingOrder.scheduled_at).getTime());
            for (const order of originalBatch) {
                await supabaseHelpers.deleteScheduledOrder(order.id);
            }

            const newScheduledOrders = [];
            for (const order of validOrders) {
                const orderData = { user_id: user.id, supplier_id: order.supplier, scheduled_at: scheduledDateTime.toISOString(), order_data: JSON.stringify({ items: order.items, additional_items: order.additional, email_subject: order.email_subject }) };
                const newScheduledOrder = await supabaseHelpers.createScheduledOrder(orderData);
                newScheduledOrders.push({ ...newScheduledOrder, supplier: suppliers.find(s => s.id.toString() === order.supplier) });
            }

            setScheduledOrders(prev => [...prev.filter(o => !originalBatch.some(orig => orig.id === o.id)), ...newScheduledOrders]);
            toast.success(`${validOrders.length} ordini aggiornati!`);
            resetForm();
            setView('list');
        } catch (error) {
            console.error('Error updating scheduled order:', error);
            toast.error('Errore durante l\'aggiornamento.');
        } finally {
            setIsSubmitting(false);
        }
    };

    const handleDeleteBatch = (ordersToDelete) => {
        if (!canScheduleOrders) { toast.error("Non hai i permessi."); return; }
        setOrdersToDelete(ordersToDelete);
        setDeleteModalOpen(true);
    };

    const confirmDelete = async () => {
        setIsSubmitting(true);
        try {
            await Promise.all(ordersToDelete.map(o => supabaseHelpers.deleteScheduledOrder(o.id)));
            setScheduledOrders(prev => prev.filter(o => !ordersToDelete.some(d => d.id === o.id)));
            toast.success(`${ordersToDelete.length} ordini eliminati.`);
        } catch (error) {
            toast.error("Errore durante l'eliminazione.");
        } finally {
            setIsSubmitting(false);
            setOrdersToDelete([]);
        }
    };

    const handleEditClick = (orderToEdit) => {
        const batch = scheduledOrders.filter(o => new Date(o.scheduled_at).getTime() === new Date(orderToEdit.scheduled_at).getTime());
        const scheduledAt = new Date(orderToEdit.scheduled_at);

        setEditingOrder(orderToEdit);
        setSelectedDate(scheduledAt.toISOString().split('T')[0]);
        setSelectedTime(scheduledAt.toTimeString().slice(0, 5));
        setMultiOrders(batch.map(o => {
            const data = JSON.parse(o.order_data || '{}');
            return {
                id: o.id,
                supplier: o.supplier_id.toString(),
                items: data.items || {},
                additional: data.additional_items || '',
                email_subject: data.email_subject || '',
                searchTerm: ''
            };
        }));
        setView('edit');
    };

    const renderListView = () => {
        const now = new Date();
        const fortyEightHoursAgo = new Date(now.getTime() - 48 * 60 * 60 * 1000);

        const readyToSendOrders = scheduledOrders.filter(o => {
            const scheduledAt = new Date(o.scheduled_at);
            return scheduledAt <= now && scheduledAt >= fortyEightHoursAgo;
        }).sort((a, b) => new Date(a.scheduled_at) - new Date(b.scheduled_at));

        const futureOrders = scheduledOrders.filter(o => new Date(o.scheduled_at) > now).sort((a, b) => new Date(a.scheduled_at) - new Date(b.scheduled_at));

        const groupedReadyToSendOrders = groupOrdersByScheduledAt(readyToSendOrders);
        const groupedFutureOrders = groupOrdersByScheduledAt(futureOrders);

        const isLimitReached = !isProUser && scheduledOrders.length >= 3;

        return (
            <>
                <div className="flex justify-center">
                    <button
                        onClick={() => {
                            if (isLimitReached) { toast.error('Limite raggiunto per il piano Base.'); return; }
                            resetForm();
                            setView('create');
                        }}
                        disabled={isLimitReached || !canScheduleOrders || isSubmitting}
                        className="btn btn-primary inline-flex items-center space-x-2"
                    >
                        <PlusCircle size={20} />
                        <span>Programma Nuovo Ordine</span>
                        {isLimitReached && <Lock size={16} />}
                    </button>
                </div>

                {scheduledOrders.length > 0 ? (
                    <div className="space-y-4">
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
                                                        <span>Lotto di {orders.length} ordini per le {scheduledAt.toLocaleTimeString()}</span>
                                                    ) : (
                                                        <span>Ordine per {suppliers.find(s => s.id === firstOrder.supplier_id)?.name || 'sconosciuto'} alle {scheduledAt.toLocaleTimeString()}</span>
                                                    )}
                                                    <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" />
                                                </summary>
                                                <div className="p-3 border-t">
                                                    {isBatch && (
                                                        <div className="flex items-center space-x-4 mb-3 pb-3 border-b border-gray-200 dark:border-gray-700">
                                                            <span className="text-sm font-medium">Azioni per il lotto:</span>
                                                            <button onClick={() => startSendNowWizard(orders)} className="p-1 text-green-500 hover:bg-green-100 rounded flex items-center space-x-1">
                                                                <Send size={14} />
                                                                <span>Invia</span>
                                                            </button>
                                                            <button onClick={() => handleDeleteBatch(orders)} className="p-1 text-red-500 hover:bg-red-100 rounded flex items-center space-x-1">
                                                                <Trash2 size={14} />
                                                                <span>Elimina</span>
                                                            </button>
                                                        </div>
                                                    )}
                                                    {orders.map(order => {
                                                        const supplier = suppliers.find(s => s.id === order.supplier_id);
                                                        return (
                                                            <div key={order.id} className="w-full text-left p-3 rounded-lg bg-white dark:bg-green-900/30 mb-2">
                                                                <div className="flex justify-between items-center">
                                                                    <div>
                                                                        <p className="font-medium text-sm text-green-900 dark:text-green-200">{supplier?.name || 'Fornitore eliminato'}</p>
                                                                    </div>
                                                                    <div className="flex items-center space-x-2">
                                                                        <button onClick={(e) => {
                                                                            e.stopPropagation();
                                                                            const supplierExists = suppliers.find(s => s.id === order.supplier_id);
                                                                            if (!supplierExists) {
                                                                                toast.error("Fornitore non trovato, impossibile inviare l'ordine.");
                                                                                return;
                                                                            }
                                                                            // This will now use the current wizard for sending single orders
                                                                            startSendNowWizard([order]);
                                                                        }} className="p-1 text-green-500 hover:bg-green-100 rounded"><Send size={14} /></button>
                                                                        <button onClick={(e) => {
                                                                            e.stopPropagation();
                                                                            if (!canScheduleOrders) {
                                                                                toast.error("Non hai i permessi per modificare ordini programmati.");
                                                                                return;
                                                                            }
                                                                            const supplierExists = suppliers.find(s => s.id === order.supplier_id);
                                                                            if (!supplierExists) {
                                                                                toast.error("Fornitore non trovato, modifica limitata.");
                                                                            }
                                                                            // Need to adjust handleEditClick to work with the multiOrders/editingOrder state
                                                                            handleEditClick(order);
                                                                        }} className="p-1 text-blue-500 hover:bg-blue-100 rounded"><Edit3 size={14} /></button>
                                                                        <button onClick={(e) => { e.stopPropagation(); handleDeleteBatch([order]); }} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button>
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
                                                        <span>Lotto di {orders.length} ordini per le {scheduledAt.toLocaleTimeString()}</span>
                                                    ) : (
                                                        <span>Ordine per {suppliers.find(s => s.id === firstOrder.supplier_id)?.name || 'sconosciuto'} alle {scheduledAt.toLocaleTimeString()}</span>
                                                    )}
                                                    <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" />
                                                </summary>
                                                <div className="p-3 border-t">
                                                    {isBatch && (
                                                        <div className="flex items-center space-x-4 mb-3 pb-3 border-b border-gray-200 dark:border-gray-700">
                                                            <span className="text-sm font-medium">Azioni per il lotto:</span>
                                                            <button onClick={() => startSendNowWizard(orders)} className="p-1 text-green-500 hover:bg-green-100 rounded flex items-center space-x-1">
                                                                <Send size={14} />
                                                                <span>Invia</span>
                                                            </button>
                                                            <button onClick={() => handleDeleteBatch(orders)} className="p-1 text-red-500 hover:bg-red-100 rounded flex items-center space-x-1">
                                                                <Trash2 size={14} />
                                                                <span>Elimina</span>
                                                            </button>
                                                        </div>
                                                    )}
                                                    {orders.map(order => {
                                                        const supplier = suppliers.find(s => s.id === order.supplier_id);
                                                        return (
                                                            <div key={order.id} className={`w-full text-left p-3 rounded-lg ${editingOrder?.id === order.id ? 'bg-purple-200' : 'bg-white'} dark:bg-purple-900/30 mb-2`}>
                                                                <div className="flex justify-between items-center">
                                                                    <div>
                                                                        <p className="font-medium text-sm text-purple-900">{supplier?.name || 'Fornitore eliminato'}</p>
                                                                    </div>
                                                                    <div className="flex items-center space-x-2">
                                                                        <button onClick={(e) => {
                                                                            e.stopPropagation();
                                                                            const supplierExists = suppliers.find(s => s.id === order.supplier_id);
                                                                            if (!supplierExists) {
                                                                                toast.error("Fornitore non trovato, impossibile inviare l'ordine.");
                                                                                return;
                                                                            }
                                                                            startSendNowWizard([order]);
                                                                        }} className="p-1 text-green-500 hover:bg-green-100 rounded"><Send size={14} /></button>
                                                                        <button onClick={(e) => {
                                                                            e.stopPropagation();
                                                                            if (!canScheduleOrders) {
                                                                                toast.error("Non hai i permessi per modificare ordini programmati.");
                                                                                return;
                                                                            }
                                                                            const supplierExists = suppliers.find(s => s.id === order.supplier_id);
                                                                            if (!supplierExists) {
                                                                                toast.error("Fornitore non trovato, modifica limitata.");
                                                                            }
                                                                            handleEditClick(order);
                                                                        }} className="p-1 text-blue-500 hover:bg-blue-100 rounded"><Edit3 size={14} /></button>
                                                                        <button onClick={(e) => { e.stopPropagation(); handleDeleteBatch([order]); }} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button>
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
                    <div className="text-center py-12"><Calendar size={48} className="mx-auto text-gray-300 mb-4" /><p className="text-gray-500">Nessun ordine programmato.</p></div>
                )}
            </>
        );
    };

    const renderFlowView = (mode) => {
        const isEdit = mode === 'edit';
        const title = isEdit ? "Modifica Programmazione" : "Nuova Programmazione";
        const onSave = isEdit ? handleUpdateOrder : handleSaveNewOrder;

        return (
            <>
                <h2 className="text-xl font-bold mb-4">{title}</h2>
                <OrderFlow initialStep="selection">
                    <OrderFlow.Step name="selection">
                        <h3 className="text-lg font-semibold mb-4">1. Seleziona Prodotti</h3>
                        <OrderSelectionUI
                            multiOrders={multiOrders}
                            setMultiOrders={setMultiOrders}
                            suppliers={suppliers}
                            isProUser={isProUser}
                            isSubmitting={isSubmitting}
                        />
                        <div className="mt-6 flex justify-end">
                            <OrderFlow.NextButton className="btn btn-primary" disabled={isSubmitting}>Avanti</OrderFlow.NextButton>
                        </div>
                    </OrderFlow.Step>
                    <OrderFlow.Step name="timing">
                        <h3 className="text-lg font-semibold mb-4">2. Scegli Data e Ora</h3>
                        <div className="glass-card p-4 space-y-4">
                            <div>
                                <label htmlFor="schedule-date" className="block text-sm font-medium text-gray-700 mb-2">Data</label>
                                <input id="schedule-date" type="date" value={selectedDate} onChange={(e) => setSelectedDate(e.target.value)} min={new Date().toISOString().split('T')[0]} className="input" disabled={isSubmitting} />
                            </div>
                            <div>
                                <label htmlFor="schedule-time" className="block text-sm font-medium text-gray-700 mb-2">Ora</label>
                                <select id="schedule-time" value={selectedTime} onChange={(e) => setSelectedTime(e.target.value)} className="select" disabled={isSubmitting}>{timeSlots.map(time => <option key={time} value={time}>{time}</option>)}</select>
                            </div>
                        </div>
                        <div className="mt-6 flex space-x-3">
                            <OrderFlow.PrevButton className="btn btn-secondary w-full" disabled={isSubmitting}>Indietro</OrderFlow.PrevButton>
                            <OrderFlow.NextButton className="btn btn-primary w-full" disabled={isSubmitting}>Vai al Riepilogo</OrderFlow.NextButton>
                        </div>
                    </OrderFlow.Step>
                    <OrderFlow.Step name="review">
                        <h3 className="text-lg font-semibold mb-4">3. Riepilogo</h3>
                        <div className="glass-card p-4 space-y-4">
                            <div>
                                <h4 className="font-medium">Orario</h4>
                                <p>{new Date(`${selectedDate}T${selectedTime}`).toLocaleString('it-IT', { dateStyle: 'full', timeStyle: 'short' })}</p>
                            </div>
                            <div>
                                <h4 className="font-medium">Ordini</h4>
                                {multiOrders.filter(o => o.supplier).map(order => {
                                    const supplier = suppliers.find(s => s.id.toString() === order.supplier);
                                    return <div key={order.id} className="mt-2"><p className="font-semibold">{supplier?.name || 'Sconosciuto'}</p><ul className="list-disc list-inside text-sm">{Object.entries(order.items).map(([name, qty]) => qty ? <li key={name}>{name}: {qty}</li> : null)}</ul></div>
                                })}
                            </div>
                        </div>
                        <div className="mt-6 flex space-x-3">
                            <OrderFlow.PrevButton className="btn btn-secondary w-full" disabled={isSubmitting}>Indietro</OrderFlow.PrevButton>
                            <button onClick={onSave} disabled={isSubmitting} className="btn btn-primary w-full">{isSubmitting ? 'Salvataggio...' : 'Salva'}</button>
                        </div>
                    </OrderFlow.Step>
                </OrderFlow>
            </>
        );
    };

    const startSendNowWizard = (ordersToSend) => {
        const validatedOrders = [];
        ordersToSend.forEach(scheduledOrder => {
            const supplier = suppliers.find(s => s.id === scheduledOrder.supplier_id);
            if (!supplier) {
                toast.error(`Fornitore per l'ordine ${scheduledOrder.id} non trovato. Impossibile inviare.`);
                return;
            }
            const order_data = JSON.parse(scheduledOrder.order_data);
            const message = generateOrderMessage(supplier, order_data.items || {}, order_data.additional_items || '');
            validatedOrders.push({
                id: scheduledOrder.id, // Keep original scheduled order ID for deletion later
                supplier,
                items: order_data.items || {},
                additional: order_data.additional_items || '',
                email_subject: order_data.email_subject || '',
                message,
            });
        });

        if (validatedOrders.length === 0) {
            toast.error("Nessun ordine valido da inviare.");
            return;
        }

        setWizardOrders(validatedOrders);
        setWizardStep(0);
        setNewlyCreatedOrders([]); // Clear previous
        setShowSendWizard(true);
    };

    const handleSendFromWizard = async (goToNext) => {
        setIsSubmitting(true);
        const order = wizardOrders[wizardStep];

        try {
            // Re-create the order in the main order history
            const orderData = { user_id: user.id, supplier_id: order.supplier.id, order_message: order.message, additional_items: order.additional || null, status: 'sent' };
            const orderItemsToInsert = Object.entries(order.items).filter(([_, quantity]) => quantity && quantity !== '0').map(([productName, quantity]) => ({ product_name: productName, quantity: parseInt(quantity, 10) || 0 }));
            const newOrder = await supabaseHelpers.createOrder(orderData, orderItemsToInsert);

            // Add to a temporary list for the summary screen
            setNewlyCreatedOrders(prev => [...prev, { ...newOrder, supplier: order.supplier, message: order.message, original_id: order.id }]);
            toast.success(`Ordine per ${order.supplier.name} salvato.`);

            // Delete the original scheduled order
            await supabaseHelpers.deleteScheduledOrder(order.id);

        } catch (error) {
            console.error('Error processing order:', error);
            toast.error('Errore durante il processamento dell\'ordine.');
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

    const handleFinishWizard = () => {
        // Filter out the sent orders from the main list
        setScheduledOrders(prev => prev.filter(o => !newlyCreatedOrders.some(sent => sent.original_id === o.id)));

        // Reset wizard state
        setShowSendWizard(false);
        setWizardOrders([]);
        setWizardStep(0);
        setNewlyCreatedOrders([]);

        toast.success("Invio completato!");
    };

    return (
        <div className="min-h-screen app-background">
            <Header title="Programma Ordini" onBack={() => {
                if (showSendWizard) {
                    setShowSendWizard(false);
                } else if (view !== 'list') {
                    setView('list');
                } else {
                    navigate('/');
                }
            }} />
            <div className="max-w-sm mx-auto px-6 py-6 space-y-6">
                {showSendWizard ? (
                    <OrderFlow initialStep="send">
                        <OrderFlow.Step name="send">
                            <SendOrderComponent
                                wizardOrders={wizardOrders}
                                wizardStep={wizardStep}
                                isSubmitting={isSubmitting}
                                onSend={handleSendFromWizard}
                                setWizardStep={setWizardStep}
                            />
                        </OrderFlow.Step>
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
                                    <button onClick={handleFinishWizard} className="btn btn-primary w-full" disabled={isSubmitting}>Fine</button>
                                </div>
                            </div>
                        </OrderFlow.Step>
                    </OrderFlow>
                ) : (
                    <>
                        {view === 'list' && renderListView()}
                        {view === 'create' && renderFlowView('create')}
                        {view === 'edit' && renderFlowView('edit')}
                    </>
                )}
            </div>

            <ConfirmModal
                isOpen={deleteModalOpen}
                onClose={() => setDeleteModalOpen(false)}
                onConfirm={confirmDelete}
                title="Conferma Eliminazione"
                message={`Sei sicuro di voler eliminare ${ordersToDelete.length} ordini programmati?`}
                confirmText="Elimina"
                cancelText="Annulla"
                confirmButtonClass="bg-red-500 hover:bg-red-600 text-white"
            />
        </div>
    );
};

const OrderSelectionUI = ({ multiOrders, setMultiOrders, suppliers, isProUser, isSubmitting }) => {
    const updateOrder = (id, field, value) => {
        setMultiOrders(prev => prev.map(order => order.id === id ? { ...order, [field]: value } : order));
    };

    const removeOrder = (id) => {
        if (multiOrders.length > 1) {
            setMultiOrders(prev => prev.filter(order => order.id !== id));
        }
    };

    const addOrder = (supplierId) => {
        if (!isProUser && multiOrders.length >= 1 && multiOrders.some(o => o.supplier)) {
            toast.error("Funzionalità PRO.");
            return;
        }
        if (supplierId) {
            const newOrder = { id: Date.now(), supplier: supplierId, items: {}, additional: '', email_subject: '', searchTerm: '' };
            if (multiOrders.length === 1 && !multiOrders[0].supplier) {
                setMultiOrders([newOrder]);
            } else {
                setMultiOrders(prev => [...prev, newOrder]);
            }
        }
    };

    return (
        <div className="space-y-6">
            {multiOrders.map((order, index) => {
                const supplierData = suppliers.find(s => s.id.toString() === order.supplier);
                return (
                    <div key={order.id} className="glass-card p-4">
                        <div className="flex justify-between items-center mb-4">
                            <h3 className="font-medium text-gray-900 dark:text-gray-100">Ordine {index + 1}: {supplierData ? supplierData.name : 'Seleziona Fornitore'}</h3>
                            {isProUser && multiOrders.length > 1 && <button onClick={() => removeOrder(order.id)} className="p-1 text-red-500 hover:bg-red-50 rounded" disabled={isSubmitting}><Trash2 size={16} /></button>}
                        </div>
                        <div className="space-y-4">
                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-2">Fornitore</label>
                                <select value={order.supplier} onChange={(e) => updateOrder(order.id, 'supplier', e.target.value)} className="select" disabled={isSubmitting}>
                                    <option value="">Scegli...</option>
                                    {suppliers.map(s => <option key={s.id} value={s.id}>{s.name}</option>)}
                                </select>
                            </div>
                            {supplierData && (
                                <>
                                    <div>
                                        <h4 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Prodotti</h4>
                                        {supplierData.products.length === 0 ? <p className="text-gray-500 text-sm">Nessun prodotto.</p> : (
                                            <div className="space-y-3">
                                                {supplierData.products.map(p => {
                                                    const productId = `schedule-product-${order.id}-${p.replace(/\s+/g, '-')}`;
                                                    const quantityId = `schedule-quantity-${order.id}-${p.replace(/\s+/g, '-')}`;
                                                    return (
                                                        <div key={p} className="flex items-center justify-between p-2 border rounded-lg">
                                                            <label htmlFor={productId} className="flex items-center space-x-3 flex-1">
                                                                <input id={productId} type="checkbox" checked={order.items.hasOwnProperty(p)} onChange={e => { const newItems = { ...order.items }; if (e.target.checked) { newItems[p] = '' } else { delete newItems[p] } updateOrder(order.id, 'items', newItems) }} className="rounded accent-blue-600" disabled={isSubmitting} />
                                                                <span>{p}</span>
                                                            </label>
                                                            <label htmlFor={quantityId} className="sr-only">Quantity for {p}</label>
                                                            <input id={quantityId} type="text" placeholder="Qt." defaultValue={order.items[p] || ''} onBlur={e => updateOrder(order.id, 'items', { ...order.items, [p]: e.target.value })} className="input-sm w-16 text-center" disabled={isSubmitting} />
                                                        </div>
                                                    );
                                                })}
                                            </div>
                                        )}
                                    </div>
                                    <div>
                                        <label className="block text-sm font-medium text-gray-700 mb-2">Prodotti Aggiuntivi</label>
                                        <textarea value={order.additional} onChange={e => updateOrder(order.id, 'additional', e.target.value)} className="input" rows="3" disabled={isSubmitting} />
                                    </div>
                                </>
                            )}
                        </div>
                    </div>
                );
            })}
            <div className="relative">
                <label className="block text-sm font-medium text-gray-700 mb-2">Aggiungi Fornitore</label>
                <select onChange={e => { addOrder(e.target.value); e.target.value = ''; }} disabled={((!isProUser && multiOrders.length >= 1 && multiOrders.some(o => o.supplier)) || isSubmitting)} className="select mb-4 disabled:bg-gray-200">
                    <option value="">Aggiungi...</option>
                    {suppliers.filter(s => !multiOrders.some(o => o.supplier === s.id.toString())).map(s => <option key={s.id} value={s.id}>{s.name}</option>)}
                </select>
            </div>
        </div>
    );
};

export default SchedulePage;