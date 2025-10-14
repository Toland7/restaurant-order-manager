create table "public"."notifications" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid,
    "title" text not null,
    "message" text not null,
    "type" text default 'info'::text,
    "is_read" boolean default false,
    "created_at" timestamp with time zone default now()
);


alter table "public"."notifications" enable row level security;

create table "public"."order_items" (
    "id" uuid not null default gen_random_uuid(),
    "order_id" uuid,
    "product_id" uuid,
    "product_name" text not null,
    "quantity" text not null,
    "created_at" timestamp with time zone default now()
);


alter table "public"."order_items" enable row level security;

create table "public"."orders" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid,
    "supplier_id" uuid,
    "order_message" text not null,
    "additional_items" text,
    "status" text default 'sent'::text,
    "scheduled_date" date,
    "sent_at" timestamp with time zone default now(),
    "created_at" timestamp with time zone default now()
);


alter table "public"."orders" enable row level security;

create table "public"."products" (
    "id" uuid not null default gen_random_uuid(),
    "supplier_id" uuid,
    "name" text not null,
    "unit" text default 'pz'::text,
    "created_at" timestamp with time zone default now()
);


alter table "public"."products" enable row level security;

create table "public"."profiles" (
    "id" uuid not null,
    "push_subscription" jsonb,
    "updated_at" timestamp with time zone default now()
);


alter table "public"."profiles" enable row level security;

create table "public"."scheduled_orders" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid,
    "supplier_id" uuid,
    "order_data" jsonb not null,
    "is_sent" boolean default false,
    "created_at" timestamp with time zone default now(),
    "reminder_type" text default 'simple'::text,
    "scheduled_at" timestamp with time zone
);


alter table "public"."scheduled_orders" enable row level security;

create table "public"."suppliers" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid,
    "name" text not null,
    "contact_method" text not null,
    "contact" text not null,
    "message_template" text default 'Buongiorno, vorremmo ordinare i seguenti prodotti:'::text,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now()
);


alter table "public"."suppliers" enable row level security;

CREATE UNIQUE INDEX notifications_pkey ON public.notifications USING btree (id);

CREATE INDEX notifications_user_id_idx ON public.notifications USING btree (user_id, is_read);

CREATE INDEX order_items_order_id_idx ON public.order_items USING btree (order_id);

CREATE UNIQUE INDEX order_items_pkey ON public.order_items USING btree (id);

CREATE UNIQUE INDEX orders_pkey ON public.orders USING btree (id);

CREATE INDEX orders_sent_at_idx ON public.orders USING btree (sent_at);

CREATE INDEX orders_supplier_id_idx ON public.orders USING btree (supplier_id);

CREATE INDEX orders_user_id_idx ON public.orders USING btree (user_id);

CREATE UNIQUE INDEX products_pkey ON public.products USING btree (id);

CREATE INDEX products_supplier_id_idx ON public.products USING btree (supplier_id);

CREATE UNIQUE INDEX profiles_pkey ON public.profiles USING btree (id);

CREATE UNIQUE INDEX scheduled_orders_pkey ON public.scheduled_orders USING btree (id);

CREATE INDEX scheduled_orders_user_id_idx ON public.scheduled_orders USING btree (user_id);

CREATE UNIQUE INDEX suppliers_pkey ON public.suppliers USING btree (id);

CREATE INDEX suppliers_user_id_idx ON public.suppliers USING btree (user_id);

alter table "public"."notifications" add constraint "notifications_pkey" PRIMARY KEY using index "notifications_pkey";

alter table "public"."order_items" add constraint "order_items_pkey" PRIMARY KEY using index "order_items_pkey";

alter table "public"."orders" add constraint "orders_pkey" PRIMARY KEY using index "orders_pkey";

alter table "public"."products" add constraint "products_pkey" PRIMARY KEY using index "products_pkey";

alter table "public"."profiles" add constraint "profiles_pkey" PRIMARY KEY using index "profiles_pkey";

alter table "public"."scheduled_orders" add constraint "scheduled_orders_pkey" PRIMARY KEY using index "scheduled_orders_pkey";

alter table "public"."suppliers" add constraint "suppliers_pkey" PRIMARY KEY using index "suppliers_pkey";

alter table "public"."notifications" add constraint "notifications_type_check" CHECK ((type = ANY (ARRAY['info'::text, 'success'::text, 'warning'::text, 'error'::text]))) not valid;

alter table "public"."notifications" validate constraint "notifications_type_check";

alter table "public"."notifications" add constraint "notifications_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."notifications" validate constraint "notifications_user_id_fkey";

