


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE EXTENSION IF NOT EXISTS "pg_cron" WITH SCHEMA "pg_catalog";






CREATE EXTENSION IF NOT EXISTS "pg_net" WITH SCHEMA "extensions";






COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE OR REPLACE FUNCTION "public"."get_user_account_ids"() RETURNS SETOF "uuid"
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
    select account_id from profiles where id = auth.uid();
$$;


ALTER FUNCTION "public"."get_user_account_ids"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_user_location_ids"() RETURNS SETOF "uuid"
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
    select default_location_id from profiles where id = auth.uid() and default_location_id is not null;
$$;


ALTER FUNCTION "public"."get_user_location_ids"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."handle_new_user"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO ''
    AS $$
DECLARE
    v_profile_id UUID;
    v_profiles_manage_permission_id UUID;
    v_company_id UUID;
    v_user_metadata JSONB; -- Declare a variable to hold the casted metadata
BEGIN
  -- Cast raw_user_meta_data to JSONB once
  -- Use COALESCE to handle cases where raw_user_meta_data might be NULL or not valid JSON
  v_user_metadata := COALESCE(NEW.raw_user_meta_data::jsonb, '{}'::jsonb);

  -- Create a new company entry with demo tier and trial dates
  INSERT INTO public.companies (owner_id, name, vat_id, address, subscription_tier, trial_start_date, trial_end_date)
  VALUES (
    NEW.id,
    COALESCE(jsonb_extract_path_text(v_user_metadata, 'company_name'), ''),
    COALESCE(jsonb_extract_path_text(v_user_metadata, 'company_vat_id'), ''),
    COALESCE(jsonb_extract_path_text(v_user_metadata, 'headquarters_address'), ''),
    'demo', -- Set subscription_tier to 'demo' for new users
    NOW(),  -- Set trial_start_date to current timestamp
    NOW() + INTERVAL '30 days' -- Set trial_end_date to 30 days from now
  )
  RETURNING id INTO v_company_id;

    -- Insert into public.profiles (existing logic, now linked to company)
    INSERT INTO public.profiles (
      id,
      first_name,
      last_name,
      role,
      company_id
    )
    VALUES (
      NEW.id,
      COALESCE(jsonb_extract_path_text(v_user_metadata, 'first_name'), ''),
      COALESCE(jsonb_extract_path_text(v_user_metadata, 'last_name'), ''),
      COALESCE(jsonb_extract_path_text(v_user_metadata, 'role'), ''),
      v_company_id
    );

    -- Create an in_app_profile for the new user (now linked to company)
    INSERT INTO public.in_app_profiles (user_id, profile_name, position, company_id)
    VALUES (
      NEW.id,
      COALESCE(jsonb_extract_path_text(v_user_metadata, 'first_name') || ' ' || jsonb_extract_path_text(v_user_metadata, 'last_name'), NEW.email),
      'Proprietario', -- Default position for the initial owner profile
      v_company_id
    )
    RETURNING id INTO v_profile_id;

  -- Assign 'profiles:manage' permission to the new in_app_profile
  SELECT id INTO v_profiles_manage_permission_id FROM public.permissions WHERE name = 'profiles:manage';

  IF v_profiles_manage_permission_id IS NOT NULL THEN
    INSERT INTO public.profile_permissions (profile_id, permission_id)
    VALUES (v_profile_id, v_profiles_manage_permission_id);
  END IF;

  RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."handle_new_user"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."is_admin"() RETURNS boolean
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
BEGIN
  RETURN EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND is_admin = true);
END;
$$;


ALTER FUNCTION "public"."is_admin"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."update_updated_at_column"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."update_updated_at_column"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."companies" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "owner_id" "uuid" NOT NULL,
    "name" "text",
    "vat_id" "text",
    "address" "text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "subscription_tier" "text" DEFAULT 'base'::"text" NOT NULL,
    "trial_start_date" timestamp with time zone,
    "trial_end_date" timestamp with time zone
);


ALTER TABLE "public"."companies" OWNER TO "postgres";


COMMENT ON COLUMN "public"."companies"."subscription_tier" IS 'Indica il livello di abbonamento della compagnia (es. base, pro)';



COMMENT ON COLUMN "public"."companies"."trial_start_date" IS 'Data di inizio del periodo di prova per gli utenti demo.';



COMMENT ON COLUMN "public"."companies"."trial_end_date" IS 'Data di fine del periodo di prova per gli utenti demo.';



CREATE TABLE IF NOT EXISTS "public"."in_app_profiles" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "profile_name" "text" NOT NULL,
    "pin_hash" "text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "pin_salt" "text",
    "position" "text",
    "company_id" "uuid"
);


