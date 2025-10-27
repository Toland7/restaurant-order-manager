import { useState, useEffect } from 'react';
import { supabaseHelpers } from '../supabase';

export const useProfile = (user) => {
    const [profile, setProfile] = useState(null);

    useEffect(() => {
        const fetchProfile = async () => {
            if (user) {
                try {
                    const profileData = await supabaseHelpers.getUserProfile(user.id);
                    setProfile(profileData);
                } catch (error) {
                    if (error.code !== 'PGRST116') {
                        console.error('Error fetching profile:', error);
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