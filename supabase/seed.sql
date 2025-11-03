

-- RLS POLICIES FOR EXISTING TABLES
ALTER TABLE "public"."profiles" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view their own profile" ON "public"."profiles" FOR SELECT USING (("auth"."uid"() = "id"));
CREATE POLICY "Users can insert their own profile" ON "public"."profiles" FOR INSERT WITH CHECK (("auth"."uid"() = "id"));
CREATE POLICY "Users can update their own profile" ON "public"."profiles" FOR UPDATE USING (("auth"."uid"() = "id"));

ALTER TABLE "public"."suppliers" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own suppliers" ON "public"."suppliers" FOR SELECT USING (("auth"."uid"() = "user_id"));
CREATE POLICY "Users can insert own suppliers" ON "public"."suppliers" FOR INSERT WITH CHECK (("auth"."uid"() = "user_id"));

ALTER TABLE "public"."orders" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own orders" ON "public"."orders" FOR SELECT USING (("auth"."uid"() = "user_id"));
CREATE POLICY "Users can insert own orders" ON "public"."orders" FOR INSERT WITH CHECK (("auth"."uid"() = "user_id"));

ALTER TABLE "public"."notifications" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own notifications" ON "public"."notifications" FOR SELECT USING (("auth"."uid"() = "user_id"));

ALTER TABLE "public"."scheduled_orders" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own scheduled orders" ON "public"."scheduled_orders" FOR SELECT USING (("auth"."uid"() = "user_id"));

-- SEED DATA
SET session_replication_role = replica;

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "created_at", "updated_at", "confirmation_token", "email_change_token_current", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous")
VALUES
('00000000-0000-0000-0000-000000000000', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'authenticated', 'authenticated', 'ouazanaruben@icloud.com', '$2a$10$/w3FeN/9TGkeNpfwnEnbVefdB73Bv7BLwFEonmLEjm0taWvZl1YDa', '2025-09-22 12:17:18.378675+00', '', NULL, '', '', NULL, '2025-10-31 18:45:28.45858+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "c23a8c58-925a-47ce-9491-9e0db8b5c16a", "email": "ouazanaruben@icloud.com", "email_verified": true, "phone_verified": false}', '2025-09-22 12:17:07.141226+00', '2025-11-02 23:31:49.758938+00', '', '', NULL, NULL, '', '', NULL, '', NULL, false, NULL, false);

INSERT INTO "public"."profiles" ("id", "updated_at", "first_name", "last_name", "is_approved", "is_admin") VALUES
('c23a8c58-925a-47ce-9491-9e0db8b5c16a', '2025-09-22 12:17:07.138552+00', 'Ruben', 'Ouazana', true, true);

-- NEW FEATURE SCHEMA


CREATE TABLE public.in_app_profiles (
    id UUID PRIMARY KEY DEFAULT extensions.uuid_generate_v4(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    profile_name TEXT NOT NULL,

    pin_hash TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

ALTER TABLE public.in_app_profiles ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow users to read their own in-app profiles" ON public.in_app_profiles FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Allow owners to manage their in-app profiles" ON public.in_app_profiles FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- NEW FEATURE DATA
INSERT INTO public.in_app_profiles (user_id, profile_name)
SELECT
    p.id,
    COALESCE(p.first_name || ' ' || p.last_name, u.email)
FROM
    public.profiles p
JOIN
    auth.users u ON p.id = u.id;

-- Assign 'profiles:manage' permission to the newly created in_app_profiles
INSERT INTO public.profile_permissions (profile_id, permission_id)
SELECT
    iap.id,
    (SELECT id FROM public.permissions WHERE name = 'profiles:manage')
FROM
    public.in_app_profiles iap
WHERE
    NOT EXISTS (
        SELECT 1
        FROM public.profile_permissions pp
        WHERE pp.profile_id = iap.id
        AND pp.permission_id = (SELECT id FROM public.permissions WHERE name = 'profiles:manage')
    );