ALTER TABLE "public"."in_app_profiles" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."notifications" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid",
    "title" "text" NOT NULL,
    "message" "text" NOT NULL,
    "type" "text" DEFAULT 'info'::"text",
    "is_read" boolean DEFAULT false,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "reminder_id" "uuid",
    CONSTRAINT "notifications_type_check" CHECK (("type" = ANY (ARRAY['info'::"text", 'success'::"text", 'warning'::"text", 'error'::"text"])))
);


ALTER TABLE "public"."notifications" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."order_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "order_id" "uuid",
    "product_id" "uuid",
    "product_name" "text" NOT NULL,
    "quantity" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."order_items" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."orders" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid",
    "supplier_id" "uuid",
    "order_message" "text" NOT NULL,
    "additional_items" "text",
    "status" "text" DEFAULT 'sent'::"text",
    "scheduled_date" "date",
    "sent_at" timestamp with time zone DEFAULT "now"(),
    "created_at" timestamp with time zone DEFAULT "now"(),
    "ordine_multiplo_id" "uuid",
    CONSTRAINT "orders_status_check" CHECK (("status" = ANY (ARRAY['draft'::"text", 'sent'::"text", 'confirmed'::"text", 'delivered'::"text"])))
);


ALTER TABLE "public"."orders" OWNER TO "postgres";


COMMENT ON COLUMN "public"."orders"."ordine_multiplo_id" IS 'Links the order to a batch order group';



CREATE TABLE IF NOT EXISTS "public"."ordini_multipli" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "nome_ordine" "text" NOT NULL,
    "status" "text" DEFAULT 'draft'::"text" NOT NULL,
    "scheduled_at" timestamp with time zone
);


ALTER TABLE "public"."ordini_multipli" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."permissions" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "name" "text" NOT NULL,
    "description" "text"
);


ALTER TABLE "public"."permissions" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."products" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "supplier_id" "uuid",
    "name" "text" NOT NULL,
    "unit" "text" DEFAULT 'pz'::"text",
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."products" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."profile_permissions" (
    "profile_id" "uuid" NOT NULL,
    "permission_id" "uuid" NOT NULL
);


ALTER TABLE "public"."profile_permissions" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."profiles" (
    "id" "uuid" NOT NULL,
    "push_subscription" "jsonb",
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "first_name" "text",
    "last_name" "text",
    "role" "text",
    "is_approved" boolean DEFAULT false,
    "is_admin" boolean DEFAULT false,
    "company_id" "uuid"
);


ALTER TABLE "public"."profiles" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."scheduled_orders" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid",
    "supplier_id" "uuid",
    "order_data" "jsonb" NOT NULL,
    "is_sent" boolean DEFAULT false,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "reminder_type" "text" DEFAULT 'simple'::"text",
    "scheduled_at" timestamp with time zone,
    CONSTRAINT "scheduled_orders_reminder_type_check" CHECK (("reminder_type" = ANY (ARRAY['simple'::"text", 'prefilled'::"text"])))
);


ALTER TABLE "public"."scheduled_orders" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."suppliers" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "name" "text" NOT NULL,
    "contact_method" "text" NOT NULL,
    "contact" "text" NOT NULL,
    "message_template" "text" DEFAULT 'Buongiorno, vorremmo ordinare i seguenti prodotti:'::"text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "email_subject" "text",
    "user_id" "uuid",
    "products" "jsonb" DEFAULT '[]'::"jsonb",
    "preferred_email_client" "text" DEFAULT 'default'::"text" NOT NULL,
    CONSTRAINT "check_preferred_email_client" CHECK (("preferred_email_client" = ANY (ARRAY['default'::"text", 'gmail'::"text", 'outlook'::"text"]))),
    CONSTRAINT "suppliers_contact_method_check" CHECK (("contact_method" = ANY (ARRAY['whatsapp'::"text", 'whatsapp_group'::"text", 'email'::"text", 'sms'::"text"])))
);


ALTER TABLE "public"."suppliers" OWNER TO "postgres";


ALTER TABLE ONLY "public"."companies"
    ADD CONSTRAINT "companies_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."in_app_profiles"
    ADD CONSTRAINT "in_app_profiles_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "notifications_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."order_items"
    ADD CONSTRAINT "order_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."ordini_multipli"
    ADD CONSTRAINT "ordini_multipli_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."permissions"
    ADD CONSTRAINT "permissions_name_key" UNIQUE ("name");



ALTER TABLE ONLY "public"."permissions"
    ADD CONSTRAINT "permissions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."products"
    ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."profile_permissions"
    ADD CONSTRAINT "profile_permissions_pkey" PRIMARY KEY ("profile_id", "permission_id");



