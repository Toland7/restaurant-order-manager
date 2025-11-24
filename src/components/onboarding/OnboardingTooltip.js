import React, { useEffect, useState } from 'react';
import { X, ChevronLeft, ChevronRight } from 'lucide-react';

const OnboardingTooltip = ({ 
  step, 
  currentStepIndex, 
  totalSteps, 
  onNext, 
  onPrevious, 
  onSkip,
  targetRect,
  position = 'bottom'
}) => {
  const [tooltipStyle, setTooltipStyle] = useState({});
  const [arrowStyle, setArrowStyle] = useState({});

  useEffect(() => {
    if (!targetRect && position !== 'center') return;

    const calculatePosition = () => {
      if (position === 'center') {
        return {
          tooltip: {
            position: 'fixed',
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            zIndex: 10002,
          },
          arrow: { display: 'none' }
        };
      }

      const spacing = 20;
      const arrowSize = 12;
      let tooltip = { position: 'fixed', zIndex: 10002 };
      let arrow = { position: 'absolute' };

      switch (position) {
        case 'bottom':
          tooltip.top = `${targetRect.bottom + spacing}px`;
          tooltip.left = `${targetRect.left + targetRect.width / 2}px`;
          tooltip.transform = 'translateX(-50%)';
          arrow.top = `-${arrowSize}px`;
          arrow.left = '50%';
          arrow.transform = 'translateX(-50%)';
          arrow.borderLeft = `${arrowSize}px solid transparent`;
          arrow.borderRight = `${arrowSize}px solid transparent`;
          arrow.borderBottom = `${arrowSize}px solid rgba(255, 255, 255, 0.95)`;
          break;
        case 'top':
          tooltip.bottom = `${window.innerHeight - targetRect.top + spacing}px`;
          tooltip.left = `${targetRect.left + targetRect.width / 2}px`;
          tooltip.transform = 'translateX(-50%)';
          arrow.bottom = `-${arrowSize}px`;
          arrow.left = '50%';
          arrow.transform = 'translateX(-50%)';
          arrow.borderLeft = `${arrowSize}px solid transparent`;
          arrow.borderRight = `${arrowSize}px solid transparent`;
          arrow.borderTop = `${arrowSize}px solid rgba(255, 255, 255, 0.95)`;
          break;
        case 'left':
          tooltip.top = `${targetRect.top + targetRect.height / 2}px`;
          tooltip.right = `${window.innerWidth - targetRect.left + spacing}px`;
          tooltip.transform = 'translateY(-50%)';
          arrow.right = `-${arrowSize}px`;
          arrow.top = '50%';
          arrow.transform = 'translateY(-50%)';
          arrow.borderTop = `${arrowSize}px solid transparent`;
          arrow.borderBottom = `${arrowSize}px solid transparent`;
          arrow.borderLeft = `${arrowSize}px solid rgba(255, 255, 255, 0.95)`;
          break;
        case 'right':
          tooltip.top = `${targetRect.top + targetRect.height / 2}px`;
          tooltip.left = `${targetRect.right + spacing}px`;
          tooltip.transform = 'translateY(-50%)';
          arrow.left = `-${arrowSize}px`;
          arrow.top = '50%';
          arrow.transform = 'translateY(-50%)';
          arrow.borderTop = `${arrowSize}px solid transparent`;
          arrow.borderBottom = `${arrowSize}px solid transparent`;
          arrow.borderRight = `${arrowSize}px solid rgba(255, 255, 255, 0.95)`;
          break;
        default:
          break;
      }

      return { tooltip, arrow };
    };

    const { tooltip, arrow } = calculatePosition();
    setTooltipStyle(tooltip);
    setArrowStyle(arrow);
  }, [targetRect, position]);

  const isFirstStep = currentStepIndex === 0;
  const isLastStep = currentStepIndex === totalSteps - 1;

  return (
    <div 
      className="onboarding-tooltip glass-card animate-scale-in"
      style={tooltipStyle}
    >
      <div style={arrowStyle} className="onboarding-arrow" />
      
      <div className="flex items-start justify-between mb-3">
        <h3 className="text-xl font-bold text-gray-900 dark:text-white">
          {step.title}
        </h3>
        <button
          onClick={onSkip}
          className="text-gray-400 hover:text-gray-600 dark:hover:text-gray-300 transition-colors ml-2"
          aria-label="Chiudi guida"
        >
          <X size={20} />
        </button>
      </div>

      <p className="text-gray-700 dark:text-gray-300 mb-4 leading-relaxed">
        {step.description}
      </p>

      <div className="flex items-center justify-between">
        <div className="text-sm text-gray-500 dark:text-gray-400">
          {currentStepIndex + 1} di {totalSteps}
        </div>

        <div className="flex gap-2">
          {!isFirstStep && (
            <button
              onClick={onPrevious}
              className="px-4 py-2 rounded-lg bg-gray-200 dark:bg-gray-700 text-gray-700 dark:text-gray-300 hover:bg-gray-300 dark:hover:bg-gray-600 transition-all flex items-center gap-1"
            >
              <ChevronLeft size={16} />
              Indietro
            </button>
          )}

          {isLastStep ? (
            <button
              onClick={onNext}
              className="px-4 py-2 rounded-lg bg-gradient-to-r from-blue-500 to-purple-600 text-white hover:from-blue-600 hover:to-purple-700 transition-all font-medium"
            >
              Completa
            </button>
          ) : (
            <button
              onClick={onNext}
              className="px-4 py-2 rounded-lg bg-gradient-to-r from-blue-500 to-purple-600 text-white hover:from-blue-600 hover:to-purple-700 transition-all flex items-center gap-1 font-medium"
            >
              Avanti
              <ChevronRight size={16} />
            </button>
          )}
        </div>
      </div>
    </div>
  );
};

export default OnboardingTooltip;
