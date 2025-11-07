-- Drop the existing policies
DROP POLICY "Users can view own orders" ON "public"."orders";
DROP POLICY "Users can insert own orders" ON "public"."orders";
DROP POLICY "Users can update own orders" ON "public"."orders";
DROP POLICY "Users can delete own orders" ON "public"."orders";
DROP POLICY "Users can manage their own orders" ON "public"."orders";

-- Create the new policy with the fix
CREATE POLICY "Users can manage their own orders"
ON "public"."orders"
AS PERMISSIVE
FOR ALL
TO public
USING (( (select auth.uid()) = user_id))
WITH CHECK (( (select auth.uid()) = user_id));