ALTER TABLE ONLY "public"."profiles"
    ADD CONSTRAINT "profiles_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."scheduled_orders"
    ADD CONSTRAINT "scheduled_orders_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."suppliers"
    ADD CONSTRAINT "suppliers_pkey" PRIMARY KEY ("id");



CREATE INDEX "idx_in_app_profiles_user_id" ON "public"."in_app_profiles" USING "btree" ("user_id");



CREATE INDEX "notifications_user_id_idx" ON "public"."notifications" USING "btree" ("user_id", "is_read");



CREATE INDEX "order_items_order_id_idx" ON "public"."order_items" USING "btree" ("order_id");



CREATE INDEX "orders_sent_at_idx" ON "public"."orders" USING "btree" ("sent_at");



CREATE INDEX "orders_supplier_id_idx" ON "public"."orders" USING "btree" ("supplier_id");



CREATE INDEX "orders_user_id_idx" ON "public"."orders" USING "btree" ("user_id");



CREATE INDEX "products_supplier_id_idx" ON "public"."products" USING "btree" ("supplier_id");



CREATE INDEX "scheduled_orders_user_id_idx" ON "public"."scheduled_orders" USING "btree" ("user_id");



CREATE OR REPLACE TRIGGER "update_suppliers_updated_at" BEFORE UPDATE ON "public"."suppliers" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



ALTER TABLE ONLY "public"."companies"
    ADD CONSTRAINT "companies_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "auth"."users"("id");



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "fk_ordine_multiplo" FOREIGN KEY ("ordine_multiplo_id") REFERENCES "public"."ordini_multipli"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."in_app_profiles"
    ADD CONSTRAINT "in_app_profiles_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id");



ALTER TABLE ONLY "public"."in_app_profiles"
    ADD CONSTRAINT "in_app_profiles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "notifications_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."order_items"
    ADD CONSTRAINT "order_items_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."order_items"
    ADD CONSTRAINT "order_items_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "public"."suppliers"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."ordini_multipli"
    ADD CONSTRAINT "ordini_multipli_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."products"
    ADD CONSTRAINT "products_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "public"."suppliers"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."profile_permissions"
    ADD CONSTRAINT "profile_permissions_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "public"."permissions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."profile_permissions"
    ADD CONSTRAINT "profile_permissions_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "public"."in_app_profiles"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."profiles"
    ADD CONSTRAINT "profiles_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id");



ALTER TABLE ONLY "public"."profiles"
    ADD CONSTRAINT "profiles_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."scheduled_orders"
    ADD CONSTRAINT "scheduled_orders_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "public"."suppliers"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."scheduled_orders"
    ADD CONSTRAINT "scheduled_orders_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."suppliers"
    ADD CONSTRAINT "suppliers_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



CREATE POLICY "Admins can manage all profiles" ON "public"."profiles" USING ((("auth"."jwt"() ->> 'is_admin'::"text") = 'true'::"text"));



CREATE POLICY "Admins can update all profiles" ON "public"."profiles" FOR UPDATE USING ("public"."is_admin"());



CREATE POLICY "Admins can view all notifications" ON "public"."notifications" FOR SELECT USING ((EXISTS ( SELECT 1
   FROM "public"."profiles"
  WHERE (("profiles"."id" = "auth"."uid"()) AND ("profiles"."is_admin" = true)))));



CREATE POLICY "Admins can view all profiles" ON "public"."profiles" FOR SELECT USING ("public"."is_admin"());



CREATE POLICY "Allow all users to read permissions" ON "public"."permissions" FOR SELECT USING (true);



CREATE POLICY "Allow individual access for own batch orders" ON "public"."ordini_multipli" TO "authenticated" USING ((( SELECT "auth"."uid"() AS "uid") = "user_id"));



CREATE POLICY "Allow users to delete permissions for their own profiles" ON "public"."profile_permissions" FOR DELETE USING ((EXISTS ( SELECT 1
   FROM "public"."in_app_profiles"
  WHERE (("in_app_profiles"."id" = "profile_permissions"."profile_id") AND ("in_app_profiles"."user_id" = "auth"."uid"())))));



CREATE POLICY "Allow users to insert permissions for their own profiles" ON "public"."profile_permissions" FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."in_app_profiles"
  WHERE (("in_app_profiles"."id" = "profile_permissions"."profile_id") AND ("in_app_profiles"."user_id" = "auth"."uid"())))));



