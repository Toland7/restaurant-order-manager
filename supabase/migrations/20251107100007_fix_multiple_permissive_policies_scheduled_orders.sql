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