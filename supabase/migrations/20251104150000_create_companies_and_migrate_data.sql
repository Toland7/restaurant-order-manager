
-- 1. Create companies table
CREATE TABLE public.companies (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    owner_id UUID NOT NULL REFERENCES auth.users(id),
    name TEXT,
    vat_id TEXT,
    address TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);
-- 2. Add company_id to profiles and in_app_profiles
ALTER TABLE public.profiles ADD COLUMN company_id UUID REFERENCES public.companies(id);
ALTER TABLE public.in_app_profiles ADD COLUMN company_id UUID REFERENCES public.companies(id);
-- 3. Data Migration Script
DO $$
DECLARE
    profile_record RECORD;
    company_id_var UUID;
BEGIN
    FOR profile_record IN SELECT * FROM public.profiles
    LOOP
        -- Create a company for each profile
        INSERT INTO public.companies (owner_id, name, vat_id, address)
        VALUES (profile_record.id, profile_record.company_name, profile_record.company_vat_id, profile_record.headquarters_address)
        RETURNING id INTO company_id_var;

        -- Update the profile with the new company_id
        UPDATE public.profiles
        SET company_id = company_id_var
        WHERE id = profile_record.id;

        -- Update all in_app_profiles associated with this user
        UPDATE public.in_app_profiles
        SET company_id = company_id_var
        WHERE user_id = profile_record.id;
    END LOOP;
END $$;
-- 4. Drop old columns from profiles
ALTER TABLE public.profiles
DROP COLUMN company_name,
DROP COLUMN company_vat_id,
DROP COLUMN headquarters_name,
DROP COLUMN headquarters_address;
