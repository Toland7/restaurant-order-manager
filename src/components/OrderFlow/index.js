import React, { createContext, useContext, useState, useMemo } from 'react';

// 1. Create the context
const OrderFlowContext = createContext();

// Custom hook for easy consumption
export const useOrderFlow = () => {
  const context = useContext(OrderFlowContext);
  if (!context) {
    throw new Error('useOrderFlow must be used within an OrderFlow provider');
  }
  return context;
};

// 2. Create the Parent Component (Provider)
const OrderFlow = ({ children, initialStep }) => {
  const [currentStep, setCurrentStep] = useState(initialStep);

  const steps = useMemo(() => 
    React.Children.toArray(children).map(child => child.props.name), 
    [children]
  );

  const currentStepIndex = steps.indexOf(currentStep);

  const goToStep = (stepName) => {
    if (steps.includes(stepName)) {
      setCurrentStep(stepName);
    } else {
      console.warn(`OrderFlow: Step "${stepName}" does not exist.`);
    }
  };

  const goToNextStep = () => {
    const nextStepIndex = currentStepIndex + 1;
    if (nextStepIndex < steps.length) {
      setCurrentStep(steps[nextStepIndex]);
    }
  };

  const goToPrevStep = () => {
    const prevStepIndex = currentStepIndex - 1;
    if (prevStepIndex >= 0) {
      setCurrentStep(steps[prevStepIndex]);
    }
  };

  const value = {
    currentStep,
    goToStep,
    goToNextStep,
    goToPrevStep,
    isFirstStep: currentStepIndex === 0,
    isLastStep: currentStepIndex === steps.length - 1,
  };

  return (
    <OrderFlowContext.Provider value={value}>
      {children}
    </OrderFlowContext.Provider>
  );
};

// 3. Create the Child Components
const Step = ({ name, children }) => {
  const { currentStep } = useOrderFlow();
  return currentStep === name ? <>{children}</> : null;
};

// Generic button handler logic
const createNavButton = (useNavLogic) => {
  return ({ children, onClick, ...props }) => {
    const navFunction = useNavLogic();

    const handleClick = (e) => {
      let shouldNavigate = true;
      if (onClick) {
        const result = onClick(e);
        // If the onClick handler returns null or false, prevent navigation
        if (result === null || result === false) {
          shouldNavigate = false;
        }
      }
      if (shouldNavigate) {
        navFunction();
      }
    };

    return <button onClick={handleClick} {...props}>{children}</button>;
  };
};

const NextButton = createNavButton(() => {
  const { goToNextStep, isLastStep } = useOrderFlow();
  return isLastStep ? null : goToNextStep;
});

const PrevButton = createNavButton(() => {
  const { goToPrevStep, isFirstStep } = useOrderFlow();
  return isFirstStep ? null : goToPrevStep;
});

const GoToStepButton = ({ children, stepName, onClick, ...props }) => {
    const { goToStep } = useOrderFlow();

    const handleClick = (e) => {
        let shouldNavigate = true;
        if (onClick) {
            const result = onClick(e);
            if (result === null || result === false) {
                shouldNavigate = false;
            }
        }
        if (shouldNavigate) {
            goToStep(stepName);
        }
    };

    return <button onClick={handleClick} {...props}>{children}</button>;
};

// 4. Attach child components to the parent
OrderFlow.Step = Step;
OrderFlow.NextButton = NextButton;
OrderFlow.PrevButton = PrevButton;
OrderFlow.GoToStepButton = GoToStepButton;

export default OrderFlow;