alter table "public"."order_items" add constraint "order_items_order_id_fkey" FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE not valid;

alter table "public"."order_items" validate constraint "order_items_order_id_fkey";

alter table "public"."order_items" add constraint "order_items_product_id_fkey" FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE not valid;

alter table "public"."order_items" validate constraint "order_items_product_id_fkey";

alter table "public"."orders" add constraint "orders_status_check" CHECK ((status = ANY (ARRAY['draft'::text, 'sent'::text, 'confirmed'::text, 'delivered'::text]))) not valid;

alter table "public"."orders" validate constraint "orders_status_check";

alter table "public"."orders" add constraint "orders_supplier_id_fkey" FOREIGN KEY (supplier_id) REFERENCES suppliers(id) ON DELETE CASCADE not valid;

alter table "public"."orders" validate constraint "orders_supplier_id_fkey";

alter table "public"."orders" add constraint "orders_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."orders" validate constraint "orders_user_id_fkey";

alter table "public"."products" add constraint "products_supplier_id_fkey" FOREIGN KEY (supplier_id) REFERENCES suppliers(id) ON DELETE CASCADE not valid;

alter table "public"."products" validate constraint "products_supplier_id_fkey";

alter table "public"."profiles" add constraint "profiles_id_fkey" FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."profiles" validate constraint "profiles_id_fkey";

alter table "public"."scheduled_orders" add constraint "scheduled_orders_reminder_type_check" CHECK ((reminder_type = ANY (ARRAY['simple'::text, 'prefilled'::text]))) not valid;

alter table "public"."scheduled_orders" validate constraint "scheduled_orders_reminder_type_check";

alter table "public"."scheduled_orders" add constraint "scheduled_orders_supplier_id_fkey" FOREIGN KEY (supplier_id) REFERENCES suppliers(id) ON DELETE CASCADE not valid;

alter table "public"."scheduled_orders" validate constraint "scheduled_orders_supplier_id_fkey";

alter table "public"."scheduled_orders" add constraint "scheduled_orders_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."scheduled_orders" validate constraint "scheduled_orders_user_id_fkey";

alter table "public"."suppliers" add constraint "suppliers_contact_method_check" CHECK ((contact_method = ANY (ARRAY['whatsapp'::text, 'email'::text, 'sms'::text]))) not valid;

alter table "public"."suppliers" validate constraint "suppliers_contact_method_check";

alter table "public"."suppliers" add constraint "suppliers_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."suppliers" validate constraint "suppliers_user_id_fkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $function$
BEGIN
  INSERT INTO public.profiles (id)
  VALUES (NEW.id);
  RETURN NEW;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.update_updated_at_column()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $function$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$function$
;

grant delete on table "public"."notifications" to "anon";

grant insert on table "public"."notifications" to "anon";

grant references on table "public"."notifications" to "anon";

grant select on table "public"."notifications" to "anon";

grant trigger on table "public"."notifications" to "anon";

grant truncate on table "public"."notifications" to "anon";

grant update on table "public"."notifications" to "anon";

grant delete on table "public"."notifications" to "authenticated";

grant insert on table "public"."notifications" to "authenticated";

grant references on table "public"."notifications" to "authenticated";

grant select on table "public"."notifications" to "authenticated";

grant trigger on table "public"."notifications" to "authenticated";

grant truncate on table "public"."notifications" to "authenticated";

grant update on table "public"."notifications" to "authenticated";

grant delete on table "public"."notifications" to "service_role";

grant insert on table "public"."notifications" to "service_role";

grant references on table "public"."notifications" to "service_role";

grant select on table "public"."notifications" to "service_role";

grant trigger on table "public"."notifications" to "service_role";

grant truncate on table "public"."notifications" to "service_role";

grant update on table "public"."notifications" to "service_role";

grant delete on table "public"."order_items" to "anon";

grant insert on table "public"."order_items" to "anon";

grant references on table "public"."order_items" to "anon";

grant select on table "public"."order_items" to "anon";

grant trigger on table "public"."order_items" to "anon";

grant truncate on table "public"."order_items" to "anon";

grant update on table "public"."order_items" to "anon";

grant delete on table "public"."order_items" to "authenticated";

grant insert on table "public"."order_items" to "authenticated";

grant references on table "public"."order_items" to "authenticated";

grant select on table "public"."order_items" to "authenticated";

grant trigger on table "public"."order_items" to "authenticated";

grant truncate on table "public"."order_items" to "authenticated";

grant update on table "public"."order_items" to "authenticated";

grant delete on table "public"."order_items" to "service_role";

