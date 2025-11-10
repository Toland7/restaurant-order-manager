ALTER TABLE public.companies
ADD COLUMN IF NOT EXISTS trial_start_date TIMESTAMP WITH TIME ZONE;

ALTER TABLE public.companies
ADD COLUMN IF NOT EXISTS trial_end_date TIMESTAMP WITH TIME ZONE;

COMMENT ON COLUMN public.companies.trial_start_date IS 'Data di inizio del periodo di prova per gli utenti demo.';
COMMENT ON COLUMN public.companies.trial_end_date IS 'Data di fine del periodo di prova per gli utenti demo.';