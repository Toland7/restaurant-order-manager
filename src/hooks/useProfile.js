import { useState, useEffect } from 'react';
import { supabaseHelpers } from '../supabase';
import { toast } from 'react-hot-toast'; // Import toast
import { supabase } from '../supabase'; // Import supabase for signOut

import logger from '../utils/logger';
export const useProfile = (user) => {
    const [profile, setProfile] = useState(null);

    useEffect(() => {
        const fetchProfile = async () => {
            if (user) {
                // Check for email confirmation
                if (!user.email_confirmed_at) {
                    toast.error("Controlla la tua email per confermare l'account.", { duration: 5000 });
                    supabase.auth.signOut(); // Sign out if email not confirmed
                    setProfile(null);
                    return;
                }

                try {
                    const profileData = await supabaseHelpers.getUserProfile(user.id);
                    setProfile(profileData);
                } catch (error) {
                    if (error.code !== 'PGRST116') {
                        logger.error('Error fetching profile:', error);
                    }
                    setProfile(null);
                }
            } else {
                setProfile(null);
            }
        };

        fetchProfile();
    }, [user]);

    return { profile, setProfile };
};