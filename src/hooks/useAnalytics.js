import { useState, useEffect } from 'react';

export const useAnalytics = (orders, suppliers) => {
    const [analytics, setAnalytics] = useState({ totalOrders: 0, totalSuppliers: 0, ordersThisWeek: 0, mostOrderedProduct: '' });

    useEffect(() => {
        const calculateAnalytics = (ordersData, suppliersData) => {
            const now = new Date();
            const weekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);
            const ordersThisWeek = ordersData.filter(order => new Date(order.sent_at || order.created_at) > weekAgo).length;
            const productCounts = {};
            ordersData.forEach(order => {
                if (order.order_items) {
                    order.order_items.forEach(item => { productCounts[item.product_name] = (productCounts[item.product_name] || 0) + 1; });
                }
            });
            const mostOrderedProduct = Object.keys(productCounts).length > 0 ? Object.keys(productCounts).reduce((a, b) => productCounts[a] > productCounts[b] ? a : b) : 'Nessuno';
            setAnalytics({ totalOrders: ordersData.length, totalSuppliers: suppliersData.length, ordersThisWeek, mostOrderedProduct });
        };

        calculateAnalytics(orders, suppliers);
    }, [orders, suppliers]);

    return { analytics };
};