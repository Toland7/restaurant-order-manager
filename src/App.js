import React, { useState, useEffect, useCallback, useMemo } from 'react';
import { Calendar, ChevronLeft, ChevronRight, Plus, Trash2, Edit3, Send, Check, Bell, History, Users, ShoppingCart, LogOut, Settings, Filter, Download, BarChart3, User } from 'lucide-react';
import { supabase, supabaseHelpers } from '../src/lib/supabase.js';
import { Toaster, toast } from 'react-hot-toast';

const App = () => {
  const [currentPage, setCurrentPage] = useState('home');
  const [suppliers, setSuppliers] = useState([]);
  const [orders, setOrders] = useState([]);
  const [scheduledOrders, setScheduledOrders] = useState([]);
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [isAuthenticating, setIsAuthenticating] = useState(false);

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

  const calculateAnalytics = useCallback((ordersData, suppliersData) => {
    const now = new Date();
    const weekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);
    
    const ordersThisWeek = ordersData.filter(order => 
      new Date(order.sent_at || order.created_at) > weekAgo
    ).length;

    // Calculate most ordered product (simplified)
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
      // Load suppliers with products
      const suppliersData = await supabaseHelpers.getSuppliers(userId);
      const formattedSuppliers = suppliersData.map(supplier => ({
        ...supplier,
        products: supplier.products ? supplier.products.map(p => p.name) : []
      }));
      setSuppliers(formattedSuppliers);

      // Load orders
      const ordersData = await supabaseHelpers.getOrders(userId);
      setOrders(ordersData);

      // Load scheduled orders
      const scheduledData = await supabaseHelpers.getScheduledOrders(userId);
      setScheduledOrders(scheduledData);

      // Calculate analytics
      calculateAnalytics(ordersData, formattedSuppliers);

    } catch (error) {
      console.error('Error loading data:', error);
      toast.error('Errore durante il caricamento dei dati');
    }
  }, [calculateAnalytics]);

  const initializeApp = useCallback(async () => {
    try {
      const currentUser = await supabaseHelpers.getCurrentUser();
      if (currentUser) {
        setUser(currentUser);
        await loadData(currentUser.id);
        setCurrentPage('home');
      } else {
        setCurrentPage('auth');
      }
    } catch (error) {
      console.error('initializeApp: CATCH block error:', error);
      setCurrentPage('auth');
    } finally {
      setLoading(false);
    }
  }, [loadData]);

  // Initialize app and auth listener
  useEffect(() => {
    initializeApp();
    
    const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
      if (event === 'SIGNED_IN' && session?.user) {
        setUser(session.user);
        await loadData(session.user.id);
        setCurrentPage('home');
      } else if (event === 'SIGNED_OUT') {
        setUser(null);
        setSuppliers([]);
        setOrders([]);
        setScheduledOrders([]);
        setCurrentPage('auth');
      }
    });

    return () => subscription.unsubscribe();
  }, [initializeApp, loadData]);


  // --- Reusable Components ---

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

  // --- Page Components ---

  const AuthPage = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [isLogin, setIsLogin] = useState(true);

    const handleAuth = async (e) => {
      e.preventDefault();
      setIsAuthenticating(true);

      try {
        if (isLogin) {
          const { error } = await supabase.auth.signInWithPassword({
            email,
            password
          });
          if (error) throw error;
          toast.success('Login effettuato con successo!');
        } else {
          const { error } = await supabase.auth.signUp({
            email,
            password
          });
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
              <h1 className="text-2xl font-light text-gray-900 mb-2">
                Gestione Ordini
              </h1>
              <p className="text-gray-500 text-sm">
                {isLogin ? 'Accedi al tuo account' : 'Crea un nuovo account'}
              </p>
            </div>

            <form onSubmit={handleAuth} className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Email
                </label>
                <input
                  type="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  required
                  className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  placeholder="tua@email.com"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Password
                </label>
                <input
                  type="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
                  minLength={6}
                  className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  placeholder="Password (min 6 caratteri)"
                />
              </div>

              <button
                type="submit"
                disabled={isAuthenticating}
                className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium hover:bg-blue-600 transition-colors disabled:bg-blue-300 flex items-center justify-center space-x-2"
              >
                {isAuthenticating ? (
                  <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" />
                ) : (
                  <span>{isLogin ? 'Accedi' : 'Registrati'}</span>
                )}
              </button>
            </form>

            <div className="mt-6 text-center">
              <button
                onClick={() => setIsLogin(!isLogin)}
                className="text-blue-500 hover:text-blue-600 text-sm"
              >
                {isLogin ? 'Non hai un account? Registrati' : 'Hai già un account? Accedi'}
              </button>
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
              <h1 className="text-2xl font-light text-gray-900">
                Gestione Ordini
              </h1>
              <p className="text-gray-500 text-sm">
                Benvenuto, {user?.email?.split('@')[0]}
              </p>
            </div>
            <div className="flex space-x-2">
              <button
                onClick={() => setCurrentPage('analytics')}
                className="p-2 text-gray-400 hover:text-blue-500 hover:bg-blue-50 rounded-full"
              >
                <BarChart3 size={20} />
              </button>
              <button
                onClick={() => setCurrentPage('settings')}
                className="p-2 text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded-full"
              >
                <Settings size={20} />
              </button>
            </div>
          </div>

          {/* Quick Stats */}
          <div className="grid grid-cols-3 gap-3 mb-6">
            <div className="bg-blue-50 rounded-lg p-3 text-center">
              <p className="text-lg font-bold text-blue-600">{analytics.totalOrders}</p>
              <p className="text-xs text-blue-600">Ordini</p>
            </div>
            <div className="bg-green-50 rounded-lg p-3 text-center">
              <p className="text-lg font-bold text-green-600">{analytics.totalSuppliers}</p>
              <p className="text-xs text-green-600">Fornitori</p>
            </div>
            <div className="bg-purple-50 rounded-lg p-3 text-center">
              <p className="text-lg font-bold text-purple-600">{analytics.ordersThisWeek}</p>
              <p className="text-xs text-purple-600">Settimana</p>
            </div>
          </div>
        </div>
      </div>
      
      <div className="max-w-sm mx-auto px-6 py-6 space-y-4">
        <MenuButton 
          icon={<ShoppingCart size={24} />} 
          title="CREA IL TUO ORDINE"
          subtitle="Nuovo ordine ai fornitori"
          onClick={() => setCurrentPage('createOrder')}
          color="bg-blue-500"
        />
        
        <MenuButton 
          icon={<Users size={24} />} 
          title="GESTIONE FORNITORI"
          subtitle="Aggiungi e modifica fornitori"
          onClick={() => setCurrentPage('suppliers')}
          color="bg-green-500"
        />
        
        <MenuButton 
          icon={<Calendar size={24} />} 
          title="PROGRAMMA ORDINI"
          subtitle="Pianifica ordini futuri"
          onClick={() => setCurrentPage('schedule')}
          color="bg-purple-500"
        />
        
        <MenuButton 
          icon={<History size={24} />} 
          title="CRONOLOGIA ORDINI"
          subtitle="Storico degli ordini"
          onClick={() => setCurrentPage('history')}
          color="bg-orange-500"
        />
      </div>
    </div>
  );

  const CreateOrderPage = () => {
    const [selectedSupplier, setSelectedSupplier] = useState('');
    const [orderItems, setOrderItems] = useState({});
    const [additionalItems, setAdditionalItems] = useState('');
    const [showConfirm, setShowConfirm] = useState(false);
    const [isSubmitting, setIsSubmitting] = useState(false);

    const handleQuantityChange = (product, quantity) => {
      setOrderItems(prev => ({
        ...prev,
        [product]: quantity
      }));
    };

    const generateOrderMessage = () => {
      const supplier = suppliers.find(s => s.id.toString() === selectedSupplier);
      if (!supplier) return '';

      let message = supplier.message_template + `\n\n`;
      
      Object.entries(orderItems).forEach(([product, quantity]) => {
        if (quantity && quantity !== '0') {
          message += `• ${product}: ${quantity}\n`;
        }
      });

      if (additionalItems.trim()) {
        message += '\nProdotti aggiuntivi:\n' + additionalItems + '\n';
      }

      message += '\nGrazie!';
      return message;
    };

    const sendOrder = async () => {
      if (isSubmitting) return;
      setIsSubmitting(true);

      try {
        const supplier = suppliers.find(s => s.id.toString() === selectedSupplier);
        const orderMessage = generateOrderMessage();
        
        // Create order in database
        const orderData = {
          user_id: user.id,
          supplier_id: selectedSupplier,
          order_message: orderMessage,
          additional_items: additionalItems || null,
          status: 'sent'
        };

        const orderItemsToInsert = Object.entries(orderItems)
          .filter(([_, quantity]) => quantity && quantity !== '0')
          .map(([productName, quantity]) => ({
            product_name: productName,
            quantity: parseInt(quantity, 10) || 0
          }));

        const newOrder = await supabaseHelpers.createOrder(orderData, orderItemsToInsert);

        // Implement actual sending logic based on contact_method
        const encodedMessage = encodeURIComponent(orderMessage);

        switch (supplier.contact_method) {
          case 'whatsapp':
            window.open(`https://wa.me/${supplier.contact}?text=${encodedMessage}`, '_blank');
            break;
          case 'email':
            window.open(`mailto:${supplier.contact}?subject=${encodeURIComponent(`Ordine Fornitore - ${supplier.name}`)}&body=${encodedMessage}`, '_blank');
            break;
          case 'sms':
            window.open(`sms:${supplier.contact}?body=${encodedMessage}`, '_blank');
            break;
          default:
            toast.error('Metodo di contatto non supportato');
            break;
        }
        
        toast.success(`Ordine inviato via ${supplier.contact_method} a ${supplier.name}!`);
        
        // Update local state
        setOrders(prev => [{ ...newOrder, suppliers: supplier, order_items: orderItemsToInsert }, ...prev]);
        
        // Reset form
        setSelectedSupplier('');
        setOrderItems({});
        setAdditionalItems('');
        setShowConfirm(false);

        // Ask if user wants to create another order
        setTimeout(() => {
          if (window.confirm('Ordine inviato con successo! Vuoi creare un altro ordine?')) {
            // Stay on the same page
          } else {
            setCurrentPage('home');
          }
        }, 1000);

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
        <Header title="Crea Ordine" onBack={() => setCurrentPage('home')} />
        
        <div className="max-w-sm mx-auto px-6 py-6 space-y-6">
          <div className="bg-white rounded-xl p-4 shadow-sm">
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Seleziona Fornitore
            </label>
            <select
              value={selectedSupplier}
              onChange={(e) => setSelectedSupplier(e.target.value)}
              className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
              <option value="">Scegli un fornitore...</option>
              {suppliers.map(supplier => (
                <option key={supplier.id} value={supplier.id}>
                  {supplier.name}
                </option>
              ))}
            </select>
          </div>

          {suppliers.length === 0 && (
            <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 text-center">
              <p className="text-yellow-800 text-sm mb-3">Non hai ancora fornitori configurati</p>
              <button
                onClick={() => setCurrentPage('suppliers')}
                className="text-yellow-600 hover:text-yellow-800 font-medium text-sm"
              >
                Aggiungi il primo fornitore →
              </button>
            </div>
          )}

          {selectedSupplierData && (
            <div className="bg-white rounded-xl p-4 shadow-sm">
              <h3 className="font-medium text-gray-900 mb-4">Prodotti Disponibili</h3>
              {selectedSupplierData.products.length === 0 ? (
                <div className="text-center py-4">
                  <p className="text-gray-500 text-sm">Nessun prodotto configurato per questo fornitore</p>
                </div>
              ) : (
                <div className="space-y-3">
                  {selectedSupplierData.products.map(product => (
                    <div key={product} className="flex items-center justify-between p-2 border border-gray-100 rounded-lg">
                      <label className="flex items-center space-x-3 flex-1">
                        <input
                          type="checkbox"
                          checked={orderItems[product] && orderItems[product] !== '0'}
                          onChange={(e) => {
                            if (!e.target.checked) {
                              setOrderItems(prev => ({ ...prev, [product]: '0' }));
                            }
                          }}
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

          {selectedSupplierData && (
            <div className="bg-white rounded-xl p-4 shadow-sm">
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Prodotti Aggiuntivi
              </label>
              <textarea
                value={additionalItems}
                onChange={(e) => setAdditionalItems(e.target.value)}
                placeholder="Inserisci prodotti non in lista..."
                className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                rows="3"
              />
            </div>
          )}

          {selectedSupplierData && (Object.keys(orderItems).some(key => orderItems[key] && orderItems[key] !== '0') || additionalItems.trim()) && (
            <button
              onClick={() => setShowConfirm(true)}
              className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium hover:bg-blue-600 transition-colors"
            >
              Anteprima Ordine
            </button>
          )}
        </div>

        {showConfirm && (
          <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
            <div className="bg-white rounded-xl p-6 max-w-sm w-full max-h-96 overflow-y-auto">
              <h3 className="font-medium text-gray-900 mb-4">Conferma Ordine</h3>
              <div className="bg-gray-50 p-3 rounded-lg mb-4">
                <pre className="text-sm text-gray-700 whitespace-pre-wrap">{generateOrderMessage()}</pre>
              </div>
              <div className="flex space-x-3">
                <button
                  onClick={() => setShowConfirm(false)}
                  className="flex-1 py-2 px-4 border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-50"
                  disabled={isSubmitting}
                >
                  Modifica
                </button>
                <button
                  onClick={sendOrder}
                  disabled={isSubmitting}
                  className="flex-1 py-2 px-4 bg-blue-500 text-white rounded-lg hover:bg-blue-600 disabled:bg-blue-300 flex items-center justify-center space-x-2"
                >
                  {isSubmitting ? (
                    <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" />
                  ) : (
                    <Send size={16} />
                  )}
                  <span>{isSubmitting ? 'Invio...' : 'Invia'}</span>
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    );
  };

  const SuppliersPage = () => {
    const [isAdding, setIsAdding] = useState(false);
    const [editingSupplier, setEditingSupplier] = useState(null);
    const [newSupplier, setNewSupplier] = useState({
      name: '',
      contact_method: 'whatsapp',
      contact: '',
      products: [],
      message_template: 'Buongiorno, vorremmo ordinare i seguenti prodotti:'
    });
    const [newProduct, setNewProduct] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);

    const addProduct = () => {
      if (newProduct.trim()) {
        setNewSupplier(prev => ({
          ...prev,
          products: [...prev.products, newProduct.trim()]
        }));
        setNewProduct('');
      }
    };

    const removeProduct = (index) => {
      setNewSupplier(prev => ({
        ...prev,
        products: prev.products.filter((_, i) => i !== index)
      }));
    };

    const saveSupplier = async () => {
      if (!newSupplier.name || !newSupplier.contact) {
        toast.error('Nome e contatto sono obbligatori');
        return;
      }

      setIsSubmitting(true);

      try {
        const supplierData = {
          user_id: user.id,
          name: newSupplier.name,
          contact_method: newSupplier.contact_method,
          contact: newSupplier.contact,
          message_template: newSupplier.message_template
        };

        let savedSupplier;

        if (editingSupplier) {
          // Update existing supplier
          savedSupplier = await supabaseHelpers.updateSupplier(editingSupplier.id, supplierData);
          
          // Update products (delete old ones and create new ones)
          await supabaseHelpers.deleteProductsBySupplier(editingSupplier.id);
          if (newSupplier.products.length > 0) {
            await supabaseHelpers.createProducts(editingSupplier.id, newSupplier.products);
          }
          
          // Update local state
          setSuppliers(prev => prev.map(s => 
            s.id === editingSupplier.id ? { ...savedSupplier, products: newSupplier.products } : s
          ));
          
          toast.success('Fornitore aggiornato con successo');
        } else {
          // Create new supplier
          savedSupplier = await supabaseHelpers.createSupplier(supplierData);
          
          // Save products
          if (newSupplier.products.length > 0) {
            await supabaseHelpers.createProducts(savedSupplier.id, newSupplier.products);
          }
          
          // Update local state
          setSuppliers(prev => [...prev, { ...savedSupplier, products: newSupplier.products }]);
          
          toast.success('Fornitore aggiunto con successo');
        }

        // Reset form
        setNewSupplier({
          name: '',
          contact_method: 'whatsapp',
          contact: '',
          products: [],
          message_template: 'Buongiorno, vorremmo ordinare i seguenti prodotti:'
        });
        setIsAdding(false);
        setEditingSupplier(null);

        // Ask if user wants to add another supplier
        if (!editingSupplier) {
          setTimeout(() => {
            if (window.confirm('Fornitore aggiunto! Vuoi aggiungerne un altro?')) {
              setIsAdding(true);
            }
          }, 1000);
        }

      } catch (error) {
        console.error('Error saving supplier:', error);
        toast.error('Errore durante il salvataggio');
      } finally {
        setIsSubmitting(false);
      }
    };

    const editSupplier = (supplier) => {
      setNewSupplier({
        name: supplier.name,
        contact_method: supplier.contact_method,
        contact: supplier.contact,
        products: supplier.products || [],
        message_template: supplier.message_template
      });
      setEditingSupplier(supplier);
      setIsAdding(true);
    };

    const deleteSupplier = async (id) => {
      if (!window.confirm('Sei sicuro di voler eliminare questo fornitore? Questa azione eliminerà anche tutti i prodotti associati.')) {
        return;
      }

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
              <button
                onClick={() => setIsAdding(true)}
                className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium mb-6 flex items-center justify-center space-x-2 hover:bg-blue-600 transition-colors"
              >
                <Plus size={20} />
                <span>Aggiungi Fornitore</span>
              </button>

              <div className="space-y-4">
                {suppliers.map(supplier => (
                  <div key={supplier.id} className="bg-white rounded-xl p-4 shadow-sm">
                    <div className="flex justify-between items-start mb-2">
                      <h3 className="font-medium text-gray-900">{supplier.name}</h3>
                      <div className="flex space-x-2">
                        <button
                          onClick={() => editSupplier(supplier)}
                          className="p-1 text-blue-500 hover:bg-blue-50 rounded"
                        >
                          <Edit3 size={16} />
                        </button>
                        <button
                          onClick={() => deleteSupplier(supplier.id)}
                          className="p-1 text-red-500 hover:bg-red-50 rounded"
                        >
                          <Trash2 size={16} />
                        </button>
                      </div>
                    </div>
                    <p className="text-sm text-gray-600 mb-1">
                      <span className="font-medium">Contatto:</span> {supplier.contact_method} - {supplier.contact}
                    </p>
                    <p className="text-sm text-gray-600">
                      <span className="font-medium">Prodotti:</span> {supplier.products ? supplier.products.join(', ') : 'Nessun prodotto'}
                    </p>
                  </div>
                ))}
                
                {suppliers.length === 0 && (
                  <div className="text-center py-12">
                    <Users size={48} className="mx-auto text-gray-300 mb-4" />
                    <p className="text-gray-500 mb-4">Nessun fornitore ancora aggiunto</p>
                    <button
                      onClick={() => setIsAdding(true)}
                      className="text-blue-500 hover:text-blue-600 font-medium"
                    >
                      Aggiungi il primo fornitore
                    </button>
                  </div>
                )}
              </div>
            </>
          ) : (
            <div className="space-y-6">
              <div className="bg-white rounded-xl p-4 shadow-sm">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Nome Fornitore *
                </label>
                <input
                  type="text"
                  value={newSupplier.name}
                  onChange={(e) => setNewSupplier(prev => ({ ...prev, name: e.target.value }))}
                  className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  placeholder="Es. Fornitore Verdure Bio"
                />
              </div>

              <div className="bg-white rounded-xl p-4 shadow-sm">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Metodo di Invio
                </label>
                <select
                  value={newSupplier.contact_method}
                  onChange={(e) => setNewSupplier(prev => ({ ...prev, contact_method: e.target.value }))}
                  className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                >
                  <option value="whatsapp">WhatsApp</option>
                  <option value="email">Email</option>
                  <option value="sms">Messaggio</option>
                </select>
              </div>

              <div className="bg-white rounded-xl p-4 shadow-sm">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Contatto *
                </label>
                <input
                  type="text"
                  value={newSupplier.contact}
                  onChange={(e) => setNewSupplier(prev => ({ ...prev, contact: e.target.value }))}
                  className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  placeholder={
                    newSupplier.contact_method === 'whatsapp' || newSupplier.contact_method === 'sms' 
                      ? "+39 123 456 7890"
                      : "email@fornitore.com"
                  }
                />
              </div>

              <div className="bg-white rounded-xl p-4 shadow-sm">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Prodotti
                </label>
                <div className="flex space-x-2 mb-3">
                  <input
                    type="text"
                    value={newProduct}
                    onChange={(e) => setNewProduct(e.target.value)}
                    className="flex-1 p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    placeholder="Aggiungi prodotto..."
                    onKeyPress={(e) => e.key === 'Enter' && addProduct()}
                  />
                  <button
                    onClick={addProduct}
                    className="px-4 py-3 bg-blue-500 text-white rounded-lg hover:bg-blue-600"
                  >
                    <Plus size={16} />
                  </button>
                </div>
                <div className="space-y-2">
                  {newSupplier.products.map((product, index) => (
                    <div key={index} className="flex items-center justify-between p-2 bg-gray-50 rounded-lg">
                      <span className="text-sm text-gray-700">{product}</span>
                      <button
                        onClick={() => removeProduct(index)}
                        className="p-1 text-red-500 hover:bg-red-100 rounded"
                      >
                        <Trash2 size={14} />
                      </button>
                    </div>
                  ))}
                </div>
              </div>

              <div className="bg-white rounded-xl p-4 shadow-sm">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Messaggio Predefinito
                </label>
                <textarea
                  value={newSupplier.message_template}
                  onChange={(e) => setNewSupplier(prev => ({ ...prev, message_template: e.target.value }))}
                  className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  rows="3"
                  placeholder="Messaggio che precederà ogni ordine..."
                />
              </div>

              <div className="flex space-x-3">
                <button
                  onClick={() => {
                    setIsAdding(false);
                    setEditingSupplier(null);
                    setNewSupplier({
                      name: '',
                      contact_method: 'whatsapp',
                      contact: '',
                      products: [],
                      message_template: 'Buongiorno, vorremmo ordinare i seguenti prodotti:'
                    });
                  }}
                  className="flex-1 py-3 border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-50"
                  disabled={isSubmitting}
                >
                  Annulla
                </button>
                <button
                  onClick={saveSupplier}
                  disabled={isSubmitting}
                  className="flex-1 py-3 bg-blue-500 text-white rounded-lg hover:bg-blue-600 disabled:bg-blue-300 flex items-center justify-center space-x-2"
                >
                  {isSubmitting ? (
                    <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" />
                  ) : (
                    <Check size={16} />
                  )}
                  <span>{isSubmitting ? 'Salvando...' : 'Salva'}</span>
                </button>
              </div>
            </div>
          )}
        </div>
      </div>
    );
  };

  const SchedulePage = () => {
    const [selectedDate, setSelectedDate] = useState('');
    const [selectedTime, setSelectedTime] = useState('09:00');
    const [selectedSupplier, setSelectedSupplier] = useState('');
    const [orderItems, setOrderItems] = useState({});
    const [additionalItems, setAdditionalItems] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);

    const scheduleOrder = async () => {
      if (!selectedDate || !selectedSupplier) {
        toast.error('Seleziona data e fornitore');
        return;
      }

      setIsSubmitting(true);

      try {
        const supplier = suppliers.find(s => s.id.toString() === selectedSupplier);
        
        const scheduledOrderData = {
          user_id: user.id,
          supplier_id: selectedSupplier,
          scheduled_date: selectedDate,
          time_to_send: selectedTime,
          order_data: JSON.stringify({
            items: orderItems,
            additional_items: additionalItems
          })
        };

        const newScheduledOrder = await supabaseHelpers.createScheduledOrder(scheduledOrderData);
        
        setScheduledOrders(prev => [...prev, { ...newScheduledOrder, suppliers: supplier }]);
        toast.success(`Ordine programmato per ${selectedDate} alle ${selectedTime} a ${supplier.name}`);
        
        // Reset form
        setSelectedDate('');
        setSelectedTime('09:00');
        setSelectedSupplier('');
        setOrderItems({});
        setAdditionalItems('');

        // Ask if user wants to schedule another order
        setTimeout(() => {
          if (window.confirm('Ordine programmato con successo! Vuoi programmarne un altro?')) {
            // Stay on the same page
          } else {
            setCurrentPage('home');
          }
        }, 1000);

      } catch (error) {
        console.error('Error scheduling order:', error);
        toast.error('Errore durante la programmazione');
      } finally {
        setIsSubmitting(false);
      }
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
          <div className="bg-white rounded-xl p-4 shadow-sm">
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Data Programmazione
            </label>
            <input
              type="date"
              value={selectedDate}
              onChange={(e) => setSelectedDate(e.target.value)}
              min={new Date().toISOString().split('T')[0]}
              className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
          </div>

          <div className="bg-white rounded-xl p-4 shadow-sm">
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Ora Invio
            </label>
            <input
              type="time"
              value={selectedTime}
              onChange={(e) => setSelectedTime(e.target.value)}
              className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
          </div>

          <div className="bg-white rounded-xl p-4 shadow-sm">
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Seleziona Fornitore
            </label>
            <select
              value={selectedSupplier}
              onChange={(e) => setSelectedSupplier(e.target.value)}
              className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
              <option value="">Scegli un fornitore...</option>
              {suppliers.map(supplier => (
                <option key={supplier.id} value={supplier.id}>
                  {supplier.name}
                </option>
              ))}
            </select>
          </div>

          {selectedSupplierData && selectedSupplierData.products && (
            <div className="bg-white rounded-xl p-4 shadow-sm">
              <h3 className="font-medium text-gray-900 mb-4">Prodotti</h3>
              <div className="space-y-3">
                {selectedSupplierData.products.map(product => (
                  <div key={product} className="flex items-center justify-between p-2 border border-gray-100 rounded-lg">
                    <label className="flex items-center space-x-3 flex-1">
                      <input
                        type="checkbox"
                        checked={orderItems[product] && orderItems[product] !== '0'}
                        onChange={(e) => {
                          if (!e.target.checked) {
                            setOrderItems(prev => ({ ...prev, [product]: '0' }));
                          }
                        }}
                        className="rounded border-gray-300 text-blue-600 focus:ring-blue-500"
                      />
                      <span className="text-sm text-gray-700">{product}</span>
                    </label>
                    <input
                      type="text"
                      placeholder="Qt."
                      value={orderItems[product] || ''}
                      onChange={(e) => setOrderItems(prev => ({ ...prev, [product]: e.target.value }))}
                      className="w-16 p-1 text-center border border-gray-200 rounded text-sm"
                    />
                  </div>
                ))}
              </div>
            </div>
          )}

          {selectedSupplierData && (
            <div className="bg-white rounded-xl p-4 shadow-sm">
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Prodotti Aggiuntivi
              </label>
              <textarea
                value={additionalItems}
                onChange={(e) => setAdditionalItems(e.target.value)}
                placeholder="Inserisci prodotti non in lista..."
                className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                rows="3"
              />
            </div>
          )}

          {scheduledOrders.length > 0 && (
            <div className="bg-white rounded-xl p-4 shadow-sm">
              <h3 className="font-medium text-gray-900 mb-4">Ordini Programmati</h3>
              <div className="space-y-3">
                {scheduledOrders.map(order => {
                  const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers;
                  return (
                    <div key={order.id} className="p-3 bg-purple-50 rounded-lg">
                      <div className="flex justify-between items-center">
                        <div>
                          <p className="font-medium text-sm text-purple-900">{supplier?.name || 'Fornitore eliminato'}</p>
                          <p className="text-xs text-purple-700">
                            {new Date(order.scheduled_date).toLocaleDateString('it-IT')} alle {order.time_to_send}
                          </p>
                          {order.is_sent && (
                            <span className="inline-block mt-1 px-2 py-1 bg-green-100 text-green-800 text-xs rounded-full">
                              Inviato
                            </span>
                          )}
                        </div>
                        <div className="flex items-center space-x-2">
                          <Bell size={16} className="text-purple-600" />
                          {!order.is_sent && (
                            <button
                              onClick={() => deleteScheduledOrder(order.id)}
                              className="p-1 text-red-500 hover:bg-red-100 rounded"
                            >
                              <Trash2 size={14} />
                            </button>
                          )}
                        </div>
                      </div>
                    </div>
                  );
                })}
              </div>
            </div>
          )}

          {selectedDate && selectedSupplierData && (Object.keys(orderItems).some(key => orderItems[key] && orderItems[key] !== '0') || additionalItems.trim()) && (
            <button
              onClick={scheduleOrder}
              disabled={isSubmitting}
              className="w-full bg-purple-500 text-white py-3 rounded-lg font-medium hover:bg-purple-600 transition-colors flex items-center justify-center space-x-2 disabled:bg-purple-300"
            >
              {isSubmitting ? (
                <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" />
              ) : (
                <Calendar size={20} />
              )}
              <span>{isSubmitting ? 'Programmando...' : 'Programma Ordine'}</span>
            </button>
          )}
        </div>
      </div>
    );
  };

  const HistoryPage = () => {
    const [showFilters, setShowFilters] = useState(false);

    /* eslint-disable react-hooks/exhaustive-deps */
    const filteredOrders = useMemo(() => {
      let filtered = [...orders];

      // Filter by date range
      if (filters.dateFrom) {
        filtered = filtered.filter(order => 
          new Date(order.sent_at || order.created_at) >= new Date(filters.dateFrom)
        );
      }
      if (filters.dateTo) {
        filtered = filtered.filter(order => 
          new Date(order.sent_at || order.created_at) <= new Date(filters.dateTo)
        );
      }

      // Filter by supplier
      if (filters.supplier) {
        filtered = filtered.filter(order => order.supplier_id.toString() === filters.supplier);
      }

      // Filter by status
      if (filters.status) {
        filtered = filtered.filter(order => order.status === filters.status);
      }

      return filtered;
    }, [orders, filters]);
    /* eslint-enable react-hooks/exhaustive-deps */

    const clearFilters = () => {
      setFilters({
        dateFrom: '',
        dateTo: '',
        supplier: '',
        status: ''
      });
    };

    const exportFilteredData = () => {
      const dataToExport = {
        orders: filteredOrders,
        filters: filters,
        exportDate: new Date().toISOString()
      };
      
      const dataStr = JSON.stringify(dataToExport, null, 2);
      const dataUri = 'data:application/json;charset=utf-8,'+ encodeURIComponent(dataStr);
      
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
          {/* Filter and Export Bar */}
          <div className="flex justify-between items-center mb-6">
            <button
              onClick={() => setShowFilters(!showFilters)}
              className="flex items-center space-x-2 px-4 py-2 bg-white border border-gray-200 rounded-lg text-sm hover:bg-gray-50"
            >
              <Filter size={16} />
              <span>Filtri</span>
              {Object.values(filters).some(v => v !== '') && (
                <span className="bg-blue-500 text-white text-xs px-2 py-1 rounded-full">
                  {Object.values(filters).filter(v => v !== '').length}
                </span>
              )}
            </button>
            
            <button
              onClick={exportFilteredData}
              className="flex items-center space-x-2 px-4 py-2 bg-green-500 text-white rounded-lg text-sm hover:bg-green-600"
            >
              <Download size={16} />
              <span>Esporta</span>
            </button>
          </div>

          {/* Filters Panel */}
          {showFilters && (
            <div className="bg-white rounded-xl p-4 shadow-sm mb-6 space-y-4">
              <div className="flex justify-between items-center">
                <h3 className="font-medium text-gray-900">Filtri</h3>
                <button
                  onClick={clearFilters}
                  className="text-sm text-blue-500 hover:text-blue-600"
                >
                  Pulisci
                </button>
              </div>
              
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="block text-xs font-medium text-gray-700 mb-1">
                    Da Data
                  </label>
                  <input
                    type="date"
                    value={filters.dateFrom}
                    onChange={(e) => setFilters(prev => ({ ...prev, dateFrom: e.target.value }))}
                    className="w-full p-2 text-sm border border-gray-200 rounded-lg focus:ring-1 focus:ring-blue-500"
                  />
                </div>
                
                <div>
                  <label className="block text-xs font-medium text-gray-700 mb-1">
                    A Data
                  </label>
                  <input
                    type="date"
                    value={filters.dateTo}
                    onChange={(e) => setFilters(prev => ({ ...prev, dateTo: e.target.value }))}
                    className="w-full p-2 text-sm border border-gray-200 rounded-lg focus:ring-1 focus:ring-blue-500"
                  />
                </div>
              </div>
              
              <div>
                <label className="block text-xs font-medium text-gray-700 mb-1">
                  Fornitore
                </label>
                <select
                  value={filters.supplier}
                  onChange={(e) => setFilters(prev => ({ ...prev, supplier: e.target.value }))}
                  className="w-full p-2 text-sm border border-gray-200 rounded-lg focus:ring-1 focus:ring-blue-500"
                >
                  <option value="">Tutti i fornitori</option>
                  {suppliers.map(supplier => (
                    <option key={supplier.id} value={supplier.id}>
                      {supplier.name}
                    </option>
                  ))}
                </select>
              </div>
              
              <div>
                <label className="block text-xs font-medium text-gray-700 mb-1">
                  Stato
                </label>
                <select
                  value={filters.status}
                  onChange={(e) => setFilters(prev => ({ ...prev, status: e.target.value }))}
                  className="w-full p-2 text-sm border border-gray-200 rounded-lg focus:ring-1 focus:ring-blue-500"
                >
                  <option value="">Tutti gli stati</option>
                  <option value="sent">Inviato</option>
                  <option value="confirmed">Confermato</option>
                  <option value="delivered">Consegnato</option>
                </select>
              </div>
            </div>
          )}

          {/* Results Summary */}
          <div className="flex justify-between items-center mb-4">
            <p className="text-sm text-gray-600">
              {filteredOrders.length} {filteredOrders.length === 1 ? 'ordine trovato' : 'ordini trovati'}
            </p>
          </div>

          {/* Orders List */}
          {filteredOrders.length === 0 ? (
            <div className="text-center py-12">
              <History size={48} className="mx-auto text-gray-300 mb-4" />
              <p className="text-gray-500 mb-2">
                {orders.length === 0 ? 'Nessun ordine inviato ancora' : 'Nessun ordine trovato con questi filtri'}
              </p>
              {orders.length === 0 && (
                <button
                  onClick={() => setCurrentPage('createOrder')}
                  className="text-blue-500 hover:text-blue-600 font-medium"
                >
                  Crea il primo ordine
                </button>
              )}
            </div>
          ) : (
            <div className="space-y-4">
              {filteredOrders.map(order => {
                const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers;
                return (
                  <div key={order.id} className="bg-white rounded-xl p-4 shadow-sm">
                    <div className="flex justify-between items-start mb-3">
                      <div>
                        <h3 className="font-medium text-gray-900">{supplier?.name || 'Fornitore eliminato'}</h3>
                        <p className="text-sm text-gray-500">
                          {new Date(order.sent_at || order.created_at).toLocaleDateString('it-IT')} - {new Date(order.sent_at || order.created_at).toLocaleTimeString('it-IT', { hour: '2-digit', minute: '2-digit' })}
                        </p>
                      </div>
                      <span className={`px-2 py-1 text-xs rounded-full flex items-center space-x-1 ${ 
                        order.status === 'sent' ? 'bg-green-100 text-green-800' :
                        order.status === 'confirmed' ? 'bg-blue-100 text-blue-800' :
                        order.status === 'delivered' ? 'bg-purple-100 text-purple-800' :
                        'bg-gray-100 text-gray-800'
                      }`}>
                        <Check size={12} />
                        <span>
                          {order.status === 'sent' ? 'Inviato' :
                           order.status === 'confirmed' ? 'Confermato' :
                           order.status === 'delivered' ? 'Consegnato' : 'Sconosciuto'}
                        </span>
                      </span>
                    </div>
                    
                    <div className="border-t pt-3">
                      <div className="bg-gray-50 p-3 rounded-lg mb-3">
                        <pre className="text-xs text-gray-700 whitespace-pre-wrap">{order.order_message}</pre>
                      </div>
                    </div>
                    
                    <div className="pt-3 border-t">
                      <p className="text-xs text-gray-500">
                        Inviato via {supplier?.contact_method || 'N/A'} a {supplier?.contact || 'N/A'}
                      </p>
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

  const AnalyticsDashboard = () => (
    <div className="min-h-screen bg-gray-50">
      <Header title="Dashboard Analytics" onBack={() => setCurrentPage('home')} />
      
      <div className="max-w-sm mx-auto px-6 py-6 space-y-6">
        {/* Stats Cards */}
        <div className="grid grid-cols-2 gap-4">
          <div className="bg-white rounded-xl p-4 shadow-sm">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-2xl font-bold text-blue-600">{analytics.totalOrders}</p>
                <p className="text-xs text-gray-500">Ordini Totali</p>
              </div>
              <ShoppingCart className="text-blue-500" size={24} />
            </div>
          </div>
          
          <div className="bg-white rounded-xl p-4 shadow-sm">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-2xl font-bold text-green-600">{analytics.totalSuppliers}</p>
                <p className="text-xs text-gray-500">Fornitori</p>
              </div>
              <Users className="text-green-500" size={24} />
            </div>
          </div>
          
          <div className="bg-white rounded-xl p-4 shadow-sm">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-2xl font-bold text-purple-600">{analytics.ordersThisWeek}</p>
                <p className="text-xs text-gray-500">Questa Settimana</p>
              </div>
              <Calendar className="text-purple-500" size={24} />
            </div>
          </div>
          
          <div className="bg-white rounded-xl p-4 shadow-sm">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-lg font-bold text-orange-600 truncate">{analytics.mostOrderedProduct}</p>
                <p className="text-xs text-gray-500">Più Ordinato</p>
              </div>
              <BarChart3 className="text-orange-500" size={24} />
            </div>
          </div>
        </div>

        {/* Quick Actions */}
        <div className="bg-white rounded-xl p-4 shadow-sm">
          <h3 className="font-medium text-gray-900 mb-4">Azioni Rapide</h3>
          <div className="space-y-3">
            <button
              onClick={() => setCurrentPage('createOrder')}
              className="w-full p-3 bg-blue-50 text-blue-700 rounded-lg text-left hover:bg-blue-100 transition-colors"
            >
              <div className="flex items-center space-x-3">
                <ShoppingCart size={16} />
                <span className="text-sm font-medium">Crea Nuovo Ordine</span>
              </div>
            </button>
            
            <button
              onClick={() => setCurrentPage('suppliers')}
              className="w-full p-3 bg-green-50 text-green-700 rounded-lg text-left hover:bg-green-100 transition-colors"
            >
              <div className="flex items-center space-x-3">
                <Plus size={16} />
                <span className="text-sm font-medium">Aggiungi Fornitore</span>
              </div>
            </button>
          </div>
        </div>

        {/* Recent Activity */}
        <div className="bg-white rounded-xl p-4 shadow-sm">
          <h3 className="font-medium text-gray-900 mb-4">Attività Recente</h3>
          {orders.slice(0, 3).map(order => {
            const supplier = suppliers.find(s => s.id === order.supplier_id) || order.suppliers;
            return (
              <div key={order.id} className="flex items-center justify-between py-2 border-b border-gray-100 last:border-b-0">
                <div>
                  <p className="text-sm font-medium text-gray-900">{supplier?.name || 'Fornitore eliminato'}</p>
                  <p className="text-xs text-gray-500">{new Date(order.sent_at || order.created_at).toLocaleDateString('it-IT')}</p>
                </div>
                <span className="px-2 py-1 bg-green-100 text-green-800 text-xs rounded-full">
                  Inviato
                </span>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );

  const SettingsPage = () => {
    const handleLogout = async () => {
      await supabase.auth.signOut();
      toast.success('Logout effettuato');
      setCurrentPage('auth');
    };

    return (
      <div className="min-h-screen bg-gray-50">
        <Header title="Impostazioni" onBack={() => setCurrentPage('home')} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-4">
          <div className="bg-white rounded-xl p-4 shadow-sm">
            <div className="flex items-center space-x-4">
              <div className="w-12 h-12 bg-gray-200 rounded-full flex items-center justify-center">
                <User size={24} className="text-gray-500" />
              </div>
              <div>
                <p className="font-medium text-gray-900">Utente</p>
                <p className="text-sm text-gray-500">{user?.email}</p>
              </div>
            </div>
          </div>
          
          <button
            onClick={handleLogout}
            className="w-full flex items-center justify-center space-x-2 py-3 bg-red-500 text-white rounded-lg font-medium hover:bg-red-600 transition-colors"
          >
            <LogOut size={16} />
            <span>Esci</span>
          </button>
        </div>
      </div>
    );
  };

  // --- Main Render Logic ---

  const renderPage = () => {
    if (loading) {
      return (
        <div className="min-h-screen bg-gray-50 flex items-center justify-center">
          <div className="spinner w-8 h-8" />
        </div>
      );
    }

    switch (currentPage) {
      case 'auth':
        return <AuthPage />;
      case 'home':
        return <HomePage />;
      case 'createOrder':
        return <CreateOrderPage />;
      case 'suppliers':
        return <SuppliersPage />;
      case 'schedule':
        return <SchedulePage />;
      case 'history':
        return <HistoryPage />;
      case 'analytics':
        return <AnalyticsDashboard />;
      case 'settings':
        return <SettingsPage />;
      default:
        return <HomePage />;
    }
  };

  return (
    <>
      <Toaster position="top-center" reverseOrder={false} />
      {renderPage()}
    </>
  );
};

export default App;