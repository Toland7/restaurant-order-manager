import { useState, useEffect, useCallback } from 'react';
import { supabaseHelpers } from '../supabase';
import { toast } from 'react-hot-toast';

export const useNotifications = (user, setPrefilledData, navigate) => {
    const [unreadCount, setUnreadCount] = useState(0);

    const handleNotificationClick = useCallback(async (notification) => {
        console.log('🔔 Notification clicked:', notification);
        if (notification.reminder_id) {
            console.log('🔔 Loading scheduled order for reminder_id:', notification.reminder_id);
            try {
                const scheduledOrder = await supabaseHelpers.getScheduledOrderById(notification.reminder_id);
                console.log('🔔 Scheduled order loaded:', scheduledOrder);
                if (scheduledOrder) {
                    console.log('🔔 Setting prefilled data and navigating to create-order');
                    setPrefilledData({ type: 'order', data: scheduledOrder });
                    navigate('/create-order');
                } else {
                    console.log('🔔 Scheduled order not found');
                    toast.error("Ordine programmato non trovato.");
                }
            } catch (error) {
                console.error("Error loading reminder from notification:", error);
                toast.error("Impossibile caricare il promemoria.");
            }
        } else {
            console.log('🔔 Notification has no reminder_id');
            // Handle other notification types if any
        }
    }, [setPrefilledData, navigate]);

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