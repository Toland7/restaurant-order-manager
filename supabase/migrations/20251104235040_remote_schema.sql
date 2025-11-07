drop policy "Company members can delete their notifications" on "public"."notifications";

drop policy "Company members can insert their notifications" on "public"."notifications";

drop policy "Company members can update their notifications" on "public"."notifications";

drop policy "Company members can view their notifications" on "public"."notifications";

drop policy "Company members can delete order items" on "public"."order_items";

drop policy "Company members can insert order items" on "public"."order_items";

drop policy "Company members can update order items" on "public"."order_items";

drop policy "Company members can view order items" on "public"."order_items";

drop policy "Company members can delete their orders" on "public"."orders";

drop policy "Company members can insert their orders" on "public"."orders";

drop policy "Company members can update their orders" on "public"."orders";

drop policy "Company members can view their orders" on "public"."orders";

drop policy "Company members can delete products" on "public"."products";

drop policy "Company members can insert products" on "public"."products";

drop policy "Company members can update products" on "public"."products";

drop policy "Company members can view products" on "public"."products";

drop policy "Company members can delete their scheduled orders" on "public"."scheduled_orders";

drop policy "Company members can insert their scheduled orders" on "public"."scheduled_orders";

drop policy "Company members can update their scheduled orders" on "public"."scheduled_orders";

drop policy "Company members can view their scheduled orders" on "public"."scheduled_orders";

drop policy "Company members can delete their suppliers" on "public"."suppliers";

drop policy "Company members can insert their suppliers" on "public"."suppliers";

drop policy "Company members can update their suppliers" on "public"."suppliers";

drop policy "Company members can view their suppliers" on "public"."suppliers";

revoke delete on table "public"."companies" from "anon";

revoke insert on table "public"."companies" from "anon";

revoke references on table "public"."companies" from "anon";

revoke select on table "public"."companies" from "anon";

revoke trigger on table "public"."companies" from "anon";

revoke truncate on table "public"."companies" from "anon";

revoke update on table "public"."companies" from "anon";

revoke delete on table "public"."companies" from "authenticated";

revoke insert on table "public"."companies" from "authenticated";

revoke references on table "public"."companies" from "authenticated";

revoke select on table "public"."companies" from "authenticated";

revoke trigger on table "public"."companies" from "authenticated";

revoke truncate on table "public"."companies" from "authenticated";

revoke update on table "public"."companies" from "authenticated";

revoke delete on table "public"."companies" from "service_role";

revoke insert on table "public"."companies" from "service_role";

revoke references on table "public"."companies" from "service_role";

revoke select on table "public"."companies" from "service_role";

revoke trigger on table "public"."companies" from "service_role";

revoke truncate on table "public"."companies" from "service_role";

revoke update on table "public"."companies" from "service_role";

revoke delete on table "public"."in_app_profiles" from "anon";

revoke insert on table "public"."in_app_profiles" from "anon";

revoke references on table "public"."in_app_profiles" from "anon";

revoke select on table "public"."in_app_profiles" from "anon";

revoke trigger on table "public"."in_app_profiles" from "anon";

revoke truncate on table "public"."in_app_profiles" from "anon";

revoke update on table "public"."in_app_profiles" from "anon";

revoke delete on table "public"."in_app_profiles" from "authenticated";

revoke insert on table "public"."in_app_profiles" from "authenticated";

revoke references on table "public"."in_app_profiles" from "authenticated";

revoke select on table "public"."in_app_profiles" from "authenticated";

revoke trigger on table "public"."in_app_profiles" from "authenticated";

revoke truncate on table "public"."in_app_profiles" from "authenticated";

revoke update on table "public"."in_app_profiles" from "authenticated";

revoke delete on table "public"."in_app_profiles" from "service_role";

revoke insert on table "public"."in_app_profiles" from "service_role";

revoke references on table "public"."in_app_profiles" from "service_role";

revoke select on table "public"."in_app_profiles" from "service_role";

revoke trigger on table "public"."in_app_profiles" from "service_role";

revoke truncate on table "public"."in_app_profiles" from "service_role";

revoke update on table "public"."in_app_profiles" from "service_role";

revoke delete on table "public"."ordini_multipli" from "anon";

revoke insert on table "public"."ordini_multipli" from "anon";

revoke references on table "public"."ordini_multipli" from "anon";

revoke select on table "public"."ordini_multipli" from "anon";

revoke trigger on table "public"."ordini_multipli" from "anon";

revoke truncate on table "public"."ordini_multipli" from "anon";

