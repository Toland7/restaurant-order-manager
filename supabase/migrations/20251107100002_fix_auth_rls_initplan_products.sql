-- Drop the existing policies
DROP POLICY "Users can view products of own suppliers" ON "public"."products";
DROP POLICY "Users can insert products to own suppliers" ON "public"."products";
DROP POLICY "Users can update products of own suppliers" ON "public"."products";
DROP POLICY "Users can delete products of own suppliers" ON "public"."products";

-- Create the new policies with the fix
CREATE POLICY "Users can view products of own suppliers"
ON "public"."products"
AS PERMISSIVE
FOR SELECT
TO public
USING ((EXISTS ( SELECT 1
   FROM suppliers
  WHERE ((suppliers.id = products.supplier_id) AND (suppliers.user_id = (select auth.uid()))))));

CREATE POLICY "Users can insert products to own suppliers"
ON "public"."products"
AS PERMISSIVE
FOR INSERT
TO public
WITH CHECK ((EXISTS ( SELECT 1
   FROM suppliers
  WHERE ((suppliers.id = products.supplier_id) AND (suppliers.user_id = (select auth.uid()))))));

CREATE POLICY "Users can update products of own suppliers"
ON "public"."products"
AS PERMISSIVE
FOR UPDATE
TO public
USING ((EXISTS ( SELECT 1
   FROM suppliers
  WHERE ((suppliers.id = products.supplier_id) AND (suppliers.user_id = (select auth.uid()))))));

CREATE POLICY "Users can delete products of own suppliers"
ON "public"."products"
AS PERMISSIVE
FOR DELETE
TO public
USING ((EXISTS ( SELECT 1
   FROM suppliers
  WHERE ((suppliers.id = products.supplier_id) AND (suppliers.user_id = (select auth.uid()))))));