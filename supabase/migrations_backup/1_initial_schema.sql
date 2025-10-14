-- Create suppliers table
CREATE TABLE suppliers (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  contact_method TEXT NOT NULL CHECK (contact_method IN ('whatsapp', 'email', 'sms')),
  contact TEXT NOT NULL,
  message_template TEXT DEFAULT 'Buongiorno, vorremmo ordinare i seguenti prodotti:',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create products table
CREATE TABLE products (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  supplier_id UUID REFERENCES suppliers(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  unit TEXT DEFAULT 'pz',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create orders table
CREATE TABLE orders (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  supplier_id UUID REFERENCES suppliers(id) ON DELETE CASCADE,
  order_message TEXT NOT NULL,
  additional_items TEXT,
  status TEXT DEFAULT 'sent' CHECK (status IN ('draft', 'sent', 'confirmed', 'delivered')),
  scheduled_date DATE,
  sent_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create order_items table
CREATE TABLE order_items (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
  product_id UUID REFERENCES products(id) ON DELETE CASCADE,
  product_name TEXT NOT NULL,
  quantity TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create scheduled_orders table
CREATE TABLE scheduled_orders (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  supplier_id UUID REFERENCES suppliers(id) ON DELETE CASCADE,
  order_data JSONB NOT NULL,
  scheduled_date DATE NOT NULL,
  time_to_send TIME DEFAULT '09:00',
  is_sent BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create notifications table
CREATE TABLE notifications (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  message TEXT NOT NULL,
  type TEXT DEFAULT 'info' CHECK (type IN ('info', 'success', 'warning', 'error')),
  is_read BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for better performance
CREATE INDEX suppliers_user_id_idx ON suppliers(user_id);
CREATE INDEX products_supplier_id_idx ON products(supplier_id);
CREATE INDEX orders_user_id_idx ON orders(user_id);
CREATE INDEX orders_supplier_id_idx ON orders(supplier_id);
CREATE INDEX orders_sent_at_idx ON orders(sent_at);
CREATE INDEX order_items_order_id_idx ON order_items(order_id);
CREATE INDEX scheduled_orders_user_id_idx ON scheduled_orders(user_id);
CREATE INDEX scheduled_orders_date_idx ON scheduled_orders(scheduled_date, is_sent);
CREATE INDEX notifications_user_id_idx ON notifications(user_id, is_read);

-- Enable Row Level Security
ALTER TABLE suppliers ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE scheduled_orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;

-- Create policies for suppliers
CREATE POLICY "Users can view own suppliers" ON suppliers
  FOR SELECT USING ((select auth.uid()) = user_id);
CREATE POLICY "Users can insert own suppliers" ON suppliers
  FOR INSERT WITH CHECK ((select auth.uid()) = user_id);
CREATE POLICY "Users can update own suppliers" ON suppliers
  FOR UPDATE USING ((select auth.uid()) = user_id);
CREATE POLICY "Users can delete own suppliers" ON suppliers
  FOR DELETE USING ((select auth.uid()) = user_id);

-- Create policies for products
CREATE POLICY "Users can view products of own suppliers" ON products
  FOR SELECT USING (
    supplier_id IN (SELECT id FROM suppliers WHERE user_id = auth.uid())
  );
CREATE POLICY "Users can insert products to own suppliers" ON products
  FOR INSERT WITH CHECK (
    supplier_id IN (SELECT id FROM suppliers WHERE user_id = auth.uid())
  );
CREATE POLICY "Users can update products of own suppliers" ON products
  FOR UPDATE USING (
    supplier_id IN (SELECT id FROM suppliers WHERE user_id = auth.uid())
  );
CREATE POLICY "Users can delete products of own suppliers" ON products
  FOR DELETE USING (
    supplier_id IN (SELECT id FROM suppliers WHERE user_id = auth.uid())
  );

-- Create policies for orders
CREATE POLICY "Users can view own orders" ON orders
  FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own orders" ON orders
  FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own orders" ON orders
  FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Users can delete own orders" ON orders
  FOR DELETE USING (auth.uid() = user_id);

-- Create policies for order_items
CREATE POLICY "Users can view order items of own orders" ON order_items
  FOR SELECT USING (
    order_id IN (SELECT id FROM orders WHERE user_id = auth.uid())
  );
CREATE POLICY "Users can insert order items to own orders" ON order_items
  FOR INSERT WITH CHECK (
    order_id IN (SELECT id FROM orders WHERE user_id = auth.uid())
  );
CREATE POLICY "Users can update order items of own orders" ON order_items
  FOR UPDATE USING (
    order_id IN (SELECT id FROM orders WHERE user_id = auth.uid())
  );
CREATE POLICY "Users can delete order items of own orders" ON order_items
  FOR DELETE USING (
    order_id IN (SELECT id FROM orders WHERE user_id = auth.uid())
  );

-- Create policies for scheduled_orders
CREATE POLICY "Users can view own scheduled orders" ON scheduled_orders
  FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own scheduled orders" ON scheduled_orders
  FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own scheduled orders" ON scheduled_orders
  FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Users can delete own scheduled orders" ON scheduled_orders
  FOR DELETE USING (auth.uid() = user_id);

-- Create policies for notifications
CREATE POLICY "Users can view own notifications" ON notifications
  FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own notifications" ON notifications
  FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own notifications" ON notifications
  FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Users can delete own notifications" ON notifications
  FOR DELETE USING (auth.uid() = user_id);

-- Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = '';

-- Create trigger for suppliers updated_at
CREATE TRIGGER update_suppliers_updated_at
    BEFORE UPDATE ON suppliers
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();
