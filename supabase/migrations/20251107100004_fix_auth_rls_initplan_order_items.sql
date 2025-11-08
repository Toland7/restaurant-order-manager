-- Drop the existing policies
DROP POLICY IF EXISTS "Users can delete order items of own orders" ON "public"."order_items";
DROP POLICY IF EXISTS "Users can delete order items of their own orders" ON "public"."order_items";
DROP POLICY IF EXISTS "Users can insert order items for their own orders" ON "public"."order_items";
DROP POLICY IF EXISTS "Users can insert order items to own orders" ON "public"."order_items";
DROP POLICY IF EXISTS "Users can update order items of own orders" ON "public"."order_items";
DROP POLICY IF EXISTS "Users can update order items of their own orders" ON "public"."order_items";
DROP POLICY IF EXISTS "Users can view order items of own orders" ON "public"."order_items";
DROP POLICY IF EXISTS "Users can view order items of their own orders" ON "public"."order_items";

-- Create the new policy with the fix
DO $$
BEGIN
    -- Check if the policy already exists before creating it
    IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE policyname = 'Users can manage order items of own orders' AND tablename = 'order_items') THEN
        CREATE POLICY "Users can manage order items of own orders"
        ON "public"."order_items"
        AS PERMISSIVE
        FOR ALL
        TO public
        USING ((EXISTS ( SELECT 1
           FROM orders
          WHERE ((orders.id = order_items.order_id) AND (orders.user_id = (select auth.uid()))))))
        WITH CHECK ((EXISTS ( SELECT 1
           FROM orders
          WHERE ((orders.id = order_items.order_id) AND (orders.user_id = (select auth.uid()))))));
    END IF;
END
$$;