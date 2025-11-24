import React from 'react';
import { BarChart3, Bell, Settings, ShoppingCart, Users, Calendar, History, Clock, TrendingUp, Package } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import MenuButton from '../components/ui/MenuButton';
import ProfileSwitcherDropdown from '../components/ui/ProfileSwitcherDropdown';
import useIsDesktop from '../hooks/useIsDesktop';

const HomePage = ({ profile, user, unreadCount, analytics, orders = [], scheduledOrders = [] }) => {
    const navigate = useNavigate();
    const isDesktop = useIsDesktop();

    // Helper to format date
    const formatDate = (dateString) => {
      return new Date(dateString).toLocaleDateString('it-IT', { day: 'numeric', month: 'short' });
    };

    const recentOrders = orders.slice(0, 5);
    const upcomingScheduled = scheduledOrders
      .filter(o => new Date(o.scheduled_at) > new Date())
      .sort((a, b) => new Date(a.scheduled_at) - new Date(b.scheduled_at))
      .slice(0, 3);

    if (isDesktop) {
      return (
        <div className="min-h-screen p-8 space-y-8">
          {/* Header Section */}
          <div className="flex justify-between items-center">
            <div>
              <h1 className="text-3xl font-bold text-gray-900 dark:text-white">Dashboard</h1>
              <p className="text-gray-500 dark:text-gray-400 mt-1">Benvenuto, {profile?.first_name || 'Utente'}</p>
            </div>
            <div className="flex items-center space-x-4">
              <ProfileSwitcherDropdown />
            </div>
          </div>

          {/* Analytics Cards Row */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div className="glass-card p-6 flex items-center space-x-4">
              <div className="p-3 bg-blue-100 dark:bg-blue-900/30 rounded-full text-blue-600 dark:text-blue-400">
                <Package size={24} />
              </div>
              <div>
                <p className="text-sm text-gray-500 dark:text-gray-400">Totale Ordini</p>
                <p className="text-2xl font-bold text-gray-900 dark:text-white">{analytics.totalOrders}</p>
              </div>
            </div>
            <div className="glass-card p-6 flex items-center space-x-4">
              <div className="p-3 bg-emerald-100 dark:bg-emerald-900/30 rounded-full text-emerald-600 dark:text-emerald-400">
                <Users size={24} />
              </div>
              <div>
                <p className="text-sm text-gray-500 dark:text-gray-400">Fornitori Attivi</p>
                <p className="text-2xl font-bold text-gray-900 dark:text-white">{analytics.totalSuppliers}</p>
              </div>
            </div>
            <div className="glass-card p-6 flex items-center space-x-4">
              <div className="p-3 bg-purple-100 dark:bg-purple-900/30 rounded-full text-purple-600 dark:text-purple-400">
                <TrendingUp size={24} />
              </div>
              <div>
                <p className="text-sm text-gray-500 dark:text-gray-400">Questa Settimana</p>
                <p className="text-2xl font-bold text-gray-900 dark:text-white">{analytics.ordersThisWeek}</p>
              </div>
            </div>
          </div>

          {/* Main Dashboard Grid */}
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
            {/* Left Column: Recent Orders (Takes 2/3 width) */}
            <div className="lg:col-span-2 space-y-6">
              <div className="glass-card p-6">
                <div className="flex justify-between items-center mb-6">
                  <h2 className="text-xl font-semibold text-gray-900 dark:text-white">Ordini Recenti</h2>
                  <button onClick={() => navigate('/history')} className="text-blue-600 hover:text-blue-700 text-sm font-medium">Vedi tutti</button>
                </div>
                <div className="overflow-x-auto">
                  <table className="w-full text-left">
                    <thead>
                      <tr className="border-b border-gray-200 dark:border-gray-700">
                        <th className="pb-3 text-sm font-medium text-gray-500 dark:text-gray-400">Fornitore</th>
                        <th className="pb-3 text-sm font-medium text-gray-500 dark:text-gray-400">Data</th>
                        <th className="pb-3 text-sm font-medium text-gray-500 dark:text-gray-400">Stato</th>
                        <th className="pb-3 text-sm font-medium text-gray-500 dark:text-gray-400 text-right">Azioni</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-gray-100 dark:divide-gray-800">
                      {recentOrders.length > 0 ? (
                        recentOrders.map((order) => (
                          <tr key={order.id} className="group hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors">
                            <td className="py-4 text-sm font-medium text-gray-900 dark:text-white">{order.suppliers?.name || 'Sconosciuto'}</td>
                            <td className="py-4 text-sm text-gray-600 dark:text-gray-300">{formatDate(order.created_at)}</td>
                            <td className="py-4">
                              <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-400">
                                Inviato
                              </span>
                            </td>
                            <td className="py-4 text-right">
                              <button onClick={() => navigate('/history')} className="text-gray-400 hover:text-blue-600 transition-colors">
                                <ChevronRight size={16} />
                              </button>
                            </td>
                          </tr>
                        ))
                      ) : (
                        <tr>
                          <td colSpan="4" className="py-8 text-center text-gray-500">Nessun ordine recente</td>
                        </tr>
                      )}
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

            {/* Right Column: Scheduled & Quick Actions (Takes 1/3 width) */}
            <div className="space-y-6">
              {/* Scheduled Orders Widget */}
              <div className="glass-card p-6">
                <div className="flex justify-between items-center mb-4">
                  <h2 className="text-lg font-semibold text-gray-900 dark:text-white">In Programma</h2>
                  <button onClick={() => navigate('/schedule')} className="text-blue-600 hover:text-blue-700 text-sm font-medium">Gestisci</button>
                </div>
                <div className="space-y-4">
                  {upcomingScheduled.length > 0 ? (
                    upcomingScheduled.map((schedule) => (
                      <div key={schedule.id} className="flex items-start space-x-3 p-3 bg-gray-50 dark:bg-gray-800/50 rounded-lg border border-gray-100 dark:border-gray-700">
                        <div className="p-2 bg-white dark:bg-gray-700 rounded-lg shadow-sm text-purple-600 dark:text-purple-400">
                          <Clock size={16} />
                        </div>
                        <div>
                          <p className="text-sm font-medium text-gray-900 dark:text-white">{schedule.suppliers?.name}</p>
                          <p className="text-xs text-gray-500 dark:text-gray-400">
                            {new Date(schedule.scheduled_at).toLocaleDateString('it-IT', { weekday: 'short', day: 'numeric', month: 'short', hour: '2-digit', minute: '2-digit' })}
                          </p>
                        </div>
                      </div>
                    ))
                  ) : (
                    <div className="text-center py-6 text-gray-500 text-sm">
                      Nessun ordine programmato
                    </div>
                  )}
                </div>
                <button onClick={() => navigate('/schedule')} className="w-full mt-4 btn btn-outline text-sm py-2">
                  + Programma Nuovo
                </button>
              </div>

              {/* Quick Actions Widget */}
              <div className="glass-card p-6 bg-gradient-to-br from-blue-600 to-indigo-700 text-white border-none">
                <h2 className="text-lg font-semibold mb-2">Nuovo Ordine</h2>
                <p className="text-blue-100 text-sm mb-6">Crea rapidamente un nuovo ordine per i tuoi fornitori.</p>
                <button onClick={() => navigate('/create-order')} className="w-full bg-white text-blue-600 hover:bg-blue-50 font-medium py-2 px-4 rounded-lg transition-colors shadow-sm">
                  Inizia Ordine
                </button>
              </div>
            </div>
          </div>
        </div>
      );
    }

    // Mobile View (Original)
    return (
    <div className="min-h-screen app-background">
      <a href="#main-content" className="sr-only focus:not-sr-only focus:absolute focus:top-4 focus:left-4 bg-blue-600 text-white px-4 py-2 rounded z-50">Salta al contenuto principale</a>
      <div className="backdrop-blur bg-white/60 dark:bg-black/40 border-b border-white/60 dark:border-white/10">
        <div className="max-w-sm mx-auto px-6 py-6">
          <div className="flex justify-between items-center mb-4"><div className="text-center">
            <h1 className="text-2xl font-light text-gray-900 dark:text-white">Gestione Ordini</h1>
            <div className="text-gray-500 text-sm">
              Benvenuto, <ProfileSwitcherDropdown />
            </div>
          </div>
            <div className="flex space-x-2">
              <button onClick={() => navigate('/analytics')} className="icon-btn" aria-label="Visualizza analytics"><BarChart3 size={20} /></button>
              <button onClick={() => navigate('/notifications')} className="relative icon-btn" aria-label={`Notifiche${unreadCount > 0 ? `, ${unreadCount} non lette` : ''}`}>
                <Bell size={20} />
                {unreadCount > 0 && (
                  <span className="absolute top-1 right-1 flex h-4 w-4 items-center justify-center rounded-full bg-red-500 text-xs text-white" aria-hidden="true">
                    {unreadCount}
                  </span>
                )}
              </button>
              <button onClick={() => navigate('/settings')} className="icon-btn" aria-label="Impostazioni"><Settings size={20} /></button>
            </div>
          </div>
          <div className="grid grid-cols-3 gap-3 mb-6">
            <div className="glass-card p-3 text-center"><p className="text-lg font-semibold bg-clip-text text-transparent bg-gradient-to-br from-blue-600 to-indigo-600">{analytics.totalOrders}</p><p className="text-xs text-gray-600 dark:text-gray-400">Ordini</p></div>
            <div className="glass-card p-3 text-center"><p className="text-lg font-semibold bg-clip-text text-transparent bg-gradient-to-br from-emerald-600 to-green-600">{analytics.totalSuppliers}</p><p className="text-xs text-gray-600 dark:text-gray-400">Fornitori</p></div>
            <div className="glass-card p-3 text-center"><p className="text-lg font-semibold bg-clip-text text-transparent bg-gradient-to-br from-purple-600 to-violet-600">{analytics.ordersThisWeek}</p><p className="text-xs text-gray-600 dark:text-gray-400">Settimana</p></div>
          </div>
        </div>
      </div>
      <div id="main-content" className="max-w-sm mx-auto px-6 py-6 space-y-4">
        <MenuButton icon={<ShoppingCart size={24} />} title="CREA IL TUO ORDINE" subtitle="Nuovo ordine ai fornitori" onClick={() => navigate('/create-order')} color="from-blue-500 to-indigo-600" />
        <MenuButton icon={<Users size={24} />} title="GESTIONE FORNITORI" subtitle="Aggiungi e modifica fornitori" onClick={() => navigate('/suppliers')} color="from-emerald-500 to-green-600" />
        <MenuButton icon={<Calendar size={24} />} title="PROGRAMMA ORDINI" subtitle="Pianifica ordini futuri" onClick={() => navigate('/schedule')} color="from-purple-500 to-violet-600" />
        <MenuButton icon={<History size={24} />} title="CRONOLOGIA ORDINI" subtitle="Storico degli ordini" onClick={() => navigate('/history')} color="from-orange-500 to-amber-600" />
      </div>
    </div>
    )
  };
  
  // Helper component for chevron (since I used it in the table but didn't import it)
  const ChevronRight = ({ size, className }) => (
    <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className={className}><path d="m9 18 6-6-6-6"/></svg>
  );

  export default HomePage;