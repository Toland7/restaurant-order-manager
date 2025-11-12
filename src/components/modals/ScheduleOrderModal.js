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
        // Find the selected scheduled order to get its scheduled_at time
        const targetScheduledOrder = scheduledOrders.find(o => o.id === scheduledOrderId);
        if (!targetScheduledOrder) {
          toast.error("L'ordine programmato selezionato non è stato trovato.");
          setIsSubmitting(false);
          return;
        }
        const scheduledDateTime = new Date(targetScheduledOrder.scheduled_at);

        const newScheduledOrders = [];
        for (const order of multiOrders) {
          if (!order.supplier) continue; // Skip orders without a supplier

          const orderData = {
            user_id: targetScheduledOrder.user_id, // Assuming the user is the same
            supplier_id: order.supplier,
            scheduled_at: scheduledDateTime.toISOString(),
            order_data: JSON.stringify({ 
              items: order.items, 
              additional_items: order.additional, 
              email_subject: order.email_subject 
            })
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
        
        onSchedule();
      } catch (error) {
        console.error('Error linking to scheduled order:', error);
        toast.error("Errore durante l'aggiunta alla programmazione");
      } finally {
        setIsSubmitting(false);
      }
    };

    return (
      <div className="modal-overlay">
        <div className="bg-surface p-6 max-w-sm w-full max-h-96 overflow-y-auto rounded-xl shadow-lg border border-border flex flex-col">
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
                  className="btn btn-primary w-full"
                >
                  Crea un nuovo ordine programmato
                </button>
              </div>
            )}
          </div>
          <div className="mt-4 flex justify-end">
            <button onClick={onClose} className="btn btn-outline">Chiudi</button>
          </div>
        </div>
      </div>
    );
  };

export default ScheduleOrderModal;
