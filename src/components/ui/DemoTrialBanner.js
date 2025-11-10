import React from 'react';
import useSubscriptionStatus from '../../hooks/useSubscriptionStatus';
import { toast } from 'react-hot-toast';

const DemoTrialBanner = () => {
  const { isDemoUser, isTrialActive, daysRemainingInTrial } = useSubscriptionStatus();

  if (!isDemoUser || !isTrialActive) {
    return null; // Don't render if not a demo user or trial is not active
  }

  const message = daysRemainingInTrial > 0
    ? `La tua prova gratuita scade tra ${daysRemainingInTrial} giorni. Effettua l'upgrade a PRO!`
    : `La tua prova gratuita è scaduta. Effettua l'upgrade a PRO per continuare!`;

  return (
    <div className="fixed bottom-0 left-0 right-0 bg-yellow-500 text-white p-3 text-center text-sm font-medium z-50 flex items-center justify-center space-x-4">
      <span>{message}</span>
       <button
         onClick={() => { /* TODO: Navigate to upgrade page */ console.log("Naviga alla pagina di upgrade!"); }}
         className="bg-white text-yellow-500 px-3 py-1 rounded-full hover:bg-gray-100 transition-colors"
       >
         Upgrade a PRO
       </button>
    </div>
  );
};

export default DemoTrialBanner;