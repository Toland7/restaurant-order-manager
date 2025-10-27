import { useState, useEffect } from 'react';
import { supabaseHelpers } from '../supabase';

export const useOrders = (user) => {
    const [orders, setOrders] = useState([]);

    useEffect(() => {
        const fetchOrders = async () => {
            if (user) {
                try {
                    const ordersData = await supabaseHelpers.getOrders(user.id);
                    setOrders(ordersData);
                } catch (error) {
                    console.error('Error fetching orders:', error);
                    setOrders([]);
                }
            } else {
                setOrders([]);
            }
        };

        fetchOrders();
    }, [user]);

    return { orders, setOrders };
};