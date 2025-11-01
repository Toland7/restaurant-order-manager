drop policy "Users can view their own notifications" on "public"."notifications";

drop policy "Users can view their own orders" on "public"."orders";

drop policy "Users can view their own scheduled orders" on "public"."scheduled_orders";

drop policy "Users can view their own suppliers" on "public"."suppliers";

drop policy "Users can delete order items of own orders" on "public"."order_items";

drop policy "Users can insert order items to own orders" on "public"."order_items";

drop policy "Users can update order items of own orders" on "public"."order_items";

drop policy "Users can view order items of own orders" on "public"."order_items";

drop policy "Users can delete products of own suppliers" on "public"."products";

drop policy "Users can insert products to own suppliers" on "public"."products";

drop policy "Users can update products of own suppliers" on "public"."products";

drop policy "Users can view products of own suppliers" on "public"."products";

drop policy "Users can update their own profile" on "public"."profiles";

drop policy "Users can delete own suppliers" on "public"."suppliers";

revoke delete on table "public"."notifications" from "anon";

revoke insert on table "public"."notifications" from "anon";

revoke references on table "public"."notifications" from "anon";

revoke select on table "public"."notifications" from "anon";

revoke trigger on table "public"."notifications" from "anon";

revoke truncate on table "public"."notifications" from "anon";

revoke update on table "public"."notifications" from "anon";

revoke delete on table "public"."notifications" from "authenticated";

revoke insert on table "public"."notifications" from "authenticated";

revoke references on table "public"."notifications" from "authenticated";

revoke select on table "public"."notifications" from "authenticated";

revoke trigger on table "public"."notifications" from "authenticated";

revoke truncate on table "public"."notifications" from "authenticated";

revoke update on table "public"."notifications" from "authenticated";

revoke delete on table "public"."notifications" from "service_role";

revoke insert on table "public"."notifications" from "service_role";

revoke references on table "public"."notifications" from "service_role";

revoke select on table "public"."notifications" from "service_role";

revoke trigger on table "public"."notifications" from "service_role";

revoke truncate on table "public"."notifications" from "service_role";

revoke update on table "public"."notifications" from "service_role";

revoke delete on table "public"."order_items" from "anon";

revoke insert on table "public"."order_items" from "anon";

revoke references on table "public"."order_items" from "anon";

revoke select on table "public"."order_items" from "anon";

revoke trigger on table "public"."order_items" from "anon";

revoke truncate on table "public"."order_items" from "anon";

revoke update on table "public"."order_items" from "anon";

revoke delete on table "public"."order_items" from "authenticated";

revoke insert on table "public"."order_items" from "authenticated";

revoke references on table "public"."order_items" from "authenticated";

revoke select on table "public"."order_items" from "authenticated";

revoke trigger on table "public"."order_items" from "authenticated";

revoke truncate on table "public"."order_items" from "authenticated";

revoke update on table "public"."order_items" from "authenticated";

revoke delete on table "public"."order_items" from "service_role";

revoke insert on table "public"."order_items" from "service_role";

revoke references on table "public"."order_items" from "service_role";

revoke select on table "public"."order_items" from "service_role";

revoke trigger on table "public"."order_items" from "service_role";

revoke truncate on table "public"."order_items" from "service_role";

revoke update on table "public"."order_items" from "service_role";

revoke delete on table "public"."orders" from "anon";

revoke insert on table "public"."orders" from "anon";

revoke references on table "public"."orders" from "anon";

revoke select on table "public"."orders" from "anon";

revoke trigger on table "public"."orders" from "anon";

revoke truncate on table "public"."orders" from "anon";

revoke update on table "public"."orders" from "anon";

revoke delete on table "public"."orders" from "authenticated";

revoke insert on table "public"."orders" from "authenticated";

revoke references on table "public"."orders" from "authenticated";

revoke select on table "public"."orders" from "authenticated";

revoke trigger on table "public"."orders" from "authenticated";

revoke truncate on table "public"."orders" from "authenticated";

revoke update on table "public"."orders" from "authenticated";

revoke delete on table "public"."orders" from "service_role";

revoke insert on table "public"."orders" from "service_role";

revoke references on table "public"."orders" from "service_role";

revoke select on table "public"."orders" from "service_role";

revoke trigger on table "public"."orders" from "service_role";

