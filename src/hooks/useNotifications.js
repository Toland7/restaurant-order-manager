import { useState, useEffect, useCallback } from 'react';
import { supabaseHelpers } from '../supabase';
import { toast } from 'react-hot-toast';

export const useNotifications = (user, setPrefilledData, navigate) => {
    const [unreadCount, setUnreadCount] = useState(0);

  const handleNotificationClick = useCallback(async (notification) => {
    if (notification.reminder_id) {
      try {
        const scheduledOrder = await supabaseHelpers.getScheduledOrderById(notification.reminder_id);
        if (scheduledOrder) {
          setPrefilledData({ type: 'order', data: scheduledOrder });
          navigate('/create-order');
          // Auto-mark as read
          await supabaseHelpers.markNotificationAsRead(notification.id);
          setUnreadCount(prev => Math.max(0, prev - 1));
        } else {
          toast.error("Ordine programmato non trovato.");
        }
      } catch (error) {
        console.error("Error loading reminder from notification:", error);
        toast.error("Impossibile caricare il promemoria.");
      }
    } else {
      // Handle other notification types if any
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