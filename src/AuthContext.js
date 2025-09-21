
import { useState, useEffect, createContext, useContext, useCallback } from 'react';
import { supabase, supabaseHelpers } from './supabase';
import { toast } from 'react-hot-toast';

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);

  // Data states moved from App.js
  const [suppliers, setSuppliers] = useState([]);
  const [orders, setOrders] = useState([]);
  const [scheduledOrders, setScheduledOrders] = useState([]);
  const [analytics, setAnalytics] = useState({
    totalOrders: 0,
    totalSuppliers: 0,
    ordersThisWeek: 0,
    mostOrderedProduct: ''
  });

  const calculateAnalytics = useCallback((ordersData, suppliersData) => {
    const now = new Date();
    const weekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);
    const ordersThisWeek = ordersData.filter(order => new Date(order.sent_at || order.created_at) > weekAgo).length;
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

      calculateAnalytics(ordersData, formattedSuppliers);
    } catch (error) {
      console.error('Error loading data:', error);
      toast.error('Errore durante il caricamento dei dati');
    }
  }, [calculateAnalytics]);

  useEffect(() => {
    const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
      setLoading(true);
      const currentUser = session?.user;
      setUser(currentUser ?? null);
      if (currentUser) {
        await loadData(currentUser.id);
      } else {
        // Clear data on sign out
        setSuppliers([]);
        setOrders([]);
        setScheduledOrders([]);
        setAnalytics({ totalOrders: 0, totalSuppliers: 0, ordersThisWeek: 0, mostOrderedProduct: '' });
      }
      setLoading(false);
    });

    return () => {
      subscription.unsubscribe();
    };
  }, [loadData]);

  const value = {
    user,
    suppliers,
    orders,
    scheduledOrders,
    analytics,
    loading,
    setOrders, // Pass setters to update state from App.js
    setSuppliers,
    setScheduledOrders,
    signOut: () => supabase.auth.signOut(),
  };

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  return useContext(AuthContext);
};
