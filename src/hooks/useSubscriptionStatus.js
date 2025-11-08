import React, { createContext, useContext, useState, useEffect } from 'react';
import { useAuth } from '../AuthContext';
import { useProfile } from './useProfile';

// 1. Create the context
const SubscriptionContext = createContext({
  tier: 'base',
  isPro: false,
  loading: true,
});

// 2. Create the provider component
export const SubscriptionProvider = ({ children }) => {
  const { user } = useAuth();
  const { profile } = useProfile(user);
  const [subscription, setSubscription] = useState({
    tier: 'base',
    isPro: false,
    loading: true,
  });

  useEffect(() => {
    // The 'profile' object is null while loading or if there's no user
    if (profile) {
      // The 'companies' object is nested inside the 'profile' object from our query
      const tier = profile.companies?.subscription_tier || 'base';
      setSubscription({
        tier: tier,
        isPro: tier === 'pro',
        loading: false,
      });
    } else if (!user) {
        // If there is no user, they are definitely not pro and not loading
        setSubscription({
            tier: 'base',
            isPro: false,
            loading: false,
        });
    } else {
        // If there is a user but no profile yet, we are loading
        setSubscription(sub => ({ ...sub, loading: true }));
    }
  }, [profile, user]);

  return (
    <SubscriptionContext.Provider value={subscription}>
      {children}
    </SubscriptionContext.Provider>
  );
};

// 3. Create the custom hook to consume the context
const useSubscriptionStatus = () => {
  const context = useContext(SubscriptionContext);
  if (context === undefined) {
    throw new Error('useSubscriptionStatus must be used within a SubscriptionProvider');
  }
  
  // The existing code in MainApp.js expects an object with `isProUser`.
  // We provide that and add the other values for future flexibility.
  return { 
    isProUser: context.isPro, 
    subscriptionTier: context.tier,
    loadingSubscription: context.loading 
  };
};

export default useSubscriptionStatus;