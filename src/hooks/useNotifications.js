import { useState, useEffect, useCallback } from 'react';
import { supabaseHelpers } from '../supabase';
import { toast } from 'react-hot-toast';

export const useNotifications = (user, setPrefilledData, navigate) => {
    const [unreadCount, setUnreadCount] = useState(0);

    const handleNotificationClick = useCallback(async (notification) => {
        let reminderIdsToProcess = [];
        if (notification.data && Array.isArray(notification.data.reminder_ids)) {
            reminderIdsToProcess = notification.data.reminder_ids;
        } else if (notification.data && notification.data.reminder_id) {
            reminderIdsToProcess = [notification.data.reminder_id];
        } else if (notification.reminder_id) { // Fallback to existing structure
            reminderIdsToProcess = [notification.reminder_id];
        }

        if (reminderIdsToProcess.length > 0) {
            try {
                if (reminderIdsToProcess.length === 1) {
                    // Existing logic for single reminder_id
                    const scheduledOrder = await supabaseHelpers.getScheduledOrderById(reminderIdsToProcess[0]);
                    if (scheduledOrder) {
                        setPrefilledData({ type: 'schedule', data: scheduledOrder });
                        navigate('/create-order?flowInitialStep=review');
                        await supabaseHelpers.markNotificationAsRead(notification.id);
                        setUnreadCount(prev => Math.max(0, prev - 1));
                    } else {
                        toast.error("Ordine programmato non trovato.");
                    }
                } else {
                    // New logic for multiple reminder_ids (array)
                    const scheduledOrders = await Promise.all(
                        reminderIdsToProcess.map(id => supabaseHelpers.getScheduledOrderById(id))
                    );
                    const validScheduledOrders = scheduledOrders.filter(Boolean); // Filter out any null/undefined results

                    if (validScheduledOrders.length > 0) {
                        // Format for multiOrders as expected by CreateOrderPage
                        const formattedMultiOrders = validScheduledOrders.map(so => {
                            const orderData = JSON.parse(so.order_data);
                            return {
                                id: so.id, // Use scheduled order ID as multiOrder ID for now
                                supplier: so.supplier_id.toString(),
                                items: orderData.items || {},
                                additional: orderData.additional_items || '',
                                email_subject: orderData.email_subject || '',
                                searchTerm: '' // Assuming searchTerm is not part of scheduled order data
                            };
                        });
                        setPrefilledData({ type: 'multi-schedule', data: formattedMultiOrders });
                        navigate('/create-order?flowInitialStep=review');
                        await supabaseHelpers.markNotificationAsRead(notification.id);
                        setUnreadCount(prev => Math.max(0, prev - 1));
                    } else {
                        toast.error("Nessun ordine programmato trovato per gli ID forniti.");
                    }
                }
            } catch (error) {
                console.error("Error loading reminder(s) from notification:", error);
                toast.error("Impossibile caricare il promemoria/i.");
            }
        } else {
            // Handle other notification types if any or no relevant reminder_id found
        }
    }, [setPrefilledData, navigate, setUnreadCount]);

    useEffect(() => {
        if (user) {
            const fetchUnreadCount = async () => {
                try {
                    const count = await supabaseHelpers.getUnreadNotificationsCount(user.id);
                    setUnreadCount(count);
                    if ('setAppBadge' in navigator) {
                        navigator.setAppBadge(count);
                    }
                } catch (error) {
                    console.error('Error fetching unread notifications count:', error);
                }
            };
            fetchUnreadCount();
        }
    }, [user]);

    return { unreadCount, setUnreadCount, handleNotificationClick };
};