import React, { useState, useEffect, useCallback, useMemo } from 'react';
import { Calendar, ChevronLeft, ChevronRight, Plus, Trash2, Edit3, Send, Check, Bell, History, Users, ShoppingCart, LogOut, Settings, Filter, Download, BarChart3, User } from 'lucide-react';
import { supabase, supabaseHelpers } from './supabase.js';
import { Toaster, toast } from 'react-hot-toast';
import { useAuth } from './AuthContext';
import { usePrefill } from './PrefillContext';

const openLinkInNewTab = (url) => {
  const newWindow = window.open(url, '_blank', 'noopener,noreferrer');
  if (newWindow) newWindow.opener = null;
};

const App = () => {
  const { user, signOut } = useAuth();
  const { setPrefilledData } = usePrefill();
  const [currentPage, setCurrentPage] = useState('home');
  const [suppliers, setSuppliers] = useState([]);
  const [orders, setOrders] = useState([]);
  const [scheduledOrders, setScheduledOrders] = useState([]);
  const [isAuthenticating, setIsAuthenticating] = useState(false);
  const [unreadCount, setUnreadCount] = useState(0);

  const [analytics, setAnalytics] = useState({ totalOrders: 0, totalSuppliers: 0, ordersThisWeek: 0, mostOrderedProduct: '' });
  const [filters, setFilters] = useState({ dateFrom: '', dateTo: '', supplier: '', status: '' });

  const handleUrlNavigation = useCallback(async (path) => {
    const match = path.match(/^\/reminders\/([0-9a-fA-F-]+)$/);
    if (match) {
      const reminderId = match[1];
      try {
        const scheduledOrder = await supabaseHelpers.getScheduledOrderById(reminderId);
        if (scheduledOrder) {
          setPrefilledData({ type: 'order', data: scheduledOrder });
          setCurrentPage('createOrder');
          // Clean the URL only if it's a reminder path
          if (window.location.pathname.startsWith('/reminders/')) {
            window.history.replaceState({}, document.title, "/");
          }
        }
      } catch (error) {
        console.error("Error loading reminder:", error);
        toast.error("Impossibile caricare il promemoria dell'ordine.");
      }
    }
  }, [setPrefilledData]);



  const handleNotificationClick = async (notification) => {
    if (notification.reminder_id) {
      try {
        const scheduledOrder = await supabaseHelpers.getScheduledOrderById(notification.reminder_id);
        if (scheduledOrder) {
          setPrefilledData({ type: 'order', data: scheduledOrder });
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
    const ordersThisWeek = ordersData.filter(order => new Date(order.sent_at || order.created_at) > weekAgo).length;
    const productCounts = {};
    ordersData.forEach(order => {
      if (order.order_items) {
        order.order_items.forEach(item => { productCounts[item.product_name] = (productCounts[item.product_name] || 0) + 1; });
      }
    });
    const mostOrderedProduct = Object.keys(productCounts).length > 0 ? Object.keys(productCounts).reduce((a, b) => productCounts[a] > productCounts[b] ? a : b) : 'Nessuno';
    setAnalytics({ totalOrders: ordersData.length, totalSuppliers: suppliersData.length, ordersThisWeek, mostOrderedProduct });
  }, []);

  const loadData = useCallback(async (userId) => {
    try {
      const suppliersData = await supabaseHelpers.getSuppliers(userId);
      const formattedSuppliers = suppliersData.map(supplier => ({ ...supplier, products: supplier.products ? supplier.products.map(p => p.name) : [] }));
      setSuppliers(formattedSuppliers);
      const ordersData = await supabaseHelpers.getOrders(userId);
      setOrders(ordersData);
      const scheduledData = await supabaseHelpers.getScheduledOrders(userId);
      setScheduledOrders(scheduledData);
      const unreadCountData = await supabaseHelpers.getUnreadNotificationsCount(userId);
      setUnreadCount(unreadCountData);
      if ('setAppBadge' in navigator) {
        navigator.setAppBadge(unreadCountData);
      }
      calculateAnalytics(ordersData, formattedSuppliers);
    } catch (error) {
      console.error('Error loading data:', error);
      toast.error('Errore durante il caricamento dei dati');
    }
  }, [calculateAnalytics]);

  useEffect(() => {
    if (user) {
      loadData(user.id);
      // Initial URL check when user is loaded
      if (window.location.pathname !== '/') {
        handleUrlNavigation(window.location.pathname);
      }
    } else {
      setSuppliers([]);
      setOrders([]);
      setScheduledOrders([]);
    }
  }, [user, loadData, handleUrlNavigation]);

  const MenuButton = ({ icon, title, subtitle, onClick, color }) => (
    <button onClick={onClick} className="w-full bg-white rounded-xl shadow-sm border border-gray-100 p-6 text-left hover:shadow-md transition-all duration-200">
      <div className="flex items-center space-x-4">
        <div className={`${color} rounded-full p-3 text-white`}>{icon}</div>
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
        <button onClick={onBack} className="p-2 -ml-2 text-gray-500 hover:bg-gray-100 rounded-full"><ChevronLeft size={24} /></button>
        <h2 className="text-lg font-medium text-gray-900 mx-auto pr-10">{title}</h2>
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
            <div className="text-center mb-6"><h1 className="text-2xl font-light text-gray-900 mb-2">Gestione Ordini</h1><p className="text-gray-500 text-sm">{isLogin ? 'Accedi al tuo account' : 'Crea un nuovo account'}</p></div>
            <form onSubmit={handleAuth} className="space-y-4">
              <div><label className="block text-sm font-medium text-gray-700 mb-2">Email</label><input type="email" value={email} onChange={(e) => setEmail(e.target.value)} required className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="tua@email.com" /></div>
              <div><label className="block text-sm font-medium text-gray-700 mb-2">Password</label><input type="password" value={password} onChange={(e) => setPassword(e.target.value)} required minLength={6} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Password (min 6 caratteri)" /></div>
              <button type="submit" disabled={isAuthenticating} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium hover:bg-blue-600 transition-colors disabled:bg-blue-300 flex items-center justify-center space-x-2">{isAuthenticating ? <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" /> : <span>{isLogin ? 'Accedi' : 'Registrati'}</span>}</button>
            </form>
            <div className="mt-6 text-center"><button onClick={() => setIsLogin(!isLogin)} className="text-blue-500 hover:text-blue-600 text-sm">{isLogin ? 'Non hai un account? Registrati' : 'Hai già un account? Accedi'}</button></div>
          </div>
        </div>
      </div>
    );
  };

  const HomePage = () => (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-white shadow-sm">
        <div className="max-w-sm mx-auto px-6 py-6">
          <div className="flex justify-between items-center mb-4"><div className="text-center"><h1 className="text-2xl font-light text-gray-900">Gestione Ordini</h1><p className="text-gray-500 text-sm">Benvenuto, {user?.email?.split('@')[0]}</p></div>
            <div className="flex space-x-2">
              <button onClick={() => setCurrentPage('analytics')} className="p-2 text-gray-400 hover:text-blue-500 hover:bg-blue-50 rounded-full"><BarChart3 size={20} /></button>
              <button onClick={() => setCurrentPage('notifications')} className="relative p-2 text-gray-400 hover:text-orange-500 hover:bg-orange-50 rounded-full">
                <Bell size={20} />
                {unreadCount > 0 && (
                  <span className="absolute top-1 right-1 flex h-4 w-4 items-center justify-center rounded-full bg-red-500 text-xs text-white">
                    {unreadCount}
                  </span>
                )}
              </button>
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

  const CreateOrderPage = ({ onOrderSent }) => {
    const { prefilledData, setPrefilledData } = usePrefill();
    const [selectedSupplier, setSelectedSupplier] = useState('');
    const [orderItems, setOrderItems] = useState({});
    const [additionalItems, setAdditionalItems] = useState('');
    const [showConfirm, setShowConfirm] = useState(false);
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [showScheduleModal, setShowScheduleModal] = useState(false);

    useEffect(() => {
      if (prefilledData && prefilledData.type === 'order') {
        setSelectedSupplier(prefilledData.data.supplier_id);
        if (prefilledData.data.order_data) {
          try {
            const data = JSON.parse(prefilledData.data.order_data);
            setOrderItems(data.items || {});
            setAdditionalItems(data.additional_items || '');
          } catch (e) {
            console.error("Failed to parse order_data", e);
          }
        }
        setPrefilledData(null);
      }
    }, [prefilledData, setPrefilledData]);

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
        
                let contactLink = '';
                switch (supplier.contact_method) {
                  case 'whatsapp': {
                    if (!supplier.contact) return toast.error('Numero di telefono del fornitore non impostato.');
                    const sanitizedContact = supplier.contact.replace(/\D/g, '');
                    if (!sanitizedContact) return toast.error('Numero di telefono del fornitore non valido.');
                    contactLink = `https://wa.me/${sanitizedContact}?text=${encodedMessage}`;
                    break;
                  }
                  case 'whatsapp_group': {
                    contactLink = `whatsapp://send?text=${encodedMessage}`;
                    break;
                  }
                  case 'email': {
                    if (!supplier.contact) return toast.error('Indirizzo email del fornitore non impostato.');
                    contactLink = `mailto:${supplier.contact}?subject=${encodeURIComponent(`Ordine Fornitore - ${supplier.name}`)}&body=${encodedMessage}`;
                    break;
                  }
                  case 'sms': {
                    if (!supplier.contact) return toast.error('Numero di telefono del fornitore non impostato.');
                    const sanitizedContact = supplier.contact.replace(/\D/g, '');
                    if (!sanitizedContact) return toast.error('Numero di telefono del fornitore non valido.');
                    contactLink = `sms:${sanitizedContact}?body=${encodedMessage}`;
                    break;
                  }
                  default: {
                    return toast.error('Metodo di contatto non supportato: ' + supplier.contact_method);
                  }
                }
                
                openLinkInNewTab(contactLink);
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
            <select value={selectedSupplier} onChange={(e) => setSelectedSupplier(e.target.value)} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" disabled={!!(prefilledData && prefilledData.type === 'order')}>
              <option value="">Scegli un fornitore...</option>
              {suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}
            </select>
          </div>
          {suppliers.length === 0 && <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 text-center"><p className="text-yellow-800 text-sm mb-3">Non hai ancora fornitori configurati</p><button onClick={() => setCurrentPage('suppliers')} className="text-yellow-600 hover:text-yellow-800 font-medium text-sm">Aggiungi il primo fornitore →</button></div>}
          {selectedSupplierData && (
            <div className="bg-white rounded-xl p-4 shadow-sm">
              <h3 className="font-medium text-gray-900 mb-4">Prodotti Disponibili</h3>
              {selectedSupplierData.products.length === 0 ? (
                <div className="text-center py-4"><p className="text-gray-500 text-sm">Nessun prodotto configurato</p></div>
              ) : (
                <div className="space-y-3">
                  {selectedSupplierData.products.map(product => (
                    <div key={product} className="flex items-center justify-between p-2 border border-gray-100 rounded-lg">
                      <label className="flex items-center space-x-3 flex-1">
                        <input
                          type="checkbox"
                          checked={!!(orderItems[product] && orderItems[product] !== '0')}
                          onChange={(e) => { if (!e.target.checked) setOrderItems(prev => ({ ...prev, [product]: '0' })); }}
                          className="rounded border-gray-300 text-blue-600 focus:ring-blue-500"
                        />
                        <span className="text-sm text-gray-700">{product}</span>
                      </label>
                      <input
                        type="text"
                        placeholder="Qt."
                        value={orderItems[product] || ''}
                        onChange={(e) => handleQuantityChange(product, e.target.value)}
                        className="w-16 p-1 text-center border border-gray-200 rounded text-sm"
                      />
                    </div>
                  ))}
                </div>
              )}
            </div>
          )}
          {selectedSupplierData && <div className="bg-white rounded-xl p-4 shadow-sm"><label className="block text-sm font-medium text-gray-700 mb-2">Prodotti Aggiuntivi</label><textarea value={additionalItems} onChange={(e) => setAdditionalItems(e.target.value)} placeholder="Inserisci prodotti non in lista..." className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" rows="3" /></div>}
          {selectedSupplierData && (Object.keys(orderItems).some(key => orderItems[key] && orderItems[key] !== '0') || additionalItems.trim()) && (
            <div className="flex space-x-3">
              <button onClick={() => setShowConfirm(true)} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium hover:bg-blue-600 transition-colors">Anteprima Ordine</button>
              <button onClick={() => setShowScheduleModal(true)} className="w-full bg-orange-500 text-white py-3 rounded-lg font-medium hover:bg-orange-600 transition-colors">Programma per dopo</button>
            </div>
          )}
        </div>
        {showConfirm && <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50"><div className="bg-white rounded-xl p-6 max-w-sm w-full max-h-96 overflow-y-auto"><h3 className="font-medium text-gray-900 mb-4">Conferma Ordine</h3><div className="bg-gray-50 p-3 rounded-lg mb-4"><pre className="text-sm text-gray-700 whitespace-pre-wrap">{generateOrderMessage()}</pre></div><div className="flex space-x-3"><button onClick={() => setShowConfirm(false)} className="flex-1 py-2 px-4 border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-50" disabled={isSubmitting}>Modifica</button><button onClick={sendOrder} disabled={isSubmitting} className="flex-1 py-2 px-4 bg-blue-500 text-white rounded-lg hover:bg-blue-600 disabled:bg-blue-300 flex items-center justify-center space-x-2">{isSubmitting ? <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" /> : <Send size={16} />}<span>{isSubmitting ? 'Invio...' : 'Invia'}</span></button></div></div></div>}
        {showScheduleModal && <ScheduleOrderModal 
            onClose={() => setShowScheduleModal(false)} 
            supplierId={selectedSupplier}
            orderItems={orderItems}
            additionalItems={additionalItems}
            onSchedule={() => {
              setSelectedSupplier('');
              setOrderItems({});
              setAdditionalItems('');
              setShowScheduleModal(false);
              setCurrentPage('home');
            }}
          />}
      </div>
    );
  };

  const ScheduleOrderModal = ({ onClose, supplierId, orderItems, additionalItems, onSchedule }) => {
    const { setPrefilledData } = usePrefill();
    const [isSubmitting, setIsSubmitting] = useState(false);
    const futureScheduledOrders = scheduledOrders.filter(o => new Date(o.scheduled_at) > new Date() && o.supplier_id === supplierId);

    const linkToScheduledOrder = async (scheduledOrderId) => {
      if (isSubmitting) return;
      setIsSubmitting(true);
      try {
        const order_data = JSON.stringify({ items: orderItems, additional_items: additionalItems });
        await supabaseHelpers.updateScheduledOrder(scheduledOrderId, { order_data });
        toast.success('Ordine programmato aggiornato con successo!');
        onSchedule();
      } catch (error) {
        console.error('Error linking to scheduled order:', error);
        toast.error("Errore durante l'aggiornamento dell'ordine programmato");
      } finally {
        setIsSubmitting(false);
      }
    };

    return (
      <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
        <div className="bg-white rounded-xl p-6 max-w-sm w-full max-h-[80vh] flex flex-col">
          <h3 className="font-medium text-gray-900 mb-4">Associa a un ordine programmato</h3>
          <div className="overflow-y-auto space-y-3">
            {futureScheduledOrders.length > 0 ? (
              futureScheduledOrders.map(order => (
                <button 
                  key={order.id} 
                  onClick={() => linkToScheduledOrder(order.id)}
                  disabled={isSubmitting}
                  className="w-full text-left p-3 bg-purple-50 rounded-lg hover:bg-purple-100 disabled:bg-gray-200"
                >
                  <p className="font-medium text-sm text-purple-900">{suppliers.find(s => s.id === order.supplier_id)?.name || 'Fornitore eliminato'}</p>
                  <p className="text-xs text-purple-700">{new Date(order.scheduled_at).toLocaleString('it-IT', { dateStyle: 'short', timeStyle: 'short' })}</p>
                </button>
              ))
            ) : (
              <div className="text-center py-8">
                <p className="text-gray-500 mb-4">Nessun ordine futuro programmato per questo fornitore.</p>
                <button 
                  onClick={() => {
                    setPrefilledData({ 
                      type: 'schedule', 
                      data: { 
                        supplier_id: supplierId, 
                        order_data: JSON.stringify({ items: orderItems, additional_items: additionalItems }) 
                      }
                    });
                    setCurrentPage('schedule');
                  }}
                  className="w-full bg-purple-500 text-white py-3 rounded-lg font-medium hover:bg-purple-600 transition-colors"
                >
                  Crea un nuovo ordine programmato
                </button>
              </div>
            )}
          </div>
          <div className="mt-4 flex justify-end">
            <button onClick={onClose} className="py-2 px-4 border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-50">Chiudi</button>
          </div>
        </div>
      </div>
    );
  };


  const SuppliersPage = () => {
    const [isAdding, setIsAdding] = useState(false);
    const [editingSupplier, setEditingSupplier] = useState(null);
    const [newSupplier, setNewSupplier] = useState({ name: '', contact_method: 'whatsapp', contact: '', products: [], message_template: 'Buongiorno, vorremmo ordinare i seguenti prodotti:' });
    const [newProduct, setNewProduct] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);

    const addProduct = () => { if (newProduct.trim()) { setNewSupplier(prev => ({ ...prev, products: [...prev.products, newProduct.trim()] })); setNewProduct(''); } };
    const removeProduct = (index) => { setNewSupplier(prev => ({ ...prev, products: prev.products.filter((_, i) => i !== index) })); };

    const saveSupplier = async () => {
      if (!newSupplier.name || !newSupplier.contact) { toast.error('Nome e contatto sono obbligatori'); return; }
      if (!user) { toast.error('Sessione utente non valida. Effettua nuovamente il login.'); setCurrentPage('auth'); return; }
      setIsSubmitting(true);
      try {
        const supplierData = { user_id: user.id, name: newSupplier.name, contact_method: newSupplier.contact_method, contact: newSupplier.contact, message_template: newSupplier.message_template };
        let savedSupplier;
        if (editingSupplier) {
          savedSupplier = await supabaseHelpers.updateSupplier(editingSupplier.id, supplierData);
          await supabaseHelpers.deleteProductsBySupplier(editingSupplier.id);
          if (newSupplier.products.length > 0) await supabaseHelpers.createProducts(editingSupplier.id, newSupplier.products);
          setSuppliers(prev => prev.map(s => s.id === editingSupplier.id ? { ...savedSupplier, products: newSupplier.products } : s));
          toast.success('Fornitore aggiornato con successo');
        } else {
          savedSupplier = await supabaseHelpers.createSupplier(supplierData);
          if (newSupplier.products.length > 0) await supabaseHelpers.createProducts(savedSupplier.id, newSupplier.products);
          setSuppliers(prev => [...prev, { ...savedSupplier, products: newSupplier.products }]);
          toast.success('Fornitore aggiunto con successo');
        }
        setNewSupplier({ name: '', contact_method: 'whatsapp', contact: '', products: [], message_template: 'Buongiorno, vorremmo ordinare i seguenti prodotti:' });
        setIsAdding(false);
        setEditingSupplier(null);
        if (!editingSupplier) { setTimeout(() => { if (window.confirm('Fornitore aggiunto! Vuoi aggiungerne un altro?')) setIsAdding(true); }, 1000); }
      } catch (error) {
        console.error('Error saving supplier:', error);
        toast.error('Errore durante il salvataggio');
        if (error.message && error.message.includes('Auth session missing')) setCurrentPage('auth');
      } finally {
        setIsSubmitting(false);
      }
    };

    const editSupplier = (supplier) => {
      setNewSupplier({ name: supplier.name, contact_method: supplier.contact_method, contact: supplier.contact, products: supplier.products || [], message_template: supplier.message_template });
      setEditingSupplier(supplier);
      setIsAdding(true);
    };

    const deleteSupplier = async (id) => {
      if (!window.confirm('Sei sicuro di voler eliminare questo fornitore? Questa azione eliminerà anche tutti i prodotti associati.')) return;
      try {
        await supabaseHelpers.deleteSupplier(id);
        setSuppliers(prev => prev.filter(s => s.id !== id));
        toast.success('Fornitore eliminato');
      } catch (error) {
        console.error('Error deleting supplier:', error);
        toast.error("Errore durante l'eliminazione");
      }
    };

    return (
      <div className="min-h-screen bg-gray-50">
        <Header title="Gestione Fornitori" onBack={() => setCurrentPage('home')} />
        <div className="max-w-sm mx-auto px-6 py-6">
          {!isAdding ? (
            <>
              <button onClick={() => setIsAdding(true)} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium mb-6 flex items-center justify-center space-x-2 hover:bg-blue-600 transition-colors"><Plus size={20} /><span>Aggiungi Fornitore</span></button>
              <div className="space-y-4">
                {suppliers.map(supplier => (
                  <div key={supplier.id} className="bg-white rounded-xl p-4 shadow-sm">
                    <div className="flex justify-between items-start mb-2">
                      <h3 className="font-medium text-gray-900">{supplier.name}</h3>
                      <div className="flex space-x-2">
                        <button onClick={() => editSupplier(supplier)} className="p-1 text-blue-500 hover:bg-blue-50 rounded"><Edit3 size={16} /></button>
                        <button onClick={() => deleteSupplier(supplier.id)} className="p-1 text-red-500 hover:bg-red-50 rounded"><Trash2 size={16} /></button>
                      </div>
                    </div>
                    <p className="text-sm text-gray-600 mb-1"><span className="font-medium">Contatto:</span> {supplier.contact_method} - {supplier.contact}</p>
                    <p className="text-sm text-gray-600"><span className="font-medium">Prodotti:</span> {supplier.products ? supplier.products.join(', ') : 'Nessun prodotto'}</p>
                  </div>
                ))}
                {suppliers.length === 0 && <div className="text-center py-12"><Users size={48} className="mx-auto text-gray-300 mb-4" /><p className="text-gray-500 mb-4">Nessun fornitore ancora aggiunto</p><button onClick={() => setIsAdding(true)} className="text-blue-500 hover:text-blue-600 font-medium">Aggiungi il primo fornitore</button></div>}
              </div>
            </>
          ) : (
            <div className="space-y-6">
              <div className="bg-white rounded-xl p-4 shadow-sm"><label className="block text-sm font-medium text-gray-700 mb-2">Nome Fornitore *</label><input type="text" value={newSupplier.name} onChange={(e) => setNewSupplier(prev => ({ ...prev, name: e.target.value }))} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Es. Fornitore Verdure Bio" /></div>
              <div className="bg-white rounded-xl p-4 shadow-sm"><label className="block text-sm font-medium text-gray-700 mb-2">Metodo di Invio</label><select value={newSupplier.contact_method} onChange={(e) => setNewSupplier(prev => ({ ...prev, contact_method: e.target.value }))} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"><option value="whatsapp">WhatsApp</option><option value="whatsapp_group">Gruppo WhatsApp</option><option value="email">Email</option><option value="sms">Messaggio</option></select></div>
              <div className="bg-white rounded-xl p-4 shadow-sm"><label className="block text-sm font-medium text-gray-700 mb-2">Contatto *</label><input type="text" value={newSupplier.contact} onChange={(e) => setNewSupplier(prev => ({ ...prev, contact: e.target.value }))} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder={newSupplier.contact_method === 'whatsapp' || newSupplier.contact_method === 'sms' ? "+39 123 456 7890" : "email@fornitore.com"} /></div>
              <div className="bg-white rounded-xl p-4 shadow-sm">
                <label className="block text-sm font-medium text-gray-700 mb-2">Prodotti</label>
                <div className="flex space-x-2 mb-3"><input type="text" value={newProduct} onChange={(e) => setNewProduct(e.target.value)} className="flex-1 p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Aggiungi prodotto..." onKeyPress={(e) => e.key === 'Enter' && addProduct()} /><button onClick={addProduct} className="px-4 py-3 bg-blue-500 text-white rounded-lg hover:bg-blue-600"><Plus size={16} /></button></div>
                <div className="space-y-2">{newSupplier.products.map((product, index) => <div key={index} className="flex items-center justify-between p-2 bg-gray-50 rounded-lg"><span className="text-sm text-gray-700">{product}</span><button onClick={() => removeProduct(index)} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button></div>)}</div>
              </div>
              <div className="bg-white rounded-xl p-4 shadow-sm"><label className="block text-sm font-medium text-gray-700 mb-2">Messaggio Predefinito</label><textarea value={newSupplier.message_template} onChange={(e) => setNewSupplier(prev => ({ ...prev, message_template: e.target.value }))} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" rows="3" placeholder="Messaggio che precederà ogni ordine..." /></div>
              <div className="flex space-x-3"><button onClick={() => { setIsAdding(false); setEditingSupplier(null); setNewSupplier({ name: '', contact_method: 'whatsapp', contact: '', products: [], message_template: 'Buongiorno, vorremmo ordinare i seguenti prodotti:' }); }} className="flex-1 py-3 border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-50" disabled={isSubmitting}>Annulla</button><button onClick={saveSupplier} disabled={isSubmitting} className="flex-1 py-3 bg-blue-500 text-white rounded-lg hover:bg-blue-600 disabled:bg-blue-300 flex items-center justify-center space-x-2">{isSubmitting ? <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" /> : <Check size={16} />}<span>{isSubmitting ? 'Salvando...' : 'Salva'}</span></button></div>
            </div>
          )}
        </div>
      </div>
    );
  };

  const SchedulePage = () => {
    const { prefilledData, setPrefilledData } = usePrefill();
    const getRoundedTime = (date = new Date()) => { const minutes = date.getMinutes(); const roundedMinutes = Math.ceil(minutes / 15) * 15; date.setMinutes(roundedMinutes); return date.toTimeString().slice(0, 5); };
    const [selectedDate, setSelectedDate] = useState(new Date().toISOString().split('T')[0]);
    const [selectedTime, setSelectedTime] = useState(getRoundedTime());
    const [selectedSupplier, setSelectedSupplier] = useState('');
    const [orderItems, setOrderItems] = useState({});
    const [additionalItems, setAdditionalItems] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [editingOrder, setEditingOrder] = useState(null);
    const timeSlots = [];
    for (let h = 0; h < 24; h++) { for (let m = 0; m < 60; m += 15) { const hour = h.toString().padStart(2, '0'); const minute = m.toString().padStart(2, '0'); timeSlots.push(`${hour}:${minute}`); } }

    useEffect(() => {
      if (prefilledData && prefilledData.type === 'schedule') {
        setSelectedSupplier(prefilledData.data.supplier_id);
        if (prefilledData.data.order_data) {
          try {
            const data = JSON.parse(prefilledData.data.order_data);
            setOrderItems(data.items || {});
            setAdditionalItems(data.additional_items || '');
          } catch (e) {
            console.error("Failed to parse order_data", e);
          }
        }
      }
    }, [prefilledData]);

    useEffect(() => {
      if (editingOrder) {
        const scheduledAt = new Date(editingOrder.scheduled_at);
        setSelectedDate(scheduledAt.toISOString().split('T')[0]);
        setSelectedTime(scheduledAt.toTimeString().slice(0, 5));
        setSelectedSupplier(editingOrder.supplier_id);
        if (editingOrder.order_data) {
          try {
            const data = JSON.parse(editingOrder.order_data);
            setOrderItems(data.items || {});
            setAdditionalItems(data.additional_items || '');
          } catch (e) {
            console.error("Failed to parse order_data", e);
          }
        }
      }
    }, [editingOrder]);

    const scheduleOrder = async () => {
      if (!selectedDate || !selectedSupplier) { toast.error('Seleziona data e fornitore'); return; }
      const scheduledDateTime = new Date(`${selectedDate}T${selectedTime}`);
      if (scheduledDateTime < new Date() && !editingOrder) { toast.error('Non puoi programmare un ordine nel passato.'); return; }
      setIsSubmitting(true);
      try {
        const orderData = { 
          user_id: user.id, 
          supplier_id: selectedSupplier, 
          scheduled_at: scheduledDateTime.toISOString(), 
          order_data: JSON.stringify({ items: orderItems, additional_items: additionalItems })
        };

        if (editingOrder) {
          const updatedOrder = await supabaseHelpers.updateScheduledOrder(editingOrder.id, orderData);
          setScheduledOrders(prev => prev.map(o => o.id === editingOrder.id ? { ...o, ...updatedOrder, suppliers: suppliers.find(s => s.id.toString() === selectedSupplier) } : o));
          toast.success('Ordine programmato aggiornato con successo');
        } else {
          const newScheduledOrder = await supabaseHelpers.createScheduledOrder(orderData);
          setScheduledOrders(prev => [...prev, { ...newScheduledOrder, suppliers: suppliers.find(s => s.id.toString() === selectedSupplier) }]);
          toast.success(`Ordine programmato creato con successo`);
        }

        setEditingOrder(null);
        setSelectedDate(new Date().toISOString().split('T')[0]);
        setSelectedTime(getRoundedTime());
        setSelectedSupplier('');
        setOrderItems({});
        setAdditionalItems('');
        if (!editingOrder) {
          setTimeout(() => { if (!window.confirm('Ordine programmato con successo! Vuoi programmarne un altro?')) setCurrentPage('home'); }, 1000);
        }
      } catch (error) {
        console.error('Error saving scheduled order:', error);
        toast.error('Errore durante il salvataggio dell\'ordine programmato');
      } finally {
        setIsSubmitting(false);
      }
    };

    const handleCancelEdit = () => {
      setEditingOrder(null);
      setSelectedDate(new Date().toISOString().split('T')[0]);
      setSelectedTime(getRoundedTime());
      setSelectedSupplier('');
      setOrderItems({});
      setAdditionalItems('');
    };

    const deleteScheduledOrder = async (id) => {
      if (!window.confirm('Sei sicuro di voler eliminare questo ordine programmato?')) return;
      try {
        await supabaseHelpers.deleteScheduledOrder(id);
        setScheduledOrders(prev => prev.filter(order => order.id !== id));
        toast.success('Ordine programmato eliminato');
      } catch (error) {
        console.error('Error deleting scheduled order:', error);
        toast.error("Errore durante l'eliminazione");
      }
    };

    const selectedSupplierData = suppliers.find(s => s.id.toString() === selectedSupplier);

    return (
      <div className="min-h-screen bg-gray-50">
        <Header title="Programma Ordini" onBack={() => setCurrentPage('home')} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-6">
          <div className="bg-white rounded-xl p-4 shadow-sm"><label className="block text-sm font-medium text-gray-700 mb-2">Data Programmazione</label><input type="date" value={selectedDate} onChange={(e) => setSelectedDate(e.target.value)} min={new Date().toISOString().split('T')[0]} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" /></div>
          <div className="bg-white rounded-xl p-4 shadow-sm"><label className="block text-sm font-medium text-gray-700 mb-2">Ora Invio</label><select value={selectedTime} onChange={(e) => setSelectedTime(e.target.value)} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent bg-white">{timeSlots.map(time => <option key={time} value={time}>{time}</option>)}</select></div>
          <div className="bg-white rounded-xl p-4 shadow-sm"><label className="block text-sm font-medium text-gray-700 mb-2">Seleziona Fornitore</label><select value={selectedSupplier} onChange={(e) => setSelectedSupplier(e.target.value)} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"><option value="">Scegli un fornitore...</option>{suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}</select></div>
          {selectedSupplierData && selectedSupplierData.products && <div className="bg-white rounded-xl p-4 shadow-sm"><h3 className="font-medium text-gray-900 mb-4">Prodotti</h3><div className="space-y-3">{selectedSupplierData.products.map(product => <div key={product} className="flex items-center justify-between p-2 border border-gray-100 rounded-lg"><label className="flex items-center space-x-3 flex-1"><input type="checkbox" checked={!!(orderItems[product] && orderItems[product] !== '0')} onChange={(e) => { if (!e.target.checked) setOrderItems(prev => ({ ...prev, [product]: '0' })); }} className="rounded border-gray-300 text-blue-600 focus:ring-blue-500" /><span className="text-sm text-gray-700">{product}</span></label><input type="text" placeholder="Qt." value={orderItems[product] || ''} onChange={(e) => setOrderItems(prev => ({ ...prev, [product]: e.target.value }))} className="w-16 p-1 text-center border border-gray-200 rounded text-sm" /></div>)}</div></div>}
          {selectedSupplierData && <div className="bg-white rounded-xl p-4 shadow-sm"><label className="block text-sm font-medium text-gray-700 mb-2">Prodotti Aggiuntivi</label><textarea value={additionalItems} onChange={(e) => setAdditionalItems(e.target.value)} placeholder="Inserisci prodotti non in lista..." className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" rows="3" /></div>}
          {scheduledOrders.length > 0 && <div className="bg-white rounded-xl p-4 shadow-sm"><h3 className="font-medium text-gray-900 mb-4">Ordini Programmati</h3><div className="space-y-3">{scheduledOrders.map(order => { const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers; return <button key={order.id} onClick={() => setEditingOrder(order)} className={`w-full text-left p-3 rounded-lg hover:bg-purple-100 ${editingOrder?.id === order.id ? 'bg-purple-200' : 'bg-purple-50'}`}><div className="flex justify-between items-center"><div><p className="font-medium text-sm text-purple-900">{supplier?.name || 'Fornitore eliminato'}</p><p className="text-xs text-purple-700">{new Date(order.scheduled_at).toLocaleString('it-IT', { dateStyle: 'short', timeStyle: 'short' })}</p>{order.is_sent && <span className="inline-block mt-1 px-2 py-1 bg-green-100 text-green-800 text-xs rounded-full">Inviato</span>}</div><div className="flex items-center space-x-2"><Bell size={16} className="text-purple-600" />{!order.is_sent && <button onClick={(e) => { e.stopPropagation(); deleteScheduledOrder(order.id); }} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button>}</div></div></button>; })}</div></div>}
          <div className="flex space-x-3">
            {editingOrder && <button onClick={handleCancelEdit} className="w-full py-3 border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-50">Annulla</button>}
            {selectedDate && selectedSupplierData && (Object.keys(orderItems).some(key => orderItems[key] && orderItems[key] !== '0') || additionalItems.trim()) && <button onClick={scheduleOrder} disabled={isSubmitting} className="w-full bg-purple-500 text-white py-3 rounded-lg font-medium hover:bg-purple-600 transition-colors flex items-center justify-center space-x-2 disabled:bg-purple-300">{isSubmitting ? <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" /> : <Calendar size={20} />}<span>{isSubmitting ? (editingOrder ? 'Aggiornando...' : 'Programmando...') : (editingOrder ? 'Aggiorna Ordine' : 'Programma Ordine')}</span></button>}
          </div>
        </div>
      </div>
    );
  };

  const HistoryPage = () => {
    const [showFilters, setShowFilters] = useState(false);
    const filteredOrders = useMemo(() => {
      let filtered = [...orders];
      if (filters.dateFrom) filtered = filtered.filter(order => new Date(order.sent_at || order.created_at) >= new Date(filters.dateFrom));
      if (filters.dateTo) filtered = filtered.filter(order => new Date(order.sent_at || order.created_at) <= new Date(filters.dateTo));
      if (filters.supplier) filtered = filtered.filter(order => order.supplier_id.toString() === filters.supplier);
      if (filters.status) filtered = filtered.filter(order => order.status === filters.status);
      return filtered;
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [orders, filters]);

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

    return (
      <div className="min-h-screen bg-gray-50">
        <Header title="Cronologia Ordini" onBack={() => setCurrentPage('home')} />
        <div className="max-w-sm mx-auto px-6 py-6">
          <div className="flex justify-between items-center mb-6">
            <button onClick={() => setShowFilters(!showFilters)} className="flex items-center space-x-2 px-4 py-2 bg-white border border-gray-200 rounded-lg text-sm hover:bg-gray-50"><Filter size={16} /><span>Filtri</span>{Object.values(filters).some(v => v !== '') && <span className="bg-blue-500 text-white text-xs px-2 py-1 rounded-full">{Object.values(filters).filter(v => v !== '').length}</span>}</button>
            <button onClick={exportFilteredData} className="flex items-center space-x-2 px-4 py-2 bg-green-500 text-white rounded-lg text-sm hover:bg-green-600"><Download size={16} /><span>Esporta</span></button>
          </div>
          {showFilters && <div className="bg-white rounded-xl p-4 shadow-sm mb-6 space-y-4"><div className="flex justify-between items-center"><h3 className="font-medium text-gray-900">Filtri</h3><button onClick={clearFilters} className="text-sm text-blue-500 hover:text-blue-600">Pulisci</button></div><div className="grid grid-cols-2 gap-3"><div><label className="block text-xs font-medium text-gray-700 mb-1">Da Data</label><input type="date" value={filters.dateFrom} onChange={(e) => setFilters(prev => ({ ...prev, dateFrom: e.target.value }))} className="w-full p-2 text-sm border border-gray-200 rounded-lg focus:ring-1 focus:ring-blue-500" /></div><div><label className="block text-xs font-medium text-gray-700 mb-1">A Data</label><input type="date" value={filters.dateTo} onChange={(e) => setFilters(prev => ({ ...prev, dateTo: e.target.value }))} className="w-full p-2 text-sm border border-gray-200 rounded-lg focus:ring-1 focus:ring-blue-500" /></div></div><div><label className="block text-xs font-medium text-gray-700 mb-1">Fornitore</label><select value={filters.supplier} onChange={(e) => setFilters(prev => ({ ...prev, supplier: e.target.value }))} className="w-full p-2 text-sm border border-gray-200 rounded-lg focus:ring-1 focus:ring-blue-500"><option value="">Tutti i fornitori</option>{suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}</select></div><div><label className="block text-xs font-medium text-gray-700 mb-1">Stato</label><select value={filters.status} onChange={(e) => setFilters(prev => ({ ...prev, status: e.target.value }))} className="w-full p-2 text-sm border border-gray-200 rounded-lg focus:ring-1 focus:ring-blue-500"><option value="">Tutti gli stati</option><option value="sent">Inviato</option><option value="confirmed">Confermato</option><option value="delivered">Consegnato</option></select></div></div>}
          <div className="flex justify-between items-center mb-4"><p className="text-sm text-gray-600">{filteredOrders.length} {filteredOrders.length === 1 ? 'ordine trovato' : 'ordini trovati'}</p></div>
          {filteredOrders.length === 0 ? <div className="text-center py-12"><History size={48} className="mx-auto text-gray-300 mb-4" /><p className="text-gray-500 mb-2">{orders.length === 0 ? 'Nessun ordine inviato ancora' : 'Nessun ordine trovato con questi filtri'}</p>{orders.length === 0 && <button onClick={() => setCurrentPage('createOrder')} className="text-blue-500 hover:text-blue-600 font-medium">Crea il primo ordine</button>}</div> : <div className="space-y-4">{filteredOrders.map(order => { const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers; return <div key={order.id} className="bg-white rounded-xl p-4 shadow-sm"><div className="flex justify-between items-start mb-3"><div><h3 className="font-medium text-gray-900">{supplier?.name || 'Fornitore eliminato'}</h3><p className="text-sm text-gray-500">{new Date(order.sent_at || order.created_at).toLocaleDateString('it-IT')} - {new Date(order.sent_at || order.created_at).toLocaleTimeString('it-IT', { hour: '2-digit', minute: '2-digit' })}</p></div><span className={`px-2 py-1 text-xs rounded-full flex items-center space-x-1 ${order.status === 'sent' ? 'bg-green-100 text-green-800' : order.status === 'confirmed' ? 'bg-blue-100 text-blue-800' : order.status === 'delivered' ? 'bg-purple-100 text-purple-800' : 'bg-gray-100 text-gray-800'}`}><Check size={12} /><span>{order.status === 'sent' ? 'Inviato' : order.status === 'confirmed' ? 'Confermato' : order.status === 'delivered' ? 'Consegnato' : 'Sconosciuto'}</span></span></div><div className="border-t pt-3"><div className="bg-gray-50 p-3 rounded-lg mb-3"><pre className="text-xs text-gray-700 whitespace-pre-wrap">{order.order_message}</pre></div></div><div className="pt-3 border-t"><p className="text-xs text-gray-500">Inviato via {supplier?.contact_method || 'N/A'} a {supplier?.contact || 'N/A'}</p></div></div>; })}</div>}
        </div>
      </div>
    );
  };

  const AnalyticsDashboard = () => (
    <div className="min-h-screen bg-gray-50">
      <Header title="Dashboard Analytics" onBack={() => setCurrentPage('home')} />
      <div className="max-w-sm mx-auto px-6 py-6 space-y-6">
        <div className="grid grid-cols-2 gap-4">
          <div className="bg-white rounded-xl p-4 shadow-sm"><div className="flex items-center justify-between"><div><p className="text-2xl font-bold text-blue-600">{analytics.totalOrders}</p><p className="text-xs text-gray-500">Ordini Totali</p></div><ShoppingCart className="text-blue-500" size={24} /></div></div>
          <div className="bg-white rounded-xl p-4 shadow-sm"><div className="flex items-center justify-between"><div><p className="text-2xl font-bold text-green-600">{analytics.totalSuppliers}</p><p className="text-xs text-gray-500">Fornitori</p></div><Users className="text-green-500" size={24} /></div></div>
          <div className="bg-white rounded-xl p-4 shadow-sm"><div className="flex items-center justify-between"><div><p className="text-2xl font-bold text-purple-600">{analytics.ordersThisWeek}</p><p className="text-xs text-gray-500">Questa Settimana</p></div><Calendar className="text-purple-500" size={24} /></div></div>
          <div className="bg-white rounded-xl p-4 shadow-sm"><div className="flex items-center justify-between"><div><p className="text-lg font-bold text-orange-600 truncate">{analytics.mostOrderedProduct}</p><p className="text-xs text-gray-500">Più Ordinato</p></div><BarChart3 className="text-orange-500" size={24} /></div></div>
        </div>
        <div className="bg-white rounded-xl p-4 shadow-sm"><h3 className="font-medium text-gray-900 mb-4">Azioni Rapide</h3><div className="space-y-3"><button onClick={() => setCurrentPage('createOrder')} className="w-full p-3 bg-blue-50 text-blue-700 rounded-lg text-left hover:bg-blue-100 transition-colors"><div className="flex items-center space-x-3"><ShoppingCart size={16} /><span className="text-sm font-medium">Crea Nuovo Ordine</span></div></button><button onClick={() => setCurrentPage('suppliers')} className="w-full p-3 bg-green-50 text-green-700 rounded-lg text-left hover:bg-green-100 transition-colors"><div className="flex items-center space-x-3"><Plus size={16} /><span className="text-sm font-medium">Aggiungi Fornitore</span></div></button></div></div>
        <div className="bg-white rounded-xl p-4 shadow-sm"><h3 className="font-medium text-gray-900 mb-4">Attività Recente</h3>{orders.slice(0, 3).map(order => { const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers; return <div key={order.id} className="flex items-center justify-between py-2 border-b border-gray-100 last:border-b-0"><div><p className="text-sm font-medium text-gray-900">{supplier?.name || 'Fornitore eliminato'}</p><p className="text-xs text-gray-500">{new Date(order.sent_at || order.created_at).toLocaleDateString('it-IT')}</p></div><span className="px-2 py-1 bg-green-100 text-green-800 text-xs rounded-full">Inviato</span></div>; })}</div>
      </div>
    </div>
  );

  const SettingsPage = () => {
    useEffect(() => {
      const isIos = () => { const userAgent = window.navigator.userAgent.toLowerCase(); return /iphone|ipad|ipod/.test(userAgent); };
      const isInStandaloneMode = () => ('standalone' in window.navigator) && (window.navigator.standalone);
      if (isIos() && !isInStandaloneMode()) {
        toast((t) => <div className="flex flex-col items-center"><span className="text-center">Per abilitare le notifiche, aggiungi questa app alla tua schermata principale: tocca l\\'icona di condivisione e poi "Aggiungi a Home".</span><button onClick={() => toast.dismiss(t.id)} className="mt-2 px-4 py-2 bg-blue-500 text-white rounded-lg">Ok</button></div>, { duration: 6000 });
      }
    }, []);

    const handleLogout = async () => { await signOut(); toast.success('Logout effettuato'); setCurrentPage('home'); };

    const handleEnablePush = async () => {
      if (!('serviceWorker' in navigator) || !('PushManager' in window)) { toast.error('Le notifiche push non sono supportate da questo browser.'); return; }
      try {
        const registration = await navigator.serviceWorker.ready;
        const existingSubscription = await registration.pushManager.getSubscription();
        if (existingSubscription) { toast.success('Le notifiche push sono già attive.'); return; }
        const permission = await window.Notification.requestPermission();
        if (permission !== 'granted') { toast.error('Permesso per le notifiche non concesso.'); return; }
        const vapidPublicKey = process.env.REACT_APP_VAPID_PUBLIC_KEY;
        if (!vapidPublicKey) { console.error('VAPID public key not found.'); toast.error('Errore di configurazione: chiave pubblica non trovata.'); return; }
        const subscription = await registration.pushManager.subscribe({ userVisibleOnly: true, applicationServerKey: vapidPublicKey });
        await supabaseHelpers.updateUserProfile(user.id, { push_subscription: subscription });
        toast.success('Notifiche push abilitate con successo!');
      } catch (error) {
        console.error('Error enabling push notifications:', error);
        toast.error('Impossibile abilitare le notifiche push.');
      }
    };

    return (
      <div className="min-h-screen bg-gray-50">
        <Header title="Impostazioni" onBack={() => setCurrentPage('home')} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-4">
          <div className="bg-white rounded-xl p-4 shadow-sm"><div className="flex items-center space-x-4"><div className="w-12 h-12 bg-gray-200 rounded-full flex items-center justify-center"><User size={24} className="text-gray-500" /></div><div><p className="font-medium text-gray-900">Utente</p><p className="text-sm text-gray-500">{user?.email}</p></div></div></div>
          <button onClick={handleEnablePush} className="w-full flex items-center justify-center space-x-2 py-3 bg-blue-500 text-white rounded-lg font-medium hover:bg-blue-600 transition-colors"><Bell size={16} /><span>Abilita Notifiche Push</span></button>
          <button onClick={handleLogout} className="w-full flex items-center justify-center space-x-2 py-3 bg-red-500 text-white rounded-lg font-medium hover:bg-red-600 transition-colors"><LogOut size={16} /><span>Esci</span></button>
        </div>
      </div>
    );
  };

  const NotificationsPage = ({ onNotificationClick, unreadCount, setUnreadCount }) => {
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
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [user]);

    const handleArchive = async (notificationId) => {
      const notification = notifications.find(n => n.id === notificationId);
      if (!notification || notification.is_read) return;

      try {
        await supabaseHelpers.markNotificationAsRead(notificationId);
        setNotifications(prev => prev.map(n => n.id === notificationId ? { ...n, is_read: true } : n));
        const newCount = Math.max(0, unreadCount - 1);
        setUnreadCount(newCount);
        if ('setAppBadge' in navigator) {
          navigator.setAppBadge(newCount);
        }
        toast.success('Notifica archiviata.');
      } catch (error) {
        console.error('Error archiving notification:', error);
        toast.error('Errore durante l\'archiviazione della notifica.');
      }
    };
    
    const handleMarkAllAsRead = async () => {
      const unreadIds = notifications.filter(n => !n.is_read).map(n => n.id);
      if (unreadIds.length === 0) return;

      try {
        await Promise.all(unreadIds.map(id => supabaseHelpers.markNotificationAsRead(id)));
        setNotifications(prev => prev.map(n => ({ ...n, is_read: true })));
        setUnreadCount(0);
        if ('clearAppBadge' in navigator) {
          navigator.clearAppBadge();
        }
        toast.success('Tutte le notifiche sono state segnate come lette.');
      } catch (error) {
        console.error('Error marking all as read:', error);
        toast.error('Errore durante l\'archiviazione delle notifiche.');
      }
    };

    const unreadNotifications = notifications.filter(n => !n.is_read);
    const readNotifications = notifications.filter(n => n.is_read);

    return (
      <div className="min-h-screen bg-gray-50">
        <Header title="Notifiche" onBack={() => setCurrentPage('home')} />
        <div className="max-w-sm mx-auto px-6 py-6">
          <div className="flex justify-between items-center mb-6">
            <h2 className="text-lg font-medium text-gray-900">Centro Notifiche</h2>
            {unreadCount > 0 && (
              <button onClick={handleMarkAllAsRead} className="text-sm text-blue-500 hover:text-blue-600">
                Segna tutte come lette
              </button>
            )}
          </div>

          {isLoading ? <p className="text-center text-gray-500">Caricamento notifiche...</p> : notifications.length === 0 ? <div className="text-center py-12"><Bell size={48} className="mx-auto text-gray-300 mb-4" /><p className="text-gray-500">Nessuna notifica presente.</p></div> : (
            <div className="space-y-4">
              {unreadNotifications.length > 0 && (
                <div className="space-y-3">
                  {unreadNotifications.map(notification => (
                    <div key={notification.id} className="bg-white rounded-xl p-4 shadow-sm border-l-4 border-blue-500 transition-all hover:shadow-md">
                      <div className="flex justify-between items-start gap-4">
                        <div className="flex-1">
                          <h3 className="font-medium text-gray-800">{notification.title}</h3>
                          <p className="text-xs text-gray-500 mt-1">{new Date(notification.created_at).toLocaleString('it-IT', { dateStyle: 'medium', timeStyle: 'short' })}</p>
                          <p className="text-sm text-gray-600 mt-2">{notification.message}</p>
                          {notification.reminder_id && (
                            <button onClick={() => onNotificationClick(notification)} className="mt-2 text-sm font-medium text-blue-600 hover:underline">
                              Visualizza ordine
                            </button>
                          )}
                        </div>
                        <button onClick={() => handleArchive(notification.id)} className="p-1 text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded-full">
                          <Check size={18} />
                        </button>
                      </div>
                    </div>
                  ))}
                </div>
              )}
              {readNotifications.length > 0 && (
                <div className="mt-8">
                  <h3 className="text-sm font-medium text-gray-500 mb-3">Già lette</h3>
                  <div className="space-y-3">
                    {readNotifications.map(notification => (
                      <div key={notification.id} className="bg-white rounded-xl p-4 shadow-sm opacity-60">
                        <h3 className="font-medium text-gray-700">{notification.title}</h3>
                        <p className="text-xs text-gray-500 mt-1">{new Date(notification.created_at).toLocaleString('it-IT', { dateStyle: 'medium', timeStyle: 'short' })}</p>
                        <p className="text-sm text-gray-600 mt-2">{notification.message}</p>
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </div>
          )}
        </div>
      </div>
    );
  };

  if (!user) return <><Toaster position="top-center" reverseOrder={false} /><AuthPage /></>;

  const renderPage = () => {
    switch (currentPage) {
      case 'home': return <HomePage />;
      case 'createOrder': return <CreateOrderPage onOrderSent={() => { setPrefilledData(null); setCurrentPage('home'); }} />;
      case 'suppliers': return <SuppliersPage />;
      case 'schedule': return <SchedulePage />;
      case 'history': return <HistoryPage />;
      case 'analytics': return <AnalyticsDashboard />;
      case 'settings': return <SettingsPage />;
      case 'notifications': return <NotificationsPage onNotificationClick={handleNotificationClick} unreadCount={unreadCount} setUnreadCount={setUnreadCount} />;
      default: return <HomePage />;
    }
  };

  return <><Toaster position="top-center" reverseOrder={false} />{renderPage()}</>;
};

export default App;
