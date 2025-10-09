import React, { useState, useEffect, useCallback, useMemo } from 'react';
import { Calendar, ChevronLeft, ChevronRight, Plus, Trash2, Edit3, Send, Check, Bell, History, Users, ShoppingCart, LogOut, Settings, Filter, Download, BarChart3, User } from 'lucide-react';
import { supabase, supabaseHelpers } from './supabase.js';
import { Toaster, toast } from 'react-hot-toast';
import { useAuth } from './AuthContext';

const App = () => {
  const { user, signOut } = useAuth();
  const [currentPage, setCurrentPage] = useState('home');
  const [suppliers, setSuppliers] = useState([]);
  const [orders, setOrders] = useState([]);
  const [scheduledOrders, setScheduledOrders] = useState([]);
  const [isAuthenticating, setIsAuthenticating] = useState(false);
  const [prefilledOrder, setPrefilledOrder] = useState(null);

  // Analytics state
  const [analytics, setAnalytics] = useState({
    totalOrders: 0,
    totalSuppliers: 0,
    ordersThisWeek: 0,
    mostOrderedProduct: ''
  });

  // Filters state
  const [filters, setFilters] = useState({
    dateFrom: '',
    dateTo: '',
    supplier: '',
    status: ''
  });

  const handleNotificationClick = async (notification) => {
    if (notification.reminder_id) {
      try {
        const scheduledOrder = await supabaseHelpers.getScheduledOrderById(notification.reminder_id);
        if (scheduledOrder) {
          setPrefilledOrder(scheduledOrder);
          setCurrentPage('createOrder');
        }
      } catch (error) {
        console.error("Error loading reminder from notification:", error);
        toast.error("Impossibile caricare il promemoria.");
      }
    }
  };

  const calculateAnalytics = useCallback((ordersData, suppliersData) => {
    const now = new Date();
    const weekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);
    
    const ordersThisWeek = ordersData.filter(order => 
      new Date(order.sent_at || order.created_at) > weekAgo
    ).length;

    const productCounts = {};
    ordersData.forEach(order => {
      if (order.order_items) {
        order.order_items.forEach(item => {
          productCounts[item.product_name] = (productCounts[item.product_name] || 0) + 1;
        });
      }
    });

    const mostOrderedProduct = Object.keys(productCounts).length > 0 
      ? Object.keys(productCounts).reduce((a, b) => productCounts[a] > productCounts[b] ? a : b)
      : 'Nessuno';

    setAnalytics({
      totalOrders: ordersData.length,
      totalSuppliers: suppliersData.length,
      ordersThisWeek,
      mostOrderedProduct
    });
  }, []);

  const loadData = useCallback(async (userId) => {
    try {
      const suppliersData = await supabaseHelpers.getSuppliers(userId);
      const formattedSuppliers = suppliersData.map(supplier => ({
        ...supplier,
        products: supplier.products ? supplier.products.map(p => p.name) : []
      }));
      setSuppliers(formattedSuppliers);

      const ordersData = await supabaseHelpers.getOrders(userId);
      setOrders(ordersData);

      const scheduledData = await supabaseHelpers.getScheduledOrders(userId);
      setScheduledOrders(scheduledData);

      calculateAnalytics(ordersData, formattedSuppliers);

    } catch (error) {
      console.error('Error loading data:', error);
      toast.error('Errore durante il caricamento dei dati');
    }
  }, [calculateAnalytics]);

  useEffect(() => {
    if (user) {
      loadData(user.id);
      const handleUrl = async () => {
        const path = window.location.pathname;
        const match = path.match(/^\/reminders\/(\d+)$/);
        if (match) {
          const reminderId = match[1];
          try {
            const scheduledOrder = await supabaseHelpers.getScheduledOrderById(reminderId);
            if (scheduledOrder) {
              setPrefilledOrder(scheduledOrder);
              setCurrentPage('createOrder');
              window.history.replaceState({}, document.title, "/");
            }
          } catch (error) {
            console.error("Error loading reminder:", error);
            toast.error("Impossibile caricare il promemoria dell'ordine.");
          }
        } else {
          setCurrentPage('home');
        }
      };
      handleUrl();
    } else {
      setSuppliers([]);
      setOrders([]);
      setScheduledOrders([]);
    }
  }, [user, loadData]);

  const openLinkInNewTab = (url) => {
    setTimeout(() => {
      window.open(url, '_blank');
    }, 100);
  };

  const MenuButton = ({ icon, title, subtitle, onClick, color }) => (
    <button
      onClick={onClick}
      className="w-full bg-white rounded-xl shadow-sm border border-gray-100 p-6 text-left hover:shadow-md transition-all duration-200"
    >
      <div className="flex items-center space-x-4">
        <div className={`${color} rounded-full p-3 text-white`}>
          {icon}
        </div>
        <div className="flex-1">
          <h3 className="font-medium text-gray-900 text-sm">{title}</h3>
          <p className="text-gray-500 text-xs mt-1">{subtitle}</p>
        </div>
        <ChevronRight size={20} className="text-gray-300" />
      </div>
    </button>
  );

  const Header = ({ title, onBack }) => (
    <div className="bg-white shadow-sm sticky top-0 z-10">
      <div className="max-w-sm mx-auto px-6 py-4 flex items-center">
        <button onClick={onBack} className="p-2 -ml-2 text-gray-500 hover:bg-gray-100 rounded-full">
          <ChevronLeft size={24} />
        </button>
        <h2 className="text-lg font-medium text-gray-900 mx-auto pr-10">
          {title}
        </h2>
      </div>
    </div>
  );

  const AuthPage = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [isLogin, setIsLogin] = useState(true);

    const handleAuth = async (e) => {
      e.preventDefault();
      setIsAuthenticating(true);

      try {
        if (isLogin) {
          const { error } = await supabase.auth.signInWithPassword({ email, password });
          if (error) throw error;
          toast.success('Login effettuato con successo!');
        } else {
          const { error } = await supabase.auth.signUp({ email, password });
          if (error) throw error;
          toast.success('Registrazione completata! Controlla la tua email per confermare.');
        }
      } catch (error) {
        toast.error(error.message);
      } finally {
        setIsAuthenticating(false);
      }
    };

    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center px-6">
        <div className="max-w-sm w-full">
          <div className="bg-white rounded-xl shadow-sm p-6">
            <div className="text-center mb-6">
              <h1 className="text-2xl font-light text-gray-900 mb-2">Gestione Ordini</h1>
              <p className="text-gray-500 text-sm">{isLogin ? 'Accedi al tuo account' : 'Crea un nuovo account'}</p>
            </div>
            <form onSubmit={handleAuth} className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Email</label>
                <input type="email" value={email} onChange={(e) => setEmail(e.target.value)} required className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="tua@email.com" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Password</label>
                <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} required minLength={6} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Password (min 6 caratteri)" />
              </div>
              <button type="submit" disabled={isAuthenticating} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium hover:bg-blue-600 transition-colors disabled:bg-blue-300 flex items-center justify-center space-x-2">
                {isAuthenticating ? <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" /> : <span>{isLogin ? 'Accedi' : 'Registrati'}</span>}
              </button>
            </form>
            <div className="mt-6 text-center">
              <button onClick={() => setIsLogin(!isLogin)} className="text-blue-500 hover:text-blue-600 text-sm">{isLogin ? 'Non hai un account? Registrati' : 'Hai già un account? Accedi'}</button>
            </div>
          </div>
        </div>
      </div>
    );
  };

  const HomePage = () => (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-white shadow-sm">
        <div className="max-w-sm mx-auto px-6 py-6">
          <div className="flex justify-between items-center mb-4">
            <div>
              <h1 className="text-2xl font-light text-gray-900">Gestione Ordini</h1>
              <p className="text-gray-500 text-sm">Benvenuto, {user?.email?.split('@')[0]}</p>
            </div>
            <div className="flex space-x-2">
              <button onClick={() => setCurrentPage('analytics')} className="p-2 text-gray-400 hover:text-blue-500 hover:bg-blue-50 rounded-full"><BarChart3 size={20} /></button>
              <button onClick={() => setCurrentPage('notifications')} className="p-2 text-gray-400 hover:text-orange-500 hover:bg-orange-50 rounded-full"><Bell size={20} /></button>
              <button onClick={() => setCurrentPage('settings')} className="p-2 text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded-full"><Settings size={20} /></button>
            </div>
          </div>
          <div className="grid grid-cols-3 gap-3 mb-6">
            <div className="bg-blue-50 rounded-lg p-3 text-center"><p className="text-lg font-bold text-blue-600">{analytics.totalOrders}</p><p className="text-xs text-blue-600">Ordini</p></div>
            <div className="bg-green-50 rounded-lg p-3 text-center"><p className="text-lg font-bold text-green-600">{analytics.totalSuppliers}</p><p className="text-xs text-green-600">Fornitori</p></div>
            <div className="bg-purple-50 rounded-lg p-3 text-center"><p className="text-lg font-bold text-purple-600">{analytics.ordersThisWeek}</p><p className="text-xs text-purple-600">Settimana</p></div>
          </div>
        </div>
      </div>
      <div className="max-w-sm mx-auto px-6 py-6 space-y-4">
        <MenuButton icon={<ShoppingCart size={24} />} title="CREA IL TUO ORDINE" subtitle="Nuovo ordine ai fornitori" onClick={() => setCurrentPage('createOrder')} color="bg-blue-500" />
        <MenuButton icon={<Users size={24} />} title="GESTIONE FORNITORI" subtitle="Aggiungi e modifica fornitori" onClick={() => setCurrentPage('suppliers')} color="bg-green-500" />
        <MenuButton icon={<Calendar size={24} />} title="PROGRAMMA ORDINI" subtitle="Pianifica ordini futuri" onClick={() => setCurrentPage('schedule')} color="bg-purple-500" />
        <MenuButton icon={<History size={24} />} title="CRONOLOGIA ORDINI" subtitle="Storico degli ordini" onClick={() => setCurrentPage('history')} color="bg-orange-500" />
      </div>
    </div>
  );

  const CreateOrderPage = ({ prefilledOrder, onOrderSent }) => {
    const [selectedSupplier, setSelectedSupplier] = useState('');
    const [orderItems, setOrderItems] = useState({});
    const [additionalItems, setAdditionalItems] = useState('');
    const [showConfirm, setShowConfirm] = useState(false);
    const [isSubmitting, setIsSubmitting] = useState(false);

    useEffect(() => {
      if (prefilledOrder) {
        setSelectedSupplier(prefilledOrder.supplier_id);
        if (prefilledOrder.order_data) {
          try {
            const data = JSON.parse(prefilledOrder.order_data);
            setOrderItems(data.items || {});
            setAdditionalItems(data.additional_items || '');
          } catch (e) {
            console.error("Failed to parse order_data", e);
          }
        }
      }
    }, [prefilledOrder]);

    const handleQuantityChange = (product, quantity) => {
      setOrderItems(prev => ({ ...prev, [product]: quantity }));
    };

    const generateOrderMessage = () => {
      const supplier = suppliers.find(s => s.id.toString() === selectedSupplier);
      if (!supplier) return '';
      let message = supplier.message_template + `\n\n`;
      Object.entries(orderItems).forEach(([product, quantity]) => {
        if (quantity && quantity !== '0') message += `• ${product}: ${quantity}\n`;
      });
      if (additionalItems.trim()) message += '\nProdotti aggiuntivi:\n' + additionalItems + '\n';
      message += '\nGrazie!';
      return message;
    };

    const sendOrder = async () => {
      if (isSubmitting) return;
      setIsSubmitting(true);
      try {
        const supplier = suppliers.find(s => s.id.toString() === selectedSupplier);
        const orderMessage = generateOrderMessage();
        const orderData = { user_id: user.id, supplier_id: selectedSupplier, order_message: orderMessage, additional_items: additionalItems || null, status: 'sent' };
        const orderItemsToInsert = Object.entries(orderItems).filter(([_, quantity]) => quantity && quantity !== '0').map(([productName, quantity]) => ({ product_name: productName, quantity: parseInt(quantity, 10) || 0 }));
        const newOrder = await supabaseHelpers.createOrder(orderData, orderItemsToInsert);
        const encodedMessage = encodeURIComponent(orderMessage);
        switch (supplier.contact_method) {
          case 'whatsapp': openLinkInNewTab(`https://wa.me/${supplier.contact}?text=${encodedMessage}`); break;
          case 'whatsapp_group': openLinkInNewTab(`whatsapp://send?text=${encodedMessage}`); break;
          case 'email': openLinkInNewTab(`mailto:${supplier.contact}?subject=${encodeURIComponent(`Ordine Fornitore - ${supplier.name}`)}&body=${encodedMessage}`); break;
          case 'sms': openLinkInNewTab(`sms:${supplier.contact}?body=${encodedMessage}`); break;
          default: toast.error('Metodo di contatto non supportato'); break;
        }
        toast.success(`Ordine inviato via ${supplier.contact_method} a ${supplier.name}!`);
        setOrders(prev => [{ ...newOrder, suppliers: supplier, order_items: orderItemsToInsert }, ...prev]);
        setSelectedSupplier('');
        setOrderItems({});
        setAdditionalItems('');
        setShowConfirm(false);
        if (onOrderSent) onOrderSent();
        else { setTimeout(() => { if (!window.confirm('Ordine inviato con successo! Vuoi creare un altro ordine?')) setCurrentPage('home'); }, 1000); }
      } catch (error) {
        console.error('Error sending order:', error);
        toast.error("Errore durante l'invio dell'ordine");
      } finally {
        setIsSubmitting(false);
      }
    };

    const selectedSupplierData = suppliers.find(s => s.id.toString() === selectedSupplier);

    return (
      <div className="min-h-screen bg-gray-50">
        <Header title="Crea Ordine" onBack={() => { onOrderSent ? onOrderSent() : setCurrentPage('home'); }} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-6">
          <div className="bg-white rounded-xl p-4 shadow-sm">
            <label className="block text-sm font-medium text-gray-700 mb-2">Seleziona Fornitore</label>
            <select value={selectedSupplier} onChange={(e) => setSelectedSupplier(e.target.value)} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" disabled={!!prefilledOrder}>
              <option value="">Scegli un fornitore...</option>
              {suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}
            </select>
          </div>
          {suppliers.length === 0 && <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 text-center"><p className="text-yellow-800 text-sm mb-3">Non hai ancora fornitori configurati</p><button onClick={() => setCurrentPage('suppliers')} className="text-yellow-600 hover:text-yellow-800 font-medium text-sm">Aggiungi il primo fornitore →</button></div>}
          {selectedSupplierData && (
            <div className="bg-white rounded-xl p-4 shadow-sm">
              <h3 className="font-medium text-gray-900 mb-4">Prodotti Disponibili</h3>
              {selectedSupplierData.products.length === 0 ? <div className="text-center py-4"><p className="text-gray-500 text-sm">Nessun prodotto configurato</p></div> : <div className="space-y-3">{selectedSupplierData.products.map(product => <div key={product} className="flex items-center justify-between p-2 border border-gray-100 rounded-lg"><label className="flex items-center space-x-3 flex-1"><input type="checkbox" checked={orderItems[product] && orderItems[product] !== '0'} onChange={(e) => { if (!e.target.checked) setOrderItems(prev => ({ ...prev, [product]: '0' })); }} className="rounded border-gray-300 text-blue-600 focus:ring-blue-500" /><span className="text-sm text-gray-700">{product}</span></label><input type="text" placeholder="Qt." value={orderItems[product] || ''} onChange={(e) => handleQuantityChange(product, e.target.value)} className="w-16 p-1 text-center border border-gray-200 rounded text-sm" /></div>)}
            </div>
          )}
          {selectedSupplierData && <div className="bg-white rounded-xl p-4 shadow-sm"><label className="block text-sm font-medium text-gray-700 mb-2">Prodotti Aggiuntivi</label><textarea value={additionalItems} onChange={(e) => setAdditionalItems(e.target.value)} placeholder="Inserisci prodotti non in lista..." className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" rows="3" /></div>}
          {selectedSupplierData && (Object.keys(orderItems).some(key => orderItems[key] && orderItems[key] !== '0') || additionalItems.trim()) && <button onClick={() => setShowConfirm(true)} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium hover:bg-blue-600 transition-colors">Anteprima Ordine</button>}
        </div>
        {showConfirm && <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50"><div className="bg-white rounded-xl p-6 max-w-sm w-full max-h-96 overflow-y-auto"><h3 className="font-medium text-gray-900 mb-4">Conferma Ordine</h3><div className="bg-gray-50 p-3 rounded-lg mb-4"><pre className="text-sm text-gray-700 whitespace-pre-wrap">{generateOrderMessage()}</pre></div><div className="flex space-x-3"><button onClick={() => setShowConfirm(false)} className="flex-1 py-2 px-4 border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-50" disabled={isSubmitting}>Modifica</button><button onClick={sendOrder} disabled={isSubmitting} className="flex-1 py-2 px-4 bg-blue-500 text-white rounded-lg hover:bg-blue-600 disabled:bg-blue-300 flex items-center justify-center space-x-2">{isSubmitting ? <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" /> : <Send size={16} />}<span>{isSubmitting ? 'Invio...' : 'Invia'}</span></button></div></div></div>}
      </div>
    );
  };

  const SuppliersPage = () => { /* ... existing code ... */ };
  const SchedulePage = () => { /* ... existing code ... */ };
  const HistoryPage = () => { /* ... existing code ... */ };
  const AnalyticsDashboard = () => { /* ... existing code ... */ };
  const SettingsPage = () => { /* ... existing code ... */ };

  const NotificationsPage = ({ onNotificationClick }) => {
    const [notifications, setNotifications] = useState([]);
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
      const fetchNotifications = async () => {
        if (!user) return;
        try {
          setIsLoading(true);
          const data = await supabaseHelpers.getNotifications(user.id);
          setNotifications(data);
        } catch (error) {
          console.error('Error fetching notifications:', error);
          toast.error('Errore nel caricamento delle notifiche.');
        } finally {
          setIsLoading(false);
        }
      };
      fetchNotifications();
    }, [user]);

    return (
      <div className="min-h-screen bg-gray-50">
        <Header title="Notifiche" onBack={() => setCurrentPage('home')} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-4">
          {isLoading ? <p className="text-center text-gray-500">Caricamento notifiche...</p> : notifications.length === 0 ? <div className="text-center py-12"><Bell size={48} className="mx-auto text-gray-300 mb-4" /><p className="text-gray-500">Nessuna notifica presente.</p></div> : notifications.map(notification => (
            <button key={notification.id} onClick={() => onNotificationClick(notification)} disabled={!notification.reminder_id} className={`w-full text-left bg-white rounded-xl p-4 shadow-sm border-l-4 ${notification.type === 'success' ? 'border-green-500' : notification.type === 'error' ? 'border-red-500' : notification.type === 'warning' ? 'border-yellow-500' : 'border-blue-500'} ${notification.reminder_id ? 'cursor-pointer hover:shadow-md' : 'cursor-default'}`}>
              <div className="flex justify-between items-start">
                <h3 className="font-medium text-gray-900">{notification.title}</h3>
                <p className="text-xs text-gray-500">{new Date(notification.created_at).toLocaleDateString('it-IT')}</p>
              </div>
              <p className="text-sm text-gray-600 mt-1">{notification.message}</p>
            </button>
          ))}
        </div>
      </div>
    );
  };

  if (!user) return <><Toaster position="top-center" reverseOrder={false} /><AuthPage /></>;

  const renderPage = () => {
    switch (currentPage) {
      case 'home': return <HomePage />;
      case 'createOrder': return <CreateOrderPage prefilledOrder={prefilledOrder} onOrderSent={() => { setPrefilledOrder(null); setCurrentPage('home'); }} />;
      case 'suppliers': return <SuppliersPage />;
      case 'schedule': return <SchedulePage />;
      case 'history': return <HistoryPage />;
      case 'analytics': return <AnalyticsDashboard />;
      case 'settings': return <SettingsPage />;
      case 'notifications': return <NotificationsPage onNotificationClick={handleNotificationClick} />;
      default: return <HomePage />;
    }
  };

  return <><Toaster position="top-center" reverseOrder={false} />{renderPage()}</>;
};

export default App;