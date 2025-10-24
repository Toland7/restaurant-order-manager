
import React from 'react';
import Cookies from 'js-cookie';
import { useNavigate } from 'react-router-dom';

function CookiePolicy() {
  const navigate = useNavigate();
  const handleManageConsent = () => {
    // The name must match the cookieName prop in CookieConsent component in App.js
    Cookies.remove('restaurantOrderManagerConsent');
    alert('Le tue preferenze sui cookie sono state reimpostate. Il banner dei cookie apparirà di nuovo alla prossima visita.');
    navigate('/');
  };

  return (
    <div className="p-8 max-w-4xl mx-auto">
      <h1 className="text-3xl font-bold mb-4">Cookie Policy</h1>
      <p className="mb-4">Data di entrata in vigore: 24 Ottobre 2025</p>

      <h2 className="text-2xl font-bold mt-6 mb-2">1. Cosa sono i cookie?</h2>
      <p className="mb-4">
        I cookie sono piccoli file di testo che i siti visitati dagli utenti inviano ai loro terminali, dove vengono memorizzati per essere poi ritrasmessi agli stessi siti alla successiva visita. Questo sito web utilizza i cookie per migliorare la tua esperienza di navigazione.
      </p>

      <h2 className="text-2xl font-bold mt-6 mb-2">2. Tipi di cookie utilizzati</h2>
      <div className="mb-4">
        <p>Questo sito utilizza i seguenti tipi di cookie:</p>
        <ul className="list-disc list-inside mt-2">
          <li className="ml-4 mb-2">
            <strong>Cookie tecnici essenziali:</strong> Questi cookie sono strettamente necessari per consentire il funzionamento del sito. Non richiedono il consenso dell'utente. Includono, ad esempio, i cookie che gestiscono il tuo consenso ai cookie.
          </li>
          <li className="ml-4 mb-2">
            <strong>Cookie di funzionalità:</strong> Questi cookie permettono al sito di ricordare le scelte che fai (come il tuo nome utente, la lingua o la regione in cui ti trovi) e forniscono funzionalità avanzate personalizzate.
          </li>
          <li className="ml-4 mb-2">
            <strong>Cookie di analisi e prestazioni (Analytics):</strong> Questi cookie vengono utilizzati per raccogliere informazioni in forma aggregata sul numero degli utenti e su come questi visitano il sito stesso. Utilizziamo questi dati per migliorare il nostro servizio. L'installazione di questi cookie è subordinata al tuo consenso.
          </li>
        </ul>
      </div>

      <h2 className="text-2xl font-bold mt-6 mb-2">3. Come gestire le preferenze sui cookie</h2>
      <div className="mb-4">
        <p className="mb-4">Puoi modificare le tue preferenze in qualsiasi momento cliccando il pulsante qui sotto. Questo farà riapparire il banner del consenso per permetterti di aggiornare la tua scelta.</p>
        <button 
          onClick={handleManageConsent}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-lg transition-colors"
        >
          Modifica Consenso Cookie
        </button>
      </div>
      <div className="mb-4">
        <p>In alternativa, puoi gestire le preferenze tramite le impostazioni del tuo browser. Di seguito trovi i link alle istruzioni per i browser più comuni:</p>
        <ul className="list-disc list-inside mt-2">
          <li><a href="https://support.google.com/chrome/answer/95647" target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">Google Chrome</a></li>
          <li><a href="https://support.mozilla.org/it/kb/Gestione%20dei%20cookie" target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">Mozilla Firefox</a></li>
          <li><a href="https://support.apple.com/it-it/guide/safari/sfri11471/mac" target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">Apple Safari</a></li>
          <li><a href="https://support.microsoft.com/it-it/windows/eliminare-e-gestire-i-cookie-168dab11-0753-043d-7c16-ede5947fc64d" target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">Microsoft Edge</a></li>
        </ul>
      </div>
      <p className="mb-4">
        Ti ricordiamo che la disabilitazione totale o parziale dei cookie tecnici può compromettere l'utilizzo delle funzionalità del sito.
      </p>

      <h2 className="text-2xl font-bold mt-6 mb-2">4. Titolare del trattamento</h2>
      <p className="mb-4">
        Il titolare del trattamento dei dati è [NOME AZIENDA/PERSONA FISICA] con sede in [INDIRIZZO COMPLETO]. Per qualsiasi chiarimento, puoi contattarci all'indirizzo email: [INSERIRE EMAIL DI CONTATTO].
      </p>
      
      <p className="mt-6 text-sm text-gray-500">
        <strong>Disclaimer:</strong> Questo è un modello di base per una cookie policy e non costituisce consulenza legale. Si consiglia vivamente di consultare un legale per garantire la piena conformità.
      </p>
    </div>
  );
}

export default CookiePolicy;