CREATE POLICY "Allow users to manage their in-app profiles" ON "public"."in_app_profiles" USING (("auth"."uid"() = "user_id")) WITH CHECK (("auth"."uid"() = "user_id"));



CREATE POLICY "Allow users to read their own in-app profiles" ON "public"."in_app_profiles" FOR SELECT USING (("auth"."uid"() = "user_id"));



CREATE POLICY "Allow users to read their own profile permissions" ON "public"."profile_permissions" FOR SELECT USING ((EXISTS ( SELECT 1
   FROM "public"."in_app_profiles"
  WHERE (("in_app_profiles"."id" = "profile_permissions"."profile_id") AND ("in_app_profiles"."user_id" = "auth"."uid"())))));



CREATE POLICY "Allow users to update permissions for their own profiles" ON "public"."profile_permissions" FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM "public"."in_app_profiles"
  WHERE (("in_app_profiles"."id" = "profile_permissions"."profile_id") AND ("in_app_profiles"."user_id" = "auth"."uid"()))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."in_app_profiles"
  WHERE (("in_app_profiles"."id" = "profile_permissions"."profile_id") AND ("in_app_profiles"."user_id" = "auth"."uid"())))));



CREATE POLICY "Owners can delete their own company" ON "public"."companies" FOR DELETE USING (("owner_id" = "auth"."uid"()));



CREATE POLICY "Owners can insert their own company" ON "public"."companies" FOR INSERT WITH CHECK (("owner_id" = "auth"."uid"()));



CREATE POLICY "Owners can update their own company" ON "public"."companies" FOR UPDATE USING (("owner_id" = "auth"."uid"())) WITH CHECK (("owner_id" = "auth"."uid"()));



CREATE POLICY "Owners can view their own company" ON "public"."companies" FOR SELECT TO "authenticated" USING (("id" IN ( SELECT "profiles"."company_id"
   FROM "public"."profiles"
  WHERE ("profiles"."id" = ( SELECT "auth"."uid"() AS "uid")))));



CREATE POLICY "Users can delete own suppliers" ON "public"."suppliers" FOR DELETE USING (("auth"."uid"() = "user_id"));



CREATE POLICY "Users can delete products of own suppliers" ON "public"."products" FOR DELETE USING ((EXISTS ( SELECT 1
   FROM "public"."suppliers"
  WHERE (("suppliers"."id" = "products"."supplier_id") AND ("suppliers"."user_id" = ( SELECT "auth"."uid"() AS "uid"))))));



CREATE POLICY "Users can delete their own profile" ON "public"."profiles" FOR DELETE USING (("auth"."uid"() = "id"));



CREATE POLICY "Users can insert own suppliers" ON "public"."suppliers" FOR INSERT WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "user_id"));



CREATE POLICY "Users can insert products to own suppliers" ON "public"."products" FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."suppliers"
  WHERE (("suppliers"."id" = "products"."supplier_id") AND ("suppliers"."user_id" = ( SELECT "auth"."uid"() AS "uid"))))));



CREATE POLICY "Users can insert their own profile" ON "public"."profiles" FOR INSERT WITH CHECK (("auth"."uid"() = "id"));



CREATE POLICY "Users can manage order items of own orders" ON "public"."order_items" USING ((EXISTS ( SELECT 1
   FROM "public"."orders"
  WHERE (("orders"."id" = "order_items"."order_id") AND ("orders"."user_id" = ( SELECT "auth"."uid"() AS "uid")))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."orders"
  WHERE (("orders"."id" = "order_items"."order_id") AND ("orders"."user_id" = ( SELECT "auth"."uid"() AS "uid"))))));



CREATE POLICY "Users can manage their own notifications" ON "public"."notifications" USING ((( SELECT "auth"."uid"() AS "uid") = "user_id")) WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "user_id"));



CREATE POLICY "Users can manage their own orders" ON "public"."orders" USING ((( SELECT "auth"."uid"() AS "uid") = "user_id")) WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "user_id"));



CREATE POLICY "Users can manage their own scheduled orders" ON "public"."scheduled_orders" USING ((( SELECT "auth"."uid"() AS "uid") = "user_id")) WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "user_id"));



CREATE POLICY "Users can update own suppliers" ON "public"."suppliers" FOR UPDATE USING ((( SELECT "auth"."uid"() AS "uid") = "user_id"));



CREATE POLICY "Users can update products of own suppliers" ON "public"."products" FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM "public"."suppliers"
  WHERE (("suppliers"."id" = "products"."supplier_id") AND ("suppliers"."user_id" = ( SELECT "auth"."uid"() AS "uid"))))));



CREATE POLICY "Users can update their own profile" ON "public"."profiles" FOR UPDATE USING (("auth"."uid"() = "id"));



