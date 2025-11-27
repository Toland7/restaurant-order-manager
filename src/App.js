import React, { useEffect } from 'react';
import { Outlet, useNavigate } from 'react-router-dom';
import ModernCookieBanner from './components/ui/ModernCookieBanner';

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
    
    navigator.serviceWorker?.addEventListener('message', handleServiceWorkerMessage);
    
    return () => {
      navigator.serviceWorker?.removeEventListener('message', handleServiceWorkerMessage);
    };
  }, [navigate]);

  return (
    <>
      <Outlet /> {/* Render child routes here */}
      <ModernCookieBanner />
    </>
  );
}

export default App;