revoke truncate on table "public"."orders" from "service_role";

revoke update on table "public"."orders" from "service_role";

revoke delete on table "public"."products" from "anon";

revoke insert on table "public"."products" from "anon";

revoke references on table "public"."products" from "anon";

revoke select on table "public"."products" from "anon";

revoke trigger on table "public"."products" from "anon";

revoke truncate on table "public"."products" from "anon";

revoke update on table "public"."products" from "anon";

revoke delete on table "public"."products" from "authenticated";

revoke insert on table "public"."products" from "authenticated";

revoke references on table "public"."products" from "authenticated";

revoke select on table "public"."products" from "authenticated";

revoke trigger on table "public"."products" from "authenticated";

revoke truncate on table "public"."products" from "authenticated";

revoke update on table "public"."products" from "authenticated";

revoke delete on table "public"."products" from "service_role";

revoke insert on table "public"."products" from "service_role";

revoke references on table "public"."products" from "service_role";

revoke select on table "public"."products" from "service_role";

revoke trigger on table "public"."products" from "service_role";

revoke truncate on table "public"."products" from "service_role";

revoke update on table "public"."products" from "service_role";

revoke delete on table "public"."profiles" from "anon";

revoke insert on table "public"."profiles" from "anon";

revoke references on table "public"."profiles" from "anon";

revoke select on table "public"."profiles" from "anon";

revoke trigger on table "public"."profiles" from "anon";

revoke truncate on table "public"."profiles" from "anon";

revoke update on table "public"."profiles" from "anon";

revoke delete on table "public"."profiles" from "authenticated";

revoke insert on table "public"."profiles" from "authenticated";

revoke references on table "public"."profiles" from "authenticated";

revoke select on table "public"."profiles" from "authenticated";

revoke trigger on table "public"."profiles" from "authenticated";

revoke truncate on table "public"."profiles" from "authenticated";

revoke update on table "public"."profiles" from "authenticated";

revoke delete on table "public"."profiles" from "service_role";

revoke insert on table "public"."profiles" from "service_role";

revoke references on table "public"."profiles" from "service_role";

revoke select on table "public"."profiles" from "service_role";

revoke trigger on table "public"."profiles" from "service_role";

revoke truncate on table "public"."profiles" from "service_role";

revoke update on table "public"."profiles" from "service_role";

revoke delete on table "public"."scheduled_orders" from "anon";

revoke insert on table "public"."scheduled_orders" from "anon";

revoke references on table "public"."scheduled_orders" from "anon";

revoke select on table "public"."scheduled_orders" from "anon";

revoke trigger on table "public"."scheduled_orders" from "anon";

revoke truncate on table "public"."scheduled_orders" from "anon";

revoke update on table "public"."scheduled_orders" from "anon";

revoke delete on table "public"."scheduled_orders" from "authenticated";

revoke insert on table "public"."scheduled_orders" from "authenticated";

revoke references on table "public"."scheduled_orders" from "authenticated";

revoke select on table "public"."scheduled_orders" from "authenticated";

revoke trigger on table "public"."scheduled_orders" from "authenticated";

revoke truncate on table "public"."scheduled_orders" from "authenticated";

revoke update on table "public"."scheduled_orders" from "authenticated";

revoke delete on table "public"."scheduled_orders" from "service_role";

revoke insert on table "public"."scheduled_orders" from "service_role";

revoke references on table "public"."scheduled_orders" from "service_role";

revoke select on table "public"."scheduled_orders" from "service_role";

revoke trigger on table "public"."scheduled_orders" from "service_role";

revoke truncate on table "public"."scheduled_orders" from "service_role";

revoke update on table "public"."scheduled_orders" from "service_role";

revoke delete on table "public"."suppliers" from "anon";

revoke insert on table "public"."suppliers" from "anon";

revoke references on table "public"."suppliers" from "anon";

revoke select on table "public"."suppliers" from "anon";

revoke trigger on table "public"."suppliers" from "anon";

revoke truncate on table "public"."suppliers" from "anon";

revoke update on table "public"."suppliers" from "anon";

revoke delete on table "public"."suppliers" from "authenticated";

revoke insert on table "public"."suppliers" from "authenticated";

revoke references on table "public"."suppliers" from "authenticated";

revoke select on table "public"."suppliers" from "authenticated";

