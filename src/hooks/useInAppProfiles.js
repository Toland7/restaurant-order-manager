import { useState, useEffect } from 'react';
import { supabase } from '../supabase'; // Assuming supabase client is exported from here
import { useAuth } from '../AuthContext';

export const useInAppProfiles = () => {
  const { user } = useAuth();
  const [profiles, setProfiles] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchProfiles = async () => {
      if (!user) {
        setLoading(false);
        return;
      }

      try {
        setLoading(true);
        const { data, error } = await supabase
          .from('in_app_profiles')
          .select('*')
          .eq('user_id', user.id);

        if (error) {
          throw error;
        }

        setProfiles(data);
      } catch (err) {
        setError(err.message);
        console.error("Error fetching in-app profiles:", err);
      } finally {
        setLoading(false);
      }
    };

    fetchProfiles();
  }, [user]);

  return { profiles, loading, error, setProfiles };
};
