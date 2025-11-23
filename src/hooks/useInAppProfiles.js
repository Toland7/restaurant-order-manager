import { useState, useEffect } from 'react';
import { supabase } from '../supabase';
import { useAuth } from '../AuthContext';

import logger from '../utils/logger';
export const useInAppProfiles = () => {
  const { user } = useAuth();
  const [profiles, setProfiles] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchProfiles = async () => {
      if (!user) {
        setProfiles([]); // Clear profiles if user logs out
        setLoading(false);
        return;
      }

      try {
        setLoading(true);
        setError(null); // Clear previous errors

        const { data: profileData, error: profileError } = await supabase
          .from('profiles')
          .select('company_id')
          .eq('id', user.id)
          .maybeSingle(); // Use maybeSingle() instead of single() to handle 0 or 1 rows

        // Handle PGRST116 (no rows found) gracefully
        if (profileError && profileError.code === 'PGRST116') {
          setProfiles([]);
          setLoading(false);
          return;
        } else if (profileError) {
          throw profileError;
        }

        if (!profileData || !profileData.company_id) {
          // This case is already handled by PGRST116 check, but good for robustness
          setProfiles([]);
          setLoading(false);
          return;
        }

        const { data, error } = await supabase
          .from('in_app_profiles')
          .select('*')
          .eq('company_id', profileData.company_id); // Filter by company_id

        if (error) {
          throw error;
        }

        setProfiles(data);
      } catch (err) {
        setError(err.message);
        logger.error("Error fetching in-app profiles:", err);
        setProfiles([]); // Clear profiles on error
      } finally {
        setLoading(false);
      }
    };

    fetchProfiles();
  }, [user]);

  return { profiles, loading, error, setProfiles };
};