revoke trigger on table "public"."suppliers" from "authenticated";

revoke truncate on table "public"."suppliers" from "authenticated";

revoke update on table "public"."suppliers" from "authenticated";

revoke delete on table "public"."suppliers" from "service_role";

revoke insert on table "public"."suppliers" from "service_role";

revoke references on table "public"."suppliers" from "service_role";

revoke select on table "public"."suppliers" from "service_role";

revoke trigger on table "public"."suppliers" from "service_role";

revoke truncate on table "public"."suppliers" from "service_role";

revoke update on table "public"."suppliers" from "service_role";

alter table "public"."suppliers" drop constraint "suppliers_contact_method_check";

drop index if exists "public"."suppliers_user_id_idx";

create table "public"."ordini_multipli" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "user_id" uuid not null,
    "nome_ordine" text not null,
    "status" text not null default 'draft'::text,
    "scheduled_at" timestamp with time zone
);


alter table "public"."ordini_multipli" enable row level security;

alter table "public"."notifications" add column "reminder_id" uuid;

alter table "public"."orders" add column "ordine_multiplo_id" uuid;

alter table "public"."suppliers" add column "products" jsonb default '[]'::jsonb;

CREATE UNIQUE INDEX ordini_multipli_pkey ON public.ordini_multipli USING btree (id);

alter table "public"."ordini_multipli" add constraint "ordini_multipli_pkey" PRIMARY KEY using index "ordini_multipli_pkey";

alter table "public"."orders" add constraint "fk_ordine_multiplo" FOREIGN KEY (ordine_multiplo_id) REFERENCES ordini_multipli(id) ON DELETE SET NULL not valid;

alter table "public"."orders" validate constraint "fk_ordine_multiplo";

alter table "public"."ordini_multipli" add constraint "ordini_multipli_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."ordini_multipli" validate constraint "ordini_multipli_user_id_fkey";

alter table "public"."suppliers" add constraint "suppliers_contact_method_check" CHECK ((contact_method = ANY (ARRAY['whatsapp'::text, 'whatsapp_group'::text, 'email'::text, 'sms'::text]))) not valid;

alter table "public"."suppliers" validate constraint "suppliers_contact_method_check";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.get_user_account_ids()
 RETURNS SETOF uuid
 LANGUAGE sql
 SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
    select account_id from profiles where id = auth.uid();
$function$
;

CREATE OR REPLACE FUNCTION public.get_user_location_ids()
 RETURNS SETOF uuid
 LANGUAGE sql
 SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
    select default_location_id from profiles where id = auth.uid() and default_location_id is not null;
$function$
;

CREATE OR REPLACE FUNCTION public.is_admin()
 RETURNS boolean
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
BEGIN
  RETURN EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND is_admin = true);
END;
$function$
;

CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $function$
BEGIN
  RAISE NOTICE 'Attempting to insert profile for user: %', NEW.id;
  INSERT INTO public.profiles (
    id,
    first_name,
    last_name,
    role,
    company_name,
    company_vat_id,
    headquarters_name,
    headquarters_address
  )
  VALUES (
    NEW.id,
    NEW.raw_user_meta_data->>'first_name',
    NEW.raw_user_meta_data->>'last_name',
    NEW.raw_user_meta_data->>'role',
    NEW.raw_user_meta_data->>'company_name',
    NEW.raw_user_meta_data->>'company_vat_id',
    NEW.raw_user_meta_data->>'headquarters_name',
    NEW.raw_user_meta_data->>'headquarters_address'
  );
  RAISE NOTICE 'Profile inserted successfully for user: %', NEW.id;
  RETURN NEW;
EXCEPTION
  WHEN OTHERS THEN
    RAISE NOTICE 'Error inserting profile for user %: %', NEW.id, SQLERRM;
    RETURN NEW; -- Return NEW to allow the auth.users insert to complete
END;
$function$
;

CREATE OR REPLACE FUNCTION public.update_updated_at_column()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$function$
;

create policy "Admins can view all notifications"
on "public"."notifications"
as permissive
for select
to public
using ((EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.is_admin = true)))));


create policy "Users can manage their own notifications"
on "public"."notifications"
as permissive
for all
to public
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "Users can delete order items of their own orders"
on "public"."order_items"
as permissive
for delete
to public
using ((EXISTS ( SELECT 1
   FROM orders
  WHERE ((orders.id = order_items.order_id) AND (orders.user_id = ( SELECT auth.uid() AS uid))))));


