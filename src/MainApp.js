import React, { useState, useEffect, useCallback } from 'react';
import { useNavigate, Routes, Route, useLocation } from 'react-router-dom';
import { toast, Toaster } from 'react-hot-toast';
import { useAuth } from './AuthContext.js';
import { usePrefill } from './PrefillContext.js';
import { OnboardingProvider } from './OnboardingContext.js';
import OnboardingTour from './components/onboarding/OnboardingTour.js';


import HomePage from './pages/HomePage';
import SuppliersPage from './pages/SuppliersPage';
import HistoryPage from './pages/HistoryPage';
import AnalyticsDashboard from './pages/AnalyticsDashboard';
import ProductHistoryPage from './pages/ProductHistoryPage';
import SettingsPage from './pages/SettingsPage';
import UserProfilePage from './pages/UserProfilePage';
import NotificationsPage from './pages/NotificationsPage';
import ProfileManagerPage from './pages/ProfileManagerPage';

import CreateOrderPage from './pages/CreateOrderPage';
import SchedulePage from './pages/SchedulePage';
import AuthPage from './pages/AuthPage';
import ProfileSelectionPage from './pages/ProfileSelectionPage';

import { useProfile } from './hooks/useProfile';
import { useSuppliers } from './hooks/useSuppliers';
import { useOrders } from './hooks/useOrders';
import { useAnalytics } from './hooks/useAnalytics';
import { useNotifications } from './hooks/useNotifications';
import { supabaseHelpers } from './supabase.js';
import useSubscriptionStatus from './hooks/useSubscriptionStatus';
import { useProfileContext } from './ProfileContext';
import PinVerificationModal from './components/modals/PinVerificationModal';
import UpgradeToProBanner from './components/ui/UpgradeToProBanner.js';
import DemoTrialBanner from './components/ui/DemoTrialBanner';
import TrialExpiredBanner from './components/ui/TrialExpiredBanner';
import ResponsiveLayout from './components/layout/ResponsiveLayout';