revoke update on table "public"."ordini_multipli" from "anon";

revoke delete on table "public"."ordini_multipli" from "authenticated";

revoke insert on table "public"."ordini_multipli" from "authenticated";

revoke references on table "public"."ordini_multipli" from "authenticated";

revoke select on table "public"."ordini_multipli" from "authenticated";

revoke trigger on table "public"."ordini_multipli" from "authenticated";

revoke truncate on table "public"."ordini_multipli" from "authenticated";

revoke update on table "public"."ordini_multipli" from "authenticated";

revoke delete on table "public"."ordini_multipli" from "service_role";

revoke insert on table "public"."ordini_multipli" from "service_role";

revoke references on table "public"."ordini_multipli" from "service_role";

revoke select on table "public"."ordini_multipli" from "service_role";

revoke trigger on table "public"."ordini_multipli" from "service_role";

revoke truncate on table "public"."ordini_multipli" from "service_role";

revoke update on table "public"."ordini_multipli" from "service_role";

revoke delete on table "public"."permissions" from "anon";

revoke insert on table "public"."permissions" from "anon";

revoke references on table "public"."permissions" from "anon";

revoke select on table "public"."permissions" from "anon";

revoke trigger on table "public"."permissions" from "anon";

revoke truncate on table "public"."permissions" from "anon";

revoke update on table "public"."permissions" from "anon";

revoke delete on table "public"."permissions" from "authenticated";

revoke insert on table "public"."permissions" from "authenticated";

revoke references on table "public"."permissions" from "authenticated";

revoke select on table "public"."permissions" from "authenticated";

revoke trigger on table "public"."permissions" from "authenticated";

revoke truncate on table "public"."permissions" from "authenticated";

revoke update on table "public"."permissions" from "authenticated";

revoke delete on table "public"."permissions" from "service_role";

revoke insert on table "public"."permissions" from "service_role";

revoke references on table "public"."permissions" from "service_role";

revoke select on table "public"."permissions" from "service_role";

revoke trigger on table "public"."permissions" from "service_role";

revoke truncate on table "public"."permissions" from "service_role";

revoke update on table "public"."permissions" from "service_role";

revoke delete on table "public"."profile_permissions" from "anon";

revoke insert on table "public"."profile_permissions" from "anon";

revoke references on table "public"."profile_permissions" from "anon";

revoke select on table "public"."profile_permissions" from "anon";

revoke trigger on table "public"."profile_permissions" from "anon";

revoke truncate on table "public"."profile_permissions" from "anon";

revoke update on table "public"."profile_permissions" from "anon";

revoke delete on table "public"."profile_permissions" from "authenticated";

revoke insert on table "public"."profile_permissions" from "authenticated";

revoke references on table "public"."profile_permissions" from "authenticated";

revoke select on table "public"."profile_permissions" from "authenticated";

revoke trigger on table "public"."profile_permissions" from "authenticated";

revoke truncate on table "public"."profile_permissions" from "authenticated";

revoke update on table "public"."profile_permissions" from "authenticated";

revoke delete on table "public"."profile_permissions" from "service_role";

revoke insert on table "public"."profile_permissions" from "service_role";

revoke references on table "public"."profile_permissions" from "service_role";

revoke select on table "public"."profile_permissions" from "service_role";

revoke trigger on table "public"."profile_permissions" from "service_role";

revoke truncate on table "public"."profile_permissions" from "service_role";

revoke update on table "public"."profile_permissions" from "service_role";

alter table "public"."notifications" drop constraint "fk_notifications_company";

alter table "public"."order_items" drop constraint "fk_order_items_company";

alter table "public"."orders" drop constraint "fk_orders_company";

alter table "public"."products" drop constraint "fk_products_company";

alter table "public"."scheduled_orders" drop constraint "fk_scheduled_orders_company";

alter table "public"."suppliers" drop constraint "fk_suppliers_company";

drop function if exists "public"."get_user_company_id"();

alter table "public"."in_app_profiles" alter column "id" set default extensions.uuid_generate_v4();

alter table "public"."notifications" drop column "company_id";

alter table "public"."order_items" drop column "company_id";

alter table "public"."orders" drop column "company_id";

alter table "public"."permissions" alter column "id" set default extensions.uuid_generate_v4();

alter table "public"."products" drop column "company_id";

alter table "public"."scheduled_orders" drop column "company_id";

alter table "public"."suppliers" drop column "company_id";

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

CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $function$
DECLARE
    v_profile_id UUID;
    v_profiles_manage_permission_id UUID;