CREATE POLICY "Users can view own notifications" ON "public"."notifications" FOR SELECT USING (("auth"."uid"() = "user_id"));



CREATE POLICY "Users can view own scheduled orders" ON "public"."scheduled_orders" FOR SELECT USING (("auth"."uid"() = "user_id"));



CREATE POLICY "Users can view own suppliers" ON "public"."suppliers" FOR SELECT USING ((( SELECT "auth"."uid"() AS "uid") = "user_id"));



CREATE POLICY "Users can view products of own suppliers" ON "public"."products" FOR SELECT USING ((EXISTS ( SELECT 1
   FROM "public"."suppliers"
  WHERE (("suppliers"."id" = "products"."supplier_id") AND ("suppliers"."user_id" = ( SELECT "auth"."uid"() AS "uid"))))));



CREATE POLICY "Users can view their own profile" ON "public"."profiles" FOR SELECT USING (("auth"."uid"() = "id"));



ALTER TABLE "public"."companies" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."in_app_profiles" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."notifications" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."order_items" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."orders" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."ordini_multipli" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."permissions" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."products" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."profile_permissions" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."profiles" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."scheduled_orders" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."suppliers" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."suppliers";









GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";














































































































































































GRANT ALL ON FUNCTION "public"."get_user_account_ids"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_user_account_ids"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_user_account_ids"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_user_location_ids"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_user_location_ids"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_user_location_ids"() TO "service_role";



GRANT ALL ON FUNCTION "public"."handle_new_user"() TO "anon";
GRANT ALL ON FUNCTION "public"."handle_new_user"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."handle_new_user"() TO "service_role";



GRANT ALL ON FUNCTION "public"."is_admin"() TO "anon";
GRANT ALL ON FUNCTION "public"."is_admin"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."is_admin"() TO "service_role";



GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "anon";
GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "service_role";
























GRANT ALL ON TABLE "public"."companies" TO "anon";
GRANT ALL ON TABLE "public"."companies" TO "authenticated";
GRANT ALL ON TABLE "public"."companies" TO "service_role";



GRANT ALL ON TABLE "public"."in_app_profiles" TO "anon";
GRANT ALL ON TABLE "public"."in_app_profiles" TO "authenticated";
GRANT ALL ON TABLE "public"."in_app_profiles" TO "service_role";



GRANT ALL ON TABLE "public"."notifications" TO "anon";
GRANT ALL ON TABLE "public"."notifications" TO "authenticated";
GRANT ALL ON TABLE "public"."notifications" TO "service_role";



GRANT ALL ON TABLE "public"."order_items" TO "anon";
GRANT ALL ON TABLE "public"."order_items" TO "authenticated";
GRANT ALL ON TABLE "public"."order_items" TO "service_role";



GRANT ALL ON TABLE "public"."orders" TO "anon";
GRANT ALL ON TABLE "public"."orders" TO "authenticated";
GRANT ALL ON TABLE "public"."orders" TO "service_role";



GRANT ALL ON TABLE "public"."ordini_multipli" TO "anon";
GRANT ALL ON TABLE "public"."ordini_multipli" TO "authenticated";
GRANT ALL ON TABLE "public"."ordini_multipli" TO "service_role";



GRANT ALL ON TABLE "public"."permissions" TO "anon";
GRANT ALL ON TABLE "public"."permissions" TO "authenticated";
GRANT ALL ON TABLE "public"."permissions" TO "service_role";



GRANT ALL ON TABLE "public"."products" TO "anon";
GRANT ALL ON TABLE "public"."products" TO "authenticated";
GRANT ALL ON TABLE "public"."products" TO "service_role";



GRANT ALL ON TABLE "public"."profile_permissions" TO "anon";
GRANT ALL ON TABLE "public"."profile_permissions" TO "authenticated";
GRANT ALL ON TABLE "public"."profile_permissions" TO "service_role";



GRANT ALL ON TABLE "public"."profiles" TO "anon";
GRANT ALL ON TABLE "public"."profiles" TO "authenticated";
GRANT ALL ON TABLE "public"."profiles" TO "service_role";



GRANT ALL ON TABLE "public"."scheduled_orders" TO "anon";
GRANT ALL ON TABLE "public"."scheduled_orders" TO "authenticated";
GRANT ALL ON TABLE "public"."scheduled_orders" TO "service_role";



GRANT ALL ON TABLE "public"."suppliers" TO "anon";
GRANT ALL ON TABLE "public"."suppliers" TO "authenticated";
GRANT ALL ON TABLE "public"."suppliers" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";































RESET ALL;
