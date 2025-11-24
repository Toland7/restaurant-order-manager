import React, { useEffect, useState, useCallback } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { useOnboarding } from '../../OnboardingContext';
import OnboardingTooltip from './OnboardingTooltip';
import { getTourSteps } from './tourSteps';
import useSubscriptionStatus from '../../hooks/useSubscriptionStatus';

const OnboardingTour = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const { isActive, currentStep, nextStep, previousStep, skipTour, completeTour } = useOnboarding();
  const { isProUser } = useSubscriptionStatus();
  const [targetRect, setTargetRect] = useState(null);
  const [steps, setSteps] = useState([]);

  // Initialize steps based on user subscription
  useEffect(() => {
    setSteps(getTourSteps(isProUser));
  }, [isProUser]);

  const currentStepData = steps[currentStep];

  // Find and highlight target element
  const updateTargetElement = useCallback(() => {
    if (!currentStepData?.target) {
      setTargetRect(null);
      return;
    }

    const element = document.querySelector(currentStepData.target);
    if (element) {
      const rect = element.getBoundingClientRect();
      setTargetRect({
        top: rect.top,
        left: rect.left,
        width: rect.width,
        height: rect.height,
        bottom: rect.bottom,
        right: rect.right,
      });

      // Scroll element into view if needed
      element.scrollIntoView({ behavior: 'smooth', block: 'center' });
    } else {
      setTargetRect(null);
    }
  }, [currentStepData]);

  // Execute step action (e.g., navigate to a page)
  useEffect(() => {
    if (!isActive || !currentStepData) return;

    if (currentStepData.action?.type === 'navigate') {
      const targetPath = currentStepData.action.path;
      if (location.pathname !== targetPath) {
        navigate(targetPath);
      }
    }

    // Wait for navigation and DOM updates before finding target
    const timer = setTimeout(() => {
      updateTargetElement();
    }, 300);

    return () => clearTimeout(timer);
  }, [isActive, currentStepData, navigate, location.pathname, updateTargetElement]);

  // Update target position on window resize
  useEffect(() => {
    if (!isActive) return;

    const handleResize = () => {
      updateTargetElement();
    };

    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  }, [isActive, updateTargetElement]);

  const handleNext = () => {
    if (currentStep === steps.length - 1) {
      completeTour();
    } else {
      nextStep();
    }
  };

  const handlePrevious = () => {
    previousStep();
  };

  const handleSkip = () => {
    skipTour();
  };

  if (!isActive || !currentStepData) return null;

  return (
    <>
      {/* Overlay */}
      <div className="onboarding-overlay" onClick={handleSkip} />

      {/* Spotlight on target element */}
      {targetRect && (
        <div
          className="onboarding-spotlight"
          style={{
            position: 'fixed',
            top: `${targetRect.top - 8}px`,
            left: `${targetRect.left - 8}px`,
            width: `${targetRect.width + 16}px`,
            height: `${targetRect.height + 16}px`,
            zIndex: 10001,
            pointerEvents: 'none',
          }}
        />
      )}

      {/* Tooltip */}
      <OnboardingTooltip
        step={currentStepData}
        currentStepIndex={currentStep}
        totalSteps={steps.length}
        onNext={handleNext}
        onPrevious={handlePrevious}
        onSkip={handleSkip}
        targetRect={targetRect}
        position={currentStepData.position}
      />
    </>
  );
};

export default OnboardingTour;