import logger from './utils/logger';
const MainApp = () => {
    const location = useLocation();
    const { user, isLoggingOut } = useAuth(); // Get isLoggingOut from AuthContext
    const { isProUser, loadingSubscription, isTrialExpired } = useSubscriptionStatus();
    const { selectedProfile, loadingProfile, setSelectedProfile, isPinModalOpen, profileToVerify, closePinModal, requiresProfileSelection, setPendingNavigation, clearPendingNavigation, executePendingNavigation, pendingNavigation, profilePermissions, forceLogout } = useProfileContext();
    const [showPinVerification, setShowPinVerification] = useState(false);
  
    useEffect(() => {
      if (isProUser && !loadingProfile && !selectedProfile) {
        const storedProfile = localStorage.getItem('selectedProfile');
        if (storedProfile) {
          const parsedProfile = JSON.parse(storedProfile);
          // Temporarily set the profile to trigger PIN verification
          setSelectedProfile(parsedProfile);
          setShowPinVerification(true);
        }
      }
    }, [isProUser, loadingProfile, selectedProfile, setSelectedProfile]);
  
    const handlePinVerificationSuccess = () => {
      setShowPinVerification(false);
      // Pending navigation will be executed by useEffect after profile is authenticated
    };
  
    const handlePinVerificationFailure = () => {
      setSelectedProfile(null);
      setShowPinVerification(false);
      clearPendingNavigation(); // Clear pending navigation on failure
      // ProfileSelectionPage will be rendered automatically due to !selectedProfile
    };
  
    const { profile, setProfile } = useProfile(user);
    const { suppliers, setSuppliers } = useSuppliers(user);
    const { orders, setOrders } = useOrders(user);
    const { setPrefilledData } = usePrefill();
    const navigate = useNavigate();
    const [scheduledOrders, setScheduledOrders] = useState([]);
    const { unreadCount, setUnreadCount, handleNotificationClick } = useNotifications(user, setPrefilledData, navigate);
    const [selectedProductForHistory, setSelectedProductForHistory] = useState(null); // New state
    const [theme, setTheme] = useState('light');
  
    const [multiOrders, setMultiOrders] = useState([{ id: Date.now(), supplier: '', items: {}, additional: '', email_subject: '', searchTerm: '' }]);
    const [showWizard, setShowWizard] = useState(false);
    const [wizardOrders, setWizardOrders] = useState([]);
    const [wizardStep, setWizardStep] = useState(0);
  
    const [pendingServiceWorkerMessage, setPendingServiceWorkerMessage] = useState(null);

    const processServiceWorkerMessage = useCallback((event) => {
          const notificationData = event.data.data;
          logger.info('Processing notification click:', notificationData);
          
          // 🔥 MODIFIED: Se utente è PRO, forza sempre il logout del profilo al click della notifica per garantire dati freschi
          if (isProUser) {
            logger.info('Notification requires re-auth, forcing profile logout');
            
            // 1. Costruisci target URL PRIMA del logout
            let targetUrl = '/';
            if (notificationData.url) {
              targetUrl = notificationData.url;
            } else if (notificationData.reminder_id) {
              targetUrl = `/create-order?reminder_id=${notificationData.reminder_id}&flowInitialStep=review`;
            } else if (notificationData.reminder_ids) {
              let ids = notificationData.reminder_ids;
              try {
                const parsed = JSON.parse(notificationData.reminder_ids);
                if (Array.isArray(parsed)) ids = parsed.join(',');
              } catch (e) {
                // keep as is
              }
              targetUrl = `/create-order?reminder_ids=${ids}&flowInitialStep=review`;
            }
            
            // 2. Salva pending navigation
            if (targetUrl !== '/') {
              logger.info('Saving pending navigation before forced logout:', targetUrl);
              setPendingNavigation(targetUrl);
            }
            
            // 3. Forza logout del profilo
            forceLogout();
            
            // 4. La ProfileSelectionPage verrà mostrata automaticamente
            // 5. Dopo l'autenticazione, executePendingNavigation verrà chiamato
            return;
          }
          
          // Build target URL from notification data (flow esistente per utenti non-PRO o senza forceReauth)
          let targetUrl = '/';
          if (notificationData.url) {
            targetUrl = notificationData.url;
          } else if (notificationData.reminder_id) {
            targetUrl = `/create-order?reminder_id=${notificationData.reminder_id}&flowInitialStep=review`;
          } else if (notificationData.reminder_ids) {
            let ids = notificationData.reminder_ids;
            try {
              const parsed = JSON.parse(notificationData.reminder_ids);
              if (Array.isArray(parsed)) ids = parsed.join(',');
            } catch (e) {
              // keep as is
            }
            targetUrl = `/create-order?reminder_ids=${ids}&flowInitialStep=review`;
          }

          // If we didn't get a meaningful URL, ignore the message
          if (targetUrl === '/') {
            logger.info('Service worker notification click has no target URL, ignoring.');
            return;
          }

          // If user is PRO but not authenticated yet, store pending navigation (only if we have a real target)
          if (isProUser && !selectedProfile && targetUrl !== '/') {
            logger.info('User is PRO without profile, saving pending navigation from service worker:', targetUrl);
            setPendingNavigation(targetUrl);
            return; // defer navigation until after login
          }

          // Otherwise navigate immediately (or if targetUrl is '/', we stay on home)
          logger.info('Navigating immediately to (service worker):', targetUrl);
          navigate(targetUrl);
    }, [isProUser, selectedProfile, setPendingNavigation, navigate, forceLogout]);

    // Listen for service worker messages (push notifications)
    useEffect(() => {
      const handleServiceWorkerMessage = (event) => {
        if (event.data && event.data.type === 'NOTIFICATION_CLICKED') {
          logger.info('Received notification click from service worker. Loading subscription:', loadingSubscription);
          
          if (loadingSubscription) {
            logger.info('Subscription loading, queuing message for later processing');
            setPendingServiceWorkerMessage(event);
            return;
          }

          processServiceWorkerMessage(event);
        }
      };
      
      navigator.serviceWorker?.addEventListener('message', handleServiceWorkerMessage);
      
      return () => {
        navigator.serviceWorker?.removeEventListener('message', handleServiceWorkerMessage);
      };
    }, [loadingSubscription, processServiceWorkerMessage]);

    // Process pending messages once subscription is loaded
    useEffect(() => {
      if (!loadingSubscription && pendingServiceWorkerMessage) {
        logger.info('Subscription loaded, processing queued service worker message');
        processServiceWorkerMessage(pendingServiceWorkerMessage);
        setPendingServiceWorkerMessage(null);
      }
    }, [loadingSubscription, pendingServiceWorkerMessage, processServiceWorkerMessage]);
  
    // Detect notification data from URL parameters (when app opens from scratch)
    useEffect(() => {
      const params = new URLSearchParams(location.search);
      const notificationUrl = params.get('notification_url');
      const notificationReminderId = params.get('notification_reminder_id');
      const notificationReminderIds = params.get('notification_reminder_ids');
      
      // ✅ ONLY process if there are actual notification parameters
      if (!notificationUrl && !notificationReminderId && !notificationReminderIds) {
        // No notification parameters, do nothing
        return;
      }
      
      // Build target URL first
      let targetUrl = '/';
      if (notificationUrl) {
        targetUrl = notificationUrl;
      } else if (notificationReminderId) {
        targetUrl = `/create-order?reminder_id=${notificationReminderId}&flowInitialStep=review`;
      } else if (notificationReminderIds) {
        // Parse possible JSON array
        let ids = notificationReminderIds;
        try {
          const parsed = JSON.parse(notificationReminderIds);
          if (Array.isArray(parsed)) ids = parsed.join(',');
        } catch (e) {
          // keep as is
        }
        targetUrl = `/create-order?reminder_ids=${ids}&flowInitialStep=review`;
      }

      // If user is PRO but not authenticated yet, store pending navigation and exit.
      if (isProUser && !selectedProfile && targetUrl !== '/') {
        logger.info('User is PRO without profile, saving pending navigation from URL params:', targetUrl);
        setPendingNavigation(targetUrl);
        // Do not navigate now; URL params will stay until next render.
        return;
      }

      // User is authenticated (or not PRO), navigate immediately.
      logger.info('Navigating to target URL from params:', targetUrl);
      // Clean up original notification params (they are not needed any more)
      params.delete('notification_url');
      params.delete('notification_reminder_id');
      params.delete('notification_reminder_ids');
      navigate(targetUrl);
      
    }, [isProUser, selectedProfile, navigate, location.search, setPendingNavigation]);
  
    // Execute pending navigation after profile is authenticated and permissions are loaded
    useEffect(() => {
      // Only execute if:
      // 1. User is PRO
      // 2. Profile is selected (authenticated)
      // 3. Profile is not loading
      // 4. Permissions are loaded (array has items or is empty but fetch completed)
      // 5. There is a pending navigation
      if (isProUser && selectedProfile && !loadingProfile && pendingNavigation) {
        logger.info('Profile authenticated, waiting for permissions before executing pending navigation');
        
        // Wait longer to ensure permissions and all state is fully loaded
        const timer = setTimeout(() => {
          logger.info('Executing pending navigation after delay:', pendingNavigation);
          const hasNavigated = executePendingNavigation(navigate);
          if (!hasNavigated) {
            // This shouldn't happen, but fallback to home just in case
            navigate('/');
          }
        }, 1000); // increased to 1000ms for safety
        
        return () => clearTimeout(timer);
      }
    }, [isProUser, selectedProfile, loadingProfile, pendingNavigation, profilePermissions, executePendingNavigation, navigate]);
  
    useEffect(() => {
      const savedWizardState = sessionStorage.getItem('wizardState');
      if (savedWizardState) {
        const { wizardOrders: savedOrders, wizardStep: savedStep } = JSON.parse(savedWizardState);
        setWizardOrders(savedOrders);
        setWizardStep(savedStep);
        setShowWizard(true);
      }
    }, []);
  
    useEffect(() => {
      if (showWizard) {
        sessionStorage.setItem('wizardState', JSON.stringify({ wizardOrders, wizardStep }));
      } else {
        sessionStorage.removeItem('wizardState');
      }
    }, [showWizard, wizardOrders, wizardStep]);
  
    // Theme management
    useEffect(() => {
      const savedTheme = localStorage.getItem('theme') || 'light';
      setTheme(savedTheme);
      document.documentElement.classList.toggle('dark', savedTheme === 'dark');
    }, []);
  
    useEffect(() => {
      localStorage.setItem('theme', theme);
      document.documentElement.classList.toggle('dark', theme === 'dark');
    }, [theme]);
  
    const { analytics } = useAnalytics(orders, suppliers);
  
    const loadData = useCallback(async (userId) => {
      if (!userId) return;
      try {
        const scheduled = await supabaseHelpers.getScheduledOrders(userId);
        setScheduledOrders(scheduled);
      } catch (error) {
        logger.error('Error loading scheduled orders:', error);
        toast.error('Errore durante il caricamento degli ordini programmati.');
      }
    }, []);
  
    useEffect(() => {
      if (user) {
        loadData(user.id);
      } else {
        setScheduledOrders([]);
      }
    }, [user, loadData]);

    const handlePinSuccessFromDropdown = () => {
      closePinModal();
      // Execute pending navigation if exists, otherwise stay on current page
      executePendingNavigation(navigate);
    };

    // Helper component for PRO features
    const ProRoute = ({ element, featureName }) => {
      if (loadingSubscription) {
        return <div className="flex justify-center items-center h-screen">Caricamento...</div>;
      }
      return isProUser ? element : <UpgradeToProBanner featureName={featureName} />;
    };
  
    if (!user) return <><Toaster position="top-center" reverseOrder={false} toastOptions={{ className: 'glass-card !bg-white !text-gray-900 dark:!bg-gray-900 dark:!text-gray-100', duration: 3000 }} /><AuthPage /></>;
  
    if ((isProUser && (showPinVerification || (!selectedProfile && !loadingProfile))) || requiresProfileSelection) {
      return (
        <>
          <Toaster position="top-center" reverseOrder={false} toastOptions={{ className: 'glass-card !bg-white !text-gray-900 dark:!bg-gray-900 dark:!text-gray-100', duration: 3000 }} />
          <ProfileSelectionPage 
            preSelectedProfile={showPinVerification ? selectedProfile : null}
            onPinVerificationSuccess={handlePinVerificationSuccess}
            onPinVerificationFailure={handlePinVerificationFailure}
          />
        </>
      );
    }
  
    if (isProUser && !selectedProfile && !loadingProfile) {
      return <><Toaster position="top-center" reverseOrder={false} toastOptions={{ className: 'glass-card !bg-white !text-gray-900 dark:!bg-gray-900 dark:!text-gray-100', duration: 3000 }} /><ProfileSelectionPage /></>;
    }

  return (
    <>
      <Toaster position="top-center" reverseOrder={false} toastOptions={{ className: 'glass-card !bg-white !text-gray-900 dark:!bg-gray-900 dark:!text-gray-100', duration: 3000 }} />
      <OnboardingProvider user={user}>
        <PinVerificationModal
          isOpen={isPinModalOpen}
          onClose={closePinModal}
          profile={profileToVerify}
          onSuccess={handlePinSuccessFromDropdown}
        />
        <div className={`animate-fade-in ${isTrialExpired ? 'pointer-events-none opacity-50' : ''}`}>
          <ResponsiveLayout unreadCount={unreadCount}>
            <Routes>
              <Route path="/" element={<HomePage profile={profile} user={user} unreadCount={unreadCount} analytics={analytics} orders={orders} scheduledOrders={scheduledOrders} />} />
              <Route path="/create-order" element={<CreateOrderPage scheduledOrders={scheduledOrders} setScheduledOrders={setScheduledOrders} onOrderSent={() => loadData(user.id)} multiOrders={multiOrders} setMultiOrders={setMultiOrders} suppliers={suppliers} setOrders={setOrders} showWizard={showWizard} setShowWizard={setShowWizard} wizardOrders={wizardOrders} setWizardOrders={setWizardOrders} wizardStep={wizardStep} setWizardStep={setWizardStep} user={user} />} />
              <Route path="/suppliers" element={<SuppliersPage suppliers={suppliers} setSuppliers={setSuppliers} user={user} />} />
              <Route path="/schedule" element={<SchedulePage multiOrders={multiOrders} setMultiOrders={setMultiOrders} suppliers={suppliers} scheduledOrders={scheduledOrders} setScheduledOrders={setScheduledOrders} setWizardOrders={setWizardOrders} showWizard={showWizard} setShowWizard={setShowWizard} wizardOrders={wizardOrders} wizardStep={wizardStep} setWizardStep={setWizardStep} user={user} />} />
              <Route path="/history" element={<HistoryPage orders={orders} suppliers={suppliers} />} />
              <Route path="/analytics" element={<ProRoute element={<AnalyticsDashboard orders={orders} suppliers={suppliers} setSelectedProductForHistory={setSelectedProductForHistory} />} featureName="Analisi" />} />
              <Route path="/product-history" element={<ProductHistoryPage orders={orders} suppliers={suppliers} selectedProductForHistory={selectedProductForHistory} />} />
              <Route path="/notifications" element={<NotificationsPage user={user} onNotificationClick={handleNotificationClick} unreadCount={unreadCount} setUnreadCount={setUnreadCount} />} />
              <Route path="/settings" element={<SettingsPage theme={theme} setTheme={setTheme} profile={profile} user={user} />} />
              <Route path="/user-profile" element={<UserProfilePage user={user} profile={profile} setProfile={setProfile} />} />
              <Route path="/profile-manager" element={<ProRoute element={<ProfileManagerPage />} featureName="Gestione Profili" />} />
              <Route path="*" element={<HomePage profile={profile} user={user} unreadCount={unreadCount} analytics={analytics} />} />
            </Routes>
          </ResponsiveLayout>
        </div>
        {!isLoggingOut && location.pathname === '/' && <DemoTrialBanner />} {/* Render only on homepage */}
        <TrialExpiredBanner /> {/* Render trial expired modal when trial is expired */}
        <OnboardingTour />
      </OnboardingProvider>
    </>
  );
};

export default MainApp;
