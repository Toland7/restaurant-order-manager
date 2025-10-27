import React, { useMemo } from 'react';
import { History } from 'lucide-react';
import Header from '../components/ui/Header';
import { useNavigate } from 'react-router-dom';

const ProductHistoryPage = ({ orders, suppliers, selectedProductForHistory }) => {
    const navigate = useNavigate();
    const productOrders = useMemo(() => {
      if (!selectedProductForHistory) return [];
      return orders.filter(order =>
        order.order_items && order.order_items.some(item => item.product_name === selectedProductForHistory)
      ).sort((a, b) => new Date(b.sent_at || b.created_at) - new Date(a.sent_at || a.created_at));
    }, [orders, selectedProductForHistory]);

    return (
      <div className="min-h-screen app-background">
        <Header title={`Storico Ordini per ${selectedProductForHistory}`} onBack={() => navigate('/analytics')} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-4">
          {productOrders.length === 0 ? (
            <div className="text-center py-12">
              <History size={48} className="mx-auto text-gray-300 dark:text-gray-600 mb-4" />
              <p className="text-gray-500">Nessun ordine trovato per questo prodotto.</p>
            </div>
          ) : (
            <div className="space-y-4">
              {productOrders.map(order => {
                const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers;
                const orderedItem = order.order_items.find(item => item.product_name === selectedProductForHistory);
                return (
                  <div key={order.id} className="glass-card p-4">
                    <div className="flex justify-between items-start mb-3">
                      <div>
                        <h3 className="font-medium text-gray-900">{supplier?.name || 'Fornitore eliminato'}</h3>
                        <p className="text-sm text-gray-500">
                          {new Date(order.sent_at || order.created_at).toLocaleDateString('it-IT')} - {new Date(order.sent_at || order.created_at).toLocaleTimeString('it-IT', { hour: '2-digit', minute: '2-digit' })}
                        </p>
                      </div>
                      {orderedItem && (
                        <span className="px-2 py-1 bg-blue-100 dark:bg-blue-900/30 text-blue-800 dark:text-blue-300 text-xs rounded-full">
                          Qt: {orderedItem.quantity}
                        </span>
                      )}
                    </div>
                    <div className="border-t pt-3">
                      <div className="text-xs text-gray-500 mb-1">Messaggio:</div>
                      <pre className="text-xs text-gray-700 dark:text-gray-200 whitespace-pre-wrap">{order.order_message}</pre>
                    </div>
                  </div>
                );
              })}
            </div>
          )}
        </div>
      </div>
    );
}

export default ProductHistoryPage;