grant insert on table "public"."order_items" to "service_role";

grant references on table "public"."order_items" to "service_role";

grant select on table "public"."order_items" to "service_role";

grant trigger on table "public"."order_items" to "service_role";

grant truncate on table "public"."order_items" to "service_role";

grant update on table "public"."order_items" to "service_role";

grant delete on table "public"."orders" to "anon";

grant insert on table "public"."orders" to "anon";

grant references on table "public"."orders" to "anon";

grant select on table "public"."orders" to "anon";

grant trigger on table "public"."orders" to "anon";

grant truncate on table "public"."orders" to "anon";

grant update on table "public"."orders" to "anon";

grant delete on table "public"."orders" to "authenticated";

grant insert on table "public"."orders" to "authenticated";

grant references on table "public"."orders" to "authenticated";

grant select on table "public"."orders" to "authenticated";

grant trigger on table "public"."orders" to "authenticated";

grant truncate on table "public"."orders" to "authenticated";

grant update on table "public"."orders" to "authenticated";

grant delete on table "public"."orders" to "service_role";

grant insert on table "public"."orders" to "service_role";

grant references on table "public"."orders" to "service_role";

grant select on table "public"."orders" to "service_role";

grant trigger on table "public"."orders" to "service_role";

grant truncate on table "public"."orders" to "service_role";

grant update on table "public"."orders" to "service_role";

grant delete on table "public"."products" to "anon";

grant insert on table "public"."products" to "anon";

grant references on table "public"."products" to "anon";

grant select on table "public"."products" to "anon";

grant trigger on table "public"."products" to "anon";

grant truncate on table "public"."products" to "anon";

grant update on table "public"."products" to "anon";

grant delete on table "public"."products" to "authenticated";

grant insert on table "public"."products" to "authenticated";

grant references on table "public"."products" to "authenticated";

grant select on table "public"."products" to "authenticated";

grant trigger on table "public"."products" to "authenticated";

grant truncate on table "public"."products" to "authenticated";

grant update on table "public"."products" to "authenticated";

grant delete on table "public"."products" to "service_role";

grant insert on table "public"."products" to "service_role";

grant references on table "public"."products" to "service_role";

grant select on table "public"."products" to "service_role";

grant trigger on table "public"."products" to "service_role";

grant truncate on table "public"."products" to "service_role";

grant update on table "public"."products" to "service_role";

grant delete on table "public"."profiles" to "anon";

grant insert on table "public"."profiles" to "anon";

grant references on table "public"."profiles" to "anon";

grant select on table "public"."profiles" to "anon";

grant trigger on table "public"."profiles" to "anon";

grant truncate on table "public"."profiles" to "anon";

grant update on table "public"."profiles" to "anon";

grant delete on table "public"."profiles" to "authenticated";

grant insert on table "public"."profiles" to "authenticated";

grant references on table "public"."profiles" to "authenticated";

grant select on table "public"."profiles" to "authenticated";

grant trigger on table "public"."profiles" to "authenticated";

grant truncate on table "public"."profiles" to "authenticated";

grant update on table "public"."profiles" to "authenticated";

grant delete on table "public"."profiles" to "service_role";

grant insert on table "public"."profiles" to "service_role";

grant references on table "public"."profiles" to "service_role";

grant select on table "public"."profiles" to "service_role";

grant trigger on table "public"."profiles" to "service_role";

grant truncate on table "public"."profiles" to "service_role";

grant update on table "public"."profiles" to "service_role";

grant delete on table "public"."scheduled_orders" to "anon";

grant insert on table "public"."scheduled_orders" to "anon";

grant references on table "public"."scheduled_orders" to "anon";

grant select on table "public"."scheduled_orders" to "anon";

grant trigger on table "public"."scheduled_orders" to "anon";

grant truncate on table "public"."scheduled_orders" to "anon";

grant update on table "public"."scheduled_orders" to "anon";

grant delete on table "public"."scheduled_orders" to "authenticated";

grant insert on table "public"."scheduled_orders" to "authenticated";

grant references on table "public"."scheduled_orders" to "authenticated";

grant select on table "public"."scheduled_orders" to "authenticated";

grant trigger on table "public"."scheduled_orders" to "authenticated";

grant truncate on table "public"."scheduled_orders" to "authenticated";

grant update on table "public"."scheduled_orders" to "authenticated";

grant delete on table "public"."scheduled_orders" to "service_role";

grant insert on table "public"."scheduled_orders" to "service_role";

grant references on table "public"."scheduled_orders" to "service_role";

grant select on table "public"."scheduled_orders" to "service_role";

