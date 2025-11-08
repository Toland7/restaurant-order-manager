



-- SEED DATA
SET session_replication_role = replica;

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "created_at", "updated_at", "confirmation_token", "email_change_token_current", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous")
VALUES
('00000000-0000-0000-0000-000000000000', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'authenticated', 'authenticated', 'ouazanaruben@icloud.com', '$2a$10$/w3FeN/9TGkeNpfwnEnbVefdB73Bv7BLwFEonmLEjm0taWvZl1YDa', '2025-09-22 12:17:18.378675+00', '', NULL, '', '', NULL, '2025-10-31 18:45:28.45858+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "c23a8c58-925a-47ce-9491-9e0db8b5c16a", "email": "ouazanaruben@icloud.com", "email_verified": true, "phone_verified": false}', '2025-09-22 12:17:07.141226+00', '2025-11-02 23:31:49.758938+00', '', '', NULL, NULL, '', '', NULL, '', NULL, false, NULL, false);

INSERT INTO "public"."profiles" ("id", "updated_at", "first_name", "last_name", "is_approved", "is_admin") VALUES
('c23a8c58-925a-47ce-9491-9e0db8b5c16a', '2025-09-22 12:17:07.138552+00', 'Ruben', 'Ouazana', true, true);



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
