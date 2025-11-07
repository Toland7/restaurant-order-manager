-- Drop the existing policies
DROP POLICY "Users can delete order items of own orders" ON "public"."order_items";
DROP POLICY "Users can delete order items of their own orders" ON "public"."order_items";
DROP POLICY "Users can insert order items for their own orders" ON "public"."order_items";
DROP POLICY "Users can insert order items to own orders" ON "public"."order_items";
DROP POLICY "Users can update order items of own orders" ON "public"."order_items";
DROP POLICY "Users can update order items of their own orders" ON "public"."order_items";
DROP POLICY "Users can view order items of own orders" ON "public"."order_items";
DROP POLICY "Users can view order items of their own orders" ON "public"."order_items";

-- Create the new policy with the fix
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