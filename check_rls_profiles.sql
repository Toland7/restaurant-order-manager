-- Query per verificare le RLS policies sulla tabella profiles
-- Esegui questa query nel SQL Editor di Supabase Dashboard

-- 1. Verifica se RLS è abilitato
SELECT tablename, rowsecurity 
FROM pg_tables 
WHERE schemaname = 'public' AND tablename = 'profiles';

-- 2. Visualizza tutte le policy sulla tabella profiles
SELECT 
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    qual,
    with_check
FROM pg_policies
WHERE schemaname = 'public' AND tablename = 'profiles';

-- 3. Se non ci sono policy, creale:
-- (Esegui SOLO se la query precedente non mostra policy)

-- Consenti agli utenti di leggere il proprio profilo
CREATE POLICY "Users can view their own profile"
ON public.profiles FOR SELECT
USING (auth.uid() = id);

-- Consenti agli utenti di aggiornare il proprio profilo
CREATE POLICY "Users can update their own profile"
ON public.profiles FOR UPDATE
USING (auth.uid() = id);

-- Consenti l'inserimento del profilo (necessario per il trigger handle_new_user)
CREATE POLICY "Allow insert for authenticated users"
ON public.profiles FOR INSERT
WITH CHECK (auth.uid() = id);
