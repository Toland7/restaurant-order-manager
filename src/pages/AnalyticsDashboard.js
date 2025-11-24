import React, { useState, useMemo } from 'react';
import { BarChart, Bar, LineChart, Line, PieChart, Pie, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, Cell } from 'recharts';
import { Filter, ChevronDown, Lock, TrendingUp, Package, ShoppingCart, Calendar as CalendarIcon, BarChart3, PieChart as PieChartIcon } from 'lucide-react';
import { useProfileContext } from '../ProfileContext';
import Header from '../components/ui/Header';
import { useNavigate } from 'react-router-dom';
import useIsDesktop from '../hooks/useIsDesktop';

const AnalyticsDashboard = ({ orders, suppliers, setSelectedProductForHistory }) => {
    const navigate = useNavigate();
    const isDesktop = useIsDesktop();
    const { hasPermission } = useProfileContext();
    const canViewAnalytics = hasPermission('analytics:view');

    const [filters, setFilters] = useState({
      dateFrom: '',
      dateTo: '',
      supplierId: '',
      productName: '',
    });
    const [pendingProductFilters, setPendingProductFilters] = useState({ searchTerm: '', supplierId: '', sortOrder: 'name-asc' });
    const [activeProductFilters, setActiveProductFilters] = useState({ searchTerm: '', supplierId: '', sortOrder: 'name-asc' });
    const [showFilters, setShowFilters] = useState(false);

    const filteredOrders = useMemo(() => {
      if (!canViewAnalytics) return [];
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
    }, [orders, filters, canViewAnalytics]);

    const ordersOverTimeData = useMemo(() => {
      const monthlyCounts = {};
      filteredOrders.forEach(order => {
        const date = new Date(order.sent_at || order.created_at);
        const monthYear = `${date.getFullYear()}-${(date.getMonth() + 1).toString().padStart(2, '0')}`;
        monthlyCounts[monthYear] = (monthlyCounts[monthYear] || 0) + 1;
      });

      return Object.keys(monthlyCounts).sort().map(month => ({
        name: month,
        'Numero di Ordini': monthlyCounts[month],
      }));
    }, [filteredOrders]);

    const ordersBySupplierData = useMemo(() => {
      const supplierCounts = {};
      filteredOrders.forEach(order => {
        const supplier = suppliers.find(s => s.id === order.supplier_id);
        const supplierName = supplier ? supplier.name : 'Sconosciuto';
        supplierCounts[supplierName] = (supplierCounts[supplierName] || 0) + 1;
      });

      return Object.entries(supplierCounts).map(([name, value]) => ({ name, value }));
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

      return Object.entries(productQuantities)
        .sort(([, a], [, b]) => b - a)
        .slice(0, 10)
        .map(([name, quantity]) => ({ name, 'Quantità Ordinata': quantity }));
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

      let productEntries = Object.entries(productDetails);

      // **EXCLUSIVE** supplier filter
      if (activeProductFilters.supplierId) {
        const selectedSupplier = suppliers.find(s => s.id === activeProductFilters.supplierId);
        if (selectedSupplier) {
          productEntries = productEntries.filter(([, details]) => details.suppliers.has(selectedSupplier.name));
        }
      }

      // Search term filter
      if (activeProductFilters.searchTerm) {
        const lowercasedSearchTerm = activeProductFilters.searchTerm.toLowerCase();
        productEntries = productEntries.filter(([productName]) =>
          productName.toLowerCase().includes(lowercasedSearchTerm)
        );
      }

      // Map to final format for sorting and rendering
      let products = productEntries.map(([productName, details]) => [
        productName,
        details.totalQuantity,
        Array.from(details.suppliers).sort().join(', ')
      ]);

      // Sorting
      products.sort((a, b) => {
        const [nameA, quantityA] = a;
        const [nameB, quantityB] = b;

        if (activeProductFilters.sortOrder === 'name-asc') {
          return nameA.localeCompare(nameB);
        } else if (activeProductFilters.sortOrder === 'name-desc') {
          return nameB.localeCompare(nameA);
        } else if (activeProductFilters.sortOrder === 'quantity-desc') {
          return quantityB - quantityA;
        }
        return 0;
      });

      return products;
    }, [filteredOrders, activeProductFilters, suppliers]);

    const clearFilters = () => {
      setFilters({ dateFrom: '', dateTo: '', supplierId: '', productName: '' });
    };

    // Calculate stats for cards
    const totalOrders = filteredOrders.length;
    const totalSuppliers = ordersBySupplierData.length;
    const totalProducts = allOrderedProductsData.length;
    const recentOrdersCount = filteredOrders.filter(o => {
      const orderDate = new Date(o.sent_at || o.created_at);
      const weekAgo = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000);
      return orderDate >= weekAgo;
    }).length;

    const PIE_CHART_COLORS = ['#3b82f6', '#8b5cf6', '#ec4899', '#f59e0b', '#10b981', '#06b6d4', '#f97316'];

    if (!canViewAnalytics) {
      return (
        <div className="min-h-screen app-background">
          {!isDesktop && <Header title="Dashboard Analytics" onBack={() => navigate('/')} />}
          <div className="max-w-sm mx-auto px-6 py-6 text-center">
            <Lock size={48} className="mx-auto text-gray-400 dark:text-gray-600 mb-4" />
            <p className="text-lg text-gray-700 dark:text-gray-300 mb-2">Accesso Negato</p>
            <p className="text-sm text-gray-500 dark:text-gray-400">Non hai i permessi per visualizzare la dashboard analytics.</p>
          </div>
        </div>
      );
    }

    return (
      <div className="min-h-screen app-background">
        {!isDesktop && <Header title="Dashboard Analytics" onBack={() => navigate('/')} />}
        <div className="max-w-sm mx-auto px-6 py-6 space-y-6">
          {isDesktop && (
            <div className="flex justify-between items-center mb-2">
              <h1 className="text-3xl font-bold text-gray-900 dark:text-white">Analisi</h1>
            </div>
          )}

          {/* Stats Cards */}
          <div className="grid grid-cols-2 gap-3">
            <div className="glass-card p-4 bg-gradient-to-br from-blue-50 to-blue-100 dark:from-blue-900/20 dark:to-blue-800/20 border border-blue-200 dark:border-blue-800/30">
              <div className="flex items-center justify-between mb-2">
                <div className="w-10 h-10 bg-gradient-to-br from-blue-500 to-blue-600 rounded-lg flex items-center justify-center shadow-md">
                  <ShoppingCart size={20} className="text-white" />
                </div>
              </div>
              <p className="text-2xl font-bold text-gray-900 dark:text-white">{totalOrders}</p>
              <p className="text-xs text-gray-700 dark:text-gray-300 font-medium mt-1">Ordini Totali</p>
            </div>

            <div className="glass-card p-4 bg-gradient-to-br from-purple-50 to-purple-100 dark:from-purple-900/20 dark:to-purple-800/20 border border-purple-200 dark:border-purple-800/30">
              <div className="flex items-center justify-between mb-2">
                <div className="w-10 h-10 bg-gradient-to-br from-purple-500 to-purple-600 rounded-lg flex items-center justify-center shadow-md">
                  <Package size={20} className="text-white" />
                </div>
              </div>
              <p className="text-2xl font-bold text-gray-900 dark:text-white">{totalSuppliers}</p>
              <p className="text-xs text-gray-700 dark:text-gray-300 font-medium mt-1">Fornitori Attivi</p>
            </div>

            <div className="glass-card p-4 bg-gradient-to-br from-green-50 to-green-100 dark:from-green-900/20 dark:to-green-800/20 border border-green-200 dark:border-green-800/30">
              <div className="flex items-center justify-between mb-2">
                <div className="w-10 h-10 bg-gradient-to-br from-green-500 to-green-600 rounded-lg flex items-center justify-center shadow-md">
                  <TrendingUp size={20} className="text-white" />
                </div>
              </div>
              <p className="text-2xl font-bold text-gray-900 dark:text-white">{recentOrdersCount}</p>
              <p className="text-xs text-gray-700 dark:text-gray-300 font-medium mt-1">Ultimi 7 Giorni</p>
            </div>

            <div className="glass-card p-4 bg-gradient-to-br from-orange-50 to-orange-100 dark:from-orange-900/20 dark:to-orange-800/20 border border-orange-200 dark:border-orange-800/30">
              <div className="flex items-center justify-between mb-2">
                <div className="w-10 h-10 bg-gradient-to-br from-orange-500 to-orange-600 rounded-lg flex items-center justify-center shadow-md">
                  <BarChart3 size={20} className="text-white" />
                </div>
              </div>
              <p className="text-2xl font-bold text-gray-900 dark:text-white">{totalProducts}</p>
              <p className="text-xs text-gray-700 dark:text-gray-300 font-medium mt-1">Prodotti Unici</p>
            </div>
          </div>

          {/* Filters */}
          <div className="flex justify-between items-center">
            <button onClick={() => setShowFilters(!showFilters)} className="flex items-center space-x-2 px-4 py-2.5 bg-white dark:bg-gray-900 border border-gray-200 dark:border-gray-700 rounded-xl text-sm text-gray-700 dark:text-gray-100 hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors shadow-sm">
              <Filter size={16} className="text-gray-700 dark:text-gray-200" />
              <span className="font-medium">Filtri</span>
              {Object.values(filters).some(v => v !== '') && <span className="bg-blue-500 text-white text-xs px-2 py-0.5 rounded-full font-bold">{Object.values(filters).filter(v => v !== '').length}</span>}
            </button>
            <button onClick={clearFilters} className="text-sm text-blue-600 dark:text-blue-400 hover:underline font-medium">Pulisci Filtri</button>
          </div>

          {showFilters && (
            <div className="glass-card p-5 space-y-4 border border-gray-200 dark:border-gray-700">
              <div className="flex items-center justify-between">
                <h3 className="text-sm font-bold text-gray-900 dark:text-gray-100">Filtra Dati</h3>
                <div className="flex items-center gap-2">
                  <span className="px-2.5 py-1 text-xs rounded-full bg-blue-100 dark:bg-blue-500/20 text-blue-700 dark:text-blue-300 font-semibold">Ordini: {filteredOrders.length}</span>
                  <span className="px-2.5 py-1 text-xs rounded-full bg-green-100 dark:bg-green-500/20 text-green-700 dark:text-green-300 font-semibold">Fornitori: {ordersBySupplierData.length}</span>
                </div>
              </div>
              <div className="flex items-center justify-between">
                <div className="flex gap-2 flex-wrap">
                  <button onClick={() => { const d=new Date(); const f=new Date(d.getTime()-24*60*60*1000); setFilters(prev=>({ ...prev, dateFrom: f.toISOString().split('T')[0], dateTo: d.toISOString().split('T')[0] })); }} className="px-3 py-1.5 text-xs rounded-full bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700 font-medium transition-colors">24h</button>
                  <button onClick={() => { const d=new Date(); const f=new Date(d.getTime()-7*24*60*60*1000); setFilters(prev=>({ ...prev, dateFrom: f.toISOString().split('T')[0], dateTo: d.toISOString().split('T')[0] })); }} className="px-3 py-1.5 text-xs rounded-full bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700 font-medium transition-colors">7g</button>
                  <button onClick={() => { const d=new Date(); const f=new Date(d.getTime()-30*24*60*60*1000); setFilters(prev=>({ ...prev, dateFrom: f.toISOString().split('T')[0], dateTo: d.toISOString().split('T')[0] })); }} className="px-3 py-1.5 text-xs rounded-full bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700 font-medium transition-colors">30g</button>
                  <button onClick={() => { const d=new Date(); const f=new Date(d.getFullYear(), d.getMonth(), 1); setFilters(prev=>({ ...prev, dateFrom: f.toISOString().split('T')[0], dateTo: d.toISOString().split('T')[0] })); }} className="px-3 py-1.5 text-xs rounded-full bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700 font-medium transition-colors">Mese</button>
                  <button onClick={() => setFilters({ dateFrom: '', dateTo: '', supplierId: '', productName: '' })} className="px-3 py-1.5 text-xs rounded-full bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700 font-medium transition-colors">Tutti</button>
                </div>
              </div>
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label htmlFor="analytics-date-from" className="block text-xs font-semibold text-gray-700 dark:text-gray-300 mb-1.5">Da Data</label>
                  <input id="analytics-date-from" name="analytics-date-from" type="date" value={filters.dateFrom} onChange={(e) => setFilters(prev => ({ ...prev, dateFrom: e.target.value }))} className="input input-sm" />
                </div>
                <div>
                  <label htmlFor="analytics-date-to" className="block text-xs font-semibold text-gray-700 dark:text-gray-300 mb-1.5">A Data</label>
                  <input id="analytics-date-to" name="analytics-date-to" type="date" value={filters.dateTo} onChange={(e) => setFilters(prev => ({ ...prev, dateTo: e.target.value }))} className="input input-sm" />
                </div>
              </div>
              <div>
                <label htmlFor="analytics-supplier" className="block text-xs font-semibold text-gray-700 dark:text-gray-300 mb-1.5">Fornitore</label>
                <select id="analytics-supplier" name="analytics-supplier" value={filters.supplierId} onChange={(e) => setFilters(prev => ({ ...prev, supplierId: e.target.value }))} className="input input-sm">
                  <option value="">Tutti i fornitori</option>
                  {suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier?.name || 'Fornitore senza nome'}</option>)}
                </select>
              </div>
              <div>
                <label htmlFor="analytics-product" className="block text-xs font-semibold text-gray-700 dark:text-gray-300 mb-1.5">Prodotto</label>
                <input id="analytics-product" name="analytics-product" type="text" value={filters.productName} onChange={(e) => setFilters(prev => ({ ...prev, productName: e.target.value }))} className="input input-sm" placeholder="Cerca prodotto..." />
              </div>
            </div>
          )}

          {/* Charts */}
          <div className="glass-card p-5 border border-gray-200 dark:border-gray-700">
            <div className="flex items-center space-x-2 mb-4">
              <div className="w-8 h-8 bg-gradient-to-br from-blue-500 to-purple-600 rounded-lg flex items-center justify-center">
                <CalendarIcon size={16} className="text-white" />
              </div>
              <h3 className="font-bold text-gray-900 dark:text-gray-100">Ordini nel Tempo</h3>
            </div>
            <ResponsiveContainer width="100%" height={250}>
              <LineChart data={ordersOverTimeData} margin={{ top: 5, right: 20, left: -10, bottom: 5 }}>
                <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                <XAxis dataKey="name" stroke="#6b7280" fontSize={11} />
                <YAxis stroke="#6b7280" fontSize={11} />
                <Tooltip contentStyle={{ backgroundColor: '#fff', border: '1px solid #e5e7eb', borderRadius: '8px' }} />
                <Legend />
                <Line type="monotone" dataKey="Numero di Ordini" stroke="#3b82f6" strokeWidth={3} dot={{ fill: '#3b82f6', r: 4 }} activeDot={{ r: 6 }} />
              </LineChart>
            </ResponsiveContainer>
          </div>

          <div className="glass-card p-5 border border-gray-200 dark:border-gray-700">
            <div className="flex items-center space-x-2 mb-4">
              <div className="w-8 h-8 bg-gradient-to-br from-purple-500 to-pink-600 rounded-lg flex items-center justify-center">
                <PieChartIcon size={16} className="text-white" />
              </div>
              <h3 className="font-bold text-gray-900 dark:text-gray-100">Ordini per Fornitore</h3>
            </div>
            <ResponsiveContainer width="100%" height={400}>
              <PieChart>
                <Pie 
                  data={ordersBySupplierData} 
                  dataKey="value" 
                  nameKey="name" 
                  cx="50%" 
                  cy="45%" 
                  outerRadius={110} 
                  label
                >
                  {ordersBySupplierData.map((entry, index) => (
                    <Cell key={`cell-${index}`} fill={PIE_CHART_COLORS[index % PIE_CHART_COLORS.length]} />
                  ))}
                </Pie>
                <Tooltip contentStyle={{ backgroundColor: '#fff', border: '1px solid #e5e7eb', borderRadius: '8px' }} />
                <Legend />
              </PieChart>
            </ResponsiveContainer>
          </div>

          <div className="glass-card p-5 border border-gray-200 dark:border-gray-700">
            <div className="flex items-center space-x-2 mb-4">
              <div className="w-8 h-8 bg-gradient-to-br from-green-500 to-emerald-600 rounded-lg flex items-center justify-center">
                <BarChart3 size={16} className="text-white" />
              </div>
              <h3 className="font-bold text-gray-900 dark:text-gray-100">Prodotti più Ordinati</h3>
            </div>
            <ResponsiveContainer width="100%" height={250}>
              <BarChart data={mostOrderedProductsData} margin={{ top: 5, right: 20, left: -10, bottom: 5 }}>
                <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                <XAxis dataKey="name" stroke="#6b7280" fontSize={11} tick={false} />
                <YAxis stroke="#6b7280" fontSize={11} />
                <Tooltip contentStyle={{ backgroundColor: '#fff', border: '1px solid #e5e7eb', borderRadius: '8px' }} />
                <Legend />
                <Bar dataKey="Quantità Ordinata" fill="#10b981" radius={[8, 8, 0, 0]} />
              </BarChart>
            </ResponsiveContainer>
          </div>

          {allOrderedProductsData.length > 0 && (
            <details className="glass-card group border border-gray-200 dark:border-gray-700">
              <summary className="font-bold text-gray-800 dark:text-gray-100 bg-gray-50 dark:bg-gray-800/60 rounded-xl p-4 cursor-pointer flex justify-between items-center list-none hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors">
                <span>Tutti i Prodotti Ordinati ({allOrderedProductsData.length})</span>
                <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" />
              </summary>
              <div className="p-4 border-t border-gray-100 dark:border-gray-700">
                <div className="grid grid-cols-2 gap-4 mb-4">
                  <div>
                    <label htmlFor="analytics-product-filter-supplier" className="block text-xs font-semibold text-gray-700 dark:text-gray-300 mb-1.5">Filtra per Fornitore</label>
                    <select
                      id="analytics-product-filter-supplier"
                      value={pendingProductFilters.supplierId}
                      onChange={(e) => setPendingProductFilters(p => ({ ...p, supplierId: e.target.value }))}
                      className="input input-sm"
                    >
                      <option value="">Tutti i fornitori</option>
                  {suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier?.name || 'Fornitore senza nome'}</option>)}
                    </select>
                  </div>
                  <div>
                    <label htmlFor="analytics-product-sort-order" className="block text-xs font-semibold text-gray-700 dark:text-gray-300 mb-1.5">Ordina per</label>
                    <select
                      id="analytics-product-sort-order"
                      value={pendingProductFilters.sortOrder}
                      onChange={(e) => setPendingProductFilters(p => ({ ...p, sortOrder: e.target.value }))}
                      className="input input-sm"
                    >
                      <option value="name-asc">Nome (A-Z)</option>
                      <option value="name-desc">Nome (Z-A)</option>
                      <option value="quantity-desc">Quantità (Decrescente)</option>
                    </select>
                  </div>
                </div>
                <div className="mb-4">
                  <label htmlFor="analytics-product-search" className="block text-xs font-semibold text-gray-700 dark:text-gray-300 mb-1.5">Cerca Prodotto</label>
                  <input
                    id="analytics-product-search"
                    type="search"
                    placeholder="Cerca prodotto..."
                    value={pendingProductFilters.searchTerm}
                    onChange={(e) => setPendingProductFilters(p => ({ ...p, searchTerm: e.target.value }))}
                    className="w-full p-2 text-sm border border-gray-200 dark:border-gray-700 rounded-lg focus:ring-2 focus:ring-blue-500"
                  />
                </div>
                <div className="mb-4">
                    <button onClick={() => setActiveProductFilters(pendingProductFilters)} className="btn btn-primary w-full">
                        Applica Filtri
                    </button>
                </div>
                <div className="space-y-2">
                  {allOrderedProductsData.map(([productName, quantity, suppliersList]) => (
                    <button
                      key={productName}
                      onClick={() => {
                        setSelectedProductForHistory(productName);
                        navigate('/product-history');
                      }}
                      className="w-full text-left p-3 bg-gray-50 dark:bg-gray-800/60 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 transition-colors border border-gray-200 dark:border-gray-700"
                    >
                      <div className="flex justify-between items-center text-sm text-gray-700 dark:text-gray-300">
                        <span className="font-medium">{productName}</span>
                        <span className="font-bold text-blue-600 dark:text-blue-400">{quantity}</span>
                      </div>
                      <p className="text-xs text-gray-500 dark:text-gray-400 mt-1">Fornitori: {suppliersList}</p>
                    </button>
                  ))}
                </div>
              </div>
            </details>
          )}

          
          <div className="glass-card p-5 border border-gray-200 dark:border-gray-700">
            <h3 className="font-bold text-gray-900 dark:text-gray-100 mb-4">Attività Recente</h3>
            {filteredOrders.slice(0, 3).map(order => { 
              const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers; 
              return (
                <div key={order.id} className="flex items-center justify-between py-3 border-b border-gray-100 dark:border-gray-700 last:border-b-0">
                  <div>
                    <p className="text-sm font-semibold text-gray-900 dark:text-gray-100">{supplier?.name || 'Fornitore eliminato'}</p>
                    <p className="text-xs text-gray-500 dark:text-gray-400 mt-0.5">{new Date(order.sent_at || order.created_at).toLocaleDateString('it-IT')}</p>
                  </div>
                  <span className="px-2.5 py-1 bg-green-100 dark:bg-green-900/30 text-green-800 dark:text-green-300 text-xs rounded-full font-semibold">Inviato</span>
                </div>
              ); 
            })}
          </div>
        </div>
      </div>
    );
}

export default AnalyticsDashboard;