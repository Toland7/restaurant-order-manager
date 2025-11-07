-- Drop the existing policy
DROP POLICY "Allow individual access for own batch orders" ON "public"."ordini_multipli";

-- Create the new policy with the fix
CREATE POLICY "Allow individual access for own batch orders"
ON "public"."ordini_multipli"
AS PERMISSIVE
FOR ALL
TO authenticated
USING (( (select auth.uid()) = user_id));