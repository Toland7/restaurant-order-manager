import React from 'react';
import { Routes, Route } from 'react-router-dom';
import MainApp from './MainApp';
import PrivacyPolicy from './PrivacyPolicy';
import CookiePolicy from './CookiePolicy';
import TermsOfService from './TermsOfService';
import LegalPageLayout from './LegalPageLayout';
import ModernCookieBanner from './components/ui/ModernCookieBanner';

function App() {
  return (
    <>
      <Routes>
        <Route path="/privacy" element={<LegalPageLayout title="Privacy Policy"><PrivacyPolicy /></LegalPageLayout>} />
        <Route path="/cookie-policy" element={<LegalPageLayout title="Cookie Policy"><CookiePolicy /></LegalPageLayout>} />
        <Route path="/terms-of-service" element={<LegalPageLayout title="Termini di Servizio"><TermsOfService /></LegalPageLayout>} />
        <Route path="/*" element={<MainApp />} />
      </Routes>
      <ModernCookieBanner />
    </>
  );
}

export default App;