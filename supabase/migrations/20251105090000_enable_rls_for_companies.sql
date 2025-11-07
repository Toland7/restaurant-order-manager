
-- Enable RLS for the companies table
ALTER TABLE public.companies ENABLE ROW LEVEL SECURITY;

-- Policies for companies table

-- Allow owners to view their own company data
CREATE POLICY "Owners can view their own company" ON public.companies FOR SELECT
USING (owner_id = auth.uid());

-- Allow owners to insert their own company data
CREATE POLICY "Owners can insert their own company" ON public.companies FOR INSERT
WITH CHECK (owner_id = auth.uid());

-- Allow owners to update their own company data
CREATE POLICY "Owners can update their own company" ON public.companies FOR UPDATE
USING (owner_id = auth.uid())
WITH CHECK (owner_id = auth.uid());

-- Allow owners to delete their own company data
CREATE POLICY "Owners can delete their own company" ON public.companies FOR DELETE
USING (owner_id = auth.uid());
