import React, { createContext, useContext, useState, useEffect } from 'react';
import { useAuth } from '../AuthContext';
import { useProfile } from './useProfile';

const SubscriptionContext = createContext({
  tier: 'base',
  isPro: false,
  isDemo: false,
  isTrialActive: false,
  isTrialExpired: false,
  daysRemainingInTrial: 0,
  loading: true,
});

export const SubscriptionProvider = ({ children }) => {
  const { user } = useAuth();
  const { profile } = useProfile(user);
  const [subscription, setSubscription] = useState({
    tier: 'base',
    isPro: false,
    isDemo: false,
    isTrialActive: false,
    isTrialExpired: false,
    daysRemainingInTrial: 0,
    loading: true,
  });

  useEffect(() => {
    if (profile) {
      const tier = profile.companies?.subscription_tier || 'base';
      const trialStartDate = profile.companies?.trial_start_date ? new Date(profile.companies.trial_start_date) : null;
      const trialEndDate = profile.companies?.trial_end_date ? new Date(profile.companies.trial_end_date) : null;

      let isTrialActive = false;
      let isTrialExpired = false;
      let daysRemainingInTrial = 0;

      if (tier === 'demo' && trialStartDate && trialEndDate) {
        const now = new Date();
        
        if (now >= trialStartDate && now <= trialEndDate) {
          isTrialActive = true;
          const diffTime = Math.abs(trialEndDate.getTime() - now.getTime());
          daysRemainingInTrial = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
        } else if (now > trialEndDate) {
          isTrialExpired = true;
        }
      }

      setSubscription({
        tier: tier,
        isPro: tier === 'pro',
        isDemo: tier === 'demo',
        isTrialActive: isTrialActive,
        isTrialExpired: isTrialExpired,
        daysRemainingInTrial: daysRemainingInTrial,
        loading: false,
      });
    } else if (!user) {
      setSubscription({
        tier: 'base',
        isPro: false,
        isDemo: false,
        isTrialActive: false,
        isTrialExpired: false,
        daysRemainingInTrial: 0,
        loading: false,
      });
    } else {
      setSubscription(sub => ({ ...sub, loading: true }));
    }
  }, [profile, user]);

  return (
    <SubscriptionContext.Provider value={subscription}>
      {children}
    </SubscriptionContext.Provider>
  );
};

const useSubscriptionStatus = () => {
  const context = useContext(SubscriptionContext);
  if (context === undefined) {
    throw new Error('useSubscriptionStatus must be used within a SubscriptionProvider');
  }
  return {
    isProUser: context.isPro,
    subscriptionTier: context.tier,
    loadingSubscription: context.loading,
    isDemoUser: context.isDemo,
    isTrialActive: context.isTrialActive,
    isTrialExpired: context.isTrialExpired,
    daysRemainingInTrial: context.daysRemainingInTrial,
  };
};

export default useSubscriptionStatus;