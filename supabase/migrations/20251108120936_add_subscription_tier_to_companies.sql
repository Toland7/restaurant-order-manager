ALTER TABLE public.companies
ADD COLUMN IF NOT EXISTS subscription_tier TEXT NOT NULL DEFAULT 'base';

COMMENT ON COLUMN public.companies.subscription_tier IS 'Indica il livello di abbonamento della compagnia (es. base, pro)';