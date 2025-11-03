-- Create the ENUM type for roles
CREATE TYPE public.role AS ENUM ('OWNER', 'MEMBER');

-- Create the in_app_profiles table
CREATE TABLE public.in_app_profiles (
    id UUID PRIMARY KEY DEFAULT extensions.uuid_generate_v4(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    profile_name TEXT NOT NULL,
    role public.role NOT NULL DEFAULT 'MEMBER',
    pin_hash TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Add indexes for performance
CREATE INDEX idx_in_app_profiles_user_id ON public.in_app_profiles(user_id);

-- Enable Row Level Security (RLS)
ALTER TABLE public.in_app_profiles ENABLE ROW LEVEL SECURITY;

-- RLS Policies
CREATE POLICY "Allow users to read their own in-app profiles" ON public.in_app_profiles FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Allow users to manage their in-app profiles" ON public.in_app_profiles FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