BEGIN
  RAISE NOTICE 'Attempting to insert profile for user: %', NEW.id;

  -- Insert into public.profiles (existing logic)
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
  RAISE NOTICE 'Profile inserted successfully into public.profiles for user: %', NEW.id;

  -- Create an in_app_profile for the new user
  INSERT INTO public.in_app_profiles (user_id, profile_name, position)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'first_name' || ' ' || NEW.raw_user_meta_data->>'last_name', NEW.email),
    'Proprietario' -- Default position for the initial owner profile
  )
  RETURNING id INTO v_profile_id;
  RAISE NOTICE 'In-app profile created with ID: % for user: %', v_profile_id, NEW.id;

  -- Assign 'profiles:manage' permission to the new in_app_profile
  SELECT id INTO v_profiles_manage_permission_id FROM public.permissions WHERE name = 'profiles:manage';

  IF v_profiles_manage_permission_id IS NOT NULL THEN
    INSERT INTO public.profile_permissions (profile_id, permission_id)
    VALUES (v_profile_id, v_profiles_manage_permission_id);
    RAISE NOTICE 'Assigned profiles:manage permission to in-app profile: %', v_profile_id;
  ELSE
    RAISE WARNING 'Permission "profiles:manage" not found. Cannot assign to new in-app profile.';
  END IF;

  RETURN NEW;
EXCEPTION
  WHEN OTHERS THEN
    RAISE NOTICE 'Error in handle_new_user for user %: %', NEW.id, SQLERRM;
    RETURN NEW;
END;
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

create policy "Users can delete own notifications"
on "public"."notifications"
as permissive
for delete
to public
using ((auth.uid() = user_id));


create policy "Users can insert own notifications"
on "public"."notifications"
as permissive
for insert
to public
with check ((auth.uid() = user_id));


create policy "Users can manage their own notifications"
on "public"."notifications"
as permissive
for all
to public
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "Users can update own notifications"
on "public"."notifications"
as permissive
for update
to public
using ((auth.uid() = user_id));


create policy "Users can delete order items of own orders"
on "public"."order_items"
as permissive
for delete
to public
using ((EXISTS ( SELECT 1
   FROM orders
  WHERE ((orders.id = order_items.order_id) AND (orders.user_id = auth.uid())))));


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


create policy "Users can update order items of their own orders"
on "public"."order_items"
as permissive
for update
to public
using ((EXISTS ( SELECT 1
   FROM orders
  WHERE ((orders.id = order_items.order_id) AND (orders.user_id = ( SELECT auth.uid() AS uid))))));


create policy "Users can view order items of own orders"
on "public"."order_items"
as permissive
for select
to public
using ((EXISTS ( SELECT 1
   FROM orders
  WHERE ((orders.id = order_items.order_id) AND (orders.user_id = auth.uid())))));


create policy "Users can view order items of their own orders"
on "public"."order_items"
as permissive
for select
to public
using ((EXISTS ( SELECT 1
   FROM orders
  WHERE ((orders.id = order_items.order_id) AND (orders.user_id = ( SELECT auth.uid() AS uid))))));


create policy "Users can delete own orders"
on "public"."orders"
as permissive
for delete
to public
using ((auth.uid() = user_id));


create policy "Users can insert own orders"
on "public"."orders"
as permissive
for insert
to public
with check ((auth.uid() = user_id));


create policy "Users can manage their own orders"
on "public"."orders"
as permissive
for all
to public
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "Users can update own orders"
on "public"."orders"
as permissive
for update
to public
using ((auth.uid() = user_id));


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


create policy "Users can delete own scheduled orders"
on "public"."scheduled_orders"
as permissive
for delete
to public
using ((auth.uid() = user_id));


create policy "Users can insert own scheduled orders"
on "public"."scheduled_orders"
as permissive
for insert
to public
with check ((auth.uid() = user_id));


create policy "Users can manage their own scheduled orders"
on "public"."scheduled_orders"
as permissive
for all
to public
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "Users can update own scheduled orders"
on "public"."scheduled_orders"
as permissive
for update
to public
using ((auth.uid() = user_id));


create policy "Users can delete own suppliers"
on "public"."suppliers"
as permissive
for delete
to public
using ((auth.uid() = user_id));


create policy "Users can insert own suppliers"
on "public"."suppliers"
as permissive
for insert
to public
with check ((auth.uid() = user_id));


create policy "Users can update own suppliers"
on "public"."suppliers"
as permissive
for update
to public
using ((auth.uid() = user_id));