grant trigger on table "public"."scheduled_orders" to "service_role";

grant truncate on table "public"."scheduled_orders" to "service_role";

grant update on table "public"."scheduled_orders" to "service_role";

grant delete on table "public"."suppliers" to "anon";

grant insert on table "public"."suppliers" to "anon";

grant references on table "public"."suppliers" to "anon";

grant select on table "public"."suppliers" to "anon";

grant trigger on table "public"."suppliers" to "anon";

grant truncate on table "public"."suppliers" to "anon";

grant update on table "public"."suppliers" to "anon";

grant delete on table "public"."suppliers" to "authenticated";

grant insert on table "public"."suppliers" to "authenticated";

grant references on table "public"."suppliers" to "authenticated";

grant select on table "public"."suppliers" to "authenticated";

grant trigger on table "public"."suppliers" to "authenticated";

grant truncate on table "public"."suppliers" to "authenticated";

grant update on table "public"."suppliers" to "authenticated";

grant delete on table "public"."suppliers" to "service_role";

grant insert on table "public"."suppliers" to "service_role";

grant references on table "public"."suppliers" to "service_role";

grant select on table "public"."suppliers" to "service_role";

grant trigger on table "public"."suppliers" to "service_role";

grant truncate on table "public"."suppliers" to "service_role";

grant update on table "public"."suppliers" to "service_role";

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


create policy "Users can update own notifications"
on "public"."notifications"
as permissive
for update
to public
using ((auth.uid() = user_id));


create policy "Users can view own notifications"
on "public"."notifications"
as permissive
for select
to public
using ((auth.uid() = user_id));


create policy "Users can delete order items of own orders"
on "public"."order_items"
as permissive
for delete
to public
using ((order_id IN ( SELECT orders.id
   FROM orders
  WHERE (orders.user_id = auth.uid()))));


create policy "Users can insert order items to own orders"
on "public"."order_items"
as permissive
for insert
to public
with check ((order_id IN ( SELECT orders.id
   FROM orders
  WHERE (orders.user_id = auth.uid()))));


create policy "Users can update order items of own orders"
on "public"."order_items"
as permissive
for update
to public
using ((order_id IN ( SELECT orders.id
   FROM orders
  WHERE (orders.user_id = auth.uid()))));


create policy "Users can view order items of own orders"
on "public"."order_items"
as permissive
for select
to public
using ((order_id IN ( SELECT orders.id
   FROM orders
  WHERE (orders.user_id = auth.uid()))));


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


create policy "Users can update own orders"
on "public"."orders"
as permissive
for update
to public
using ((auth.uid() = user_id));


create policy "Users can view own orders"
on "public"."orders"
as permissive
for select
to public
using ((auth.uid() = user_id));


create policy "Users can delete products of own suppliers"
on "public"."products"
as permissive
for delete
to public
using ((supplier_id IN ( SELECT suppliers.id
   FROM suppliers
  WHERE (suppliers.user_id = auth.uid()))));


create policy "Users can insert products to own suppliers"
on "public"."products"
as permissive
for insert
to public
with check ((supplier_id IN ( SELECT suppliers.id
   FROM suppliers
  WHERE (suppliers.user_id = auth.uid()))));


create policy "Users can update products of own suppliers"
on "public"."products"
as permissive
for update
to public
using ((supplier_id IN ( SELECT suppliers.id
   FROM suppliers
  WHERE (suppliers.user_id = auth.uid()))));


create policy "Users can view products of own suppliers"
on "public"."products"
as permissive
for select
to public
using ((supplier_id IN ( SELECT suppliers.id
   FROM suppliers
  WHERE (suppliers.user_id = auth.uid()))));


create policy "Users can update their own profile"
on "public"."profiles"
as permissive
for update
to public
using ((auth.uid() = id));


create policy "Users can view their own profile"
on "public"."profiles"
as permissive
for select
to public
using ((auth.uid() = id));


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


create policy "Users can update own scheduled orders"
on "public"."scheduled_orders"
as permissive
for update
to public
using ((auth.uid() = user_id));


create policy "Users can view own scheduled orders"
on "public"."scheduled_orders"
as permissive
for select
to public
using ((auth.uid() = user_id));


create policy "Users can delete own suppliers"
on "public"."suppliers"
as permissive
for delete
to public
using (((select auth.uid()) = user_id));


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


create policy "Users can view own suppliers"
on "public"."suppliers"
as permissive
for select
to public
using ((auth.uid() = user_id));


CREATE TRIGGER update_suppliers_updated_at BEFORE UPDATE ON public.suppliers FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();



