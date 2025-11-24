import React, { useState, useMemo } from 'react';
import { Filter, Download, Check, History, ChevronDown } from 'lucide-react';
import Header from '../components/ui/Header';
import { toast } from 'react-hot-toast';
import { useNavigate } from 'react-router-dom';
import EmptyState from '../components/ui/EmptyState';
import { useAutoAnimate } from '@formkit/auto-animate/react';
import useIsDesktop from '../hooks/useIsDesktop';

const HistoryPage = ({ orders, suppliers }) => {
    const navigate = useNavigate();
    const [showFilters, setShowFilters] = useState(false);
    const [filters, setFilters] = useState({ dateFrom: '', dateTo: '', supplier: '', status: '' });
    const [parent] = useAutoAnimate();

    const filteredOrders = useMemo(() => {
        let filtered = [...orders];
        if (filters.dateFrom) filtered = filtered.filter(order => new Date(order.sent_at || order.created_at) >= new Date(filters.dateFrom));
        if (filters.dateTo) filtered = filtered.filter(order => new Date(order.sent_at || order.created_at) <= new Date(filters.dateTo));
        if (filters.supplier) filtered = filtered.filter(order => order.supplier_id.toString() === filters.supplier);
        if (filters.status) filtered = filtered.filter(order => order.status === filters.status);
        return filtered;
      }, [orders, filters]);
  
      const getOrderGroup = (orderDate) => {
          const now = new Date();
          const fortyEightHoursAgo = new Date(now.getTime() - 48 * 60 * 60 * 1000);
          const sevenDaysAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);
          const thirtyDaysAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000);
  
          if (orderDate >= fortyEightHoursAgo) return 'Ultime 48 ore';
          if (orderDate >= sevenDaysAgo) return 'Ultimi 7 giorni';
          if (orderDate >= thirtyDaysAgo) return 'Ultimi 30 giorni';
          return 'Più vecchi';
      };
  
      const groupedOrders = useMemo(() => {
          const groups = {
              'Ultime 48 ore': [],
              'Ultimi 7 giorni': [],
              'Ultimi 30 giorni': [],
              'Più vecchi': [],
          };
  
          filteredOrders.forEach(order => {
              const orderDate = new Date(order.sent_at || order.created_at);
              const groupName = getOrderGroup(orderDate);
              if (groups[groupName]) {
                  groups[groupName].push(order);
              }
          });
  
          return groups;
      }, [filteredOrders]);
  
      const clearFilters = () => { setFilters({ dateFrom: '', dateTo: '', supplier: '', status: '' }); };
  
      const exportFilteredData = () => {
        const dataToExport = { orders: filteredOrders, filters: filters, exportDate: new Date().toISOString() };
        const dataStr = JSON.stringify(dataToExport, null, 2);
        const dataUri = 'data:application/json;charset=utf-8,' + encodeURIComponent(dataStr);
        const exportFileDefaultName = `cronologia_ordini_${new Date().toISOString().split('T')[0]}.json`;
        const linkElement = document.createElement('a');
        linkElement.setAttribute('href', dataUri);
        linkElement.setAttribute('download', exportFileDefaultName);
        linkElement.click();
        toast.success('Cronologia esportata con successo');
      };

    const isDesktop = useIsDesktop(); // Import this hook at the top

    if (isDesktop) {
      return (
        <div className="min-h-screen p-8 space-y-6">
          <div className="flex justify-between items-center">
            <h1 className="text-3xl font-bold text-gray-900 dark:text-white">Cronologia Ordini</h1>
            <div className="flex space-x-3">
              <button onClick={() => setShowFilters(!showFilters)} className={`btn ${showFilters ? 'btn-primary' : 'btn-outline'}`}>
                <Filter size={18} /> <span>Filtri</span>
              </button>
              <button onClick={exportFilteredData} className="btn btn-success">
                <Download size={18} /> <span>Esporta</span>
              </button>
            </div>
          </div>

          {showFilters && (
            <div className="glass-card p-6 grid grid-cols-4 gap-4">
              <div>
                <label className="label">Da Data</label>
                <input type="date" value={filters.dateFrom} onChange={(e) => setFilters(prev => ({ ...prev, dateFrom: e.target.value }))} className="input" />
              </div>
              <div>
                <label className="label">A Data</label>
                <input type="date" value={filters.dateTo} onChange={(e) => setFilters(prev => ({ ...prev, dateTo: e.target.value }))} className="input" />
              </div>
              <div>
                <label className="label">Fornitore</label>
                <select value={filters.supplier} onChange={(e) => setFilters(prev => ({ ...prev, supplier: e.target.value }))} className="select">
                  <option value="">Tutti</option>
                  {suppliers.map(s => <option key={s.id} value={s.id}>{s.name}</option>)}
                </select>
              </div>
              <div className="flex items-end">
                <button onClick={clearFilters} className="btn btn-outline w-full">Reset Filtri</button>
              </div>
            </div>
          )}

          <div className="glass-card overflow-hidden">
            <table className="w-full text-left">
              <thead className="bg-gray-50 dark:bg-gray-800 border-b border-gray-200 dark:border-gray-700">
                <tr>
                  <th className="px-6 py-4 text-xs font-semibold text-gray-500 uppercase tracking-wider">Data</th>
                  <th className="px-6 py-4 text-xs font-semibold text-gray-500 uppercase tracking-wider">Fornitore</th>
                  <th className="px-6 py-4 text-xs font-semibold text-gray-500 uppercase tracking-wider">Messaggio</th>
                  <th className="px-6 py-4 text-xs font-semibold text-gray-500 uppercase tracking-wider">Stato</th>
                  <th className="px-6 py-4 text-xs font-semibold text-gray-500 uppercase tracking-wider">Metodo</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-200 dark:divide-gray-700">
                {filteredOrders.length > 0 ? (
                  filteredOrders.map((order) => {
                    const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers;
                    return (
                      <tr key={order.id} className="hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors">
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-100">
                          {new Date(order.sent_at || order.created_at).toLocaleString('it-IT', { dateStyle: 'short', timeStyle: 'short' })}
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-white">
                          {supplier?.name || 'Sconosciuto'}
                        </td>
                        <td className="px-6 py-4 text-sm text-gray-500 dark:text-gray-400 max-w-xs truncate" title={order.order_message}>
                          {order.order_message}
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          <span className={`px-2 inline-flex text-xs leading-5 font-semibold rounded-full ${order.status === 'sent' ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-800'}`}>
                            {order.status === 'sent' ? 'Inviato' : order.status}
                          </span>
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500 dark:text-gray-400">
                          {supplier?.contact_method}
                        </td>
                      </tr>
                    );
                  })
                ) : (
                  <tr>
                    <td colSpan="5" className="px-6 py-10 text-center text-gray-500">
                      Nessun ordine trovato
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        </div>
      );
    }

    return (
        <div className="min-h-screen app-background">
          <Header title="Cronologia Ordini" onBack={() => navigate('/')} />
          <div className="max-w-sm mx-auto px-6 py-6">
            <div className="flex justify-between items-center mb-6">
              <button onClick={() => setShowFilters(!showFilters)} className="flex items-center space-x-2 px-4 py-2 bg-white dark:bg-gray-900 border border-gray-200 dark:border-gray-700 rounded-lg text-sm text-gray-700 dark:text-gray-100 hover:bg-gray-50 dark:hover:bg-gray-800"><Filter size={16} className="text-gray-700 dark:text-gray-200" /><span>Filtri</span>{Object.values(filters).some(v => v !== '') && <span className="bg-blue-500 text-white text-xs px-2 py-1 rounded-full">{Object.values(filters).filter(v => v !== '').length}</span>}</button>
              <button onClick={exportFilteredData} className="btn btn-success text-sm"><Download size={16} /><span>Esporta</span></button>
            </div>
            {showFilters && <div className="glass-card p-5 mt-6 mb-7 pb-0.5 space-y-4"><div className="flex justify-between items-center"><h3 className="font-medium text-gray-900">Filtri</h3><button onClick={clearFilters} className="text-sm text-blue-500 dark:text-blue-400 hover:underline">Pulisci</button></div><div className="grid grid-cols-2 gap-3"><div><label htmlFor="history-date-from" className="block text-xs font-medium text-gray-700 mb-1">Da Data</label><input id="history-date-from" name="history-date-from" type="date" value={filters.dateFrom} onChange={(e) => setFilters(prev => ({ ...prev, dateFrom: e.target.value }))} className="input input-sm" /></div><div><label htmlFor="history-date-to" className="block text-xs font-medium text-gray-700 mb-1">A Data</label><input id="history-date-to" name="history-date-to" type="date" value={filters.dateTo} onChange={(e) => setFilters(prev => ({ ...prev, dateTo: e.target.value }))} className="input input-sm" /></div></div><div><label htmlFor="history-supplier" className="block text-xs font-medium text-gray-700 mb-1">Fornitore</label><select id="history-supplier" name="history-supplier" value={filters.supplier} onChange={(e) => setFilters(prev => ({ ...prev, supplier: e.target.value }))} className="input input-sm"><option value="">Tutti i fornitori</option>{suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}</select></div><div><label htmlFor="history-status" className="block text-xs font-medium text-gray-700 mb-1">Stato</label><select id="history-status" name="history-status" value={filters.status} onChange={(e) => setFilters(prev => ({ ...prev, status: e.target.value }))} className="input input-sm"><option value="">Tutti gli stati</option><option value="sent">Inviato</option><option value="confirmed">Confermato</option><option value="delivered">Consegnato</option></select></div></div>} 
            
            {filteredOrders.length === 0 ? (
              <EmptyState 
                icon={History}
                title={orders.length === 0 ? "La tua cronologia è vuota" : "Nessun risultato"}
                message={orders.length === 0 ? "Sembra che tu non abbia ancora inviato nessun ordine." : "Prova a modificare i filtri per trovare quello che cerchi."}
                actionText={orders.length === 0 ? "Crea il tuo primo ordine" : null}
                onActionClick={orders.length === 0 ? () => navigate('/create-order') : null}
              />
            ) : (
            <>
              <div className="flex justify-between items-center mb-4"><p className="text-sm text-gray-600">{filteredOrders.length} {filteredOrders.length === 1 ? 'ordine trovato' : 'ordini trovati'}</p></div>
              <div ref={parent} className="space-y-4">
                {Object.entries(groupedOrders).map(([groupName, groupOrders]) => (
                    groupOrders.length > 0 && (
                        <details key={groupName} className="glass-card group" open={groupName === 'Ultime 48 ore'}> 
                            <summary className="font-medium text-gray-800 dark:text-gray-100 bg-gray-50 dark:bg-gray-800/60 rounded-md p-4 cursor-pointer flex justify-between items-center list-none">
                                <span>{groupName} ({groupOrders.length})</span>
                                <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" />
                            </summary>
                            <div className="p-4 space-y-4 border-t border-gray-100">
                                {groupOrders.map(order => {
                                    const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers;
                                    return (
                                      <div key={order.id} className="glass-card p-4"><div className="flex justify-between items-start mb-3"><div><h3 className="font-medium text-gray-900">{supplier?.name || 'Fornitore eliminato'}</h3><p className="text-sm text-gray-500">{new Date(order.sent_at || order.created_at).toLocaleDateString('it-IT')} - {new Date(order.sent_at || order.created_at).toLocaleTimeString('it-IT', { hour: '2-digit', minute: '2-digit' })}</p></div><span className={`px-2 py-1 text-xs rounded-full flex items-center space-x-1 ${order.status === 'sent' ? 'bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300' : order.status === 'confirmed' ? 'bg-blue-100 text-blue-800 dark:bg-blue-900/30 dark:text-blue-300' : order.status === 'delivered' ? 'bg-purple-100 text-purple-800 dark:bg-purple-900/30 dark:text-purple-300' : 'bg-gray-100 text-gray-800 dark:bg-gray-800 dark:text-gray-200'}`}><Check size={12} /><span>{order.status === 'sent' ? 'Inviato' : order.status === 'confirmed' ? 'Confermato' : order.status === 'delivered' ? 'Consegnato' : 'Sconosciuto'}</span></span></div><div className="border-t pt-3"><div className="bg-gray-50 dark:bg-gray-800/60 p-3 rounded-lg mb-3"><pre className="text-xs text-gray-700 dark:text-gray-200 whitespace-pre-wrap">{order.order_message}</pre></div></div><div className="pt-3 border-t"><p className="text-xs text-gray-500">Inviato via {supplier?.contact_method || 'N/A'} a {supplier?.contact || 'N/A'}</p></div></div>
                                    );
                                })}
                            </div>
                        </details>
                    )
                ))}
              </div>
            </>
            )} 
          </div>
        </div>
      );
}

export default HistoryPage;