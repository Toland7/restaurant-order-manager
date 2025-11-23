import React, { createContext, useContext, useState, useEffect, useCallback } from 'react';
import { supabase } from './supabase'; // Assuming supabase client is exported from here

import logger from './utils/logger';
const ProfileContext = createContext(null);

export const ProfileProvider = ({ children }) => {
  const [selectedProfile, setSelectedProfile] = useState(null);
  const [loadingProfile, setLoadingProfile] = useState(true);
  const [profilePermissions, setProfilePermissions] = useState([]);
  const [isPinModalOpen, setIsPinModalOpen] = useState(false);
  const [profileToVerify, setProfileToVerify] = useState(null);

  // Attempt to load selected profile from localStorage on initial render
  useEffect(() => {
    const storedProfile = localStorage.getItem('selectedProfile');
    if (storedProfile) {
      setSelectedProfile(JSON.parse(storedProfile));
    }
    setLoadingProfile(false);
  }, []);

  // New function to update profile and sync with localStorage
  const updateSelectedProfile = (profile) => {
    setSelectedProfile(profile);
    if (profile) {
      localStorage.setItem('selectedProfile', JSON.stringify(profile));
    } else {
      localStorage.removeItem('selectedProfile');
    }
  };

  const openPinModal = (profile) => {
    setProfileToVerify(profile);
    setIsPinModalOpen(true);
  };

  const closePinModal = () => {
    setProfileToVerify(null);
    setIsPinModalOpen(false);
  };

  // Fetch permissions when selectedProfile changes OR for current user (demo/base)
  useEffect(() => {
    const fetchPermissions = async () => {
      // For Pro users: use selectedProfile
      if (selectedProfile?.id) {
        const { data, error } = await supabase
          .from('profile_permissions')
          .select('permissions(name)')
          .eq('profile_id', selectedProfile.id);

        if (error) {
          logger.error('Error fetching profile permissions:', error);
          setProfilePermissions([]);
        } else {
          const fetchedPermissions = data.map(pp => pp.permissions.name);
          setProfilePermissions(fetchedPermissions);
        }
      } else {
        // For demo/base users: load from current user's in_app_profile
        const { data: { user } } = await supabase.auth.getUser();
        
        if (user) {
          // Get user's in_app_profile
          const { data: profileData, error: profileError } = await supabase
            .from('in_app_profiles')
            .select('id')
            .eq('user_id', user.id)
            .maybeSingle();
          
          if (profileError || !profileData) {
            logger.error('Error fetching in_app_profile:', profileError);
            setProfilePermissions([]);
            return;
          }
          
          // Get permissions for this profile
          const { data: permData, error: permError } = await supabase
            .from('profile_permissions')
            .select('permissions(name)')
            .eq('profile_id', profileData.id);
          
          if (permError) {
            logger.error('Error fetching permissions:', permError);
            setProfilePermissions([]);
          } else {
            const fetchedPermissions = permData.map(pp => pp.permissions.name);
            setProfilePermissions(fetchedPermissions);
          }
        } else {
          setProfilePermissions([]);
        }
      }
    };

    fetchPermissions();
  }, [selectedProfile]);

  // Function to check if the selected profile has a specific permission
  const hasPermission = useCallback((permissionName) => {
    return profilePermissions.includes(permissionName);
  }, [profilePermissions]);

  return (
    <ProfileContext.Provider value={{ 
      selectedProfile, 
      setSelectedProfile: updateSelectedProfile, 
      loadingProfile, 
      profilePermissions, 
      hasPermission,
      isPinModalOpen,
      profileToVerify,
      openPinModal,
      closePinModal
    }}>
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
