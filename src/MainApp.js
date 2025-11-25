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
    const { selectedProfile, loadingProfile, setSelectedProfile, isPinModalOpen, profileToVerify, closePinModal, requiresProfileSelection, setPendingNavigation, clearPendingNavigation, executePendingNavigation } = useProfileContext();
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
  
    // Detect if app was opened from a push notification and save pending navigation
    useEffect(() => {
      if (isProUser && !selectedProfile && !loadingProfile) {
        const currentPath = location.pathname + location.search;
        // Check if the URL contains notification-related parameters (reminder_ids or reminder_id)
        if (currentPath.includes('reminder_id') && currentPath !== '/') {
          logger.info('Detected push notification URL, saving as pending navigation:', currentPath);
          setPendingNavigation(currentPath);
        }
      }
    }, [isProUser, selectedProfile, loadingProfile, location.pathname, location.search, setPendingNavigation]);
  
    const handlePinVerificationSuccess = () => {
      setShowPinVerification(false);
      // Execute pending navigation if exists, otherwise go to home
      executePendingNavigation(navigate);
      if (!executePendingNavigation(navigate)) {
        navigate('/');
      }
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
