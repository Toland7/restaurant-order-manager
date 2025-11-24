import React from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { 
  Home, 
  ShoppingCart, 
  Users, 
  Calendar, 
  History, 
  BarChart3, 
  Settings, 
  Bell,
  LogOut
} from 'lucide-react';
import { useAuth } from '../../AuthContext';

const DesktopSidebar = ({ unreadCount }) => {
  const navigate = useNavigate();
  const location = useLocation();
  const { logout } = useAuth();

  const menuItems = [
    { icon: Home, label: 'Dashboard', path: '/' },
    { icon: ShoppingCart, label: 'Crea Ordine', path: '/create-order' },
    { icon: Users, label: 'Fornitori', path: '/suppliers' },
    { icon: Calendar, label: 'Programma', path: '/schedule' },
    { icon: History, label: 'Cronologia', path: '/history' },
    { icon: BarChart3, label: 'Analisi', path: '/analytics' },
    { icon: Bell, label: 'Notifiche', path: '/notifications', badge: unreadCount },
    { icon: Settings, label: 'Impostazioni', path: '/settings' },
  ];

  const isActive = (path) => location.pathname === path;

  return (
    <div className="hidden lg:flex flex-col w-64 h-screen bg-white dark:bg-slate-900 border-r border-gray-200 dark:border-gray-800 fixed left-0 top-0 z-50">
      <div className="p-6">
        <h1 className="text-2xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-blue-600 to-indigo-600">
          Gestore Ordini
        </h1>
        <p className="text-xs text-gray-500 mt-1">Pannello di Controllo</p>
      </div>

      <nav className="flex-1 px-4 space-y-2 overflow-y-auto">
        {menuItems.map((item) => (
          <button
            key={item.path}
            onClick={() => navigate(item.path)}
            className={`w-full flex items-center space-x-3 px-4 py-3 rounded-xl transition-all duration-200 group ${
              isActive(item.path)
                ? 'bg-blue-50 dark:bg-blue-900/20 text-blue-600 dark:text-blue-400 font-medium shadow-sm'
                : 'text-gray-600 dark:text-gray-400 hover:bg-gray-50 dark:hover:bg-gray-800 hover:text-gray-900 dark:hover:text-gray-200'
            }`}
          >
            <item.icon size={20} className={isActive(item.path) ? 'text-blue-600 dark:text-blue-400' : 'text-gray-400 group-hover:text-gray-600'} />
            <span className="flex-1 text-left">{item.label}</span>
            {item.badge > 0 && (
              <span className="bg-red-500 text-white text-xs font-bold px-2 py-0.5 rounded-full">
                {item.badge}
              </span>
            )}
          </button>
        ))}
      </nav>

      <div className="p-4 border-t border-gray-200 dark:border-gray-800">
        <button
          onClick={logout}
          className="w-full flex items-center space-x-3 px-4 py-3 rounded-xl text-red-600 hover:bg-red-50 dark:hover:bg-red-900/20 transition-colors"
        >
          <LogOut size={20} />
          <span>Esci</span>
        </button>
      </div>
    </div>
  );
};

export default DesktopSidebar;
