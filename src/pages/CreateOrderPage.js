import React, { useState, useEffect, useCallback, useMemo } from 'react';
import { Trash2, PlusCircle, ArrowLeft, Send, Lock, Users, Search, Check, Plus, CheckCircle, ChevronDown } from 'lucide-react';
import { toast, Toaster } from 'react-hot-toast';
import Header from '../components/ui/Header';
import { usePrefill } from '../PrefillContext';
import useSubscriptionStatus from '../hooks/useSubscriptionStatus';
import { useProfileContext } from '../ProfileContext';
import OrderFlow from '../components/OrderFlow';
import { supabaseHelpers } from '../supabase';
import logger from '../utils/logger';

import ExitConfirmationModal from '../components/modals/ExitConfirmationModal';


import { useNavigate, useLocation } from 'react-router-dom';
import SendOrderComponent, { openLinkInNewTab, generateEmailLink, generateOrderMessage } from '../components/ui/SendOrderComponent';
import useIsDesktop from '../hooks/useIsDesktop';

const CreateOrderPage = ({ scheduledOrders, setScheduledOrders, onOrderSent, multiOrders, setMultiOrders, suppliers, setOrders, user }) => {
  const navigate = useNavigate();
  const currentLocation = useLocation();
  const isDesktop = useIsDesktop();



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
  const [flowInitialStep, setFlowInitialStep] = useState('selection');
  const [isPrefilledOrder, setIsPrefilledOrder] = useState(false);
  const [initialMultiOrdersSet, setInitialMultiOrdersSet] = useState(false);

  const prepareAndValidateOrders = useCallback((checkType, suppressPermissionErrors = false) => {
    if (checkType === 'send' && !canSendOrders) {
      if (!suppressPermissionErrors) toast.error("Non hai i permessi per inviare ordini.");
      return suppressPermissionErrors ? 'ok' : null;
    }
    if (checkType === 'schedule' && !canScheduleOrders) {
      if (!suppressPermissionErrors) toast.error("Non hai i permessi per programmare ordini.");
      return suppressPermissionErrors ? 'ok' : null;
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
  }, [canSendOrders, canScheduleOrders, multiOrders, suppliers, setOrderMessages, setWizardOrders, setWizardStep, setNewlyCreatedOrders]);

  useEffect(() => {
    const params = new URLSearchParams(currentLocation.search);
    const reminderId = params.get('reminder_id');
    const batchId = params.get('batch_id');
    const userId = params.get('user_id');
    const flowInitialStepParam = params.get('flowInitialStep');

    if (flowInitialStepParam === 'review') {
      setFlowInitialStep('review');
    }

    if (reminderId) {
      const fetchScheduledOrder = async () => {
        try {
          const scheduledOrder = await supabaseHelpers.getScheduledOrderById(reminderId);
          if (scheduledOrder) {
            setPrefilledData({ type: 'schedule', data: scheduledOrder });
          } else {
            toast.error("Ordine programmato non trovato.");
          }
        } catch (error) {
          logger.error("Error loading reminder from URL:", error);
          toast.error("Impossibile caricare il promemoria.");
        }
      };
      fetchScheduledOrder();
    } else if (params.get('reminder_ids')) {
      const reminderIdsParam = params.get('reminder_ids');
      const fetchMultipleOrders = async () => {
        try {
          const ids = reminderIdsParam.split(',');
          const orders = await Promise.all(ids.map(id => supabaseHelpers.getScheduledOrderById(id)));
          const validOrders = orders.filter(o => o !== null);

          if (validOrders.length > 0) {
            const formattedOrders = validOrders.map(order => {
              const orderData = JSON.parse(order.order_data);
              const supplierObj = suppliers.find(s => s.id === order.supplier_id);
              return {
                id: order.id,
                supplier: order.supplier_id.toString(),
                items: orderData.items || {},
                additional: orderData.additional_items || '',
                email_subject: orderData.email_subject || supplierObj?.email_subject || '',
                searchTerm: ''
              };
            });
            setMultiOrders(formattedOrders);
            setIsPrefilledOrder(true);
            setInitialMultiOrdersSet(true);
            const validationResult = prepareAndValidateOrders('send', true);
            if (validationResult === 'ok') {
              setFlowInitialStep('review');
            }
          } else {
            toast.error("Nessun ordine trovato.");
          }
        } catch (error) {
          logger.error("Error loading orders from URL:", error);
          toast.error("Impossibile caricare gli ordini.");
        }
      };
      fetchMultipleOrders();
    } else if (batchId && userId) {
      const fetchBatch = async () => {
        try {
          const batchOrders = await supabaseHelpers.getScheduledOrdersByBatch(userId, batchId);
          if (batchOrders && batchOrders.length > 0) {
            const formattedOrders = batchOrders.map(order => {
              const orderData = JSON.parse(order.order_data);
              const supplierObj = suppliers.find(s => s.id === order.supplier_id);
              return {
                id: order.id,
                supplier: order.supplier_id.toString(),
                items: orderData.items || {},
                additional: orderData.additional_items || '',
                email_subject: orderData.email_subject || supplierObj?.email_subject || '',
                searchTerm: ''
              };
            });
            setMultiOrders(formattedOrders);
            setIsPrefilledOrder(true);
            setInitialMultiOrdersSet(true);
            const validationResult = prepareAndValidateOrders('send', true);
            if (validationResult === 'ok') {
              setFlowInitialStep('review');
            }
          } else {
            toast.error("Batch di ordini non trovato.");
          }
        } catch (error) {
          logger.error("Error loading batch from URL:", error);
          toast.error("Impossibile caricare il batch di ordini.");
        }
      };
      fetchBatch();
    }

    // Clean up the URL regardless after processing
    if (reminderId || batchId) {
      navigate('/create-order', { replace: true });
    }
  }, [currentLocation, setPrefilledData, navigate, user, suppliers, setMultiOrders, setIsPrefilledOrder, setInitialMultiOrdersSet, prepareAndValidateOrders, setFlowInitialStep]);

  const futureScheduledOrders = scheduledOrders.filter(o => new Date(o.scheduled_at) > new Date());

  // Effect to handle prefilled data (runs only when prefilledData changes to a non-null value)
  useEffect(() => {
    if (prefilledData && prefilledData.type === 'schedule') {
      const scheduledOrder = prefilledData.data;
      const orderData = JSON.parse(scheduledOrder.order_data);
      const supplierObj = suppliers.find(s => s.id === scheduledOrder.supplier_id);

      if (!supplierObj) {
        toast.error("Fornitore non trovato per l'ordine programmato.");
        // Ensure prefilledData is cleared to avoid re-triggering this effect
        setPrefilledData(null); // Clear context
        setIsPrefilledOrder(false);
        setInitialMultiOrdersSet(false); // Reset in case we need to init multiOrders again
        return;
      }

      setMultiOrders([
        {
          id: Date.now(),
          supplier: scheduledOrder.supplier_id.toString(),
          items: orderData.items || {},
          additional: orderData.additional_items || '',
          email_subject: orderData.email_subject || supplierObj.email_subject || '',
          searchTerm: ''
        }
      ]);
      setIsPrefilledOrder(true);
      setInitialMultiOrdersSet(true); // Mark that multiOrders have been set

      const timeoutId = setTimeout(() => {
        const validationResult = prepareAndValidateOrders('send');
        if (validationResult === 'ok') {
          setFlowInitialStep('review');
        }
        // Clear prefilledData ONLY IF this page was INITIALLY loaded with prefilled data
        // (i.e., from a notification). Do NOT clear if this page just SET prefilledData for navigation.
        if (isPrefilledOrder) {
          setPrefilledData(null);
        }
      }, 0);

      return () => clearTimeout(timeoutId);
    } else if (prefilledData && prefilledData.type === 'multi-schedule' && Array.isArray(prefilledData.data)) {
      // New logic for multi-scheduled orders
      setMultiOrders(prefilledData.data);
      setIsPrefilledOrder(true);
      setInitialMultiOrdersSet(true);

      const timeoutId = setTimeout(() => {
        const validationResult = prepareAndValidateOrders('send');
        if (validationResult === 'ok') {
          setFlowInitialStep('review');
        }
        if (isPrefilledOrder) {
          setPrefilledData(null);
        }
      }, 0);

      return () => clearTimeout(timeoutId);
    }
  }, [prefilledData, suppliers, setPrefilledData, prepareAndValidateOrders, setFlowInitialStep, setIsPrefilledOrder, setMultiOrders, setInitialMultiOrdersSet, isPrefilledOrder]);





  // Effect to initialize multiOrders for non-prefilled cases or after prefilled data is cleared
  // This effect runs only once when prefilledData is null and initialMultiOrdersSet is false
  useEffect(() => {
    if (!prefilledData && !initialMultiOrdersSet) {
      setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '', email_subject: '', searchTerm: '' }]);
      setIsPrefilledOrder(false);
      setInitialMultiOrdersSet(true); // Mark as set
    }
  }, [prefilledData, initialMultiOrdersSet, setMultiOrders, setIsPrefilledOrder, setInitialMultiOrdersSet]);

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



  const hasUnsavedChanges = () => multiOrders.some(order => order.supplier && (Object.keys(order.items).some(key => order.items[key] && order.items[key] !== '0') || order.additional.trim() || order.email_subject?.trim()));

  const onConfirmExit = () => {
    setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '', email_subject: '', searchTerm: '' }]);
    setShowExitConfirm(false);
    navigate(-1);
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
      logger.error('Error saving order:', error);
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
      logger.error('Error linking to scheduled order:', error);
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
    // Filter out invalid orders and format them for SchedulePage
    const ordersToSchedule = multiOrders.filter(order => order.supplier && (Object.keys(order.items).some(key => order.items[key] && order.items[key] !== '0') || order.additional.trim())) // Basic validation for non-empty orders
      .map(order => ({
        supplier: order.supplier,
        items: order.items,
        additional: order.additional,
        email_subject: order.email_subject
      }));

    if (ordersToSchedule.length === 0) {
      toast.error("Nessun ordine valido da programmare.");
      return;
    }

    navigate('/schedule', { state: { ordersToSchedule: ordersToSchedule } });
  };

  return (
    <div className="min-h-screen app-background">
      {!isDesktop && <Header title="Crea Ordine" onBack={() => { isPrefilledOrder ? navigate(-1) : (hasUnsavedChanges() ? setShowExitConfirm(true) : navigate(-1)); }} />}
      <div className="max-w-sm mx-auto px-6 py-6 space-y-6">
        {isDesktop && (
          <div className="flex justify-between items-center mb-2">
             <h1 className="text-3xl font-bold text-gray-900 dark:text-white">Crea Ordine</h1>
          </div>
        )}
        <OrderFlow initialStep={flowInitialStep}>
          {/* STEP 1: SELECTION */}
          <OrderFlow.Step name="selection">
            {suppliers.length === 0 && <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 text-center"><p className="text-yellow-800 text-sm mb-3">Non hai ancora fornitori configurati</p><button onClick={() => navigate('/suppliers')} className="text-yellow-600 hover:text-yellow-800 font-medium text-sm">Aggiungi il primo fornitore →</button></div>}
            <div className={`space-y-6 ${isDesktop ? 'grid grid-cols-2 gap-6 space-y-0 items-start' : ''}`}>
              {multiOrders.map((order, index) => {
                const supplierData = suppliers.find(s => s.id.toString() === order.supplier);
                return (
                  <div key={order.id} className="glass-card p-0 h-full flex flex-col overflow-hidden border border-gray-200 dark:border-gray-700 shadow-sm hover:shadow-md transition-shadow duration-200">
                    <div className="bg-gray-50 dark:bg-gray-800/50 p-4 border-b border-gray-100 dark:border-gray-700 flex justify-between items-center">
                      <div className="flex items-center space-x-3">
                        <div className="bg-blue-100 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400 p-2 rounded-lg">
                          <span className="font-bold text-sm">#{index + 1}</span>
                        </div>
                        <div>
                          <h3 className="font-semibold text-gray-900 dark:text-gray-100">
                            {supplierData ? supplierData.name : 'Nuovo Ordine'}
                          </h3>
                          <p className="text-xs text-gray-500 dark:text-gray-400">
                            {supplierData ? `${supplierData.products.length} prodotti disponibili` : 'Seleziona un fornitore'}
                          </p>
                        </div>
                      </div>
                      {isProUser && multiOrders.length > 1 && (
                        <button onClick={() => removeSupplierOrder(order.id)} className="text-gray-400 hover:text-red-500 transition-colors p-1" title="Rimuovi ordine" disabled={isSubmitting}>
                          <Trash2 size={18} />
                        </button>
                      )}
                    </div>
                    
                    <div className="p-5 space-y-5 flex-1">
                      <div>
                        <label htmlFor={`supplier-select-${order.id}`} className="block text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">Fornitore</label>
                        <div className="relative">
                          <select 
                            id={`supplier-select-${order.id}`} 
                            name={`supplier-select-${order.id}`} 
                            value={order.supplier} 
                            onChange={(e) => updateSupplierOrder(order.id, 'supplier', e.target.value)} 
                            className="select w-full !pl-12 appearance-none" 
                            disabled={isSubmitting}
                          >
                            <option value="">Seleziona...</option>
                            {suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier?.name || 'Fornitore senza nome'}</option>)}
                          </select>
                          <div className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 pointer-events-none">
                            <Users size={18} />
                          </div>
                          <div className="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400 pointer-events-none">
                            <ChevronDown size={16} />
                          </div>
                        </div>
                      </div>

                      {supplierData && (
                        <>
                          <div>
                            <div className="flex justify-between items-end mb-3">
                              <label className="block text-xs font-semibold text-gray-500 uppercase tracking-wider">Prodotti</label>
                              {isProUser && (
                                <div className="relative w-1/2">
                                  <input 
                                    type="text" 
                                    placeholder="Cerca..." 
                                    value={order.searchTerm || ''} 
                                    onChange={(e) => updateSupplierOrder(order.id, 'searchTerm', e.target.value)} 
                                    className="input input-sm w-full !pl-10" 
                                    disabled={isSubmitting} 
                                  />
                                  <Search size={14} className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400" />
                                </div>
                              )}
                            </div>
                            
                            {supplierData.products.length === 0 ? (
                              <div className="bg-gray-50 dark:bg-gray-800/50 rounded-lg p-6 text-center border border-dashed border-gray-200 dark:border-gray-700">
                                <p className="text-gray-500 text-sm">Nessun prodotto configurato per questo fornitore.</p>
                              </div>
                            ) : (
                              <div className="bg-gray-50 dark:bg-gray-900/30 rounded-xl border border-gray-100 dark:border-gray-700 overflow-hidden">
                                <div className="max-h-64 overflow-y-auto custom-scrollbar p-2 space-y-1">
                                  {supplierData.products
                                    .filter(product => !isProUser || product.toLowerCase().includes((order.searchTerm || '').toLowerCase()))
                                    .map(product => {
                                      const productId = `product-${order.id}-${product.replace(/\s+/g, '-')}`;
                                      const isSelected = order.items.hasOwnProperty(product);
                                      return (
                                        <div 
                                          key={product} 
                                          className={`group flex items-center justify-between p-2.5 rounded-lg transition-all duration-200 ${isSelected ? 'bg-white dark:bg-gray-800 shadow-sm border border-blue-100 dark:border-blue-900/30' : 'hover:bg-gray-100 dark:hover:bg-gray-800/50 border border-transparent'}`}
                                        >
                                          <label htmlFor={productId} className="flex items-center space-x-3 flex-1 cursor-pointer">
                                            <div className={`w-5 h-5 rounded border flex items-center justify-center transition-colors ${isSelected ? 'bg-blue-500 border-blue-500' : 'bg-white dark:bg-gray-700 border-gray-300 dark:border-gray-600 group-hover:border-blue-400'}`}>
                                              {isSelected && <Check size={12} className="text-white" />}
                                            </div>
                                            <input 
                                              id={productId} 
                                              type="checkbox" 
                                              className="sr-only" 
                                              checked={isSelected} 
                                              onChange={(e) => {
                                                const newItems = { ...order.items };
                                                if (e.target.checked) { newItems[product] = ''; } else { delete newItems[product]; }
                                                updateSupplierOrder(order.id, 'items', newItems);
                                              }} 
                                              disabled={isSubmitting} 
                                            />
                                            <span className={`text-sm font-medium ${isSelected ? 'text-blue-700 dark:text-blue-300' : 'text-gray-700 dark:text-gray-300'}`}>{product}</span>
                                          </label>
                                          
                                          {isSelected && (
                                            <div className="flex items-center animate-fadeIn">
                                              <input 
                                                type="text" 
                                                placeholder="Qt." 
                                                defaultValue={order.items[product] || ''} 
                                                onBlur={(e) => updateSupplierOrder(order.id, 'items', { ...order.items, [product]: e.target.value })} 
                                                className="input-sm w-20 text-center font-medium bg-gray-50 dark:bg-gray-900 border-gray-200 dark:border-gray-700 focus:border-blue-500 focus:ring-1 focus:ring-blue-500" 
                                                autoFocus
                                                disabled={isSubmitting} 
                                              />
                                            </div>
                                          )}
                                        </div>
                                      )
                                    })
                                  }
                                </div>
                              </div>
                            )}
                          </div>
                          
                          <div>
                            <label htmlFor={`additional-items-${order.id}`} className="block text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">Note / Prodotti Extra</label>
                            <textarea 
                              id={`additional-items-${order.id}`} 
                              value={order.additional} 
                              onChange={(e) => updateSupplierOrder(order.id, 'additional', e.target.value)} 
                              placeholder="Scrivi qui eventuali prodotti non in lista o note per il fornitore..." 
                              className="input min-h-[80px] text-sm resize-none" 
                              disabled={isSubmitting} 
                            />
                          </div>
                        </>
                      )}
                    </div>
                  </div>
                );
              })}
              
              <div className="h-full min-h-[200px]">
                <div className="glass-card h-full flex flex-col justify-center items-center p-8 border-2 border-dashed border-gray-300 dark:border-gray-700 hover:border-blue-400 dark:hover:border-blue-500 transition-colors group bg-gray-50/50 dark:bg-gray-800/30">
                  <div className="bg-white dark:bg-gray-800 p-4 rounded-full shadow-sm mb-4 group-hover:scale-110 transition-transform duration-200">
                    <Plus size={32} className="text-blue-500" />
                  </div>
                  <h3 className="text-lg font-semibold text-gray-900 dark:text-gray-100 mb-2">Aggiungi un altro ordine</h3>
                  <p className="text-sm text-gray-500 dark:text-gray-400 text-center mb-6 max-w-xs">
                    Crea ordini per più fornitori contemporaneamente e inviali in un colpo solo.
                  </p>
                  
                  <div className="relative w-full max-w-xs">
                    <select
                      onChange={(e) => {
                        handleAddSupplier(e.target.value);
                        e.target.value = '';
                      }}
                      disabled={(!isProUser && multiOrders.length >= 1 && multiOrders.some(o => o.supplier)) || isSubmitting}
                      className="select w-full text-center cursor-pointer hover:border-blue-400 transition-colors"
                    >
                      <option value="">Seleziona Fornitore...</option>
                      {suppliers.filter(s => !multiOrders.some(o => o.supplier === s.id.toString())).map(supplier => <option key={supplier.id} value={supplier.id}>{supplier?.name || 'Fornitore senza nome'}</option>)}
                    </select>
                    
                    {!isProUser && multiOrders.length >= 1 && multiOrders.some(o => o.supplier) && (
                      <div className="absolute inset-0 bg-white/80 dark:bg-gray-900/80 backdrop-blur-[1px] flex items-center justify-center rounded-lg cursor-not-allowed border border-gray-200 dark:border-gray-700">
                        <div className="flex items-center space-x-2 text-yellow-600 bg-yellow-50 dark:bg-yellow-900/30 px-3 py-1.5 rounded-full shadow-sm">
                          <Lock size={14} />
                          <span className="text-xs font-bold uppercase tracking-wide">Funzionalità PRO</span>
                        </div>
                      </div>
                    )}
                  </div>
                </div>
              </div>
            </div>

            {multiOrders.some(order => order.supplier && (Object.keys(order.items).some(key => order.items[key] && order.items[key] !== '0') || order.additional.trim())) && (
              <div className="flex space-x-3">
                <OrderFlow.GoToStepButton stepName="review" onClick={() => prepareAndValidateOrders('send')} className="btn btn-primary w-full" disabled={!canSendOrders || isSubmitting}>
                  {isSubmitting ? 'Preparazione...' : 'Anteprima e Invia'}
                  {!canSendOrders && <Lock size={12} className="inline-block ml-2" />}
                </OrderFlow.GoToStepButton>
                <OrderFlow.GoToStepButton stepName="schedule" onClick={() => prepareAndValidateOrders('schedule')} className="btn btn-warning w-full" disabled={!canScheduleOrders || isSubmitting}>
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
                <OrderFlow.PrevButton className="btn btn-secondary w-full" disabled={isSubmitting}><ArrowLeft size={16} className="inline-block mr-2" /> Modifica</OrderFlow.PrevButton>
                <OrderFlow.GoToStepButton stepName="send" className="btn btn-primary w-full" disabled={!canSendOrders || isSubmitting}><Send size={16} className="inline-block mr-2" /> Inizia Invio</OrderFlow.GoToStepButton>
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
                <OrderFlow.PrevButton className="btn btn-secondary w-full" disabled={isSubmitting}><ArrowLeft size={16} className="inline-block mr-2" /> Annulla</OrderFlow.PrevButton>
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
      <ExitConfirmationModal isOpen={showExitConfirm} onClose={() => setShowExitConfirm(false)} onConfirmExit={onConfirmExit} />
    </div>
  );
};

export default CreateOrderPage;