import React, { createContext, useContext, useState, useEffect, useCallback } from 'react';
import { supabase } from './supabase'; // Assuming supabase client is exported from here

const ProfileContext = createContext(null);

export const ProfileProvider = ({ children }) => {
  const [selectedProfile, setSelectedProfile] = useState(null);
  const [loadingProfile, setLoadingProfile] = useState(true);
  const [profilePermissions, setProfilePermissions] = useState([]); // New state for permissions

  // Attempt to load selected profile from localStorage on initial render
  useEffect(() => {
    const storedProfile = localStorage.getItem('selectedProfile');
    if (storedProfile) {
      setSelectedProfile(JSON.parse(storedProfile));
    }
    setLoadingProfile(false);
  }, []);

  // Fetch permissions when selectedProfile changes
  useEffect(() => {
    const fetchPermissions = async () => {
      if (selectedProfile?.id) {
        const { data, error } = await supabase
          .from('profile_permissions')
          .select('permissions(name)')
          .eq('profile_id', selectedProfile.id);

        if (error) {
          console.error('Error fetching profile permissions:', error);
          setProfilePermissions([]);
        } else {
          const fetchedPermissions = data.map(pp => pp.permissions.name);
          setProfilePermissions(fetchedPermissions);
        }
      } else {
        setProfilePermissions([]);
      }
    };

    fetchPermissions();
  }, [selectedProfile]);

  // Function to check if the selected profile has a specific permission
  const hasPermission = useCallback((permissionName) => {
    return profilePermissions.includes(permissionName);
  }, [profilePermissions]);

  return (
    <ProfileContext.Provider value={{ selectedProfile, setSelectedProfile, loadingProfile, profilePermissions, hasPermission }}>
      {children}
    </ProfileContext.Provider>
  );
};

export const useProfileContext = () => {
  const context = useContext(ProfileContext);
  if (!context) {
    throw new Error('useProfileContext must be used within a ProfileProvider');
  }
  return context;
};
