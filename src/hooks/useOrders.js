import { useState, useEffect } from 'react';
import { supabaseHelpers } from '../supabase';
import useSubscriptionStatus from './useSubscriptionStatus'; // Import the hook

export const useOrders = (user) => {
    const [orders, setOrders] = useState([]);
    const { isProUser, loadingSubscription } = useSubscriptionStatus(); // Use the hook

    useEffect(() => {
        const fetchOrders = async () => {
            if (user && !loadingSubscription) { // Wait for subscription status to load
                try {
                    let filters = {};
                    if (!isProUser) {
                        const oneYearAgo = new Date();
                        oneYearAgo.setFullYear(oneYearAgo.getFullYear() - 1);
                        filters.dateFrom = oneYearAgo.toISOString();
                    }
                    const ordersData = await supabaseHelpers.getOrders(user.id, filters);
                    setOrders(ordersData);
                } catch (error) {
                    console.error('Error fetching orders:', error);
                    setOrders([]);
                }
            } else if (!user) {
                setOrders([]);
            }
        };

        fetchOrders();
    }, [user, isProUser, loadingSubscription]); // Re-fetch when subscription status changes

    return { orders, setOrders };
};