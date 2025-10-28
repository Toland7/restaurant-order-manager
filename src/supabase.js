import { createClient } from '@supabase/supabase-js'

// VERSION_220251028_1530_DEBUG_API_KEY_FILTER_FIX
const supabaseUrl = process.env.REACT_APP_SUPABASE_URL
const supabaseAnonKey = process.env.REACT_APP_SUPABASE_ANON_KEY

console.log('Supabase URL:', supabaseUrl);
console.log('Supabase Anon Key (first 5 chars):', supabaseAnonKey ? supabaseAnonKey.substring(0, 5) : 'N/A');

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error('Missing Supabase environment variables. Please check your .env file.')
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey, {
  auth: {
    persistSession: true,
    autoRefreshToken: true,
  }
});

// Helper functions for common operations
export const supabaseHelpers = {
  // Suppliers
  async getSuppliers(userId) {
    const { data, error } = await supabase
      .from('suppliers')
      .select(`
        *,
        products (
          id,
          name,
          unit
        )
      `)
      .eq('user_id', userId)
      .order('created_at', { ascending: false });
    
    if (error) throw error;
    return data;
  },

  async createSupplier(supplierData) {
    const { data, error } = await supabase
      .from('suppliers')
      .insert([supplierData])
      .select()
      .single();
    
    if (error) throw error;
    return data;
  },

  async updateSupplier(id, supplierData) {
    const { data, error } = await supabase
      .from('suppliers')
      .update(supplierData)
      .eq('id', id)
      .select()
      .single();
    
    if (error) throw error;
    return data;
  },

  async deleteSupplier(id) {
    const { error } = await supabase
      .from('suppliers')
      .delete()
      .eq('id', id);
    
    if (error) throw error;
  },

  // Products
  async createProducts(supplierId, products) {
    if (!products || products.length === 0) return [];
    
    const productsData = products.map(name => ({
      supplier_id: supplierId,
      name,
      unit: 'pz' // Default unit
    }));

    const { data, error } = await supabase
      .from('products')
      .insert(productsData)
      .select();
    
    if (error) throw error;
    return data;
  },

  async deleteProductsBySupplier(supplierId) {
    const { error } = await supabase
      .from('products')
      .delete()
      .eq('supplier_id', supplierId);
    
    if (error) throw error;
  },

  // Orders
  async getOrders(userId, filters = {}) {
    let query = supabase
      .from('orders')
      .select(`
        *,
        suppliers (
          name,
          contact_method,
          contact
        ),
        order_items (
          product_name,
          quantity
        )
      `)
      .eq('user_id', userId)
      .order('created_at', { ascending: false });

    // Apply filters
    if (filters.supplierId) {
      query = query.eq('supplier_id', filters.supplierId);
    }
    if (filters.status) {
      query = query.eq('status', filters.status);
    }
    if (filters.dateFrom) {
      query = query.gte('sent_at', filters.dateFrom);
    }
    if (filters.dateTo) {
      query = query.lte('sent_at', filters.dateTo);
    }

    const { data, error } = await query;
    if (error) throw error;
    return data;
  },

  async createOrder(orderData, orderItems) {
    // Start a transaction-like operation
    const { data: order, error: orderError } = await supabase
      .from('orders')
      .insert([orderData])
      .select()
      .single();

    if (orderError) throw orderError;

    // Create order items if any
    if (orderItems && orderItems.length > 0) {
      const itemsData = orderItems.map(item => ({
        ...item,
        order_id: order.id
      }));

      const { error: itemsError } = await supabase
        .from('order_items')
        .insert(itemsData);

      if (itemsError) throw itemsError;
    }

    return order;
  },

  // Scheduled Orders
  async getScheduledOrders(userId) {
    const { data, error } = await supabase
      .from('scheduled_orders')
      .select(`
        *,
        suppliers (
          name,
          contact_method,
          contact
        )
      `)
      .eq('user_id', userId)

      .order('scheduled_at', { ascending: true });
    
    if (error) throw error;
    return data;
  },

  async createScheduledOrder(scheduledOrderData) {
    const { data, error } = await supabase
      .from('scheduled_orders')
      .insert([scheduledOrderData])
      .select()
      .single();
    
    if (error) throw error;
    return data;
  },

  async deleteScheduledOrder(id) {
    const { error } = await supabase
      .from('scheduled_orders')
      .delete()
      .eq('id', id);
    
    if (error) throw error;
  },

  async updateScheduledOrder(id, scheduledOrderData) {
    const { data, error } = await supabase
      .from('scheduled_orders')
      .update(scheduledOrderData)
      .eq('id', id)
      .select()
      .single();
    
    if (error) throw error;
    return data;
  },

  async getScheduledOrderById(id) {
    const { data, error } = await supabase
      .from('scheduled_orders')
      .select('*')
      .eq('id', id)
      .single();
    
    if (error) throw error;
    return data;
  },

      async getAllNotifications(userId) {
        const { data, error } = await supabase
          .from('notifications')
          .select('*')
          .eq('user_id', userId)
          .order('created_at', { ascending: false });

        console.log('🔕 Raw response from Supabase query:', { data, error });

        if (error) throw error;
        return data;
      },
    
        // OLD: getNotifications function (commented out)
    
        /*
    
        async getNotifications(userId, includeRead = true) {
    
          let query = supabase
    
            .from('notifications')
    
            .select('*')
    
            .eq('user_id', userId);
    
      
    
          if (!includeRead) {
    
            query = query.eq('is_read', false);
    
          }
    
      
    
              query = query.order('created_at', { ascending: false });
    
      
    
          
    
      
    
              const response = await query;
    
      
    
              console.log('🔕 Raw response from Supabase query:', response);
    
      
    
          
    
      
    
              const { data, error } = response;
    
          if (error) throw error;
    
          return data;
    
        },
    
        */
    
      
    
        async getUnreadNotificationsCount(userId) {
    const { count, error } = await supabase
      .from('notifications')
      .select('*', { count: 'exact', head: true })
      .eq('user_id', userId)
      .eq('is_read', false);

    if (error) {
      console.error('Error getting unread notifications count:', error);
      return 0;
    }
    return count;
  },

  async markNotificationAsRead(notificationId) {
    const { data, error } = await supabase
      .from('notifications')
      .update({ is_read: true })
      .eq('id', notificationId)
      .select()
      .single();
    
    if (error) throw error;
    return data;
  },

  async deleteNotification(notificationId) {
    const { error } = await supabase
      .from('notifications')
      .delete()
      .eq('id', notificationId);
    
    if (error) throw error;
  },

  async updateUserProfile(userId, profileData) {
    const { data, error } = await supabase
      .from('profiles')
      .update(profileData)
      .eq('id', userId)
      .select()
      .single();
    
    if (error) throw error;
    return data;
  },

  async getUserProfile(userId) {
    const { data, error } = await supabase
      .from('profiles')
      .select('*')
      .eq('id', userId)
      .single();

    if (error) throw error;
    return data;
  },

  // Auth helpers
  async getCurrentUser() {
    const { data: { user }, error } = await supabase.auth.getUser();
    if (error) throw error;
    return user;
  },

  async signOut() {
    const { error } = await supabase.auth.signOut();
    if (error) throw error;
  },

  async deleteCurrentUser() {
    const { data, error } = await supabase.functions.invoke('delete-user', {
      method: 'POST',
    });
    if (error) throw error;
    return data;
  },

  async exportUserData() {
    const { data, error } = await supabase.functions.invoke('export-user-data', {
      method: 'POST',
    });
    if (error) throw error;
    return data;
  },


};