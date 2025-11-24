import React, { createContext, useContext, useState, useCallback, useEffect } from 'react';
import { supabaseHelpers } from './supabase.js';
import { toast } from 'react-hot-toast';
import logger from './utils/logger';

const OnboardingContext = createContext();

export const useOnboarding = () => {
  const context = useContext(OnboardingContext);
  if (!context) {
    throw new Error('useOnboarding must be used within OnboardingProvider');
  }
  return context;
};

export const OnboardingProvider = ({ children, user }) => {
  const [isActive, setIsActive] = useState(false);
  const [currentStep, setCurrentStep] = useState(0);
  const [hasCompletedOnboarding, setHasCompletedOnboarding] = useState(null);
  const [loading, setLoading] = useState(true);

  // Load onboarding status from database
  useEffect(() => {
    const loadOnboardingStatus = async () => {
      if (!user?.id) {
        setLoading(false);
        return;
      }

      try {
        const status = await supabaseHelpers.getOnboardingStatus(user.id);
        setHasCompletedOnboarding(status);
        setLoading(false);

        // Auto-start tour for new users
        if (status === false) {
          // Small delay to ensure UI is ready
          setTimeout(() => {
            setIsActive(true);
            setCurrentStep(0);
          }, 1000);
        }
      } catch (error) {
        logger.error('Error loading onboarding status:', error);
        setLoading(false);
      }
    };

    loadOnboardingStatus();
  }, [user?.id]);

  const startTour = useCallback(() => {
    setIsActive(true);
    setCurrentStep(0);
  }, []);

  const nextStep = useCallback(() => {
    setCurrentStep(prev => prev + 1);
  }, []);

  const previousStep = useCallback(() => {
    setCurrentStep(prev => Math.max(0, prev - 1));
  }, []);

  const skipTour = useCallback(async () => {
    setIsActive(false);
    setCurrentStep(0);
    
    if (user?.id) {
      try {
        await supabaseHelpers.updateOnboardingStatus(user.id, true);
        setHasCompletedOnboarding(true);
      } catch (error) {
        logger.error('Error updating onboarding status:', error);
      }
    }
  }, [user?.id]);

  const completeTour = useCallback(async () => {
    setIsActive(false);
    setCurrentStep(0);
    
    if (user?.id) {
      try {
        await supabaseHelpers.updateOnboardingStatus(user.id, true);
        setHasCompletedOnboarding(true);
        toast.success('Guida completata! Benvenuto! 🎉');
      } catch (error) {
        logger.error('Error completing onboarding:', error);
        toast.error('Errore durante il salvataggio del progresso');
      }
    }
  }, [user?.id]);

  const value = {
    isActive,
    currentStep,
    hasCompletedOnboarding,
    loading,
    startTour,
    nextStep,
    previousStep,
    skipTour,
    completeTour,
  };

  return (
    <OnboardingContext.Provider value={value}>
      {children}
    </OnboardingContext.Provider>
  );
};
