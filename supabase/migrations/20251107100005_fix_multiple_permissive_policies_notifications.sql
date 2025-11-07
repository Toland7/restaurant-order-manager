-- Drop the existing policies
DROP POLICY "Users can delete own notifications" ON "public"."notifications";
DROP POLICY "Users can insert own notifications" ON "public"."notifications";
DROP POLICY "Users can update own notifications" ON "public"."notifications";
DROP POLICY "Users can manage their own notifications" ON "public"."notifications";

-- Create the new policy with the fix
CREATE POLICY "Users can manage their own notifications"
ON "public"."notifications"
AS PERMISSIVE
FOR ALL
TO public
USING (( (select auth.uid()) = user_id))
WITH CHECK (( (select auth.uid()) = user_id));