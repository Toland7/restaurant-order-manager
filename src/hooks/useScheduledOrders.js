import { useState, useEffect } from 'react';
import { supabaseHelpers } from '../supabase';

export const useScheduledOrders = (user) => {
    const [scheduledOrders, setScheduledOrders] = useState([]);

    useEffect(() => {
        const fetchScheduledOrders = async () => {
            if (user) {
                try {
                    const scheduledData = await supabaseHelpers.getScheduledOrders(user.id);
                    setScheduledOrders(scheduledData);
                } catch (error) {
                    console.error('Error fetching scheduled orders:', error);
                    setScheduledOrders([]);
                }
            } else {
                setScheduledOrders([]);
            }
        };

        fetchScheduledOrders();
    }, [user]);

    return { scheduledOrders, setScheduledOrders };
};