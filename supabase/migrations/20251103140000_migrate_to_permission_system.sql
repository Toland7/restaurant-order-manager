-- Remove the 'role' column from the 'in_app_profiles' table
ALTER TABLE public.in_app_profiles DROP COLUMN role;

-- Drop the 'public.role' ENUM type
DROP TYPE public.role;

-- Create the 'permissions' table
CREATE TABLE public.permissions (
    id UUID PRIMARY KEY DEFAULT extensions.uuid_generate_v4(),
    name TEXT UNIQUE NOT NULL,
    description TEXT
);

-- Insert initial permissions
INSERT INTO public.permissions (name, description) VALUES
('orders:send', 'Can send immediate orders'),
('orders:schedule', 'Can schedule future orders'),
('orders:view_all_history', 'Can view all orders history (otherwise only their own)'),
('suppliers:manage', 'Can create/edit/delete suppliers'),
('analytics:view', 'Can view dashboard/statistics'),
('settings:view', 'Can access settings page'),
('profiles:manage', 'Can manage profiles and permissions (OWNER only)');

-- Create the 'profile_permissions' join table
CREATE TABLE public.profile_permissions (
    profile_id UUID REFERENCES public.in_app_profiles(id) ON DELETE CASCADE NOT NULL,
    permission_id UUID REFERENCES public.permissions(id) ON DELETE CASCADE NOT NULL,
    PRIMARY KEY (profile_id, permission_id)
);

-- Enable Row Level Security (RLS) for 'permissions' table
ALTER TABLE public.permissions ENABLE ROW LEVEL SECURITY;

-- RLS Policy for 'permissions': Allow all users to read permissions
CREATE POLICY "Allow all users to read permissions" ON public.permissions FOR SELECT USING (true);

-- Enable Row Level Security (RLS) for 'profile_permissions' table
ALTER TABLE public.profile_permissions ENABLE ROW LEVEL SECURITY;

-- RLS Policy for 'profile_permissions': Allow users to read their own profile permissions
CREATE POLICY "Allow users to read their own profile permissions" ON public.profile_permissions FOR SELECT USING (
    EXISTS (SELECT 1 FROM public.in_app_profiles WHERE id = profile_id AND user_id = auth.uid())
);
