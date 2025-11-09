-- Inizia una transazione per garantire l'atomicità
BEGIN;

-- Rimuovi la policy esistente (se presente)
DROP POLICY IF EXISTS "Owners can view their own company" ON public.companies;

-- Crea la nuova policy con la correzione di performance
CREATE POLICY "Owners can view their own company"
ON public.companies
FOR SELECT
TO authenticated
USING (
    id IN (SELECT company_id FROM public.profiles WHERE id = (select auth.uid()))
);

-- Applica le modifiche
COMMIT;