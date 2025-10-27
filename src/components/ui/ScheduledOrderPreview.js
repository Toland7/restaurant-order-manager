import React from 'react';

const ScheduledOrderPreview = ({ order, suppliers }) => {
    const orderData = order.order_data ? JSON.parse(order.order_data) : { items: {}, additional_items: '' };

    return (
        <div className="p-2 bg-gray-50 dark:bg-gray-800/50 rounded-lg mt-2">
            <h4 className="font-medium text-sm mb-1">Dettaglio Ordine</h4>
            <ul className="text-xs space-y-1">
                {Object.entries(orderData.items).map(([product, quantity]) => (
                    <li key={product} className="flex justify-between"><span>{product}</span><span>{quantity}</span></li>
                ))}
            {orderData.additional_items && (
                <li className="flex justify-between"><span>{orderData.additional_items}</span><span></span></li>
            )}
        </ul>
        </div>
    );
}

export default ScheduledOrderPreview;