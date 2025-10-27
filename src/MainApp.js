
import React, { useState, useEffect, useCallback } from 'react';
import { useNavigate, Routes, Route } from 'react-router-dom';
import { toast, Toaster } from 'react-hot-toast';
import { useAuth } from './AuthContext.js';
import { usePrefill } from './PrefillContext.js';

import HomePage from './pages/HomePage';
import SuppliersPage from './pages/SuppliersPage';
import HistoryPage from './pages/HistoryPage';
import AnalyticsDashboard from './pages/AnalyticsDashboard';
import ProductHistoryPage from './pages/ProductHistoryPage';
import SettingsPage from './pages/SettingsPage';
import UserProfilePage from './pages/UserProfilePage';
import NotificationsPage from './pages/NotificationsPage';
import AdminAuthPage from './pages/AdminAuthPage';
import AdminPanel from './pages/AdminPanel';
import CreateOrderPage from './pages/CreateOrderPage';
import SchedulePage from './pages/SchedulePage';
import AuthPage from './pages/AuthPage';
import ModernCookieBanner from './components/ui/ModernCookieBanner';
import { useProfile } from './hooks/useProfile';
import { useSuppliers } from './hooks/useSuppliers';
import { useOrders } from './hooks/useOrders';
import { useAnalytics } from './hooks/useAnalytics';
import { useNotifications } from './hooks/useNotifications';
import { supabaseHelpers } from './supabase.js';

const MainApp = () => {
  const { user } = useAuth();

  const { profile, setProfile } = useProfile(user);
  const { suppliers, setSuppliers } = useSuppliers(user);
  const { orders, setOrders } = useOrders(user);
  const { setPrefilledData } = usePrefill();
  const navigate = useNavigate();
  const [scheduledOrders, setScheduledOrders] = useState([]);
  const { unreadCount, setUnreadCount, handleNotificationClick } = useNotifications(user, setPrefilledData, navigate);
  const [isAdminAuthenticated, setIsAdminAuthenticated] = useState(false);
  const [selectedProductForHistory, setSelectedProductForHistory] = useState(null); // New state
  const [batchMode, setBatchMode] = useState(false);
  const [multiOrders, setMultiOrders] = useState([{ id: Date.now(), supplier: '', items: {}, additional: '', email_subject: '' }]);
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

  const { analytics } = useAnalytics(orders, suppliers);

  const loadData = useCallback(async (userId) => {
    if (!userId) return;
    try {
      const scheduled = await supabaseHelpers.getScheduledOrders(userId);
      setScheduledOrders(scheduled);
    } catch (error) {
      console.error('Error loading scheduled orders:', error);
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









  






  
















  







  if (!user) return <><Toaster position="top-center" reverseOrder={false} toastOptions={{ className: 'glass-card !bg-white !text-gray-900 dark:!bg-gray-900 dark:!text-gray-100', duration: 3000 }} /><AuthPage /></>;

  return (
    <>
      <Toaster position="top-center" reverseOrder={false} toastOptions={{ className: 'glass-card !bg-white !text-gray-900 dark:!bg-gray-900 dark:!text-gray-100', duration: 3000 }} />
      <Routes>
        <Route path="/" element={<HomePage profile={profile} user={user} unreadCount={unreadCount} analytics={analytics} />} />
        <Route path="/create-order" element={<CreateOrderPage scheduledOrders={scheduledOrders} setScheduledOrders={setScheduledOrders} onOrderSent={() => loadData(user.id)} batchMode={batchMode} setBatchMode={setBatchMode} multiOrders={multiOrders} setMultiOrders={setMultiOrders} suppliers={suppliers} setOrders={setOrders} showWizard={showWizard} setShowWizard={setShowWizard} wizardOrders={wizardOrders} setWizardOrders={setWizardOrders} wizardStep={wizardStep} setWizardStep={setWizardStep} user={user} />} />
        <Route path="/suppliers" element={<SuppliersPage suppliers={suppliers} setSuppliers={setSuppliers} user={user} />} />
        <Route path="/schedule" element={<SchedulePage batchMode={batchMode} setBatchMode={setBatchMode} multiOrders={multiOrders} setMultiOrders={setMultiOrders} suppliers={suppliers} scheduledOrders={scheduledOrders} setScheduledOrders={setScheduledOrders} setWizardOrders={setWizardOrders} showWizard={showWizard} setShowWizard={setShowWizard} wizardOrders={wizardOrders} wizardStep={wizardStep} setWizardStep={setWizardStep} user={user} />} />
        <Route path="/history" element={<HistoryPage orders={orders} suppliers={suppliers} />} />
        <Route path="/analytics" element={<AnalyticsDashboard orders={orders} suppliers={suppliers} setSelectedProductForHistory={setSelectedProductForHistory} />} />
        <Route path="/product-history" element={<ProductHistoryPage orders={orders} suppliers={suppliers} selectedProductForHistory={selectedProductForHistory} />} />
        <Route path="/notifications" element={<NotificationsPage onNotificationClick={handleNotificationClick} unreadCount={unreadCount} setUnreadCount={setUnreadCount} />} />
        <Route path="/settings" element={<SettingsPage profile={profile} user={user} setIsAdminAuthenticated={setIsAdminAuthenticated} />} />
        <Route path="/user-profile" element={<UserProfilePage user={user} profile={profile} setProfile={setProfile} />} />
        <Route path="/admin-auth" element={<AdminAuthPage setIsAdminAuthenticated={setIsAdminAuthenticated} />} />
        <Route path="/admin" element={profile?.is_admin && isAdminAuthenticated ? <AdminPanel isAdminAuthenticated={isAdminAuthenticated} /> : <div className="min-h-screen flex items-center justify-center"><p>Accesso negato</p></div>} />
        <Route path="*" element={<HomePage profile={profile} user={user} unreadCount={unreadCount} analytics={analytics} />} />
      </Routes>
      <ModernCookieBanner />
    </>
  );
};

export default MainApp;
