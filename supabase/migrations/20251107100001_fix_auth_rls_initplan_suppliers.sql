-- Drop the existing policies
DROP POLICY "Users can insert own suppliers" ON "public"."suppliers";
DROP POLICY "Users can update own suppliers" ON "public"."suppliers";
DROP POLICY "Users can view own suppliers" ON "public"."suppliers";

-- Create the new policies with the fix
CREATE POLICY "Users can insert own suppliers"
ON "public"."suppliers"
AS PERMISSIVE
FOR INSERT
TO public
WITH CHECK (( (select auth.uid()) = user_id));

CREATE POLICY "Users can update own suppliers"
ON "public"."suppliers"
AS PERMISSIVE
FOR UPDATE
TO public
USING (( (select auth.uid()) = user_id));

CREATE POLICY "Users can view own suppliers"
ON "public"."suppliers"
AS PERMISSIVE
FOR SELECT
TO public
USING (( (select auth.uid()) = user_id));