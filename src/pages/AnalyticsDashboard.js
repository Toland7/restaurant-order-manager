import React, { useState, useMemo } from 'react';
import { Chart as ChartJS, CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend, ArcElement, LineElement, PointElement } from 'chart.js';
import { Bar, Pie, Line } from 'react-chartjs-2';
import { Filter, ChevronDown } from 'lucide-react';
import Header from '../components/ui/Header';
import { useNavigate } from 'react-router-dom';

ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend,
  ArcElement,
  LineElement,
  PointElement
);

const AnalyticsDashboard = ({ orders, suppliers, setSelectedProductForHistory }) => {
    const navigate = useNavigate();
    const [filters, setFilters] = useState({
      dateFrom: '',
      dateTo: '',
      supplierId: '',
      productName: '',
    });
    const [productSearchTerm, setProductSearchTerm] = useState('');
    const [productFilterSupplierId, setProductFilterSupplierId] = useState('');
    const [productSortOrder, setProductSortOrder] = useState('name-asc');
    const [showFilters, setShowFilters] = useState(false);

    const filteredOrders = useMemo(() => {
      let currentOrders = orders;

      if (filters.dateFrom) {
        const fromDate = new Date(filters.dateFrom);
        currentOrders = currentOrders.filter(order => new Date(order.sent_at || order.created_at) >= fromDate);
      }
      if (filters.dateTo) {
        const toDate = new Date(filters.dateTo);
        currentOrders = currentOrders.filter(order => new Date(order.sent_at || order.created_at) <= toDate);
      }

      if (filters.supplierId) {
        currentOrders = currentOrders.filter(order => order.supplier_id.toString() === filters.supplierId);
      }

      if (filters.productName) {
        const searchProduct = filters.productName.toLowerCase();
        currentOrders = currentOrders.filter(order =>
          order.order_items && order.order_items.some(item =>
            item.product_name.toLowerCase().includes(searchProduct)
          )
        );
      }
      return currentOrders;
    }, [orders, filters]);

    const ordersOverTimeData = useMemo(() => {
      const monthlyCounts = {};
      filteredOrders.forEach(order => {
        const date = new Date(order.sent_at || order.created_at);
        const monthYear = `${date.getFullYear()}-${(date.getMonth() + 1).toString().padStart(2, '0')}`;
        monthlyCounts[monthYear] = (monthlyCounts[monthYear] || 0) + 1;
      });

      const sortedMonths = Object.keys(monthlyCounts).sort();
      return {
        labels: sortedMonths,
        datasets: [{
          label: 'Numero di Ordini',
          data: sortedMonths.map(month => monthlyCounts[month]),
          backgroundColor: 'rgba(75, 192, 192, 0.6)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1,
        }],
      };
    }, [filteredOrders]);

    const ordersBySupplierData = useMemo(() => {
      const supplierCounts = {};
      filteredOrders.forEach(order => {
        const supplier = suppliers.find(s => s.id === order.supplier_id);
        const supplierName = supplier ? supplier.name : 'Sconosciuto';
        supplierCounts[supplierName] = (supplierCounts[supplierName] || 0) + 1;
      });

      const labels = Object.keys(supplierCounts);
      const data = Object.values(supplierCounts);
      const backgroundColors = labels.map((_, i) => `hsl(${i * 60}, 70%, 60%)`);

      return {
        labels: labels,
        datasets: [{
          data: data,
          backgroundColor: backgroundColors,
          hoverOffset: 4,
        }],
      };
    }, [filteredOrders, suppliers]);

    const mostOrderedProductsData = useMemo(() => {
      const productQuantities = {};
      filteredOrders.forEach(order => {
        if (order.order_items) {
          order.order_items.forEach(item => {
            productQuantities[item.product_name] = (productQuantities[item.product_name] || 0) + Number(item.quantity);
          });
        }
      });

      const sortedProducts = Object.entries(productQuantities)
        .sort(([, a], [, b]) => b - a)
        .slice(0, 10);

      return {
        labels: sortedProducts.map(([name]) => name),
        datasets: [{
          label: 'Quantità Ordinata',
          data: sortedProducts.map(([, quantity]) => quantity),
          backgroundColor: 'rgba(153, 102, 255, 0.6)',
          borderColor: 'rgba(153, 102, 255, 1)',
          borderWidth: 1,
        }],
      };
    }, [filteredOrders]);

    const allOrderedProductsData = useMemo(() => {
      const productDetails = {}; // { productName: { totalQuantity: 0, suppliers: Set<string> } }
      filteredOrders.forEach(order => {
        const supplier = suppliers.find(s => s.id === order.supplier_id);
        const supplierName = supplier ? supplier.name : 'Sconosciuto';

        if (order.order_items) {
          order.order_items.forEach(item => {
            if (!productDetails[item.product_name]) {
              productDetails[item.product_name] = { totalQuantity: 0, suppliers: new Set() };
            }
            productDetails[item.product_name].totalQuantity += Number(item.quantity);
            productDetails[item.product_name].suppliers.add(supplierName);
          });
        }
      });

      let products = Object.entries(productDetails).map(([productName, details]) => [
        productName,
        details.totalQuantity,
        Array.from(details.suppliers).sort().join(', ') // Convert set to sorted array and join
      ]);

      // Apply search filter
      if (productSearchTerm) {
        const lowercasedSearchTerm = productSearchTerm.toLowerCase();
        products = products.filter(([productName]) =>
          productName.toLowerCase().includes(lowercasedSearchTerm)
        );
      }

      // Apply sorting
      products.sort((a, b) => {
        const [nameA, quantityA] = a;
        const [nameB, quantityB] = b;

        if (productSortOrder === 'name-asc') {
          return nameA.localeCompare(nameB);
        } else if (productSortOrder === 'name-desc') {
          return nameB.localeCompare(nameA);
        } else if (productSortOrder === 'quantity-desc') {
          return quantityB - quantityA;
        }
        return 0;
      });

      return products;
    }, [filteredOrders, productSearchTerm, productSortOrder, suppliers]);

    const clearFilters = () => {
      setFilters({ dateFrom: '', dateTo: '', supplierId: '', productName: '' });
    };

    const chartOptions = {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          position: 'top',
        },
        tooltip: {
          mode: 'index',
          intersect: false,
        },
      },
    };

    return (
      <div className="min-h-screen app-background">
        <Header title="Dashboard Analytics" onBack={() => navigate('/')} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-6">
          <div className="flex justify-between items-center mb-4">
            <button onClick={() => setShowFilters(!showFilters)} className="flex items-center space-x-2 px-4 py-2 bg-white dark:bg-gray-900 border border-gray-200 dark:border-gray-700 rounded-lg text-sm text-gray-700 dark:text-gray-100 hover:bg-gray-50 dark:hover:bg-gray-800">
              <Filter size={16} className="text-gray-700 dark:text-gray-200" />
              <span>Filtri</span>
              {Object.values(filters).some(v => v !== '') && <span className="bg-blue-500 text-white text-xs px-2 py-1 rounded-full">{Object.values(filters).filter(v => v !== '').length}</span>}
            </button>
            <button onClick={clearFilters} className="text-sm text-blue-500 dark:text-blue-400 hover:underline">Pulisci Filtri</button>
          </div>

          {showFilters && (
            <div className="glass-card p-5 mt-6 mb-7 pb-0.5 space-y-4">
              <div className="flex items-center justify-between"><h3 className="text-sm font-medium text-gray-900 dark:text-gray-100">Filtra Dati</h3><div className="flex items-center gap-2"><span className="px-2 py-1 text-xs rounded-full bg-blue-50 dark:bg-blue-500/10 text-blue-700 dark:text-blue-300">Ordini: {filteredOrders.length}</span><span className="px-2 py-1 text-xs rounded-full bg-green-50 dark:bg-green-500/10 text-green-700 dark:text-green-300">Fornitori: {ordersBySupplierData.labels.length}</span></div></div>
              <div className="flex items-center justify-between">
                <div className="flex gap-2">
                  <button onClick={() => { const d=new Date(); const f=new Date(d.getTime()-24*60*60*1000); setFilters(prev=>({ ...prev, dateFrom: f.toISOString().split('T')[0], dateTo: d.toISOString().split('T')[0] })); }} className="px-3 py-1 text-xs rounded-full bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700">Ultime 24h</button>
                  <button onClick={() => { const d=new Date(); const f=new Date(d.getFullYear(), d.getMonth(), 1); setFilters(prev=>({ ...prev, dateFrom: f.toISOString().split('T')[0], dateTo: d.toISOString().split('T')[0] })); }} className="px-3 py-1 text-xs rounded-full bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700">Questo mese</button>
                  <button onClick={() => { const d=new Date(); const f=new Date(d.getTime()-7*24*60*60*1000); setFilters(prev=>({ ...prev, dateFrom: f.toISOString().split('T')[0], dateTo: d.toISOString().split('T')[0] })); }} className="px-3 py-1 text-xs rounded-full bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700">Ultimi 7g</button>
                  <button onClick={() => { const d=new Date(); const f=new Date(d.getTime()-30*24*60*60*1000); setFilters(prev=>({ ...prev, dateFrom: f.toISOString().split('T')[0], dateTo: d.toISOString().split('T')[0] })); }} className="px-3 py-1 text-xs rounded-full bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700">Ultimi 30g</button>
                  <button onClick={() => setFilters({ dateFrom: '', dateTo: '', supplierId: '', productName: '' })} className="px-3 py-1 text-xs rounded-full bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700">Tutti</button>
                </div>
                <button onClick={clearFilters} className="text-xs font-medium text-blue-600 dark:text-blue-400 hover:underline">Pulisci</button>
              </div>
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label htmlFor="analytics-date-from" className="block text-xs font-medium text-gray-700 mb-1">Da Data</label>
                  <input id="analytics-date-from" name="analytics-date-from" type="date" value={filters.dateFrom} onChange={(e) => setFilters(prev => ({ ...prev, dateFrom: e.target.value }))} className="input input-sm" />
                </div>
                <div>
                  <label htmlFor="analytics-date-to" className="block text-xs font-medium text-gray-700 mb-1">A Data</label>
                  <input id="analytics-date-to" name="analytics-date-to" type="date" value={filters.dateTo} onChange={(e) => setFilters(prev => ({ ...prev, dateTo: e.target.value }))} className="input input-sm" />
                </div>
              </div>
              <div>
                <label htmlFor="analytics-supplier" className="block text-xs font-medium text-gray-700 mb-1">Fornitore</label>
                <select id="analytics-supplier" name="analytics-supplier" value={filters.supplierId} onChange={(e) => setFilters(prev => ({ ...prev, supplierId: e.target.value }))} className="input input-sm">
                  <option value="">Tutti i fornitori</option>
                  {suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}
                </select>
              </div>
              <div>
                <label htmlFor="analytics-product" className="block text-xs font-medium text-gray-700 mb-1">Prodotto</label>
                <input id="analytics-product" name="analytics-product" type="text" value={filters.productName} onChange={(e) => setFilters(prev => ({ ...prev, productName: e.target.value }))} className="input input-sm" placeholder="Cerca prodotto..." />
              </div>
            </div>
          )}


          <div className="glass-card p-4">
            <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Ordini nel Tempo</h3>
            <div style={{ height: '250px' }}>
              <Line data={ordersOverTimeData} options={chartOptions} />
            </div>
          </div>

          <div className="glass-card p-4">
            <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Ordini per Fornitore</h3>
            <div style={{ height: '250px' }}>
              <Pie data={ordersBySupplierData} options={chartOptions} />
            </div>
          </div>

          <div className="glass-card p-4">
            <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Prodotti più Ordinati (Quantit)</h3>
            <div style={{ height: '250px' }}>
              <Bar data={mostOrderedProductsData} options={chartOptions} />
            </div>
          </div>

          {/* New section: All Ordered Products */} 
          {allOrderedProductsData.length > 0 && (
            <details className="glass-card group">
              <summary className="font-medium text-gray-800 dark:text-gray-100 bg-gray-50 dark:bg-gray-800/60 rounded-md p-4 cursor-pointer flex justify-between items-center list-none">
                <span>Tutti i Prodotti Ordinati ({allOrderedProductsData.length})</span>
                <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" />
              </summary>
              <div className="p-4 border-t border-gray-100">
                <div className="mb-4 space-y-3">
                  <div>
                    <label htmlFor="analytics-product-filter-supplier" className="block text-xs font-medium text-gray-700 mb-1">Filtra per Fornitore</label>
                    <select
                      id="analytics-product-filter-supplier"
                      name="analytics-product-filter-supplier"
                      value={productFilterSupplierId}
                      onChange={(e) => setProductFilterSupplierId(e.target.value)}
                      className="input input-sm"
                    >
                      <option value="">Tutti i fornitori</option>
                      {suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}
                    </select>
                  </div>
                  <div>
                    <label htmlFor="analytics-product-sort-order" className="block text-xs font-medium text-gray-700 mb-1">Ordina per</label>
                    <select
                      id="analytics-product-sort-order"
                      name="analytics-product-sort-order"
                      value={productSortOrder}
                      onChange={(e) => setProductSortOrder(e.target.value)}
                      className="input input-sm"
                    >
                      <option value="name-asc">Nome (A-Z)</option>
                      <option value="name-desc">Nome (Z-A)</option>
                      <option value="quantity-desc">Quantità (Decrescente)</option>
                    </select>
                  </div>
                </div>
                <label htmlFor="analytics-product-search" className="block text-xs font-medium text-gray-700 mb-1">Cerca Prodotto</label>
                <input
                  id="analytics-product-search"
                  name="analytics-product-search"
                  type="search"
                  placeholder="Cerca prodotto..."
                  value={productSearchTerm}
                  onChange={(e) => setProductSearchTerm(e.target.value)}
                  className="w-full p-2 mb-4 text-sm border border-gray-200 rounded-lg focus:ring-1 focus:ring-blue-500"
                />
                <div className="space-y-2">
                  {allOrderedProductsData.map(([productName, quantity, suppliersList]) => (
                    <button
                      key={productName}
                      onClick={() => {
                        setSelectedProductForHistory(productName);
                        navigate('/product-history');
                      }}
                      className="w-full text-left p-2 bg-gray-50 dark:bg-gray-800/60 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700"
                    >
                      <div className="flex justify-between items-center text-sm text-gray-700">
                        <span>{productName}</span>
                        <span className="font-medium">{quantity}</span>
                      </div>
                      <p className="text-xs text-gray-500 mt-1">Fornitori: {suppliersList}</p>
                    </button>
                  ))}
                </div>
              </div>
            </details>
          )}

          
          <div className="glass-card p-4"><h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Attività Recente</h3>{filteredOrders.slice(0, 3).map(order => { const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers; return <div key={order.id} className="flex items-center justify-between py-2 border-b border-gray-100 last:border-b-0"><div><p className="text-sm font-medium text-gray-900">{supplier?.name || 'Fornitore eliminato'}</p><p className="text-sm text-gray-500">{new Date(order.sent_at || order.created_at).toLocaleDateString('it-IT')}</p></div><span className="px-2 py-1 bg-green-100 dark:bg-green-900/30 text-green-800 dark:text-green-300 text-xs rounded-full">Inviato</span></div>; })}
          </div>
        </div>
      </div>
    );
}

export default AnalyticsDashboard;