create policy "Users can insert order items for their own orders"
on "public"."order_items"
as permissive
for insert
to public
with check ((EXISTS ( SELECT 1
   FROM orders
  WHERE ((orders.id = order_items.order_id) AND (orders.user_id = ( SELECT auth.uid() AS uid))))));


create policy "Users can update order items of their own orders"
on "public"."order_items"
as permissive
for update
to public
using ((EXISTS ( SELECT 1
   FROM orders
  WHERE ((orders.id = order_items.order_id) AND (orders.user_id = ( SELECT auth.uid() AS uid))))));


create policy "Users can view order items of their own orders"
on "public"."order_items"
as permissive
for select
to public
using ((EXISTS ( SELECT 1
   FROM orders
  WHERE ((orders.id = order_items.order_id) AND (orders.user_id = ( SELECT auth.uid() AS uid))))));


create policy "Users can manage their own orders"
on "public"."orders"
as permissive
for all
to public
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "Allow individual access for own batch orders"
on "public"."ordini_multipli"
as permissive
for all
to authenticated
using ((auth.uid() = user_id));


create policy "Admins can manage all profiles"
on "public"."profiles"
as permissive
for all
to public
using (((auth.jwt() ->> 'is_admin'::text) = 'true'::text));


create policy "Admins can update all profiles"
on "public"."profiles"
as permissive
for update
to public
using (is_admin());


create policy "Admins can view all profiles"
on "public"."profiles"
as permissive
for select
to public
using (is_admin());


create policy "Users can delete their own profile"
on "public"."profiles"
as permissive
for delete
to public
using ((auth.uid() = id));


create policy "Users can insert their own profile"
on "public"."profiles"
as permissive
for insert
to public
with check ((auth.uid() = id));


create policy "Users can manage their own scheduled orders"
on "public"."scheduled_orders"
as permissive
for all
to public
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "Users can delete order items of own orders"
on "public"."order_items"
as permissive
for delete
to public
using ((EXISTS ( SELECT 1
   FROM orders
  WHERE ((orders.id = order_items.order_id) AND (orders.user_id = auth.uid())))));


create policy "Users can insert order items to own orders"
on "public"."order_items"
as permissive
for insert
to public
with check ((EXISTS ( SELECT 1
   FROM orders
  WHERE ((orders.id = order_items.order_id) AND (orders.user_id = auth.uid())))));


create policy "Users can update order items of own orders"
on "public"."order_items"
as permissive
for update
to public
using ((EXISTS ( SELECT 1
   FROM orders
  WHERE ((orders.id = order_items.order_id) AND (orders.user_id = auth.uid())))));


create policy "Users can view order items of own orders"
on "public"."order_items"
as permissive
for select
to public
using ((EXISTS ( SELECT 1
   FROM orders
  WHERE ((orders.id = order_items.order_id) AND (orders.user_id = auth.uid())))));


create policy "Users can delete products of own suppliers"
on "public"."products"
as permissive
for delete
to public
using ((EXISTS ( SELECT 1
   FROM suppliers
  WHERE ((suppliers.id = products.supplier_id) AND (suppliers.user_id = auth.uid())))));


create policy "Users can insert products to own suppliers"
on "public"."products"
as permissive
for insert
to public
with check ((EXISTS ( SELECT 1
   FROM suppliers
  WHERE ((suppliers.id = products.supplier_id) AND (suppliers.user_id = auth.uid())))));


create policy "Users can update products of own suppliers"
on "public"."products"
as permissive
for update
to public
using ((EXISTS ( SELECT 1
   FROM suppliers
  WHERE ((suppliers.id = products.supplier_id) AND (suppliers.user_id = auth.uid())))));


create policy "Users can view products of own suppliers"
on "public"."products"
as permissive
for select
to public
using ((EXISTS ( SELECT 1
   FROM suppliers
  WHERE ((suppliers.id = products.supplier_id) AND (suppliers.user_id = auth.uid())))));


create policy "Users can update their own profile"
on "public"."profiles"
as permissive
for update
to public
using ((auth.uid() = id));


create policy "Users can delete own suppliers"
on "public"."suppliers"
as permissive
for delete
to public
using ((auth.uid() = user_id));




