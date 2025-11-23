import React from 'react';
import { AlertCircle, Check } from 'lucide-react';
import { toast } from 'react-hot-toast';
import useSubscriptionStatus from '../../hooks/useSubscriptionStatus';

const TrialExpiredBanner = () => {
  const { isTrialExpired } = useSubscriptionStatus();
  
  // Force show banner for testing with URL param ?showExpired=true
  const urlParams = new URLSearchParams(window.location.search);
  const forceShow = urlParams.get('showExpired') === 'true';

  if (!isTrialExpired && !forceShow) {
    return null;
  }

  const handleUpgradeToBase = () => {
    // TODO: Integrate with Stripe/payment provider
    toast.success('Reindirizzamento al pagamento Piano Base... (Stripe non configurato)', {
      duration: 3000,
      icon: '💳',
    });
    // window.location.href = '/upgrade?plan=base';
  };

  const handleUpgradeToPro = () => {
    // TODO: Integrate with Stripe/payment provider
    toast.success('Reindirizzamento al pagamento Piano Pro... (Stripe non configurato)', {
      duration: 3000,
      icon: '💳',
    });
    // window.location.href = '/upgrade?plan=pro';
  };

  return (
    <div className="fixed inset-0 bg-black bg-opacity-75 z-50 flex items-center justify-center p-4">
      <div className="bg-white dark:bg-gray-800 rounded-2xl shadow-2xl max-w-4xl w-full p-8 text-center animate-fade-in">
        <div className="flex justify-center mb-6">
          <div className="bg-red-100 dark:bg-red-900 p-4 rounded-full">
            <AlertCircle size={48} className="text-red-600 dark:text-red-400" />
          </div>
        </div>
        
        <h2 className="text-3xl font-bold text-gray-900 dark:text-gray-100 mb-4">
          Il tuo periodo di prova è terminato
        </h2>
        
        <p className="text-lg text-gray-600 dark:text-gray-400 mb-8">
          Per continuare a utilizzare l'app, scegli uno dei nostri piani a pagamento.
        </p>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
          {/* Base Plan */}
          <div className="border-2 border-gray-300 dark:border-gray-600 rounded-xl p-8 hover:border-blue-500 hover:shadow-xl transition-all duration-300">
            <h3 className="text-2xl font-bold text-gray-900 dark:text-gray-100 mb-2">Piano Base</h3>
            <div className="mb-4">
              <span className="text-4xl font-bold text-blue-600">€14,90</span>
              <span className="text-gray-500 dark:text-gray-400">/mese</span>
            </div>
            <p className="text-gray-600 dark:text-gray-400 mb-6 text-sm">
              Tutte le funzionalità essenziali per gestire i tuoi ordini
            </p>
            <ul className="text-left text-sm text-gray-700 dark:text-gray-300 mb-8 space-y-3">
              <li className="flex items-start">
                <Check size={20} className="text-green-500 mr-2 flex-shrink-0 mt-0.5" />
                <span>Gestione ordini illimitata</span>
              </li>
              <li className="flex items-start">
                <Check size={20} className="text-green-500 mr-2 flex-shrink-0 mt-0.5" />
                <span>Gestione fornitori</span>
              </li>
              <li className="flex items-start">
                <Check size={20} className="text-green-500 mr-2 flex-shrink-0 mt-0.5" />
                <span>Notifiche email e push</span>
              </li>
              <li className="flex items-start">
                <Check size={20} className="text-green-500 mr-2 flex-shrink-0 mt-0.5" />
                <span>Ordini programmati (max 10/mese)</span>
              </li>
              <li className="flex items-start">
                <Check size={20} className="text-green-500 mr-2 flex-shrink-0 mt-0.5" />
                <span>Supporto email</span>
              </li>
            </ul>
            <button
              onClick={handleUpgradeToBase}
              className="btn-primary w-full py-3 text-lg font-semibold"
            >
              Scegli Base
            </button>
          </div>

          {/* Pro Plan */}
          <div className="border-2 border-blue-500 rounded-xl p-8 bg-white dark:bg-gray-700 relative hover:shadow-2xl transition-all duration-300 transform hover:scale-105">
            <div className="absolute -top-4 left-1/2 transform -translate-x-1/2 bg-gradient-to-r from-blue-500 to-blue-600 text-white px-6 py-2 rounded-full text-sm font-bold shadow-lg">
              CONSIGLIATO
            </div>
            <h3 className="text-2xl font-bold text-gray-900 dark:text-gray-100 mb-2 mt-2">Piano Pro</h3>
            <div className="mb-4">
              <span className="text-4xl font-bold text-blue-600">€19,90</span>
              <span className="text-gray-500 dark:text-gray-400">/mese</span>
            </div>
            <p className="text-gray-600 dark:text-gray-300 mb-6 text-sm font-medium">
              Tutto del Base + funzionalità avanzate
            </p>
            <ul className="text-left text-sm text-gray-700 dark:text-gray-200 mb-8 space-y-3">
              <li className="flex items-start">
                <Check size={20} className="text-green-600 dark:text-green-400 mr-2 flex-shrink-0 mt-0.5" />
                <span className="font-medium">Tutto del Piano Base</span>
              </li>
              <li className="flex items-start">
                <Check size={20} className="text-green-600 dark:text-green-400 mr-2 flex-shrink-0 mt-0.5" />
                <span><strong>Gestione profili multipli</strong></span>
              </li>
              <li className="flex items-start">
                <Check size={20} className="text-green-600 dark:text-green-400 mr-2 flex-shrink-0 mt-0.5" />
                <span><strong>Importazione prodotti Excel/CSV</strong></span>
              </li>
              <li className="flex items-start">
                <Check size={20} className="text-green-600 dark:text-green-400 mr-2 flex-shrink-0 mt-0.5" />
                <span><strong>Ordini programmati illimitati</strong></span>
              </li>
              <li className="flex items-start">
                <Check size={20} className="text-green-600 dark:text-green-400 mr-2 flex-shrink-0 mt-0.5" />
                <span><strong>Analytics avanzate</strong></span>
              </li>
              <li className="flex items-start">
                <Check size={20} className="text-green-600 dark:text-green-400 mr-2 flex-shrink-0 mt-0.5" />
                <span>Supporto prioritario 24/7</span>
              </li>
            </ul>
            <button
              onClick={handleUpgradeToPro}
              className="btn-primary w-full bg-blue-600 hover:bg-blue-700 py-3 text-lg font-semibold shadow-lg"
            >
              Scegli Pro
            </button>
          </div>
        </div>

        <p className="text-sm text-gray-500 dark:text-gray-400 mb-2">
          💳 <strong>Pagamento sicuro con Stripe</strong> · Cancella in qualsiasi momento
        </p>
        <p className="text-xs text-gray-400 dark:text-gray-500">
          Non puoi accedere all'app finché non scegli un piano.
        </p>
        
        {forceShow && (
          <p className="mt-4 text-xs text-yellow-600 dark:text-yellow-400 font-mono">
            ⚠️ Modalità test: Banner forzato (?showExpired=true)
          </p>
        )}
      </div>
    </div>
  );
};

export default TrialExpiredBanner;
