import React from 'react';
import { Lock } from 'lucide-react';

const UpgradeToProBanner = ({ featureName }) => {
  return (
    <div className="flex flex-col items-center justify-center h-full bg-gray-50 dark:bg-gray-900 text-center p-8">
      <Lock className="w-16 h-16 text-yellow-500 mb-4" />
      <h2 className="text-2xl font-bold text-gray-800 dark:text-gray-200 mb-2">
        Funzionalità PRO: {featureName}
      </h2>
      <p className="text-gray-600 dark:text-gray-400 mb-6 max-w-md">
        Questa funzionalità è disponibile solo per gli utenti del piano PRO. Esegui l'upgrade per sbloccare l'accesso a questa e molte altre potenti funzionalità.
      </p>
      <button 
        className="bg-blue-600 text-white font-semibold py-2 px-6 rounded-lg shadow-md hover:bg-blue-700 transition-colors duration-300"
        onClick={() => { /* Logica per aprire la pagina di upgrade */ }}
      >
        Upgrade a PRO
      </button>
    </div>
  );
};

export default UpgradeToProBanner;
