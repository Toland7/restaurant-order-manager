import React, { useEffect } from 'react';
import { Outlet, useNavigate } from 'react-router-dom';
import ModernCookieBanner from './components/ui/ModernCookieBanner';
import { toast, Toaster } from 'react-hot-toast';

function App() {
  const navigate = useNavigate();

  // Global listener for service worker messages (PWA notifications)
  // This ensures notifications work regardless of which page is currently active
  useEffect(() => {
    console.log('[App.js] Mounting service worker listener');
    
    const handleServiceWorkerMessage = (event) => {
      console.log('[App.js] Received message from service worker:', event.data);
      
      // Visual feedback for debugging on mobile
      toast.success('📬 Message received: ' + (event.data?.type || 'unknown'));
      
      if (event.data && event.data.type === 'NOTIFICATION_NAVIGATE') {
        console.log('[App.js] Navigating to:', event.data.targetUrl);
        toast.success('🧭 Navigating to: ' + event.data.targetUrl);
        navigate(event.data.targetUrl);
      } else {
        console.log('[App.js] Message type not NOTIFICATION_NAVIGATE, ignoring');
      }
    };
    
    if (navigator.serviceWorker) {
      console.log('[App.js] Adding service worker message listener');
      navigator.serviceWorker.addEventListener('message', handleServiceWorkerMessage);
    } else {
      console.warn('[App.js] navigator.serviceWorker not available!');
      toast.error('⚠️ Service Worker not available!');
    }
    
    return () => {
      console.log('[App.js] Removing service worker message listener');
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