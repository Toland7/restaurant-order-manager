BEGIN;

-- Migration: 20251107100004_fix_auth_rls_initplan_order_items.sql
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

-- Migration: 20251107100005_fix_multiple_permissive_policies_notifications.sql
-- Drop the existing policies
DROP POLICY IF EXISTS "Users can delete own notifications" ON "public"."notifications";
DROP POLICY IF EXISTS "Users can insert own notifications" ON "public"."notifications";
DROP POLICY IF EXISTS "Users can update own notifications" ON "public"."notifications";
DROP POLICY IF EXISTS "Users can manage their own notifications" ON "public"."notifications";

-- Create the new policy with the fix
CREATE POLICY "Users can manage their own notifications"
ON "public"."notifications"
AS PERMISSIVE
FOR ALL
TO public
USING (( (select auth.uid()) = user_id))
WITH CHECK (( (select auth.uid()) = user_id));

-- Migration: 20251107100006_fix_multiple_permissive_policies_orders.sql
-- Drop the existing policies
DROP POLICY IF EXISTS "Users can view own orders" ON "public"."orders";
DROP POLICY IF EXISTS "Users can insert own orders" ON "public"."orders";
DROP POLICY IF EXISTS "Users can update own orders" ON "public"."orders";
DROP POLICY IF EXISTS "Users can delete own orders" ON "public"."orders";
DROP POLICY IF EXISTS "Users can manage their own orders" ON "public"."orders";

-- Create the new policy with the fix
CREATE POLICY "Users can manage their own orders"
ON "public"."orders"
AS PERMISSIVE
FOR ALL
TO public
USING (( (select auth.uid()) = user_id))
WITH CHECK (( (select auth.uid()) = user_id));

-- Migration: 20251107100007_fix_multiple_permissive_policies_scheduled_orders.sql
-- Drop the existing policies
DROP POLICY IF EXISTS "Users can delete own scheduled orders" ON "public"."scheduled_orders";
DROP POLICY IF EXISTS "Users can insert own scheduled orders" ON "public"."scheduled_orders";
DROP POLICY IF EXISTS "Users can update own scheduled orders" ON "public"."scheduled_orders";
DROP POLICY IF EXISTS "Users can manage their own scheduled orders" ON "public"."scheduled_orders";

-- Create the new policy with the fix
CREATE POLICY "Users can manage their own scheduled orders"
ON "public"."scheduled_orders"
AS PERMISSIVE
FOR ALL
TO public
USING (( (select auth.uid()) = user_id))
WITH CHECK (( (select auth.uid()) = user_id));

-- Migration: 20251108120936_add_subscription_tier_to_companies.sql
ALTER TABLE public.companies
ADD COLUMN IF NOT EXISTS subscription_tier TEXT NOT NULL DEFAULT 'base';

COMMENT ON COLUMN public.companies.subscription_tier IS 'Indica il livello di abbonamento della compagnia (es. base, pro)';

COMMIT;