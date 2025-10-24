-- Enable RLS for tables
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.suppliers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.order_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.scheduled_orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;

-- Policies for 'profiles' table
DROP POLICY IF EXISTS "Users can view their own profile" ON public.profiles;
DROP POLICY IF EXISTS "Users can update their own profile" ON public.profiles;
DROP POLICY IF EXISTS "Users can insert their own profile" ON public.profiles;
DROP POLICY IF EXISTS "Users can delete their own profile" ON public.profiles;
DROP POLICY IF EXISTS "Admins can view all profiles" ON public.profiles;
DROP POLICY IF EXISTS "Admins can update all profiles" ON public.profiles;
CREATE POLICY "Users can view their own profile" ON public.profiles FOR SELECT USING (auth.uid() = id);
CREATE POLICY "Users can update their own profile" ON public.profiles FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "Users can insert their own profile" ON public.profiles FOR INSERT WITH CHECK (auth.uid() = id);
CREATE POLICY "Users can delete their own profile" ON public.profiles FOR DELETE USING (auth.uid() = id);
CREATE POLICY "Admins can view all profiles" ON public.profiles FOR SELECT USING (EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND is_admin = true));
CREATE POLICY "Admins can update all profiles" ON public.profiles FOR UPDATE USING (EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND is_admin = true));

-- Policies for 'suppliers' table
DROP POLICY IF EXISTS "Users can manage their own suppliers" ON public.suppliers;
CREATE POLICY "Users can manage their own suppliers" ON public.suppliers FOR ALL USING (auth.uid() = user_id);

-- Policies for 'products' table
DROP POLICY IF EXISTS "Users can view products of their own suppliers" ON public.products;
DROP POLICY IF EXISTS "Users can insert products for their own suppliers" ON public.products;
DROP POLICY IF EXISTS "Users can update products of their own suppliers" ON public.products;
DROP POLICY IF EXISTS "Users can delete products of their own suppliers" ON public.products;
CREATE POLICY "Users can view products of their own suppliers" ON public.products FOR SELECT USING (EXISTS (SELECT 1 FROM public.suppliers WHERE id = supplier_id AND user_id = auth.uid()));
CREATE POLICY "Users can insert products for their own suppliers" ON public.products FOR INSERT WITH CHECK (EXISTS (SELECT 1 FROM public.suppliers WHERE id = supplier_id AND user_id = auth.uid()));
CREATE POLICY "Users can update products of their own suppliers" ON public.products FOR UPDATE USING (EXISTS (SELECT 1 FROM public.suppliers WHERE id = supplier_id AND user_id = auth.uid()));
CREATE POLICY "Users can delete products of their own suppliers" ON public.products FOR DELETE USING (EXISTS (SELECT 1 FROM public.suppliers WHERE id = supplier_id AND user_id = auth.uid()));

-- Policies for 'orders' table
DROP POLICY IF EXISTS "Users can manage their own orders" ON public.orders;
CREATE POLICY "Users can manage their own orders" ON public.orders FOR ALL USING (auth.uid() = user_id);

-- Policies for 'order_items' table
DROP POLICY IF EXISTS "Users can view order items of their own orders" ON public.order_items;
DROP POLICY IF EXISTS "Users can insert order items for their own orders" ON public.order_items;
DROP POLICY IF EXISTS "Users can update order items of their own orders" ON public.order_items;
DROP POLICY IF EXISTS "Users can delete order items of their own orders" ON public.order_items;
CREATE POLICY "Users can view order items of their own orders" ON public.order_items FOR SELECT USING (EXISTS (SELECT 1 FROM public.orders WHERE id = order_id AND user_id = auth.uid()));
CREATE POLICY "Users can insert order items for their own orders" ON public.order_items FOR INSERT WITH CHECK (EXISTS (SELECT 1 FROM public.orders WHERE id = order_id AND user_id = auth.uid()));
CREATE POLICY "Users can update order items of their own orders" ON public.order_items FOR UPDATE USING (EXISTS (SELECT 1 FROM public.orders WHERE id = order_id AND user_id = auth.uid()));
CREATE POLICY "Users can delete order items of their own orders" ON public.order_items FOR DELETE USING (EXISTS (SELECT 1 FROM public.orders WHERE id = order_id AND user_id = auth.uid()));

-- Policies for 'scheduled_orders' table
DROP POLICY IF EXISTS "Users can manage their own scheduled orders" ON public.scheduled_orders;
CREATE POLICY "Users can manage their own scheduled orders" ON public.scheduled_orders FOR ALL USING (auth.uid() = user_id);

-- Policies for 'notifications' table
DROP POLICY IF EXISTS "Users can manage their own notifications" ON public.notifications;
DROP POLICY IF EXISTS "Admins can view all notifications" ON public.notifications;
CREATE POLICY "Users can manage their own notifications" ON public.notifications FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "Admins can view all notifications" ON public.notifications FOR SELECT USING (EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND is_admin = true));