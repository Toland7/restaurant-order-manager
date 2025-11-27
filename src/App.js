import React, { useEffect } from 'react';
import { Outlet, useNavigate } from 'react-router-dom';
import ModernCookieBanner from './components/ui/ModernCookieBanner';
import { Toaster } from 'react-hot-toast';

function App() {
  const navigate = useNavigate();

  // Global listener for service worker messages (PWA notifications)
  // This ensures notifications work regardless of which page is currently active
  useEffect(() => {
    const handleServiceWorkerMessage = (event) => {
      if (event.data && event.data.type === 'NOTIFICATION_NAVIGATE') {
        navigate(event.data.targetUrl);
      }
    };
    
    if (navigator.serviceWorker) {
      navigator.serviceWorker.addEventListener('message', handleServiceWorkerMessage);
    }
    
    return () => {
      navigator.serviceWorker?.removeEventListener('message', handleServiceWorkerMessage);
    };
  }, [navigate]);

  return (
    <>
      <Toaster position="top-center" reverseOrder={false} toastOptions={{ className: 'glass-card !bg-white !text-gray-900 dark:!bg-gray-900 dark:!text-gray-100', duration: 3000 }} />
      <Outlet /> {/* Render child routes here */}
      <ModernCookieBanner />
    </>
  );
}

export default App;