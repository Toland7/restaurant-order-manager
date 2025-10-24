import React from 'react';
import { Routes, Route } from 'react-router-dom';
import MainApp from './MainApp';
import PrivacyPolicy from './PrivacyPolicy';
import CookiePolicy from './CookiePolicy';
import TermsOfService from './TermsOfService';
import LegalPageLayout from './LegalPageLayout';
import CookieConsent from "react-cookie-consent";

function App() {
  return (
    <>
      <Routes>
        <Route path="/privacy" element={<LegalPageLayout title="Privacy Policy"><PrivacyPolicy /></LegalPageLayout>} />
        <Route path="/cookie-policy" element={<LegalPageLayout title="Cookie Policy"><CookiePolicy /></LegalPageLayout>} />
        <Route path="/terms-of-service" element={<LegalPageLayout title="Termini di Servizio"><TermsOfService /></LegalPageLayout>} />
        <Route path="/*" element={<MainApp />} />
      </Routes>
      <CookieConsent
        location="bottom"
        buttonText="Accetto"
        declineButtonText="Rifiuto"
        cookieName="restaurantOrderManagerConsent"
        style={{ background: "#2B373B" }}
        buttonStyle={{ color: "#4e503b", fontSize: "13px" }}
        declineButtonStyle={{ fontSize: "13px" }}
        expires={150}
        enableDeclineButton
      >
        Questo sito web utilizza i cookie per migliorare l'esperienza utente.{" "}
        <a href="/cookie-policy" style={{ color: "white", textDecoration: "underline" }}>
          Maggiori informazioni
        </a>
      </CookieConsent>
    </>
  );
}

export default App;