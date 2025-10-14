
import { useState, useEffect, createContext, useContext, useCallback } from 'react';
import { toast } from 'react-hot-toast';
import { supabase, supabaseHelpers } from './supabase';

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [profile, setProfile] = useState(null);
  const [loading, setLoading] = useState(true);

  const fetchProfile = useCallback(async (user) => {
    if (user) {
      try {
        const profileData = await supabaseHelpers.getUserProfile(user.id);
        if (profileData && profileData.is_approved === false) {
          toast.error('Il tuo account è in attesa di approvazione.', { duration: 5000 });
          supabase.auth.signOut();
          setProfile(null);
          setUser(null);
          return;
        }
        setProfile(profileData);
      } catch (error) {
        console.error('Error fetching profile:', error);
        setProfile(null);
      }
    } else {
      setProfile(null);
    }
  }, []);

  useEffect(() => {
    const fetchSession = async () => {
      const { data: { session } } = await supabase.auth.getSession();
      const currentUser = session?.user ?? null;
      setUser(currentUser);
      await fetchProfile(currentUser);
      setLoading(false);
    };

    fetchSession();

    const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
      const currentUser = session?.user ?? null;
      setUser(currentUser);
      await fetchProfile(currentUser);
    });

    return () => {
      subscription.unsubscribe();
    };
  }, [fetchProfile]);

  const value = {
    user,
    profile,
    setProfile,
    signOut: () => supabase.auth.signOut(),
  };

  return (
    <AuthContext.Provider value={value}>
      {!loading && children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  return useContext(AuthContext);
};
