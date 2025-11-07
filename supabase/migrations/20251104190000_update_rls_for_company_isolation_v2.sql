
-- Helper function to get the current user's company_id
CREATE OR REPLACE FUNCTION public.get_user_company_id()
RETURNS UUID
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  user_company_id UUID;
BEGIN
  SELECT company_id INTO user_company_id
  FROM public.profiles
  WHERE id = auth.uid();

  RETURN user_company_id;
END;
$$;

-- Update RLS for public.orders
DROP POLICY IF EXISTS "Users can view their own orders" ON public.orders;
DROP POLICY IF EXISTS "Users can manage their own orders" ON public.orders;
DROP POLICY IF EXISTS "Users can delete own orders" ON public.orders;
DROP POLICY IF EXISTS "Users can insert own orders" ON public.orders;
DROP POLICY IF EXISTS "Users can update own orders" ON public.orders;

CREATE POLICY "Company members can view their orders" ON public.orders FOR SELECT
USING (company_id = public.get_user_company_id());

CREATE POLICY "Company members can insert their orders" ON public.orders FOR INSERT
WITH CHECK (company_id = public.get_user_company_id());

CREATE POLICY "Company members can update their orders" ON public.orders FOR UPDATE
USING (company_id = public.get_user_company_id())
WITH CHECK (company_id = public.get_user_company_id());

CREATE POLICY "Company members can delete their orders" ON public.orders FOR DELETE
USING (company_id = public.get_user_company_id());

-- Update RLS for public.suppliers
DROP POLICY IF EXISTS "Users can view their own suppliers" ON public.suppliers;
DROP POLICY IF EXISTS "Users can delete own suppliers" ON public.suppliers;
DROP POLICY IF EXISTS "Users can insert own suppliers" ON public.suppliers;
DROP POLICY IF EXISTS "Users can update own suppliers" ON public.suppliers;

CREATE POLICY "Company members can view their suppliers" ON public.suppliers FOR SELECT
USING (company_id = public.get_user_company_id());

CREATE POLICY "Company members can insert their suppliers" ON public.suppliers FOR INSERT
WITH CHECK (company_id = public.get_user_company_id());

CREATE POLICY "Company members can update their suppliers" ON public.suppliers FOR UPDATE
USING (company_id = public.get_user_company_id())
WITH CHECK (company_id = public.get_user_company_id());

CREATE POLICY "Company members can delete their suppliers" ON public.suppliers FOR DELETE
USING (company_id = public.get_user_company_id());

-- Update RLS for public.scheduled_orders
DROP POLICY IF EXISTS "Users can view their own scheduled orders" ON public.scheduled_orders;
DROP POLICY IF EXISTS "Users can manage their own scheduled orders" ON public.scheduled_orders;
DROP POLICY IF EXISTS "Users can delete own scheduled orders" ON public.scheduled_orders;
DROP POLICY IF EXISTS "Users can insert own scheduled orders" ON public.scheduled_orders;
DROP POLICY IF EXISTS "Users can update own scheduled orders" ON public.scheduled_orders;

CREATE POLICY "Company members can view their scheduled orders" ON public.scheduled_orders FOR SELECT
USING (company_id = public.get_user_company_id());

CREATE POLICY "Company members can insert their scheduled orders" ON public.scheduled_orders FOR INSERT
WITH CHECK (company_id = public.get_user_company_id());

CREATE POLICY "Company members can update their scheduled orders" ON public.scheduled_orders FOR UPDATE
USING (company_id = public.get_user_company_id())
WITH CHECK (company_id = public.get_user_company_id());

CREATE POLICY "Company members can delete their scheduled orders" ON public.scheduled_orders FOR DELETE
USING (company_id = public.get_user_company_id());

-- Update RLS for public.notifications
DROP POLICY IF EXISTS "Users can view their own notifications" ON public.notifications;
DROP POLICY IF EXISTS "Users can manage their own notifications" ON public.notifications;
DROP POLICY IF EXISTS "Users can delete own notifications" ON public.notifications;
DROP POLICY IF EXISTS "Users can insert own notifications" ON public.notifications;
DROP POLICY IF EXISTS "Users can update own notifications" ON public.notifications;

