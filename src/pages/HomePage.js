import { BarChart3, Bell, Settings, ShoppingCart, Users, Calendar, History } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import MenuButton from '../components/ui/MenuButton';
import ProfileSwitcherDropdown from '../components/ui/ProfileSwitcherDropdown';

const HomePage = ({ profile, user, unreadCount, analytics }) => {
    const navigate = useNavigate();

    return (
    <div className="min-h-screen app-background">
      <a href="#main-content" className="sr-only focus:not-sr-only focus:absolute focus:top-4 focus:left-4 bg-blue-600 text-white px-4 py-2 rounded z-50">Salta al contenuto principale</a>
      <div className="backdrop-blur bg-white/60 dark:bg-black/40 border-b border-white/60 dark:border-white/10">
        <div className="max-w-sm mx-auto px-6 py-6">
          <div className="flex justify-between items-center mb-4"><div className="text-center">
            <h1 className="text-2xl font-light text-gray-900">Gestione Ordini</h1>
            <p className="text-gray-500 text-sm">
              Benvenuto, <ProfileSwitcherDropdown />
            </p>
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
            <div className="glass-card p-3 text-center"><p className="text-lg font-semibold bg-clip-text text-transparent bg-gradient-to-br from-blue-600 to-indigo-600">{analytics.totalOrders}</p><p className="text-xs text-gray-600">Ordini</p></div>
            <div className="glass-card p-3 text-center"><p className="text-lg font-semibold bg-clip-text text-transparent bg-gradient-to-br from-emerald-600 to-green-600">{analytics.totalSuppliers}</p><p className="text-xs text-gray-600">Fornitori</p></div>
            <div className="glass-card p-3 text-center"><p className="text-lg font-semibold bg-clip-text text-transparent bg-gradient-to-br from-purple-600 to-violet-600">{analytics.ordersThisWeek}</p><p className="text-xs text-gray-600">Settimana</p></div>
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

  export default HomePage;