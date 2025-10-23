import React, { useState, useEffect, useCallback, useMemo } from 'react';
import { Calendar, ChevronLeft, ChevronRight, Plus, Trash2, Edit3, Send, Check, Bell, History, Users, ShoppingCart, LogOut, Settings, Filter, Download, BarChart3, User, ChevronDown } from 'lucide-react';
import { Chart as ChartJS, CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend, ArcElement, LineElement, PointElement } from 'chart.js';
import { Bar, Pie, Line } from 'react-chartjs-2';
import { supabase, supabaseHelpers } from './supabase.js';
import { Toaster, toast } from 'react-hot-toast';
import { useAuth } from './AuthContext.js';
import { usePrefill } from './PrefillContext.js';

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

const openLinkInNewTab = (url) => {
  const newWindow = window.open(url, '_blank', 'noopener,noreferrer');
  if (newWindow) newWindow.opener = null;
};

const App = () => {
  const { user, signOut } = useAuth();
  const [profile, setProfile] = useState(null);

  useEffect(() => {
    const fetchProfile = async () => {
      if (user) {
        try {
          const profileData = await supabaseHelpers.getUserProfile(user.id);
          setProfile(profileData);
        } catch (error) {
          // It's okay if a profile doesn't exist yet (e.g., new user).
          // The helper throws an error with code 'PGRST116' in this case.
          if (error.code !== 'PGRST116') {
            console.error('Error fetching profile:', error);
          }
          setProfile(null);
        }
      } else {
        setProfile(null);
      }
    };

    fetchProfile();
  }, [user]);
  const { setPrefilledData } = usePrefill();
  const [currentPage, setCurrentPage] = useState('home');
  const [suppliers, setSuppliers] = useState([]);
  const [orders, setOrders] = useState([]);
  const [scheduledOrders, setScheduledOrders] = useState([]);
  const [unreadCount, setUnreadCount] = useState(0);
  const [isAdminAuthenticated, setIsAdminAuthenticated] = useState(false);
  const [selectedProductForHistory, setSelectedProductForHistory] = useState(null); // New state
  const [batchMode, setBatchMode] = useState(false);
  const [multiOrders, setMultiOrders] = useState([{ id: Date.now(), supplier: '', items: {}, additional: '', email_subject: '' }]);
  const [showWizard, setShowWizard] = useState(false);
  const [wizardOrders, setWizardOrders] = useState([]);
  const [wizardStep, setWizardStep] = useState(0);

  useEffect(() => {
    const savedWizardState = sessionStorage.getItem('wizardState');
    if (savedWizardState) {
      const { wizardOrders: savedOrders, wizardStep: savedStep } = JSON.parse(savedWizardState);
      setWizardOrders(savedOrders);
      setWizardStep(savedStep);
      setShowWizard(true);
    }
  }, []);

  useEffect(() => {
    if (showWizard) {
      sessionStorage.setItem('wizardState', JSON.stringify({ wizardOrders, wizardStep }));
    } else {
      sessionStorage.removeItem('wizardState');
    }
  }, [showWizard, wizardOrders, wizardStep]);

  const [analytics, setAnalytics] = useState({ totalOrders: 0, totalSuppliers: 0, ordersThisWeek: 0, mostOrderedProduct: '' });
  const [theme, setTheme] = useState(() => {
    try {
      const saved = localStorage.getItem('theme');
      if (saved) return saved;
      return window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
    } catch { return 'light'; }
  });
  useEffect(() => {
    const root = document.documentElement;
    if (theme === 'dark') root.classList.add('dark'); else root.classList.remove('dark');
    try { localStorage.setItem('theme', theme); } catch {}
  }, [theme]);
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
        } else {
      
        }
      } catch (error) {
        console.error("Error loading reminder from notification:", error);
        toast.error("Impossibile caricare il promemoria.");
      }
    } else {
  
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
    <button onClick={onClick} className="w-full glass-card border border-white/60 p-6 text-left transition-all duration-300 hover:-translate-y-0.5 hover:shadow-md active:scale-95 group">
      <div className="flex items-center space-x-4">
        <div className={`rounded-2xl p-3 text-white bg-gradient-to-br ${color} ring-1 ring-white/60 shadow-inner`}>{icon}</div>
        <div className="flex-1">
          <h3 className="font-medium text-gray-900 text-sm">{title}</h3>
          <p className="text-gray-500 text-xs mt-1">{subtitle}</p>
        </div>
        <ChevronRight size={20} className="text-gray-300" />
      </div>
    </button>
  );

  const Header = ({ title, onBack }) => (
    <div className="backdrop-blur bg-white/60 dark:bg-black/40 border-b border-white/60 dark:border-white/10 sticky top-0 z-10">
      <div className="max-w-sm mx-auto px-6 py-4 flex items-center">
        <button onClick={onBack} className="p-2 -ml-2 text-gray-500 hover:bg-gray-100 rounded-full"><ChevronLeft size={24} /></button>
        <h2 className="text-lg font-medium text-gray-900 dark:text-gray-100 mx-auto pr-10">{title}</h2>
      </div>
    </div>
  );



  const HomePage = () => (
    <div className="min-h-screen app-background">
      <div className="backdrop-blur bg-white/60 dark:bg-black/40 border-b border-white/60 dark:border-white/10">
        <div className="max-w-sm mx-auto px-6 py-6">
          <div className="flex justify-between items-center mb-4"><div className="text-center"><h1 className="text-2xl font-light text-gray-900">Gestione Ordini</h1><p className="text-gray-500 text-sm">Benvenuto, {profile?.first_name || user?.email?.split('@')[0]}</p></div>
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
            <div className="glass-card p-3 text-center"><p className="text-lg font-semibold bg-clip-text text-transparent bg-gradient-to-br from-blue-600 to-indigo-600">{analytics.totalOrders}</p><p className="text-xs text-gray-600">Ordini</p></div>
            <div className="glass-card p-3 text-center"><p className="text-lg font-semibold bg-clip-text text-transparent bg-gradient-to-br from-emerald-600 to-green-600">{analytics.totalSuppliers}</p><p className="text-xs text-gray-600">Fornitori</p></div>
            <div className="glass-card p-3 text-center"><p className="text-lg font-semibold bg-clip-text text-transparent bg-gradient-to-br from-purple-600 to-violet-600">{analytics.ordersThisWeek}</p><p className="text-xs text-gray-600">Settimana</p></div>
          </div>
        </div>
      </div>
      <div className="max-w-sm mx-auto px-6 py-6 space-y-4">
        <MenuButton icon={<ShoppingCart size={24} />} title="CREA IL TUO ORDINE" subtitle="Nuovo ordine ai fornitori" onClick={() => setCurrentPage('createOrder')} color="from-blue-500 to-indigo-600" />
        <MenuButton icon={<Users size={24} />} title="GESTIONE FORNITORI" subtitle="Aggiungi e modifica fornitori" onClick={() => setCurrentPage('suppliers')} color="from-emerald-500 to-green-600" />
        <MenuButton icon={<Calendar size={24} />} title="PROGRAMMA ORDINI" subtitle="Pianifica ordini futuri" onClick={() => setCurrentPage('schedule')} color="from-purple-500 to-violet-600" />
        <MenuButton icon={<History size={24} />} title="CRONOLOGIA ORDINI" subtitle="Storico degli ordini" onClick={() => setCurrentPage('history')} color="from-orange-500 to-amber-600" />
      </div>
    </div>
  );

  const CreateOrderPage = ({ scheduledOrders, setScheduledOrders, onOrderSent, batchMode, setBatchMode, multiOrders, setMultiOrders, suppliers, setOrders, showWizard, setShowWizard, wizardOrders, setWizardOrders, wizardStep, setWizardStep }) => {
    const { prefilledData, setPrefilledData } = usePrefill();
    const [selectedSupplier, setSelectedSupplier] = useState('');
    const [orderItems, setOrderItems] = useState({});
    const [additionalItems, setAdditionalItems] = useState('');
    const [emailSubject, setEmailSubject] = useState('');
    const [showConfirm, setShowConfirm] = useState(false);
    const [confirmMessages, setConfirmMessages] = useState(null);
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [showScheduleModal, setShowScheduleModal] = useState(false);
    const [showTypeModal, setShowTypeModal] = useState(false);

    const [newlyCreatedOrders, setNewlyCreatedOrders] = useState([]);









    const removeSupplierOrder = (id) => {
      if (multiOrders.length > 1) {
        setMultiOrders(prev => prev.filter(order => order.id !== id));
      }
    };

    const updateSupplierOrder = (id, field, value) => {
      setMultiOrders(prev => prev.map(order => order.id === id ? { ...order, [field]: value } : order));
    };

    useEffect(() => {
      if (prefilledData && prefilledData.type === 'order') {
        const newSelectedSupplierId = prefilledData.data.supplier_id;
        setSelectedSupplier(newSelectedSupplierId);
        const supplier = suppliers.find(s => s.id.toString() === newSelectedSupplierId);
        if (supplier) {
          setEmailSubject(supplier.email_subject || '');
        }

        let newOrderItems = {};
        let newAdditionalItems = '';
        if (prefilledData.data.order_data) {
          try {
            const data = JSON.parse(prefilledData.data.order_data);
            newOrderItems = data.items || {};
            newAdditionalItems = data.additional_items || '';
            setOrderItems(newOrderItems);
            setAdditionalItems(newAdditionalItems);
          } catch (e) {
            console.error("Failed to parse order_data", e);
          }
        }

        if (prefilledData.immediateSend) {
          const supplier = suppliers.find(s => s.id.toString() === newSelectedSupplierId);
          if (supplier) {
            // Re-implement generateOrderMessage locally to avoid dependency
            let message = supplier.message_template + `\n\n`;
            Object.entries(newOrderItems).forEach(([product, quantity]) => {
              if (quantity && quantity !== '0') message += `• ${product}: ${quantity}\n`;
            });
            if (newAdditionalItems.trim()) message += newAdditionalItems + '\n';
            message += '\nGrazie!';
            
            setConfirmMessages([{ supplier: supplier.name, message: message }]);
            setShowConfirm(true);
          } else {
            toast.error("Fornitore non trovato per l'ordine programmato.");
          }
          setPrefilledData(p => ({...p, immediateSend: false}));
        }
      }
    }, [prefilledData, setPrefilledData, suppliers, setConfirmMessages, setShowConfirm]);

    const handleProductSelectionChange = (product, isSelected) => {
        setOrderItems(prev => {
            const newItems = { ...prev };
            if (isSelected) {
                newItems[product] = '';
            } else {
                delete newItems[product];
            }
            return newItems;
        });
    };

    const handleQuantityChange = (product, quantity) => {
      setOrderItems(prev => ({ ...prev, [product]: quantity }));
    };

    const generateOrderMessage = (supplier, items = orderItems, additional = additionalItems) => {
      if (!supplier) return '';
      let message = supplier.message_template + `\n\n`;
      Object.entries(items).forEach(([product, quantity]) => {
        if (quantity && quantity !== '0') message += `• ${product}: ${quantity}\n`;
      });
      if (additional.trim()) message += additional + '\n';
      message += '\nGrazie!';
      return message;
    };

    const handlePreviewOrder = () => {
        if (batchMode) {
            const invalidOrders = [];
            const orderMessages = [];
            multiOrders.forEach((order, index) => {
                if (!order.supplier) {
                    invalidOrders.push(`Ordine ${index + 1}: Seleziona un fornitore`);
                    return;
                }
                const supplier = suppliers.find(s => s.id.toString() === order.supplier);
                if (!supplier) return;
                const itemsWithMissingQuantity = Object.keys(order.items).filter(product => order.items[product] === '');
                if (itemsWithMissingQuantity.length > 0) {
                    invalidOrders.push(`Ordine ${index + 1} (${supplier.name}): Inserire quantità per ${itemsWithMissingQuantity.join(', ')}`);
                    return;
                }
                const message = generateOrderMessage(supplier, order.items, order.additional);
                orderMessages.push({ supplier: supplier.name, message });
            });
            if (invalidOrders.length > 0) {
                toast.error(invalidOrders.join('; '));
                return;
            }
            setConfirmMessages(orderMessages);
            setShowConfirm(true);
        } else {
            const itemsWithMissingQuantity = Object.keys(orderItems)
                .filter(product => orderItems.hasOwnProperty(product) && orderItems[product] === '');

            if (itemsWithMissingQuantity.length > 0) {
                toast.error(`Inserire la quantità per i seguenti prodotti: ${itemsWithMissingQuantity.join(', ')}`);
                return;
            }
            const supplier = suppliers.find(s => s.id.toString() === selectedSupplier);
            const orderMessage = generateOrderMessage(supplier);
            setConfirmMessages([{ supplier: supplier.name, message: orderMessage }]);
            setShowConfirm(true);
        }
    };

    const sendOrder = async () => {
      if (batchMode) {
        const validOrders = multiOrders.filter(order => order.supplier && Object.keys(order.items).some(key => order.items[key] && order.items[key] !== '0'));
        if (validOrders.length === 0) {
          toast.error('Nessun ordine valido da inviare');
          setShowConfirm(false);
          setConfirmMessages(null);
          return;
        }
        const ordersWithSuppliers = validOrders.map(order => {
          const supplier = suppliers.find(s => s.id.toString() === order.supplier);
          if (!supplier) {
            console.warn(`Supplier with ID ${order.supplier} not found for order. Skipping.`);
            return null; // Mark for removal
          }
          return { ...order, supplier, message: generateOrderMessage(supplier, order.items, order.additional), email_subject: order.email_subject };
        }).filter(Boolean); // Remove null entries

        if (ordersWithSuppliers.length === 0) {
          toast.error('Nessun ordine valido con fornitore trovato da inviare.');
          setShowConfirm(false);
          setConfirmMessages(null);
          return;
        }
        setWizardOrders(ordersWithSuppliers);
        setWizardStep(0);
        setShowWizard(true);
        setShowConfirm(false);
        setConfirmMessages(null);
      } else {
        const itemsWithMissingQuantity = Object.keys(orderItems)
            .filter(product => orderItems.hasOwnProperty(product) && orderItems[product] === '');

        if (itemsWithMissingQuantity.length > 0) {
            toast.error(`Inserire la quantità per i seguenti prodotti: ${itemsWithMissingQuantity.join(', ')}`);
            setShowConfirm(false);
            return;
        }

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
                      contactLink = `mailto:${supplier.contact}?subject=${encodeURIComponent(emailSubject || `Ordine Fornitore - ${supplier.name}`)}&body=${encodedMessage}`;
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

          let scheduledOrderMessagePart = '';
          if (prefilledData && prefilledData.type === 'order' && prefilledData.data.id && prefilledData.data.scheduled_at) {
              try {
                  await supabaseHelpers.deleteScheduledOrder(prefilledData.data.id);
                  setScheduledOrders(prev => prev.filter(order => order.id !== prefilledData.data.id));
                  setPrefilledData(null);
                  scheduledOrderMessagePart = ' L\'ordine programmato è stato rimosso.';
              } catch (error) {
                  console.error('Error deleting scheduled order:', error);
                  toast.error("Errore durante l'eliminazione dell'ordine programmato");
              }
          }

          toast.success(`Ordine inviato via ${supplier.contact_method} a ${supplier.name}!${scheduledOrderMessagePart}`);
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
      }
    };

    const selectedSupplierData = suppliers.find(s => s.id.toString() === selectedSupplier);

    return (
      <div className="min-h-screen app-background">
        <Header title="Crea Ordine" onBack={() => { onOrderSent ? onOrderSent() : setCurrentPage('home'); }} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-6">

          <div className="glass-card p-4">
            <div className="flex justify-between items-center mb-4">
              <h3 className="font-medium text-gray-900 dark:text-gray-100">Tipo Ordine</h3>
              <button onClick={() => setShowTypeModal(true)} className={`px-4 py-2 rounded-lg text-sm font-medium ${batchMode ? 'bg-purple-500 text-white' : 'bg-gray-200 text-gray-700'} transition-colors`}>
                {batchMode ? 'Più Fornitori' : 'Singolo Fornitore'}
              </button>
            </div>
            {!batchMode && (
              <>
                <label htmlFor="supplier-select" className="block text-sm font-medium text-gray-700 mb-2">Seleziona Fornitore</label>
                <select id="supplier-select" name="supplier-select" value={selectedSupplier} onChange={(e) => setSelectedSupplier(e.target.value)} className="w-full p-3 border border-gray-200 dark:border-gray-700 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100" disabled={!!(prefilledData && prefilledData.type === 'order')}>
                  <option value="">Scegli un fornitore...</option>
                  {suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}
                </select>
              </>
            )}
          </div>
          {suppliers.length === 0 && <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 text-center"><p className="text-yellow-800 text-sm mb-3">Non hai ancora fornitori configurati</p><button onClick={() => setCurrentPage('suppliers')} className="text-yellow-600 hover:text-yellow-800 font-medium text-sm">Aggiungi il primo fornitore →</button></div>}
          {selectedSupplierData && (
            <div className="glass-card p-4">
              <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Prodotti Disponibili</h3>
              {selectedSupplierData.products.length === 0 ? (
                <div className="text-center py-4"><p className="text-gray-500 text-sm">Nessun prodotto configurato</p></div>
              ) : (
                <div className="space-y-3">
                  {selectedSupplierData.products.map(product => (
                    <div key={product} className="flex items-center justify-between p-2 border border-gray-100 rounded-lg">
                      <label className="flex items-center space-x-3 flex-1">
                        <input
                          type="checkbox"
                          id={`product-checkbox-${product}`}
                          name={`product-checkbox-${product}`}
                          checked={orderItems.hasOwnProperty(product)}
                          onChange={(e) => handleProductSelectionChange(product, e.target.checked)}
                          className="rounded border-gray-300 dark:border-gray-600 text-blue-600 dark:text-blue-400 focus:ring-blue-500 accent-blue-600 dark:accent-blue-400 transition-transform active:scale-95"
                        />
                        <span className="text-sm text-gray-700">{product}</span>
                      </label>
                      <input
                        type="tel"
                        inputMode="decimal"
                        id={`quantity-${product}`}
                        name={`quantity-${product}`}
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
          {selectedSupplierData && selectedSupplierData.contact_method === 'email' && <div className="glass-card p-4"><label htmlFor="email-subject" className="block text-sm font-medium text-gray-700 mb-2">Oggetto Email</label><input id="email-subject" name="email-subject" type="text" value={emailSubject} onChange={(e) => setEmailSubject(e.target.value)} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Oggetto dell'email" /></div>}
          {selectedSupplierData && <div className="glass-card p-4"><label htmlFor="additional-items" className="block text-sm font-medium text-gray-700 mb-2">Prodotti Aggiuntivi</label><textarea id="additional-items" name="additional-items" value={additionalItems} onChange={(e) => setAdditionalItems(e.target.value)} placeholder="Inserisci prodotti non in lista..." className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" rows="3" /></div>}
            <div className="flex space-x-3">
              <button onClick={handlePreviewOrder} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium hover:bg-blue-600 transition-colors">Anteprima Ordine</button>
              <button onClick={() => setShowScheduleModal(true)} className="w-full bg-orange-500 text-white py-3 rounded-lg font-medium hover:bg-orange-600 transition-colors">Programma per dopo</button>
            </div>

          {batchMode && (
            <div className="space-y-6">
              {multiOrders.map((order, index) => {
                const supplierData = suppliers.find(s => s.id.toString() === order.supplier);
                return (
                  <div key={order.id} className="glass-card p-4">
                    <div className="flex justify-between items-center mb-4">
                      <h3 className="font-medium text-gray-900 dark:text-gray-100">Ordine {index + 1}: {supplierData ? supplierData.name : 'Seleziona Fornitore'}</h3>
                      {multiOrders.length > 1 && (
                        <button onClick={() => removeSupplierOrder(order.id)} className="p-1 text-red-500 hover:bg-red-50 rounded"><Trash2 size={16} /></button>
                      )}
                    </div>
                    <div className="space-y-4">
                      <div>
                        <label htmlFor={`supplier-select-${order.id}`} className="block text-sm font-medium text-gray-700 mb-2">Seleziona Fornitore</label>
                        <select id={`supplier-select-${order.id}`} name={`supplier-select-${order.id}`} value={order.supplier} onChange={(e) => updateSupplierOrder(order.id, 'supplier', e.target.value)} className="w-full p-3 border border-gray-200 dark:border-gray-700 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100">
                          <option value="">Scegli un fornitore...</option>
                          {suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}
                        </select>
                      </div>
                      {supplierData && (
                        <>
                          <div>
                            <h4 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Prodotti Disponibili</h4>
                            {supplierData.products.length === 0 ? (
                              <div className="text-center py-4"><p className="text-gray-500 text-sm">Nessun prodotto configurato</p></div>
                            ) : (
                              <div className="space-y-3">
                                {supplierData.products.map(product => (
                                  <div key={product} className="flex items-center justify-between p-2 border border-gray-100 rounded-lg">
                                    <label className="flex items-center space-x-3 flex-1">
                                      <input
                                        type="checkbox"
                                        id={`product-checkbox-${order.id}-${product}`}
                                        name={`product-checkbox-${order.id}-${product}`}
                                        checked={order.items.hasOwnProperty(product)}
                                        onChange={(e) => {
                                          const newItems = { ...order.items };
                                          if (e.target.checked) {
                                            newItems[product] = '';
                                          } else {
                                            delete newItems[product];
                                          }
                                          updateSupplierOrder(order.id, 'items', newItems);
                                        }}
                                        className="rounded border-gray-300 dark:border-gray-600 text-blue-600 dark:text-blue-400 focus:ring-blue-500 accent-blue-600 dark:accent-blue-400 transition-transform active:scale-95"
                                      />
                                      <span className="text-sm text-gray-700">{product}</span>
                                    </label>
                                    <input
                                      type="tel"
                                      inputMode="decimal"
                                      id={`quantity-${order.id}-${product}`}
                                      name={`quantity-${order.id}-${product}`}
                                      placeholder="Qt."
                                      value={order.items[product] || ''}
                                      onChange={(e) => updateSupplierOrder(order.id, 'items', { ...order.items, [product]: e.target.value })}
                                      className="w-16 p-1 text-center border border-gray-200 rounded text-sm"
                                    />
                                  </div>
                                ))}
                              </div>
                            )}
                          </div>
                          <div>
                            <label htmlFor={`additional-items-${order.id}`} className="block text-sm font-medium text-gray-700 mb-2">Prodotti Aggiuntivi</label>
                            <textarea id={`additional-items-${order.id}`} name={`additional-items-${order.id}`} value={order.additional} onChange={(e) => updateSupplierOrder(order.id, 'additional', e.target.value)} placeholder="Inserisci prodotti non in lista..." className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" rows="3" />
                          </div>
                          {supplierData.contact_method === 'email' && <div className="glass-card p-4"><label htmlFor={`email-subject-${order.id}`} className="block text-sm font-medium text-gray-700 mb-2">Oggetto Email</label><input id={`email-subject-${order.id}`} name={`email-subject-${order.id}`} type="text" value={order.email_subject} onChange={(e) => updateSupplierOrder(order.id, 'email_subject', e.target.value)} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Oggetto dell'email" /></div>}
                        </>
                      )}
                    </div>
                  </div>
                );
              })}
              <label htmlFor="add-supplier-select" className="block text-sm font-medium text-gray-700 mb-2">Aggiungi Fornitore</label>
              <select id="add-supplier-select" name="add-supplier-select" onChange={(e) => {
                const supplierId = e.target.value;
                if (supplierId) {
                  setMultiOrders(prev => [...prev, { id: Date.now(), supplier: supplierId, items: {}, additional: '' }]);
                  e.target.value = '';
                }
              }} className="w-full p-3 border border-gray-200 dark:border-gray-700 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100 mb-4">
                <option value="">Aggiungi Fornitore...</option>
                {suppliers.filter(s => !multiOrders.some(o => o.supplier === s.id.toString())).map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}
              </select>
              {multiOrders.some(order => order.supplier && (Object.keys(order.items).length > 0 || order.additional.trim())) && (
                <div className="flex space-x-3">
                  <button onClick={handlePreviewOrder} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium hover:bg-blue-600 transition-colors">Anteprima Ordini</button>
                  <button onClick={() => setShowScheduleModal(true)} className="w-full bg-orange-500 text-white py-3 rounded-lg font-medium hover:bg-orange-600 transition-colors">Programma per dopo</button>
                </div>
              )}
            </div>
          )}
        </div>
        {showConfirm && <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50"><div className="glass-card p-6 max-w-sm w-full max-h-96 overflow-y-auto"><h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">{confirmMessages ? 'Conferma Ordini' : 'Conferma Ordine'}</h3><div className="space-y-4 mb-4">{confirmMessages ? confirmMessages.map((msg, index) => (<div key={index} className="bg-gray-50 p-3 rounded-lg"><h4 className="font-medium text-gray-800 mb-2">{msg.supplier}</h4><pre className="text-sm text-gray-700 whitespace-pre-wrap">{msg.message}</pre></div>)) : <div className="bg-gray-50 p-3 rounded-lg"><pre className="text-sm text-gray-700 whitespace-pre-wrap">{generateOrderMessage()}</pre></div>}</div><div className="flex space-x-3"><button onClick={() => { setShowConfirm(false); setConfirmMessages(null); }} className="flex-1 py-2 px-4 border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-50" disabled={isSubmitting}>Modifica</button><button onClick={sendOrder} disabled={isSubmitting} className="flex-1 py-2 px-4 bg-blue-500 text-white rounded-lg hover:bg-blue-600 disabled:bg-blue-300 flex items-center justify-center space-x-2">{isSubmitting ? <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" /> : <Send size={16} />}<span>{isSubmitting ? 'Invio...' : (confirmMessages ? 'Invia Ordini' : 'Invia')}</span></button></div></div></div>}
        {showTypeModal && (
          <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
            <div className="glass-card p-6 max-w-sm w-full">
              <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Scegli Tipo Ordine</h3>
              <div className="space-y-3">
                <button onClick={() => { setBatchMode(false); setShowTypeModal(false); }} className="w-full py-3 bg-blue-500 text-white rounded-lg font-medium hover:bg-blue-600 transition-colors">Singolo Fornitore</button>
                <button onClick={() => { setBatchMode(true); setShowTypeModal(false); }} className="w-full py-3 bg-purple-500 text-white rounded-lg font-medium hover:bg-purple-600 transition-colors">Più Fornitori</button>
              </div>
            </div>
          </div>
        )}
        {showWizard && wizardOrders.length > 0 && (
          <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
            <div className="glass-card p-6 max-w-sm w-full max-h-96 overflow-y-auto">
              <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Invio Ordine {wizardStep + 1} di {wizardOrders.length}</h3>
              <div className="bg-gray-50 p-3 rounded-lg mb-4">
                <h4 className="font-medium text-gray-800 mb-2">{wizardOrders[wizardStep].supplier?.name || 'Fornitore sconosciuto'}</h4>
                <pre className="text-sm text-gray-700 whitespace-pre-wrap">{wizardOrders[wizardStep].message}</pre>
              </div>
              <div className="flex items-center justify-between space-x-3">
                <button onClick={() => setWizardStep(prev => Math.max(0, prev - 1))} disabled={wizardStep === 0} className="p-2 border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-50"><ChevronLeft size={20} /></button>
                <button onClick={async () => {
                  // Send this order
                  const order = wizardOrders[wizardStep];

                  // Save order to DB
                  try {
                    const orderData = { user_id: user.id, supplier_id: order.supplier.id, order_message: order.message, additional_items: order.additional || null, status: 'sent' };
                    const orderItemsToInsert = Object.entries(order.items).filter(([_, quantity]) => quantity && quantity !== '0').map(([productName, quantity]) => ({ product_name: productName, quantity: parseInt(quantity, 10) || 0 }));
                    const newOrder = await supabaseHelpers.createOrder(orderData, orderItemsToInsert);
                    setNewlyCreatedOrders(prev => [...prev, { ...newOrder, suppliers: order.supplier, order_items: orderItemsToInsert }]);
                  } catch (error) {
                    console.error('Error saving order from wizard:', error);
                    toast.error('Errore durante il salvataggio dell\'ordine.');
                  }

                  const encodedMessage = encodeURIComponent(order.message);
                  let contactLink = '';
                  switch (order.supplier.contact_method) {
                    case 'whatsapp': {
                      const sanitizedContact = order.supplier.contact.replace(/\D/g, '');
                      contactLink = `https://wa.me/${sanitizedContact}?text=${encodedMessage}`;
                      break;
                    }
                    case 'whatsapp_group': {
                      contactLink = `whatsapp://send?text=${encodedMessage}`;
                      break;
                    }
                    case 'email': {
                      contactLink = `mailto:${order.supplier.contact}?subject=${encodeURIComponent(order.email_subject || `Ordine Fornitore - ${order.supplier.name}`)}&body=${encodedMessage}`;
                      break;
                    }
                    case 'sms': {
                      const sanitizedContact = order.supplier.contact.replace(/\D/g, '');
                      contactLink = `sms:${sanitizedContact}?body=${encodedMessage}`;
                      break;
                    }
                    default:
                      break;
                  }
                  openLinkInNewTab(contactLink);
                  if (wizardStep < wizardOrders.length - 1) {
                    setWizardStep(wizardStep + 1);
                  } else {
                    // Finish
                    sessionStorage.removeItem('wizardState');
                    setOrders(prev => [...newlyCreatedOrders, ...prev]);
                    setNewlyCreatedOrders([]);
                    setShowWizard(false);
                    setWizardOrders([]);
                    setWizardStep(0);
                    toast.success('Tutti gli ordini inviati!');
                    setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '' }]);
                    if (onOrderSent) onOrderSent();
                    else setCurrentPage('home');
                  }
                }} className="flex-1 py-2 px-4 bg-blue-500 text-white rounded-lg hover:bg-blue-600">Invia</button>
              </div>
              <p onClick={() => {
                sessionStorage.removeItem('wizardState');
                setShowWizard(false);
                setWizardOrders([]);
                setWizardStep(0);
                setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '' }]);
                if (onOrderSent) onOrderSent();
                else setCurrentPage('home');
              }} className="text-sm text-gray-500 mt-4 text-center cursor-pointer hover:underline">Esci</p>
            </div>
          </div>
        )}
        {showScheduleModal && <ScheduleOrderModal
            onClose={() => setShowScheduleModal(false)}
            batchMode={batchMode}
            supplierId={selectedSupplier}
            orderItems={orderItems}
            additionalItems={additionalItems}
            multiOrders={multiOrders}
            scheduledOrders={scheduledOrders}
            setScheduledOrders={setScheduledOrders}
            onSchedule={() => {
              if (batchMode) {
                setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '' }]);
              } else {
                setSelectedSupplier('');
                setOrderItems({});
                setAdditionalItems('');
              }
              setShowScheduleModal(false);
              setCurrentPage('home');
            }}
          />}
      </div>
    );
  };

  const ScheduleOrderModal = ({ onClose = () => {}, batchMode = false, supplierId = '', orderItems = {}, additionalItems = '', multiOrders = [], onSchedule = () => {}, scheduledOrders = [], setScheduledOrders = () => {} }) => {
    const { setPrefilledData } = usePrefill();
    const [isSubmitting, setIsSubmitting] = useState(false);
    const futureScheduledOrders = batchMode ? scheduledOrders.filter(o => new Date(o.scheduled_at) > new Date()) : scheduledOrders.filter(o => new Date(o.scheduled_at) > new Date() && o.supplier_id === supplierId);

    const linkToScheduledOrder = async (scheduledOrderId) => {
      if (isSubmitting) return;
      setIsSubmitting(true);
      try {
        const existingScheduledOrder = await supabaseHelpers.getScheduledOrderById(scheduledOrderId);

        let existingOrderData = { items: {}, additional_items: '' };
        if (existingScheduledOrder.order_data) {
          try {
            existingOrderData = JSON.parse(existingScheduledOrder.order_data);
          } catch (e) {
            console.error("Failed to parse existing order_data from scheduled order", e);
          }
        }

        const mergedItems = { ...existingOrderData.items };
        Object.entries(orderItems).forEach(([product, quantity]) => {
          const newQuantity = parseInt(quantity, 10) || 0;
          if (newQuantity > 0) {
            mergedItems[product] = (parseInt(mergedItems[product], 10) || 0) + newQuantity;
          } else if (mergedItems[product]) {
            delete mergedItems[product];
          }
        });

        let mergedAdditionalItems = existingOrderData.additional_items;
        if (additionalItems.trim()) {
          mergedAdditionalItems = mergedAdditionalItems ? `${mergedAdditionalItems}\n${additionalItems.trim()}` : additionalItems.trim();
        }

        const updatedOrderData = {
          order_data: JSON.stringify({ items: mergedItems, additional_items: mergedAdditionalItems })
        };

        const updatedOrder = await supabaseHelpers.updateScheduledOrder(scheduledOrderId, updatedOrderData);
        setScheduledOrders(prev => prev.map(o => o.id === scheduledOrderId ? { ...o, ...updatedOrder } : o));

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
        <div className="glass-card p-6 max-w-sm w-full max-h-[80vh] flex flex-col">
          <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Associa a un ordine programmato</h3>
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
                  <p className="text-xs text-purple-700 dark:text-purple-300">{new Date(order.scheduled_at).toLocaleString('it-IT', { dateStyle: 'short', timeStyle: 'short' })}</p>
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
    const [newSupplier, setNewSupplier] = useState({ name: '', contact_method: 'whatsapp', contact: '', products: [], message_template: 'Buongiorno, vorremmo ordinare i seguenti prodotti:', email_subject: '' });
    const [newProduct, setNewProduct] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);

    const addProduct = () => { if (newProduct.trim()) { setNewSupplier(prev => ({ ...prev, products: [...prev.products, newProduct.trim()] })); setNewProduct(''); } };
    const removeProduct = (index) => { setNewSupplier(prev => ({ ...prev, products: prev.products.filter((_, i) => i !== index) })); };

    const saveSupplier = async () => {
      if (!newSupplier.name || !newSupplier.contact) { toast.error('Nome e contatto sono obbligatori'); return; }
      if (!user) { toast.error('Sessione utente non valida. Effettua nuovamente il login.'); setCurrentPage('auth'); return; }
      setIsSubmitting(true);
      try {
        const supplierData = { user_id: user.id, name: newSupplier.name, contact_method: newSupplier.contact_method, contact: newSupplier.contact, message_template: newSupplier.message_template, email_subject: newSupplier.email_subject };
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
      setNewSupplier({ name: supplier.name, contact_method: supplier.contact_method, contact: supplier.contact, products: supplier.products || [], message_template: supplier.message_template, email_subject: supplier.email_subject || '' });
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
      <div className="min-h-screen app-background">
        <Header title="Gestione Fornitori" onBack={() => setCurrentPage('home')} />
        <div className="max-w-sm mx-auto px-6 py-6">
          {!isAdding ? (
            <>
              <button onClick={() => setIsAdding(true)} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium mb-6 flex items-center justify-center space-x-2 hover:bg-blue-600 transition-colors"><Plus size={20} /><span>Aggiungi Fornitore</span></button>
              <div className="space-y-4">
                {suppliers.map(supplier => (
                  <div key={supplier.id} className="glass-card p-4">
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
              <div className="glass-card p-4"><label htmlFor="supplier-name" className="block text-sm font-medium text-gray-700 mb-2">Nome Fornitore *</label><input id="supplier-name" name="supplier-name" type="text" value={newSupplier.name} onChange={(e) => setNewSupplier(prev => ({ ...prev, name: e.target.value }))} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Es. Fornitore Verdure Bio" /></div>
              <div className="glass-card p-4"><label htmlFor="contact-method" className="block text-sm font-medium text-gray-700 mb-2">Metodo di Invio</label><select id="contact-method" name="contact-method" value={newSupplier.contact_method} onChange={(e) => setNewSupplier(prev => ({ ...prev, contact_method: e.target.value }))} className="w-full p-3 border border-gray-200 dark:border-gray-700 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100"><option value="whatsapp">WhatsApp</option><option value="whatsapp_group">Gruppo WhatsApp</option><option value="email">Email</option><option value="sms">Messaggio</option></select></div>
              <div className="glass-card p-4"><label htmlFor="contact" className="block text-sm font-medium text-gray-700 mb-2">Contatto *</label><input id="contact" name="contact" type="text" value={newSupplier.contact} onChange={(e) => setNewSupplier(prev => ({ ...prev, contact: e.target.value }))} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder={newSupplier.contact_method === 'whatsapp' || newSupplier.contact_method === 'sms' ? "+39 123 456 7890" : "email@fornitore.com"} /></div>
              {newSupplier.contact_method === 'email' && <div className="glass-card p-4"><label htmlFor="email-subject" className="block text-sm font-medium text-gray-700 mb-2">Oggetto Email</label><input id="email-subject" name="email-subject" type="text" value={newSupplier.email_subject} onChange={(e) => setNewSupplier(prev => ({ ...prev, email_subject: e.target.value }))} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Oggetto dell'email" /></div>}
              <div className="glass-card p-4">
                <label className="block text-sm font-medium text-gray-700 mb-2">Prodotti</label>
                <label htmlFor="new-product" className="block text-sm font-medium text-gray-700 mb-2">Nuovo Prodotto</label>
                <div className="flex space-x-2 mb-3"><input id="new-product" name="new-product" type="text" value={newProduct} onChange={(e) => setNewProduct(e.target.value)} className="flex-1 p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Aggiungi prodotto..." onKeyPress={(e) => e.key === 'Enter' && addProduct()} /><button onClick={addProduct} className="px-4 py-3 bg-blue-500 text-white rounded-lg hover:bg-blue-600"><Plus size={16} /></button></div>
                <div className="space-y-2">{newSupplier.products.map((product, index) => <div key={index} className="flex items-center justify-between p-2 bg-gray-50 rounded-lg"><span className="text-sm text-gray-700">{product}</span><button onClick={() => removeProduct(index)} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button></div>)}</div>
              </div>
              <div className="glass-card p-4"><label htmlFor="message-template" className="block text-sm font-medium text-gray-700 mb-2">Messaggio Predefinito</label><textarea id="message-template" name="message-template" value={newSupplier.message_template} onChange={(e) => setNewSupplier(prev => ({ ...prev, message_template: e.target.value }))} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" rows="3" placeholder="Messaggio che precederà ogni ordine..." /></div>
              <div className="flex space-x-3"><button onClick={() => { setIsAdding(false); setEditingSupplier(null); setNewSupplier({ name: '', contact_method: 'whatsapp', contact: '', products: [], message_template: 'Buongiorno, vorremmo ordinare i seguenti prodotti:' }); }} className="flex-1 py-3 border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-50" disabled={isSubmitting}>Annulla</button><button onClick={saveSupplier} disabled={isSubmitting} className="flex-1 py-3 bg-blue-500 text-white rounded-lg hover:bg-blue-600 disabled:bg-blue-300 flex items-center justify-center space-x-2">{isSubmitting ? <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" /> : <Check size={16} />}<span>{isSubmitting ? 'Salvando...' : 'Salva'}</span></button></div>
            </div>
          )}
        </div>
      </div>
    );
  };

  
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

const groupOrdersByScheduledAt = (orders) => {
    return orders.reduce((acc, order) => {
        const key = order.scheduled_at;
        if (!acc[key]) {
            acc[key] = [];
        }
        acc[key].push(order);
        return acc;
    }, {});
};

const SchedulePage = ({ batchMode, setBatchMode, multiOrders, setMultiOrders, setCurrentPage, suppliers, scheduledOrders, setScheduledOrders, setWizardOrders, showWizard, setShowWizard, wizardOrders, wizardStep, setWizardStep }) => {
    const { prefilledData, setPrefilledData } = usePrefill();
    const getRoundedTime = (date = new Date()) => { const minutes = date.getMinutes(); const roundedMinutes = Math.ceil(minutes / 15) * 15; date.setMinutes(roundedMinutes); return date.toTimeString().slice(0, 5); };
    const [selectedDate, setSelectedDate] = useState(new Date().toISOString().split('T')[0]);
    const [selectedTime, setSelectedTime] = useState(getRoundedTime());
    const [selectedSupplier, setSelectedSupplier] = useState('');
    const [orderItems, setOrderItems] = useState({});
    const [additionalItems, setAdditionalItems] = useState('');
    const [emailSubject, setEmailSubject] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [editingOrder, setEditingOrder] = useState(null);
    const [showTypeModal, setShowTypeModal] = useState(false);
    const timeSlots = [];
    for (let h = 0; h < 24; h++) { for (let m = 0; m < 60; m += 15) { const hour = h.toString().padStart(2, '0'); const minute = m.toString().padStart(2, '0'); timeSlots.push(`${hour}:${minute}`); } }

    const now = new Date();
    const fortyEightHoursAgo = new Date(now.getTime() - 48 * 60 * 60 * 1000);
    const readyToSendOrders = scheduledOrders.filter(o => {
        const scheduledAt = new Date(o.scheduled_at);
        return scheduledAt <= now && scheduledAt >= fortyEightHoursAgo;
    }).sort((a,b) => new Date(a.scheduled_at) - new Date(b.scheduled_at));

    const futureOrders = scheduledOrders.filter(o => new Date(o.scheduled_at) > now).sort((a,b) => new Date(a.scheduled_at) - new Date(b.scheduled_at));

    const groupedReadyToSendOrders = groupOrdersByScheduledAt(readyToSendOrders);
    const groupedFutureOrders = groupOrdersByScheduledAt(futureOrders);

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
      if (!selectedDate) { toast.error('Seleziona data'); return; }
      if (!batchMode && !selectedSupplier) { toast.error('Seleziona fornitore'); return; }
      const scheduledDateTime = new Date(`${selectedDate}T${selectedTime}`);
      if (scheduledDateTime < new Date() && !editingOrder) { toast.error('Non puoi programmare un ordine nel passato.'); return; }
      setIsSubmitting(true);
      try {
        if (batchMode) {
          const validOrders = multiOrders.filter(order => order.supplier && Object.keys(order.items).some(key => order.items[key] && order.items[key] !== '0'));
          if (validOrders.length === 0) { toast.error('Nessun ordine valido da programmare'); return; }
          for (const order of validOrders) {
            const orderData = {
              user_id: user.id,
              supplier_id: order.supplier,
              scheduled_at: scheduledDateTime.toISOString(),
              order_data: JSON.stringify({ items: order.items, additional_items: order.additional })
            };
            const newScheduledOrder = await supabaseHelpers.createScheduledOrder(orderData);
            setScheduledOrders(prev => [...prev, { ...newScheduledOrder, suppliers: suppliers.find(s => s.id.toString() === order.supplier) }]);
          }
          toast.success(`${validOrders.length} ordini programmati con successo`);
        } else {
          const orderData = {
            user_id: user.id,
            supplier_id: selectedSupplier,
            scheduled_at: scheduledDateTime.toISOString(),
            order_data: JSON.stringify({ items: orderItems, additional_items: additionalItems, email_subject: emailSubject })
          };

          if (editingOrder) {
            const updatedOrder = await supabaseHelpers.updateScheduledOrder(editingOrder.id, orderData);
            setScheduledOrders(prev => prev.map(o => o.id === editingOrder.id ? { ...o, ...updatedOrder } : o));
            toast.success('Ordine programmato aggiornato con successo');
          } else {
            const newScheduledOrder = await supabaseHelpers.createScheduledOrder(orderData);
            setScheduledOrders(prev => [...prev, { ...newScheduledOrder, suppliers: suppliers.find(s => s.id.toString() === selectedSupplier) }]);
            toast.success(`Ordine programmato creato con successo`);
          }
        }

        setEditingOrder(null);
        setSelectedDate(new Date().toISOString().split('T')[0]);
        setSelectedTime(getRoundedTime());
        if (!batchMode) {
          setSelectedSupplier('');
          setOrderItems({});
          setAdditionalItems('');
        }
        if (!editingOrder) {
          setTimeout(() => { if (!window.confirm('Ordini programmati con successo! Vuoi programmarne altri?')) setCurrentPage('home'); }, 1000);
        }
      } catch (error) {
        console.error('Error saving scheduled order:', error);
        toast.error('Errore durante il salvataggio degli ordini programmati');
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

    const handleDeleteBatch = async (ordersToDelete) => {
      if (!window.confirm(`Sei sicuro di voler eliminare questo lotto di ${ordersToDelete.length} ordini programmati? Questa azione è irreversibile.`)) return;
      try {
        for (const order of ordersToDelete) {
          await supabaseHelpers.deleteScheduledOrder(order.id);
        }
        setScheduledOrders(prev => prev.filter(order => !ordersToDelete.some(deletedOrder => deletedOrder.id === order.id)));
        toast.success(`${ordersToDelete.length} ordini programmati eliminati`);
      } catch (error) {
        console.error('Error deleting scheduled order batch:', error);
        toast.error("Errore durante l'eliminazione del lotto di ordini");
      }
    };

    const handleSendBatch = (orders) => {
        const ordersForWizard = orders.map(order => {
            const supplier = suppliers.find(s => s.id === order.supplier_id);
            if (!supplier) {
                console.warn(`Supplier with ID ${order.supplier_id} not found for scheduled order. Skipping.`);
                return null;
            }
            let orderItems = {};
            let additionalItems = '';
            let emailSubject = '';
            if (order.order_data) {
                try {
                    const parsedData = JSON.parse(order.order_data);
                    orderItems = parsedData.items || {};
                    additionalItems = parsedData.additional_items || '';
                    emailSubject = parsedData.email_subject || '';
                } catch (e) {
                    console.error("Failed to parse order_data for scheduled order", e);
                }
            }
            let message = supplier.message_template + `\n\n`;
            Object.entries(orderItems).forEach(([product, quantity]) => {
                if (quantity && quantity !== '0') message += `• ${product}: ${quantity}\n`;
            });
            if (additionalItems.trim()) message += '\nProdotti aggiuntivi:\n' + additionalItems + '\n';
            message += '\nGrazie!';

            return { ...order, supplier, items: orderItems, additional: additionalItems, message, emailSubject };
        }).filter(Boolean);

        if (ordersForWizard.length === 0) {
            toast.error('Nessun ordine programmato valido con fornitore trovato da inviare.');
            return;
        }

        setWizardOrders(ordersForWizard);
        setWizardStep(0);
        setShowWizard(true);
        setCurrentPage('createOrder');
    }

    const selectedSupplierData = suppliers.find(s => s.id.toString() === selectedSupplier);

    useEffect(() => {
      if (selectedSupplierData) {
        setEmailSubject(selectedSupplierData.email_subject || '');
      }
    }, [selectedSupplierData]);

    return (
      <div className="min-h-screen app-background">
        <Header title="Programma Ordini" onBack={() => setCurrentPage('home')} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-6">
          <div className="glass-card p-4">
            <div className="flex justify-between items-center mb-4">
              <h3 className="font-medium text-gray-900 dark:text-gray-100">Tipo Ordine</h3>
              <button onClick={() => setShowTypeModal(true)} className={`px-4 py-2 rounded-lg text-sm font-medium ${batchMode ? 'bg-purple-500 text-white' : 'bg-gray-200 text-gray-700'} transition-colors`}>
                {batchMode ? 'Più Fornitori' : 'Singolo Fornitore'}
              </button>
            </div>
          </div>
          <div className="glass-card p-4"><label htmlFor="schedule-date" className="block text-sm font-medium text-gray-700 mb-2">Data Programmazione</label><input id="schedule-date" name="schedule-date" type="date" value={selectedDate} onChange={(e) => setSelectedDate(e.target.value)} min={new Date().toISOString().split('T')[0]} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" /></div>
          <div className="glass-card p-4"><label htmlFor="schedule-time" className="block text-sm font-medium text-gray-700 mb-2">Ora Invio</label><select id="schedule-time" name="schedule-time" value={selectedTime} onChange={(e) => setSelectedTime(e.target.value)} className="w-full p-3 border border-gray-200 dark:border-gray-700 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100">{timeSlots.map(time => <option key={time} value={time}>{time}</option>)}</select></div>
          {!batchMode && <div className="glass-card p-4"><label htmlFor="schedule-supplier" className="block text-sm font-medium text-gray-700 mb-2">Seleziona Fornitore</label><select id="schedule-supplier" name="schedule-supplier" value={selectedSupplier} onChange={(e) => setSelectedSupplier(e.target.value)} className="w-full p-3 border border-gray-200 dark:border-gray-700 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100"><option value="">Scegli un fornitore...</option>{suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}</select></div>}
          {selectedSupplierData && selectedSupplierData.products && <div className="glass-card p-4"><h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Prodotti</h3><div className="space-y-3">{selectedSupplierData.products.map(product => <div key={product} className="flex items-center justify-between p-2 border border-gray-100 rounded-lg"><label className="flex items-center space-x-3 flex-1"><input type="checkbox" id={`schedule-product-checkbox-${product}`} name={`schedule-product-checkbox-${product}`} checked={!!(orderItems[product] && orderItems[product] !== '0')} onChange={(e) => { if (!e.target.checked) setOrderItems(prev => ({ ...prev, [product]: '0' })); }} className="rounded border-gray-300 dark:border-gray-600 text-blue-600 dark:text-blue-400 focus:ring-blue-500 accent-blue-600 dark:accent-blue-400 transition-transform active:scale-95" /><span className="text-sm text-gray-700">{product}</span></label><input type="tel" inputMode="decimal" id={`scheduled-quantity-${product}`} name={`scheduled-quantity-${product}`} placeholder="Qt." value={orderItems[product] || ''} onChange={(e) => setOrderItems(prev => ({ ...prev, [product]: e.target.value }))} className="w-16 p-1 text-center border border-gray-200 rounded text-sm" /></div>)}</div></div>}
          {selectedSupplierData && selectedSupplierData.contact_method === 'email' && <div className="glass-card p-4"><label htmlFor="schedule-email-subject" className="block text-sm font-medium text-gray-700 mb-2">Oggetto Email</label><input id="schedule-email-subject" name="schedule-email-subject" type="text" value={emailSubject} onChange={(e) => setEmailSubject(e.target.value)} className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Oggetto dell'email" /></div>}
          {selectedSupplierData && <div className="glass-card p-4"><label htmlFor="schedule-additional-items" className="block text-sm font-medium text-gray-700 mb-2">Prodotti Aggiuntivi</label><textarea id="schedule-additional-items" name="schedule-additional-items" value={additionalItems} onChange={(e) => setAdditionalItems(e.target.value)} placeholder="Inserisci prodotti non in lista..." className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" rows="3" /></div>}
          
          {scheduledOrders.length > 0 && !batchMode ? (<div className="space-y-4">
            {Object.keys(groupedReadyToSendOrders).length > 0 && (
                <details className="glass-card group" open>
                    <summary className="font-medium text-green-800 dark:text-green-300 bg-green-50 dark:bg-green-900/30 rounded-md p-4 cursor-pointer flex justify-between items-center list-none">
                        <span>Pronti per l'invio ({readyToSendOrders.length})</span>
                        <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" />
                    </summary>
                    <div className="p-4 space-y-3 border-t border-gray-100">
                        {Object.values(groupedReadyToSendOrders).map((orders, groupIndex) => {
                            const isBatch = orders.length > 1;
                            const firstOrder = orders[0];
                            const scheduledAt = new Date(firstOrder.scheduled_at);
                            return (
                                <details key={groupIndex} className="bg-green-50/50 dark:bg-green-900/20 rounded-lg">
                                    <summary className="font-medium text-sm p-3 cursor-pointer flex justify-between items-center list-none">
                                        {isBatch ? (
                                            <div className="w-full flex justify-between items-center">
                                                <span>Lotto di {orders.length} ordini per le {scheduledAt.toLocaleTimeString()}</span>
                                                <div className="flex items-center space-x-2">
                                                    <button onClick={() => handleSendBatch(orders)} className="p-1 text-green-500 hover:bg-green-100 rounded"><Send size={14} /></button>
                                                    <button onClick={() => handleDeleteBatch(orders)} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button>
                                                </div>
                                            </div>
                                        ) : (
                                            <span>Ordine per {suppliers.find(s => s.id === firstOrder.supplier_id)?.name || 'sconosciuto'} alle {scheduledAt.toLocaleTimeString()}</span>
                                        )}
                                        <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" />
                                    </summary>
                                    <div className="p-3 border-t">
                                        {orders.map(order => {
                                            const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers;
                                            return (
                                                <div key={order.id} className="w-full text-left p-3 rounded-lg bg-white dark:bg-green-900/30 mb-2">
                                                    <div className="flex justify-between items-center">
                                                        <div>
                                                            <p className="font-medium text-sm text-green-900 dark:text-green-200">{supplier?.name || 'Fornitore eliminato'}</p>
                                                        </div>
                                                        <div className="flex items-center space-x-2">
                                                            <button onClick={() => { setPrefilledData({ type: 'order', data: order, immediateSend: true }); setCurrentPage('createOrder'); }} className="p-1 text-green-500 hover:bg-green-100 rounded"><Send size={14} /></button>
                                                            <button onClick={() => setEditingOrder(order)} className="p-1 text-blue-500 hover:bg-blue-100 rounded"><Edit3 size={14} /></button>
                                                            <button onClick={(e) => { e.stopPropagation(); deleteScheduledOrder(order.id); }} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button>
                                                        </div>
                                                    </div>
                                                    <ScheduledOrderPreview order={order} suppliers={suppliers} />
                                                </div>
                                            )
                                        })}
                                    </div>
                                </details>
                            )
                        })}
                    </div>
                </details>
            )}

            {Object.keys(groupedFutureOrders).length > 0 && (
                <details className="glass-card group">
                    <summary className="font-medium text-purple-800 dark:text-purple-300 bg-purple-50 dark:bg-purple-900/30 rounded-md p-4 cursor-pointer flex justify-between items-center list-none">
                        <span>Ordini Programmati ({futureOrders.length})</span>
                        <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" />
                    </summary>
                    <div className="p-4 space-y-3 border-t border-gray-100">
                        {Object.values(groupedFutureOrders).map((orders, groupIndex) => {
                            const isBatch = orders.length > 1;
                            const firstOrder = orders[0];
                            const scheduledAt = new Date(firstOrder.scheduled_at);
                            return (
                                <details key={groupIndex} className="bg-purple-50/50 dark:bg-purple-900/20 rounded-lg">
                                    <summary className="font-medium text-sm p-3 cursor-pointer flex justify-between items-center list-none">
                                        {isBatch ? (
                                            <div className="w-full flex justify-between items-center">
                                                <span>Lotto di {orders.length} ordini per le {scheduledAt.toLocaleTimeString()}</span>
                                                <div className="flex items-center space-x-2">
                                                    <button onClick={() => handleSendBatch(orders)} className="p-1 text-green-500 hover:bg-green-100 rounded"><Send size={14} /></button>
                                                    <button onClick={() => handleDeleteBatch(orders)} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button>
                                                </div>
                                            </div>
                                        ) : (
                                            <span>Ordine per {suppliers.find(s => s.id === firstOrder.supplier_id)?.name || 'sconosciuto'} alle {scheduledAt.toLocaleTimeString()}</span>
                                        )}
                                        <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" />
                                    </summary>
                                    <div className="p-3 border-t">
                                        {orders.map(order => {
                                            const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers;
                                            return (
                                                <div key={order.id} className={`w-full text-left p-3 rounded-lg ${editingOrder?.id === order.id ? 'bg-purple-200' : 'bg-white'} dark:bg-purple-900/30 mb-2`}>
                                                    <div className="flex justify-between items-center">
                                                        <div>
                                                            <p className="font-medium text-sm text-purple-900">{supplier?.name || 'Fornitore eliminato'}</p>
                                                        </div>
                                                        <div className="flex items-center space-x-2">
                                                            <button onClick={() => { setPrefilledData({ type: 'order', data: order, immediateSend: true }); setCurrentPage('createOrder'); }} className="p-1 text-green-500 hover:bg-green-100 rounded"><Send size={14} /></button>
                                                            <button onClick={() => setEditingOrder(order)} className="p-1 text-blue-500 hover:bg-blue-100 rounded"><Edit3 size={14} /></button>
                                                            <button onClick={(e) => { e.stopPropagation(); deleteScheduledOrder(order.id); }} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button>
                                                        </div>
                                                    </div>
                                                    <ScheduledOrderPreview order={order} suppliers={suppliers} />
                                                </div>
                                            )
                                        })}
                                    </div>
                                </details>
                            )
                        })}
                    </div>
                </details>
            )}
        </div>
        ) : (
                <div className="glass-card p-4">
                    <div className="text-center py-12">
                        <Calendar size={48} className="mx-auto text-gray-300 mb-4" />
                        <p className="text-gray-500">Nessun ordine programmato.</p>
                    </div>
                </div>
            )}

           <div className="flex space-x-3">
            {editingOrder && <button onClick={handleCancelEdit} className="w-full py-3 border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-50">Annulla</button>}
            {selectedDate && (batchMode || (selectedSupplierData && (Object.keys(orderItems).some(key => orderItems[key] && orderItems[key] !== '0') || additionalItems.trim()))) && <button onClick={scheduleOrder} disabled={isSubmitting} className="w-full bg-purple-500 text-white py-3 rounded-lg font-medium hover:bg-purple-600 transition-colors flex items-center justify-center space-x-2 disabled:bg-purple-300">{isSubmitting ? <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" /> : <Calendar size={20} />}<span>{isSubmitting ? (editingOrder ? 'Aggiornando...' : (batchMode ? 'Programmando...' : 'Programmando...')) : (editingOrder ? 'Aggiorna Ordine' : (batchMode ? 'Programma Ordini' : 'Programma Ordine'))}</span></button>}
          </div>
        </div>
        {showTypeModal && (
          <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
            <div className="glass-card p-6 max-w-sm w-full">
              <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Scegli Tipo Ordine</h3>
              <div className="space-y-3">
                <button onClick={() => { setBatchMode(false); setShowTypeModal(false); }} className="w-full py-3 bg-blue-500 text-white rounded-lg font-medium hover:bg-blue-600 transition-colors">Singolo Fornitore</button>
                <button onClick={() => { setBatchMode(true); setShowTypeModal(false); }} className="w-full py-3 bg-purple-500 text-white rounded-lg font-medium hover:bg-purple-600 transition-colors">Più Fornitori</button>
              </div>
            </div>
          </div>
        )}
      </div>
    );
}

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

    return (
      <div className="min-h-screen app-background">
        <Header title="Cronologia Ordini" onBack={() => setCurrentPage('home')} />
        <div className="max-w-sm mx-auto px-6 py-6">
          <div className="flex justify-between items-center mb-6">
            <button onClick={() => setShowFilters(!showFilters)} className="flex items-center space-x-2 px-4 py-2 bg-white dark:bg-gray-900 border border-gray-200 dark:border-gray-700 rounded-lg text-sm text-gray-700 dark:text-gray-100 hover:bg-gray-50 dark:hover:bg-gray-800"><Filter size={16} className="text-gray-700 dark:text-gray-200" /><span>Filtri</span>{Object.values(filters).some(v => v !== '') && <span className="bg-blue-500 text-white text-xs px-2 py-1 rounded-full">{Object.values(filters).filter(v => v !== '').length}</span>}</button>
            <button onClick={exportFilteredData} className="flex items-center space-x-2 px-4 py-2 bg-green-500 text-white rounded-lg text-sm hover:bg-green-600 active:scale-95 transition-transform"><Download size={16} /><span>Esporta</span></button>
          </div>
          {showFilters && <div className="glass-card p-5 mt-6 mb-7 pb-0.5 space-y-4"><div className="flex justify-between items-center"><h3 className="font-medium text-gray-900">Filtri</h3><button onClick={clearFilters} className="text-sm text-blue-500 dark:text-blue-400 hover:underline">Pulisci</button></div><div className="grid grid-cols-2 gap-3"><div><label htmlFor="history-date-from" className="block text-xs font-medium text-gray-700 mb-1">Da Data</label><input id="history-date-from" name="history-date-from" type="date" value={filters.dateFrom} onChange={(e) => setFilters(prev => ({ ...prev, dateFrom: e.target.value }))} className="w-full p-3 text-sm rounded-lg border border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100 focus:ring-2 focus:ring-blue-500 focus:border-transparent" /></div><div><label htmlFor="history-date-to" className="block text-xs font-medium text-gray-700 mb-1">A Data</label><input id="history-date-to" name="history-date-to" type="date" value={filters.dateTo} onChange={(e) => setFilters(prev => ({ ...prev, dateTo: e.target.value }))} className="w-full p-3 text-sm rounded-lg border border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100 focus:ring-2 focus:ring-blue-500 focus:border-transparent" /></div></div><div><label htmlFor="history-supplier" className="block text-xs font-medium text-gray-700 mb-1">Fornitore</label><select id="history-supplier" name="history-supplier" value={filters.supplier} onChange={(e) => setFilters(prev => ({ ...prev, supplier: e.target.value }))} className="w-full p-3 text-sm rounded-lg border border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100 focus:ring-2 focus:ring-blue-500 focus:border-transparent"><option value="">Tutti i fornitori</option>{suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}</select></div><div><label htmlFor="history-status" className="block text-xs font-medium text-gray-700 mb-1">Stato</label><select id="history-status" name="history-status" value={filters.status} onChange={(e) => setFilters(prev => ({ ...prev, status: e.target.value }))} className="w-full p-3 text-sm rounded-lg border border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100 focus:ring-2 focus:ring-blue-500 focus:border-transparent"><option value="">Tutti gli stati</option><option value="sent">Inviato</option><option value="confirmed">Confermato</option><option value="delivered">Consegnato</option></select></div></div>} 
          <div className="flex justify-between items-center mb-4"><p className="text-sm text-gray-600">{filteredOrders.length} {filteredOrders.length === 1 ? 'ordine trovato' : 'ordini trovati'}</p></div>
          {filteredOrders.length === 0 ? <div className="text-center py-12"><History size={48} className="mx-auto text-gray-300 dark:text-gray-600 mb-4" /><p className="text-gray-500 mb-2">{orders.length === 0 ? 'Nessun ordine inviato ancora' : 'Nessun ordine trovato con questi filtri'}</p>{orders.length === 0 && <button onClick={() => setCurrentPage('createOrder')} className="text-blue-500 hover:text-blue-600 font-medium">Crea il primo ordine</button>}</div> : 
          <div className="space-y-4">
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
          </div>} 
        </div>
      </div>
    );
  };

  const AnalyticsDashboard = () => {
    const [filters, setFilters] = useState({
      dateFrom: '',
      dateTo: '',
      supplierId: '',
      productName: '',
    });
    const [productSearchTerm, setProductSearchTerm] = useState('');
    const [productFilterSupplierId, setProductFilterSupplierId] = useState(''); // New state for supplier filter in product list
    const [productSortOrder, setProductSortOrder] = useState('name-asc'); // New state for sorting: 'name-asc', 'name-desc', 'quantity-desc'
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
    // eslint-disable-next-line react-hooks/exhaustive-deps
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
    // eslint-disable-next-line react-hooks/exhaustive-deps
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
    // eslint-disable-next-line react-hooks/exhaustive-deps
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
    // eslint-disable-next-line react-hooks/exhaustive-deps
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
        <Header title="Dashboard Analytics" onBack={() => setCurrentPage('home')} />
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
                  <input id="analytics-date-from" name="analytics-date-from" type="date" value={filters.dateFrom} onChange={(e) => setFilters(prev => ({ ...prev, dateFrom: e.target.value }))} className="w-full p-3 text-sm rounded-lg border border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100 focus:ring-2 focus:ring-blue-500 focus:border-transparent" />
                </div>
                <div>
                  <label htmlFor="analytics-date-to" className="block text-xs font-medium text-gray-700 mb-1">A Data</label>
                  <input id="analytics-date-to" name="analytics-date-to" type="date" value={filters.dateTo} onChange={(e) => setFilters(prev => ({ ...prev, dateTo: e.target.value }))} className="w-full p-3 text-sm rounded-lg border border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100 focus:ring-2 focus:ring-blue-500 focus:border-transparent" />
                </div>
              </div>
              <div>
                <label htmlFor="analytics-supplier" className="block text-xs font-medium text-gray-700 mb-1">Fornitore</label>
                <select id="analytics-supplier" name="analytics-supplier" value={filters.supplierId} onChange={(e) => setFilters(prev => ({ ...prev, supplierId: e.target.value }))} className="w-full p-3 text-sm rounded-lg border border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100 focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                  <option value="">Tutti i fornitori</option>
                  {suppliers.map(supplier => <option key={supplier.id} value={supplier.id}>{supplier.name}</option>)}
                </select>
              </div>
              <div>
                <label htmlFor="analytics-product" className="block text-xs font-medium text-gray-700 mb-1">Prodotto</label>
                <input id="analytics-product" name="analytics-product" type="text" value={filters.productName} onChange={(e) => setFilters(prev => ({ ...prev, productName: e.target.value }))} className="w-full p-3 text-sm rounded-lg border border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100 focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Cerca prodotto..." />
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
            <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Prodotti più Ordinati (Quantit��)</h3>
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
                      className="w-full p-3 text-sm rounded-lg border border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
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
                      className="w-full p-3 text-sm rounded-lg border border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
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
                        setCurrentPage('productHistory');
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


          
          <div className="glass-card p-4"><h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Attività Recente</h3>{filteredOrders.slice(0, 3).map(order => { const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers; return <div key={order.id} className="flex items-center justify-between py-2 border-b border-gray-100 last:border-b-0"><div><p className="text-sm font-medium text-gray-900">{supplier?.name || 'Fornitore eliminato'}</p><p className="text-xs text-gray-500">{new Date(order.sent_at || order.created_at).toLocaleDateString('it-IT')}</p></div><span className="px-2 py-1 bg-green-100 dark:bg-green-900/30 text-green-800 dark:text-green-300 text-xs rounded-full">Inviato</span></div>; })}
          </div>
        </div>
      </div>
    );
  };

  const ProductHistoryPage = () => {
    const productOrders = useMemo(() => {
      if (!selectedProductForHistory) return [];
      return orders.filter(order =>
        order.order_items && order.order_items.some(item => item.product_name === selectedProductForHistory)
      ).sort((a, b) => new Date(b.sent_at || b.created_at) - new Date(a.sent_at || a.created_at));
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [orders, selectedProductForHistory]);

    return (
      <div className="min-h-screen app-background">
        <Header title={`Storico Ordini per ${selectedProductForHistory}`} onBack={() => setCurrentPage('analytics')} />
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
  };

  const SettingsPage = () => {
    useEffect(() => {
      const isIos = () => { const userAgent = window.navigator.userAgent.toLowerCase(); return /iphone|ipad|ipod/.test(userAgent); };
      const isInStandaloneMode = () => ('standalone' in window.navigator) && (window.navigator.standalone);
      if (isIos() && !isInStandaloneMode()) {
        toast((t) => <div className="flex flex-col items-center"><span className="text-center">Per abilitare le notifiche, aggiungi questa app alla tua schermata principale: tocca l'icona di condivisione e poi "Aggiungi a Home".</span><button onClick={() => toast.dismiss(t.id)} className="mt-2 px-4 py-2 bg-blue-500 text-white rounded-lg">Ok</button></div>, { duration: 6000 });
      }
    }, []);

    const handleLogout = async () => { 
      setIsAdminAuthenticated(false); // Clear admin auth on logout
      await signOut(); 
      toast.success('Logout effettuato'); 
      setCurrentPage('home'); 
    };

    const [isPushEnabled, setIsPushEnabled] = useState(false);

    useEffect(() => {
      const checkSubscription = async () => {
        if (!('serviceWorker' in navigator) || !('PushManager' in window)) {
          setIsPushEnabled(false);
          return;
        }
        const registration = await navigator.serviceWorker.ready;
        const subscription = await registration.pushManager.getSubscription();
        setIsPushEnabled(!!subscription);
      };
      checkSubscription();
    }, []);

    const handleTogglePush = async (enable) => {
      if (!('serviceWorker' in navigator) || !('PushManager' in window)) {
        toast.error('Le notifiche push non sono supportate da questo browser.');
        return;
      }

      try {
        const registration = await navigator.serviceWorker.ready;

        if (enable) {
          // Enable push notifications
          const permission = await window.Notification.requestPermission();
          if (permission !== 'granted') {
            toast.error('Permesso per le notifiche non concesso.');
            return;
          }
          const vapidPublicKey = process.env.REACT_APP_VAPID_PUBLIC_KEY;
          if (!vapidPublicKey) {
            console.error('VAPID public key not found.');
            toast.error('Errore di configurazione: chiave pubblica non trovata.');
            return;
          }
          const subscription = await registration.pushManager.subscribe({ userVisibleOnly: true, applicationServerKey: vapidPublicKey });
          await supabaseHelpers.updateUserProfile(user.id, { push_subscription: subscription });
          setIsPushEnabled(true);
          toast.success('Notifiche push abilitate con successo!');
        } else {
          // Disable push notifications
          const subscription = await registration.pushManager.getSubscription();
          if (subscription) {
            await subscription.unsubscribe();
            await supabaseHelpers.updateUserProfile(user.id, { push_subscription: null });
            setIsPushEnabled(false);
            toast.success('Notifiche push disabilitate con successo!');
          } else {
            toast.info('Le notifiche push non sono attive.');
          }
        }
      } catch (error) {
        console.error('Error toggling push notifications:', error);
        toast.error('Impossibile modificare lo stato delle notifiche push.');
      }
    };

    return (
      <div className="min-h-screen app-background">
        <Header title="Impostazioni" onBack={() => setCurrentPage('home')} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-4">
          <button onClick={() => setCurrentPage('userProfile')} className="w-full glass-card p-4 text-left hover:shadow-md transition-all">
            <div className="flex items-center space-x-4">
              <div className="w-12 h-12 bg-gray-200 rounded-full flex items-center justify-center"><User size={24} className="text-gray-500" /></div>
              <div>
                <p className="font-medium text-gray-900">Profilo Utente</p>
                <p className="text-sm text-gray-500">Visualizza e modifica i tuoi dati</p>
              </div>
              <ChevronRight size={20} className="text-gray-300 ml-auto" />
            </div>
          </button>

          {profile?.is_admin && (
            <button onClick={() => setCurrentPage('adminAuth')} className="w-full bg-yellow-400 rounded-xl p-4 shadow-sm text-left hover:shadow-md transition-all">
              <div className="flex items-center space-x-4">
                <div>
                  <p className="font-medium text-yellow-900">Pannello Admin</p>
                  <p className="text-sm text-yellow-700">Gestisci utenti e approvazioni</p>
                </div>
                <ChevronRight size={20} className="text-yellow-500 ml-auto" />
              </div>
            </button>
          )}

          <div className="glass-card p-4 flex items-center justify-between">
            <div>
              <p className="font-medium text-gray-900 dark:text-gray-100">Tema scuro</p>
              <p className="text-xs text-gray-500 dark:text-gray-400">Interfaccia ottimizzata per ambienti poco luminosi</p>
            </div>
            <label className="inline-flex items-center cursor-pointer">
              <input id="theme-toggle" name="theme-toggle" type="checkbox" className="sr-only peer" checked={theme === 'dark'} onChange={(e) => setTheme(e.target.checked ? 'dark' : 'light')} />
              <div className="w-11 h-6 bg-gray-200 dark:bg-gray-700 rounded-full peer peer-checked:bg-blue-600 transition-colors relative">
                <span className="absolute top-0.5 left-0.5 w-5 h-5 bg-white rounded-full shadow transform transition-transform peer-checked:translate-x-5"></span>
              </div>
            </label>
          </div>

          <div className="glass-card p-4 flex items-center justify-between">
            <div>
              <p className="font-medium text-gray-900 dark:text-gray-100">Notifiche Push</p>
              <p className="text-xs text-gray-500 dark:text-gray-400">Ricevi notifiche per gli ordini programmati</p>
            </div>
            <label className="inline-flex items-center cursor-pointer">
              <input id="push-toggle" name="push-toggle" type="checkbox" className="sr-only peer" checked={isPushEnabled} onChange={(e) => handleTogglePush(e.target.checked)} />
              <div className="w-11 h-6 bg-gray-200 dark:bg-gray-700 rounded-full peer peer-checked:bg-blue-600 transition-colors relative">
                <span className="absolute top-0.5 left-0.5 w-5 h-5 bg-white rounded-full shadow transform transition-transform peer-checked:translate-x-5"></span>
              </div>
            </label>
          </div>
          <button onClick={handleLogout} className="w-full flex items-center justify-center space-x-2 py-3 bg-red-500 text-white rounded-lg font-medium hover:bg-red-600 active:scale-95 transition-transform"><LogOut size={16} /><span>Esci</span></button>
        </div>
      </div>
    );
  };

  const AdminAuthPage = () => {
    const [password, setPassword] = useState('');
    const [isVerifying, setIsVerifying] = useState(false);

    const handleVerify = async (e) => {
      e.preventDefault();
      if (!password) return;
      setIsVerifying(true);
      try {
        const { error } = await supabase.auth.signInWithPassword({ email: user.email, password });
        if (error) throw error;
        setIsAdminAuthenticated(true);
        setCurrentPage('admin');
      } catch (error) {
        console.error("Admin auth error:", error);
        toast.error(error.message || 'Password errata.');
      } finally {
        setIsVerifying(false);
      }
    };

    return (
      <div className="min-h-screen app-background">
        <Header title="Verifica Admin" onBack={() => setCurrentPage('settings')} />
        <div className="max-w-sm mx-auto px-6 py-6">
          <div className="glass-card p-6">
            <p className="text-center text-gray-600 mb-4">Per accedere al pannello di amministrazione, per favore inserisci di nuovo la tua password.</p>
            <form onSubmit={handleVerify} className="space-y-4">
              <div>
                <label htmlFor="admin-password" className="block text-sm font-medium text-gray-700 mb-2">Password</label>
                <input 
                  type="password"
                  id="admin-password"
                  name="admin-password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
                  className="w-full p-3 border border-gray-200 rounded-lg"
                />
              </div>
              <button type="submit" disabled={isVerifying} className="w-full bg-yellow-500 text-white py-3 rounded-lg font-medium flex items-center justify-center">
                {isVerifying ? 'Verifica...' : 'Accedi'}
              </button>
            </form>
          </div>
        </div>
      </div>
    );
  };

  const AdminPage = () => {
    const [users, setUsers] = useState([]);
    const [isLoading, setIsLoading] = useState(true);
    const [error, setError] = useState(null);
    const [actionUser, setActionUser] = useState(null); // For dropdown

    const fetchUsers = useCallback(async () => {
      setIsLoading(true);
      setError(null);
      try {
        const { data, error: functionError } = await supabase.functions.invoke('get-users');
        if (functionError) throw functionError;
        if (data.error) throw new Error(data.error);
        setUsers(data.sort((a, b) => new Date(b.created_at) - new Date(a.created_at)));
      } catch (err) {
        setError(err.message);
        toast.error("Errore nel caricamento degli utenti: " + err.message);
      } finally {
        setIsLoading(false);
      }
    }, []);

    useEffect(() => {
      fetchUsers();
    }, [fetchUsers]);

    const handleAction = async (action, userId, payload) => {
      setActionUser(null); // Close dropdown
      try {
        const { error } = await supabase.functions.invoke(action, { body: payload });
        if (error) throw error;
        
        // Optimistic UI updates
        switch(action) {
          case 'approve-user':
            setUsers(users.map(u => u.id === userId ? { ...u, is_approved: true, email_confirmed_at: new Date().toISOString() } : u));
            toast.success("Utente approvato!");
            break;
          case 'reject-user':
            if (!window.confirm("Sei sicuro di voler rifiutare e cancellare questo utente? L'azione è irreversibile.")) return;
            setUsers(users.filter(u => u.id !== userId));
            toast.success("Utente rifiutato e cancellato.");
            break;
          case 'revoke-approval':
            setUsers(users.map(u => u.id === userId ? { ...u, is_approved: false, email_confirmed_at: null } : u));
            toast.success("Approvazione revocata.");
            break;
          case 'set-admin-status':
            setUsers(users.map(u => u.id === userId ? { ...u, is_admin: payload.is_admin } : u));
            toast.success(`Status admin aggiornato.`);
            break;
          default: break;
        }
      } catch (err) {
        toast.error(`Errore: ${err.message}`);
        fetchUsers(); // Refetch to get latest state on error
      }
    };

    const UserActions = ({ u }) => {
      if (u.id === user.id) return null; // Can't edit self

      return (
        <div className="relative">
          <button onClick={() => setActionUser(actionUser === u.id ? null : u.id)} className="px-3 py-1 text-sm border border-gray-200 dark:border-gray-700 rounded-md hover:bg-gray-50 dark:hover:bg-gray-800 text-gray-700 dark:text-gray-100">Azioni</button>
          {actionUser === u.id && (
            <div className="absolute right-0 mt-2 w-48 bg-white dark:bg-gray-900 rounded-md shadow-lg z-50 border border-gray-200 dark:border-gray-700 text-gray-700 dark:text-gray-100">
              {!u.is_approved ? (
                <>
                  <button onClick={() => handleAction('approve-user', u.id, { user_id_to_approve: u.id })} className="block w-full text-left px-4 py-2 text-sm text-gray-700 dark:text-gray-100 hover:bg-gray-100 dark:hover:bg-gray-800">Approva</button>
                  <button onClick={() => handleAction('reject-user', u.id, { user_id_to_reject: u.id })} className="block w-full text-left px-4 py-2 text-sm text-red-600 hover:bg-gray-100 dark:hover:bg-gray-800">Rifiuta</button>
                </>
              ) : (
                <>
                  <button onClick={() => handleAction('revoke-approval', u.id, { user_id_to_revoke: u.id })} className="block w-full text-left px-4 py-2 text-sm text-gray-700 dark:text-gray-100 hover:bg-gray-100 dark:hover:bg-gray-800">Revoca Approvazione</button>
                  {u.is_admin ? (
                    <button onClick={() => handleAction('set-admin-status', u.id, { target_user_id: u.id, is_admin: false })} className="block w-full text-left px-4 py-2 text-sm text-red-600 hover:bg-gray-100 dark:hover:bg-gray-800">Rimuovi Admin</button>
                  ) : (
                    <button onClick={() => handleAction('set-admin-status', u.id, { target_user_id: u.id, is_admin: true })} className="block w-full text-left px-4 py-2 text-sm text-gray-700 dark:text-gray-100 hover:bg-gray-100 dark:hover:bg-gray-800">Rendi Admin</button>
                  )}
                </>
              )}
            </div>
          )}
        </div>
    );
  };


    return (
      <div className="min-h-screen app-background">
        <Header title="Pannello Admin" onBack={() => setCurrentPage('settings')} />
        <div className="max-w-sm mx-auto px-6 py-6">
          <div className="flex justify-between items-center mb-4">
            <h3 className="text-lg font-medium">Gestione Utenti</h3>
            <button onClick={fetchUsers} disabled={isLoading} className="p-2 text-gray-500 hover:bg-gray-100 rounded-full">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M21 12a9 9 0 1 1-6.219-8.56"/></svg>
            </button>
          </div>

          {isLoading ? (
            <p>Caricamento utenti...</p>
          ) : error ? (
            <p className="text-red-500">{error}</p>
          ) : (
            <div className="space-y-4">
              {users.map(u => (
                <div key={u.id} className="glass-card p-4">
                  <div className="flex justify-between items-start">
                    <div>
                      <p className="font-medium">{u.first_name || 'N/A'} {u.last_name || ''}</p>
                      <p className="text-sm text-gray-600">{u.email}</p>
                      <p className="text-xs text-gray-400">Registrato: {new Date(u.created_at).toLocaleDateString()}</p>
                    </div>
                    <div className="text-right">
                      <div className={`inline-block px-2 py-1 text-xs rounded-full ${u.is_approved ? 'bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300' : 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900/30 dark:text-yellow-300'}`}>
                        {u.is_approved ? 'Approvato' : 'In attesa'}
                      </div>
                      {u.is_admin && (
                        <div className="inline-block px-2 py-1 text-xs rounded-full bg-purple-100 text-purple-800 dark:bg-purple-900/30 dark:text-purple-300 mt-1">
                          Admin
                        </div>
                      )}
                    </div>
                  </div>
                  <div className="flex justify-end mt-4 pt-4 border-t">
                     <UserActions u={u} />
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    );
  };

  const UserProfilePage = ({ user, profile, setProfile }) => {
    const [isSubmitting, setIsSubmitting] = useState(false);

    const [formData, setFormData] = useState({
      first_name: '',
      last_name: '',
      role: '',
      company_name: '',
      company_vat_id: '',
      headquarters_name: '',
      headquarters_address: '',
    });

    useEffect(() => {
      if (profile) {
        setFormData({
          first_name: profile.first_name || '',
          last_name: profile.last_name || '',
          role: profile.role || '',
          company_name: profile.company_name || '',
          company_vat_id: profile.company_vat_id || '',
          headquarters_name: profile.headquarters_name || '',
          headquarters_address: profile.headquarters_address || '',
        });
      }
    }, [profile]);

    const handleChange = (e) => {
      const { name, value } = e.target;
      setFormData(prev => ({ ...prev, [name]: value }));
    };

    const handleSubmit = async (e) => {
      e.preventDefault();
      if (!user) return;
      setIsSubmitting(true);
      try {
        const updatedProfile = await supabaseHelpers.updateUserProfile(user.id, formData);
        setProfile(updatedProfile); // Update context state
        toast.success('Profilo aggiornato con successo!');
      } catch (error) {
        console.error('Error updating profile:', error);
        toast.error('Errore durante l\'aggiornamento del profilo.');
      } finally {
        setIsSubmitting(false);
      }
    };

    return (
      <div className="min-h-screen app-background">
        <Header title="Profilo Utente" onBack={() => setCurrentPage('settings')} />
        <div className="max-w-sm mx-auto px-6 py-6">
            <form onSubmit={handleSubmit} className="space-y-4">
              <div><label htmlFor="first_name" className="block text-sm font-medium text-gray-700 mb-2">Nome</label><input id="first_name" type="text" name="first_name" value={formData.first_name} onChange={handleChange} className="w-full p-3 border border-gray-200 rounded-lg" /></div>
              <div><label htmlFor="last_name" className="block text-sm font-medium text-gray-700 mb-2">Cognome</label><input id="last_name" type="text" name="last_name" value={formData.last_name} onChange={handleChange} className="w-full p-3 border border-gray-200 rounded-lg" /></div>
              <div><label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-2">Email</label><input id="email" type="email" name="email" value={formData.email} onChange={handleChange} className="w-full p-3 border border-gray-200 rounded-lg bg-gray-100" disabled /></div>
              <div><label htmlFor="role" className="block text-sm font-medium text-gray-700 mb-2">Ruolo</label><input id="role" type="text" name="role" value={formData.role} onChange={handleChange} className="w-full p-3 border border-gray-200 rounded-lg" /></div>
              
              <h4 className="text-md font-medium text-gray-800 pt-2">Dati Aziendali</h4>
              <div><label htmlFor="company_name" className="block text-sm font-medium text-gray-700 mb-2">Ragione Sociale</label><input id="company_name" type="text" name="company_name" value={formData.company_name} onChange={handleChange} className="w-full p-3 border border-gray-200 rounded-lg" /></div>
              <div><label htmlFor="company_vat_id" className="block text-sm font-medium text-gray-700 mb-2">Partita IVA</label><input id="company_vat_id" type="text" name="company_vat_id" value={formData.company_vat_id} onChange={handleChange} className="w-full p-3 border border-gray-200 rounded-lg" /></div>
              <div><label htmlFor="headquarters_name" className="block text-sm font-medium text-gray-700 mb-2">Nome Sede</label><input id="headquarters_name" type="text" name="headquarters_name" value={formData.headquarters_name} onChange={handleChange} className="w-full p-3 border border-gray-200 rounded-lg" /></div>
              <div><label htmlFor="headquarters_address" className="block text-sm font-medium text-gray-700 mb-2">Indirizzo Sede</label><input id="headquarters_address" type="text" name="headquarters_address" value={formData.headquarters_address} onChange={handleChange} className="w-full p-3 border border-gray-200 rounded-lg" /></div>

              <button type="submit" disabled={isSubmitting} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium flex items-center justify-center">
                {isSubmitting ? 'Salvataggio...' : 'Salva Modifiche'}
              </button>
            </form>
        </div>
      </div>
    );
  };

  const NotificationsPage = ({ onNotificationClick, unreadCount, setUnreadCount }) => {
    const [notifications, setNotifications] = useState([]);
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
      const fetchAndCleanNotifications = async () => {
        if (!user) return;
        try {
          setIsLoading(true);
          const data = await supabaseHelpers.getNotifications(user.id);
          
          const now = new Date();
          const twentyFourHoursAgo = new Date(now.getTime() - 24 * 60 * 60 * 1000);
          
          const oldReadNotifications = data.filter(n => {
              const notificationDate = new Date(n.created_at);
              return n.is_read && notificationDate < twentyFourHoursAgo;
          });

          if (oldReadNotifications.length > 0) {
              const idsToDelete = oldReadNotifications.map(n => n.id);
              await Promise.all(idsToDelete.map(id => supabaseHelpers.deleteNotification(id)));
              
              const currentNotifications = data.filter(n => !idsToDelete.includes(n.id));
              setNotifications(currentNotifications);
          } else {
            setNotifications(data);
          }

        } catch (error) {
          console.error('Error fetching or cleaning notifications:', error);
          toast.error('Errore nel caricamento delle notifiche.');
        } finally {
          setIsLoading(false);
        }
      };
      fetchAndCleanNotifications();
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
      <div className="min-h-screen app-background">
        <Header title="Notifiche" onBack={() => setCurrentPage('home')} />
        <div className="max-w-sm mx-auto px-6 py-6">
          <div className="flex justify-between items-center mb-6">
            <h2 className="text-lg font-medium text-gray-900">Centro Notifiche</h2>
            {unreadCount > 0 && (
              <button onClick={handleMarkAllAsRead} className="text-sm text-blue-500 dark:text-blue-400 hover:underline">
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
                <details className="mt-8 group">
                  <summary className="font-medium text-gray-500 cursor-pointer flex justify-between items-center list-none">
                    <h3 className="text-sm mb-3">Archivio (Ultime 24 ore)</h3>
                    <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" />
                  </summary>
                  <div className="space-y-3 mt-3">
                    {readNotifications.map(notification => (
                      <div key={notification.id} className="bg-white rounded-xl p-4 shadow-sm opacity-60">
                        <h3 className="font-medium text-gray-700">{notification.title}</h3>
                        <p className="text-xs text-gray-500 mt-1">{new Date(notification.created_at).toLocaleString('it-IT', { dateStyle: 'medium', timeStyle: 'short' })}</p>
                        <p className="text-sm text-gray-600 mt-2">{notification.message}</p>
                      </div>
                    ))}
                  </div>
                </details>
              )}
            </div>
          )}
        </div>
      </div>
    );
  };

    const AuthPage = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [isLogin, setIsLogin] = useState(true);

    // New profile fields
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [role, setRole] = useState('');
    const [companyName, setCompanyName] = useState('');
    const [companyVatId, setCompanyVatId] = useState('');
    const [headquartersName, setHeadquartersName] = useState('');
    const [headquartersAddress, setHeadquartersAddress] = useState('');
    const [isAuthenticating, setIsAuthenticating] = useState(false);

    const handleLogin = async (e) => {
      e.preventDefault();
      setIsAuthenticating(true);
      try {
        const { error } = await supabase.auth.signInWithPassword({ email, password });
        if (error) throw error;
        toast.success('Accesso effettuato con successo!');
        setCurrentPage('home');
      } catch (error) {
        toast.error(error.message);
      } finally {
        setIsAuthenticating(false);
      }
    };

    const handleSignUp = async (e) => {
      e.preventDefault();
      setIsAuthenticating(true);
      try {
        const { data, error } = await supabase.auth.signUp({
          email,
          password,
          options: {
            data: {
              first_name: firstName,
              last_name: lastName,
              role: role,
              company_name: companyName,
              company_vat_id: companyVatId,
              headquarters_name: headquartersName,
              headquarters_address: headquartersAddress,
              is_approved: false,
              is_admin: false,
            }
          }
        });
        if (error) throw error;
        if (data.user) {
          toast.success('Registrazione completata! Un amministratore approverà il tuo account a breve.');
          setIsLogin(true);
        }
      } catch (error) {
        toast.error(error.message);
      } finally {
        setIsAuthenticating(false);
      }
    };

    return (
      <div className="min-h-screen app-background flex items-center justify-center px-6">
        <div className="max-w-sm w-full">
          <div className="glass-card p-6">
            <div className="text-center mb-6"><h1 className="text-2xl font-light text-gray-900 mb-2">Gestione Ordini</h1><p className="text-gray-500 text-sm">{isLogin ? 'Accedi al tuo account' : 'Crea un nuovo account'}</p></div>
            <form onSubmit={isLogin ? handleLogin : handleSignUp} className="space-y-4">
              {!isLogin && (
                <>
                  <div><label htmlFor="first-name" className="block text-sm font-medium text-gray-700 mb-2">Nome</label><input id="first-name" name="first-name" type="text" value={firstName} onChange={(e) => setFirstName(e.target.value)} required className="w-full p-3 border border-gray-200 rounded-lg" placeholder="Mario" /></div>
                  <div><label htmlFor="last-name" className="block text-sm font-medium text-gray-700 mb-2">Cognome</label><input id="last-name" name="last-name" type="text" value={lastName} onChange={(e) => setLastName(e.target.value)} required className="w-full p-3 border border-gray-200 rounded-lg" placeholder="Rossi" /></div>
                  <div><label htmlFor="role" className="block text-sm font-medium text-gray-700 mb-2">Ruolo</label><input id="role" name="role" type="text" value={role} onChange={(e) => setRole(e.target.value)} required className="w-full p-3 border border-gray-200 rounded-lg" placeholder="Es. Manager" /></div>
                  <h4 className="text-md font-medium text-gray-800 pt-2">Dati Aziendali</h4>
                  <div><label htmlFor="company-name" className="block text-sm font-medium text-gray-700 mb-2">Ragione Sociale</label><input id="company-name" name="company-name" type="text" value={companyName} onChange={(e) => setCompanyName(e.target.value)} required className="w-full p-3 border border-gray-200 rounded-lg" placeholder="Ristorante S.R.L." /></div>
                  <div><label htmlFor="company-vat-id" className="block text-sm font-medium text-gray-700 mb-2">Partita IVA</label><input id="company-vat-id" name="company-vat-id" type="text" value={companyVatId} onChange={(e) => setCompanyVatId(e.target.value)} required className="w-full p-3 border border-gray-200 rounded-lg" placeholder="IT12345678901" /></div>
                  <div><label htmlFor="headquarters-name" className="block text-sm font-medium text-gray-700 mb-2">Nome Sede</label><input id="headquarters-name" name="headquarters-name" type="text" value={headquartersName} onChange={(e) => setHeadquartersName(e.target.value)} required className="w-full p-3 border border-gray-200 rounded-lg" placeholder="Ristorante da Mario" /></div>
                  <div><label htmlFor="headquarters-address" className="block text-sm font-medium text-gray-700 mb-2">Indirizzo Sede</label><input id="headquarters-address" name="headquarters-address" type="text" value={headquartersAddress} onChange={(e) => setHeadquartersAddress(e.target.value)} required className="w-full p-3 border border-gray-200 rounded-lg" placeholder="Via Roma, 1" /></div>
                </>
              )}
              <div><label htmlFor="auth-email" className="block text-sm font-medium text-gray-700 mb-2">Email</label><input id="auth-email" name="auth-email" type="email" value={email} onChange={(e) => setEmail(e.target.value)} required className="w-full p-3 border border-gray-200 rounded-lg" placeholder="mario.rossi@email.com" /></div>
              <div><label htmlFor="auth-password" className="block text-sm font-medium text-gray-700 mb-2">Password</label><input id="auth-password" name="auth-password" type="password" value={password} onChange={(e) => setPassword(e.target.value)} required className="w-full p-3 border border-gray-200 rounded-lg" placeholder="••••••••" /></div>
              <button type="submit" disabled={isAuthenticating} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium flex items-center justify-center">
                {isAuthenticating ? (isLogin ? 'Accesso in corso...' : 'Registrazione in corso...') : (isLogin ? 'Accedi' : 'Registrati')}
              </button>
            </form>
            <div className="mt-6 text-center"><button onClick={() => setIsLogin(!isLogin)} className="text-blue-500 hover:text-blue-600 text-sm">{isLogin ? 'Non hai un account? Registrati' : 'Hai già un account? Accedi'}</button></div>
          </div>
        </div>
      </div>
    );
  };

  if (!user) return <><Toaster position="top-center" reverseOrder={false} /><AuthPage /></>;

  const renderPage = () => {
    switch (currentPage) {
      case 'home': return <HomePage />;
      case 'createOrder': return <CreateOrderPage scheduledOrders={scheduledOrders} setScheduledOrders={setScheduledOrders} onOrderSent={() => { setPrefilledData(null); setCurrentPage('home'); }} suppliers={suppliers} batchMode={batchMode} setBatchMode={setBatchMode} multiOrders={multiOrders} setMultiOrders={setMultiOrders} setOrders={setOrders} showWizard={showWizard} setShowWizard={setShowWizard} wizardOrders={wizardOrders} setWizardOrders={setWizardOrders} wizardStep={wizardStep} setWizardStep={setWizardStep} />;
      case 'suppliers': return <SuppliersPage />;
      case 'schedule': return <SchedulePage setCurrentPage={setCurrentPage} batchMode={batchMode} setBatchMode={setBatchMode} multiOrders={multiOrders} setMultiOrders={setMultiOrders} suppliers={suppliers} scheduledOrders={scheduledOrders} setScheduledOrders={setScheduledOrders} setWizardOrders={setWizardOrders} showWizard={showWizard} setShowWizard={setShowWizard} wizardOrders={wizardOrders} wizardStep={wizardStep} setWizardStep={setWizardStep} />;
      case 'history': return <HistoryPage />;
      case 'analytics': return <AnalyticsDashboard />;
      case 'settings': return <SettingsPage />;
      case 'userProfile': return <UserProfilePage user={user} profile={profile} setProfile={setProfile} />;
      case 'adminAuth': return <AdminAuthPage />;
      case 'admin': 
        if (profile?.is_admin && isAdminAuthenticated) {
          return <AdminPage />;
        }
        // Redirect to home if not authorized
        return <HomePage />;
      case 'notifications': return <NotificationsPage onNotificationClick={handleNotificationClick} unreadCount={unreadCount} setUnreadCount={setUnreadCount} />;
      case 'productHistory': return <ProductHistoryPage />;
      default: return <HomePage />;
    }
  };

  return <><Toaster position="top-center" reverseOrder={false} />{renderPage()}</>;
};

export default App;
