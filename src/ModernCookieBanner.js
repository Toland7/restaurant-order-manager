import React, { useState, useEffect } from 'react';
import Cookies from 'js-cookie';
import { Cookie, X, Check } from 'lucide-react';

function ModernCookieBanner() {
  const [showBanner, setShowBanner] = useState(false);

  useEffect(() => {
    const consent = Cookies.get('restaurantOrderManagerConsent');
    if (!consent) {
      setShowBanner(true);
    }
  }, []);

  const handleAccept = () => {
    Cookies.set('restaurantOrderManagerConsent', 'accepted', { expires: 150 });
    setShowBanner(false);
  };

  const handleDecline = () => {
    Cookies.set('restaurantOrderManagerConsent', 'declined', { expires: 150 });
    setShowBanner(false);
  };

  if (!showBanner) return null;

  return (
    <div className="fixed bottom-0 left-0 right-0 z-50 p-4">
      <div className="max-w-sm mx-auto glass-card border border-white/60 dark:border-white/10 p-4 rounded-2xl shadow-lg">
        <div className="flex items-start space-x-3">
          <div className="flex-shrink-0">
            <div className="w-10 h-10 rounded-full bg-gradient-to-br from-blue-500 to-indigo-600 flex items-center justify-center">
              <Cookie size={20} className="text-white" />
            </div>
          </div>
          <div className="flex-1 min-w-0">
            <h3 className="text-sm font-medium text-gray-900 dark:text-gray-100 mb-1">
              🍪 Cookie per una migliore esperienza
            </h3>
            <p className="text-xs text-gray-600 dark:text-gray-300 mb-3">
              Utilizziamo cookie tecnici e di analisi per migliorare il servizio. Puoi gestire le preferenze in qualsiasi momento.
              <a href="/cookie-policy" className="text-blue-600 dark:text-blue-400 hover:underline ml-1">
                Maggiori info
              </a>
            </p>
            <div className="flex space-x-2">
              <button
                onClick={handleAccept}
                className="btn btn-primary text-xs px-3 py-1.5 flex items-center space-x-1"
              >
                <Check size={14} />
                <span>Accetto</span>
              </button>
              <button
                onClick={handleDecline}
                className="btn btn-outline text-xs px-3 py-1.5 flex items-center space-x-1"
              >
                <X size={14} />
                <span>Rifiuto</span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default ModernCookieBanner;