CREATE POLICY "Company members can view their notifications" ON public.notifications FOR SELECT
USING (company_id = public.get_user_company_id());

CREATE POLICY "Company members can insert their notifications" ON public.notifications FOR INSERT
WITH CHECK (company_id = public.get_user_company_id());

CREATE POLICY "Company members can update their notifications" ON public.notifications FOR UPDATE
USING (company_id = public.get_user_company_id())
WITH CHECK (company_id = public.get_user_company_id());

CREATE POLICY "Company members can delete their notifications" ON public.notifications FOR DELETE
USING (company_id = public.get_user_company_id());

-- Update RLS for public.order_items (assuming it has a company_id or can be joined)
-- Note: If order_items does not have a company_id directly, it needs to be joined with orders
DROP POLICY IF EXISTS "Users can delete order items of their own orders" ON public.order_items;
DROP POLICY IF EXISTS "Users can insert order items for their own orders" ON public.order_items;
DROP POLICY IF EXISTS "Users can update order items of their own orders" ON public.order_items;
DROP POLICY IF EXISTS "Users can view order items of their own orders" ON public.order_items;
DROP POLICY IF EXISTS "Users can delete order items of own orders" ON public.order_items;
DROP POLICY IF EXISTS "Users can insert order items to own orders" ON public.order_items;
DROP POLICY IF EXISTS "Users can update order items of own orders" ON public.order_items;
DROP POLICY IF EXISTS "Users can view order items of own orders" ON public.order_items;

CREATE POLICY "Company members can view order items" ON public.order_items FOR SELECT
USING (order_id IN (SELECT id FROM public.orders WHERE company_id = public.get_user_company_id()));

CREATE POLICY "Company members can insert order items" ON public.order_items FOR INSERT
WITH CHECK (order_id IN (SELECT id FROM public.orders WHERE company_id = public.get_user_company_id()));

CREATE POLICY "Company members can update order items" ON public.order_items FOR UPDATE
USING (order_id IN (SELECT id FROM public.orders WHERE company_id = public.get_user_company_id()))
WITH CHECK (order_id IN (SELECT id FROM public.orders WHERE company_id = public.get_user_company_id()));

CREATE POLICY "Company members can delete order items" ON public.order_items FOR DELETE
USING (order_id IN (SELECT id FROM public.orders WHERE company_id = public.get_user_company_id()));

-- Update RLS for public.products (assuming it has a company_id or can be joined)
-- Note: If products does not have a company_id directly, it needs to be joined with suppliers
DROP POLICY IF EXISTS "Users can delete products of own suppliers" ON public.products;
DROP POLICY IF EXISTS "Users can insert products to own suppliers" ON public.products;
DROP POLICY IF EXISTS "Users can update products of own suppliers" ON public.products;
DROP POLICY IF EXISTS "Users can view products of own suppliers" ON public.products;

CREATE POLICY "Company members can view products" ON public.products FOR SELECT
USING (supplier_id IN (SELECT id FROM public.suppliers WHERE company_id = public.get_user_company_id()));

CREATE POLICY "Company members can insert products" ON public.products FOR INSERT
WITH CHECK (supplier_id IN (SELECT id FROM public.suppliers WHERE company_id = public.get_user_company_id()));

CREATE POLICY "Company members can update products" ON public.products FOR UPDATE
USING (supplier_id IN (SELECT id FROM public.suppliers WHERE company_id = public.get_user_company_id()))
WITH CHECK (supplier_id IN (SELECT id FROM public.suppliers WHERE company_id = public.get_user_company_id()));

CREATE POLICY "Company members can delete products" ON public.products FOR DELETE
USING (supplier_id IN (SELECT id FROM public.suppliers WHERE company_id = public.get_user_company_id()));
