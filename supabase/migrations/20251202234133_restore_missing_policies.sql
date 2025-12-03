-- Fix admin role for seed user
UPDATE public.profiles 
SET role = 'admin' 
WHERE id = 'c23a8c58-925a-47ce-9491-9e0db8b5c16a';

-- Restore Policies for PROFILES
ALTER TABLE "public"."profiles" ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "profiles_select_policy" ON "public"."profiles";
CREATE POLICY "profiles_select_policy" ON "public"."profiles" FOR SELECT USING (
  (id = auth.uid()) OR (public.is_admin())
);

DROP POLICY IF EXISTS "profiles_update_policy" ON "public"."profiles";
CREATE POLICY "profiles_update_policy" ON "public"."profiles" FOR UPDATE USING (
  (id = auth.uid()) OR (public.is_admin())
);

-- Restore Policies for ORDERS
ALTER TABLE "public"."orders" ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "orders_select_policy" ON "public"."orders";
CREATE POLICY "orders_select_policy" ON "public"."orders" FOR SELECT USING (
  (user_id = auth.uid()) OR (public.is_admin())
);

DROP POLICY IF EXISTS "orders_insert_policy" ON "public"."orders";
CREATE POLICY "orders_insert_policy" ON "public"."orders" FOR INSERT WITH CHECK (
  (user_id = auth.uid()) OR (public.is_admin())
);

-- Restore Policies for SUPPLIERS
ALTER TABLE "public"."suppliers" ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "suppliers_select_policy" ON "public"."suppliers";
CREATE POLICY "suppliers_select_policy" ON "public"."suppliers" FOR SELECT USING (
  (user_id = auth.uid()) OR (public.is_admin())
);

-- Restore Policies for SCHEDULED_ORDERS
ALTER TABLE "public"."scheduled_orders" ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "scheduled_orders_select_policy" ON "public"."scheduled_orders";
CREATE POLICY "scheduled_orders_select_policy" ON "public"."scheduled_orders" FOR SELECT USING (
  (user_id = auth.uid()) OR (public.is_admin())
);

-- Restore Policies for NOTIFICATIONS
ALTER TABLE "public"."notifications" ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "notifications_select_policy" ON "public"."notifications";
CREATE POLICY "notifications_select_policy" ON "public"."notifications" FOR SELECT USING (
  (user_id = auth.uid()) OR (public.is_admin())
);

DROP POLICY IF EXISTS "notifications_update_policy" ON "public"."notifications";
CREATE POLICY "notifications_update_policy" ON "public"."notifications" FOR UPDATE USING (
  (user_id = auth.uid()) OR (public.is_admin())
);
