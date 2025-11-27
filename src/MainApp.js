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
  
    // Listen for service worker messages for PWA navigation
    useEffect(() => {
      const handleServiceWorkerMessage = (event) => {
        if (event.data && event.data.type === 'NOTIFICATION_NAVIGATE') {
          logger.info('Received navigation request from service worker:', event.data.targetUrl);
          navigate(event.data.targetUrl);
        }
      };
      
      navigator.serviceWorker?.addEventListener('message', handleServiceWorkerMessage);
      
      return () => {
        navigator.serviceWorker?.removeEventListener('message', handleServiceWorkerMessage);
      };
    }, [navigate]);
  
  





  
    // Detect notification data from URL parameters (when app opens from scratch)
    useEffect(() => {
      const params = new URLSearchParams(location.search);
      const reminderId = params.get('reminder_id');
      const reminderIds = params.get('reminder_ids');
      const batchId = params.get('batch_id');
      const userId = params.get('user_id');
      const forceReauthParam = params.get('forceReauth');

      // Construct the *intended* target URL based on available params
      let initialTargetUrl = '/';
      if (reminderId) {
        initialTargetUrl = `/create-order?reminder_id=${reminderId}&flowInitialStep=review`;
      } else if (reminderIds) {
        initialTargetUrl = `/create-order?reminder_ids=${reminderIds}&flowInitialStep=review`;
      } else if (batchId && userId) {
        initialTargetUrl = `/create-order?batch_id=${batchId}&user_id=${userId}&flowInitialStep=review`;
      }

      // If there are no relevant notification/reauth parameters, do nothing
      if (initialTargetUrl === '/' && !forceReauthParam) {
        return;
      }

      // *** Main Re-authentication Logic ***
      // If forceReauth is requested and user is PRO
      if (isProUser && forceReauthParam === 'true') {
        logger.info('URL contains forceReauth=true, forcing profile logout and saving pending navigation:', initialTargetUrl);
        setPrefilledData(null); // Clear any stale data
        setPendingNavigation(initialTargetUrl); // Save the target URL
        forceLogout(); // This will clear selectedProfile, show ProfileSelectionPage
        return; // Stop here, the pendingNavigation will be handled after re-auth
      }

      // *** Always use pending navigation flow to ensure fresh data loading ***
      // Even without forceReauth, we need to load fresh data from the database
      if (initialTargetUrl !== '/') {
        logger.info('Setting pending navigation to load fresh data:', initialTargetUrl);
        setPrefilledData(null); // Clear any stale data first
        setPendingNavigation(initialTargetUrl);
        return; // Let the pending navigation effect handle data loading and navigation
      }
      
      // *** Existing Pending Navigation Logic (if a flow is already active) ***
      // If there's an active pending navigation, it means we're likely coming back from a re-auth flow
      // initiated by this component itself (from a previous render) or another component.
      // In this case, we let the 'execute pending navigation' effect handle the actual navigation.
      if (pendingNavigation) {
        return;
      }

      // *** Default Navigation Logic (no re-auth needed, no pending flow) ***
      // If user is PRO but not authenticated yet (e.g., first app load, no stored profile)
      if (isProUser && !selectedProfile && initialTargetUrl !== '/') {
        logger.info('User is PRO without profile, saving pending navigation from URL params (no forceReauth):', initialTargetUrl);
        setPendingNavigation(initialTargetUrl);
        return; // defer navigation until after login
      }
      
      // If no forceReauth, no pendingNavigation, and profile is selected (or not PRO user)
      // then simply navigate to the initialTargetUrl.
      logger.info('Navigating directly to target URL from params:', initialTargetUrl);
      navigate(initialTargetUrl);
      
    }, [isProUser, selectedProfile, navigate, location.search, setPendingNavigation, forceLogout, pendingNavigation, setPrefilledData]);
  
    // Execute pending navigation after profile is authenticated and permissions are loaded
    // Execute pending navigation after profile is authenticated, and pre-fill context if needed.
    useEffect(() => {
      const processAndExecuteNavigation = async () => {
        // Guard: Wait for suppliers to be loaded before processing
        if (isProUser && selectedProfile && !loadingProfile && pendingNavigation && suppliers.length > 0) {
          logger.info('Profile authenticated, processing and executing pending navigation:', pendingNavigation);
  
          try {
            // 1. Parse URL and fetch data to pre-fill context
            const url = new URL(pendingNavigation, window.location.origin);
            const params = new URLSearchParams(url.search);
            const reminderId = params.get('reminder_id');
            const reminderIdsParam = params.get('reminder_ids');
            const batchId = params.get('batch_id');
  
            if (reminderId) {
              const scheduledOrder = await supabaseHelpers.getScheduledOrderById(reminderId);
              if (scheduledOrder) {
                logger.info('Prefilling context for single reminder from MainApp');
                setPrefilledData({ type: 'schedule', data: scheduledOrder });
              }
            } else if (reminderIdsParam) {
              const ids = reminderIdsParam.split(',');
              const orders = await Promise.all(ids.map(id => supabaseHelpers.getScheduledOrderById(id)));
              const validOrders = orders.filter(o => o !== null);
  
              if (validOrders.length > 0) {
                const formattedOrders = validOrders.map(order => {
                  const orderData = JSON.parse(order.order_data);
                  const supplierObj = suppliers.find(s => s.id === order.supplier_id);
                  return {
                    id: order.id,
                    supplier: order.supplier_id.toString(),
                    items: orderData.items || {},
                    additional: orderData.additional_items || '',
                    email_subject: orderData.email_subject || supplierObj?.email_subject || '',
                    searchTerm: ''
                  };
                });
                logger.info('Prefilling context for multiple reminders from MainApp');
                setPrefilledData({ type: 'multi-schedule', data: formattedOrders });
              }
            } else if (batchId && user?.id) {
              const batchOrders = await supabaseHelpers.getScheduledOrdersByBatch(user.id, batchId);
              if (batchOrders && batchOrders.length > 0) {
                const formattedOrders = batchOrders.map(order => {
                  const orderData = JSON.parse(order.order_data);
                  const supplierObj = suppliers.find(s => s.id === order.supplier_id);
                  return {
                    id: order.id,
                    supplier: order.supplier_id.toString(),
                    items: orderData.items || {},
                    additional: orderData.additional_items || '',
                    email_subject: orderData.email_subject || supplierObj?.email_subject || '',
                    searchTerm: ''
                  };
                });
                logger.info('Prefilling context for batch from MainApp');
                setPrefilledData({ type: 'multi-schedule', data: formattedOrders });
              }
            }
          } catch (error) {
            logger.error('Error prefilling context from MainApp:', error);
            toast.error("Impossibile preparare l'ordine dalla notifica.");
          }
  
          // 2. Navigate to CreateOrderPage with CLEAN URL (data is already in context)
          // This prevents the useEffect from retriggering
          logger.info('Data prefilled, navigating to clean /create-order URL');
          clearPendingNavigation();
          navigate('/create-order?flowInitialStep=review', { replace: true });
        }
      };
  
      if (pendingNavigation) {
        // Wait to ensure all state is fully loaded
        const timer = setTimeout(processAndExecuteNavigation, 500);
        return () => clearTimeout(timer);
      }
    }, [isProUser, selectedProfile, loadingProfile, pendingNavigation, suppliers, user, executePendingNavigation, navigate, setPrefilledData, clearPendingNavigation]);
  
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
