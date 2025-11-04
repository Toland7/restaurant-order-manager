import React, { useState } from 'react';
import { toast } from 'react-hot-toast';
import { usePrefill } from '../../PrefillContext';
import { supabaseHelpers } from '../../supabase';
import { useNavigate } from 'react-router-dom';

const ScheduleOrderModal = ({ onClose = () => {}, multiOrders = [], onSchedule = () => {}, scheduledOrders = [], setScheduledOrders = () => {}, suppliers }) => {
    const navigate = useNavigate();
    const { setPrefilledData } = usePrefill();
    const [isSubmitting, setIsSubmitting] = useState(false);
    const futureScheduledOrders = scheduledOrders.filter(o => new Date(o.scheduled_at) > new Date());

    const linkToScheduledOrder = async (scheduledOrderId) => {
      if (isSubmitting) return;
      setIsSubmitting(true);
      try {
        const existingScheduledOrder = await supabaseHelpers.getScheduledOrderById(scheduledOrderId);

        let existingOrderData = { items: {}, additional_items: '' };
        if (existingScheduledOrder.order_data) {
          try {
            existingOrderData = JSON.parse(existingScheduledOrder.order_data);
          } catch (e) {
            console.error("Failed to parse existing order_data from scheduled order", e);
          }
        }

        // For now, use the first order in multiOrders (backward compatibility)
        const currentOrder = multiOrders[0] || { items: {}, additional: '' };

        const mergedItems = { ...existingOrderData.items };
        Object.entries(currentOrder.items).forEach(([product, quantity]) => {
          const newQuantity = parseInt(quantity, 10) || 0;
          if (newQuantity > 0) {
            mergedItems[product] = (parseInt(mergedItems[product], 10) || 0) + newQuantity;
          } else if (mergedItems[product]) {
            delete mergedItems[product];
          }
        });

        let mergedAdditionalItems = existingOrderData.additional_items;
        if (currentOrder.additional.trim()) {
          mergedAdditionalItems = mergedAdditionalItems ? `${mergedAdditionalItems}\n${currentOrder.additional.trim()}` : currentOrder.additional.trim();
        }

        const updatedOrderData = {
          order_data: JSON.stringify({ items: mergedItems, additional_items: mergedAdditionalItems })
        };

        const updatedOrder = await supabaseHelpers.updateScheduledOrder(scheduledOrderId, updatedOrderData);
        setScheduledOrders(prev => prev.map(o => o.id === scheduledOrderId ? { ...o, ...updatedOrder } : o));

        toast.success('Ordine programmato aggiornato con successo!');
        onSchedule();
      } catch (error) {
        console.error('Error linking to scheduled order:', error);
        toast.error("Errore durante l'aggiornamento dell'ordine programmato");
      } finally {
        setIsSubmitting(false);
      }
    };

    return (
      <div className="modal-overlay">
        <div className="glass-card p-6 max-w-sm w-full max-h-[80vh] flex flex-col">
          <h3 className="font-medium text-dark-gray dark:text-gray-100 mb-4">Associa a un ordine programmato</h3>
          <div className="overflow-y-auto space-y-3">
            {futureScheduledOrders.length > 0 ? (
              futureScheduledOrders.map(order => (
                <button 
                  key={order.id} 
                  onClick={() => linkToScheduledOrder(order.id)}
                  disabled={isSubmitting}
                  className="w-full text-left p-3 bg-light-gray rounded-lg hover:bg-medium-gray disabled:bg-medium-gray"
                >
                  <p className="font-medium text-sm text-primary-blue">{suppliers.find(s => s.id === order.supplier_id)?.name || 'Fornitore eliminato'}</p>
                  <p className="text-xs text-dark-gray dark:text-gray-300">{new Date(order.scheduled_at).toLocaleString('it-IT', { dateStyle: 'short', timeStyle: 'short' })}</p>
                </button>
              ))
            ) : (
              <div className="text-center py-8">
                <p className="text-dark-gray mb-4">Nessun ordine futuro programmato per questo fornitore.</p>
                <button
                  onClick={() => {
                    // For now, schedule the first order in multiOrders
                    const currentOrder = multiOrders[0] || { supplier: '', items: {}, additional: '' };
                    setPrefilledData({
                      type: 'schedule',
                      data: {
                        supplier_id: currentOrder.supplier,
                        order_data: JSON.stringify({ items: currentOrder.items, additional_items: currentOrder.additional })
                      }
                    });
                    navigate('/schedule');
                  }}
                  className="w-full bg-primary-blue text-white py-3 rounded-lg font-medium hover:bg-secondary-blue transition-colors"
                >
                  Crea un nuovo ordine programmato
                </button>
              </div>
            )}
          </div>
          <div className="mt-4 flex justify-end">
            <button onClick={onClose} className="py-2 px-4 border border-medium-gray text-dark-gray rounded-lg hover:bg-light-gray">Chiudi</button>
          </div>
        </div>
      </div>
    );
  };

export default ScheduleOrderModal;
