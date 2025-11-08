import React from 'react';
import ReactDOM from 'react-dom/client';
import * as Sentry from '@sentry/react';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
import * as serviceWorkerRegistration from './serviceWorkerRegistration';
import { BrowserRouter } from 'react-router-dom';
import { AuthProvider } from './AuthContext.js';
import { PrefillProvider } from './PrefillContext.js';
import { ProfileProvider } from './ProfileContext.js';
import { SubscriptionProvider } from './hooks/useSubscriptionStatus.js';
import './i18n';

// Inizializza Sentry per monitoraggio errori
Sentry.init({
  dsn: process.env.REACT_APP_SENTRY_DSN || 'https://your-dsn@sentry.io/project-id', // Sostituisci con DSN reale
  integrations: [Sentry.browserTracingIntegration()],
  tracesSampleRate: 1.0, // Cattura 100% delle transazioni per demo
  environment: process.env.NODE_ENV,
});

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <Sentry.ErrorBoundary fallback={<p>Si è verificato un errore. Ricarica la pagina.</p>}>
      <BrowserRouter future={{ v7_startTransition: true, v7_relativeSplatPath: true }}>
        <AuthProvider>
          <ProfileProvider>
            <SubscriptionProvider>
              <PrefillProvider>
                <App />
              </PrefillProvider>
            </SubscriptionProvider>
          </ProfileProvider>
        </AuthProvider>
      </BrowserRouter>
    </Sentry.ErrorBoundary>
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://cra.link/PWA
serviceWorkerRegistration.register(); // <--- ENABLED FOR PUSH NOTIFICATIONS
// serviceWorkerRegistration.unregister(); // <--- DISABLED