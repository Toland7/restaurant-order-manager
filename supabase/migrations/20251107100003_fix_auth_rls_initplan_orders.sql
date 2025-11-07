-- Drop the existing policies
DROP POLICY "Users can view own orders" ON "public"."orders";
DROP POLICY "Users can insert own orders" ON "public"."orders";
DROP POLICY "Users can update own orders" ON "public"."orders";
DROP POLICY "Users can delete own orders" ON "public"."orders";

-- Create the new policies with the fix
CREATE POLICY "Users can view own orders"
ON "public"."orders"
AS PERMISSIVE
FOR SELECT
TO public
USING (( (select auth.uid()) = user_id));

CREATE POLICY "Users can insert own orders"
ON "public"."orders"
AS PERMISSIVE
FOR INSERT
TO public
WITH CHECK (( (select auth.uid()) = user_id));

CREATE POLICY "Users can update own orders"
ON "public"."orders"
AS PERMISSIVE
FOR UPDATE
TO public
USING (( (select auth.uid()) = user_id));

CREATE POLICY "Users can delete own orders"
ON "public"."orders"
AS PERMISSIVE
FOR DELETE
TO public
USING (( (select auth.uid()) = user_id));