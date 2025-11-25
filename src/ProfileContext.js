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

  const [requiresProfileSelection, setRequiresProfileSelection] = useState(false);
  const [pendingNavigation, setPendingNavigationState] = useState(null);
  const [lastAuthenticationTime, setLastAuthenticationTime] = useState(null);

  // Attempt to load selected profile from localStorage on initial render
  useEffect(() => {
    const storedProfile = localStorage.getItem('selectedProfile');
    if (storedProfile) {
      setSelectedProfile(JSON.parse(storedProfile));
    }
    setLoadingProfile(false);
  }, []);

  const openPinModal = (profile) => {
    setProfileToVerify(profile);
    setIsPinModalOpen(true);
  };

  const closePinModal = () => {
    setProfileToVerify(null);
    setIsPinModalOpen(false);
  };

  const setSelectedProfileWithTimestamp = useCallback((profile) => {
    setSelectedProfile(profile);
    if (profile) {
      setLastAuthenticationTime(Date.now());
      localStorage.setItem('selectedProfile', JSON.stringify(profile));
      setRequiresProfileSelection(false); // Reset flag when profile is selected
    } else {
      localStorage.removeItem('selectedProfile');
    }
  }, []);

  // Pending navigation management for push notifications
  const setPendingNavigation = useCallback((url) => {
    if (!url || url === '/') {
      logger.info('Attempted to set pending navigation with empty or root URL, ignoring:', url);
      return;
    }
    logger.info('Setting pending navigation:', url);
    setPendingNavigationState(url);
  }, []);

  const clearPendingNavigation = useCallback(() => {
    logger.info('Clearing pending navigation');
    setPendingNavigationState(null);
  }, []);

  const executePendingNavigation = useCallback((navigate) => {
    if (pendingNavigation && pendingNavigation !== '/') {
      logger.info('Executing pending navigation:', pendingNavigation);
      const urlToNavigate = pendingNavigation;
      setPendingNavigationState(null);
      
      // Extract path and search params from the URL
      try {
        const url = new URL(urlToNavigate, window.location.origin);
        const fullPath = url.pathname + url.search;
        navigate(fullPath);
      } catch (error) {
        logger.error('Error parsing pending navigation URL:', error);
        navigate(pendingNavigation);
      }
      return true;
    }
    return false;
  }, [pendingNavigation]);

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
          
          if (profileError) {
            if (profileError.code === 'PGRST116') {
              // Multiple profiles found, require selection
              logger.info('Multiple profiles found, requiring selection.');
              setRequiresProfileSelection(true);
              setProfilePermissions([]);
              return;
            }
            logger.error('Error fetching in_app_profile:', profileError);
            setProfilePermissions([]);
            return;
          }

          if (!profileData) {
            // No profile found
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
      setSelectedProfile: setSelectedProfileWithTimestamp, 
      loadingProfile, 
      profilePermissions, 
      hasPermission,
      isPinModalOpen,
      profileToVerify,
      openPinModal,
      closePinModal,
      requiresProfileSelection,
      setPendingNavigation,
      clearPendingNavigation,
      executePendingNavigation,
      pendingNavigation,
      lastAuthenticationTime
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
