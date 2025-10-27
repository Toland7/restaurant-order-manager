import React, { useState, useEffect } from 'react';
import { Cookie } from 'lucide-react';
import { Link } from 'react-router-dom';

const ModernCookieBanner = () => {
    const [isVisible, setIsVisible] = useState(false);

    useEffect(() => {
        const consent = localStorage.getItem('cookie_consent');
        if (!consent) {
            setIsVisible(true);
        }
    }, []);

    const handleAccept = () => {
        localStorage.setItem('cookie_consent', 'accepted');
        setIsVisible(false);
    };

    const handleDecline = () => {
        localStorage.setItem('cookie_consent', 'declined');
        setIsVisible(false);
    };

    if (!isVisible) return null;

    return (
        <div className="fixed bottom-0 left-0 right-0 z-50 p-4 bg-white/90 dark:bg-gray-900/90 backdrop-blur-md shadow-lg border-t border-gray-200 dark:border-gray-700">
            <div className="max-w-sm mx-auto flex items-center space-x-3">
                <Cookie size={24} className="text-gray-500 dark:text-gray-400" />
                <div className="flex-1">
                    <p className="text-sm text-gray-800 dark:text-gray-100 mb-1">Utilizziamo i cookie per migliorare la tua esperienza.</p>
                    <Link to="/cookie-policy" className="text-xs text-blue-600 hover:underline">Leggi la nostra Cookie Policy</Link>
                </div>
                <div className="flex space-x-2">
                    <button onClick={handleDecline} className="btn btn-outline-sm">Rifiuta</button>
                    <button onClick={handleAccept} className="btn btn-primary-sm">Accetta</button>
                </div>
            </div>
        </div>
    );
};

export default ModernCookieBanner;