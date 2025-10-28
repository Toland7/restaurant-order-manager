import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { toast } from 'react-hot-toast';
import { User, Download, ChevronRight } from 'lucide-react';
import Header from '../components/ui/Header';
import { useAuth } from '../AuthContext';
import { supabaseHelpers } from '../supabase';

const SettingsPage = ({ theme, setTheme, profile, user }) => {
    const navigate = useNavigate();
    const { signOut } = useAuth();

    useEffect(() => {
      const isIos = () => { const userAgent = window.navigator.userAgent.toLowerCase(); return /iphone|ipad|ipod/.test(userAgent); };
      const isInStandaloneMode = () => ('standalone' in window.navigator) && (window.navigator.standalone);
      if (isIos() && !isInStandaloneMode()) {
        toast((t) => <div className="flex flex-col items-center"><span className="text-center">Per abilitare le notifiche, aggiungi questa app alla tua schermata principale: tocca l'icona di condivisione e poi "Aggiungi a Home".</span><button onClick={() => toast.dismiss(t.id)} className="mt-2 px-4 py-2 bg-blue-500 text-white rounded-lg">Ok</button></div>, { duration: 6000 });
      }
    }, []);

    const handleLogout = async () => {
      await signOut();
      toast.success('Logout effettuato');
      navigate('/');
    };

    const [isPushEnabled, setIsPushEnabled] = useState(false);

    useEffect(() => {
      const checkSubscription = async () => {
        if (!('serviceWorker' in navigator) || !('PushManager' in window)) {
          setIsPushEnabled(false);
          return;
        }
        const registration = await navigator.serviceWorker.ready;
        const subscription = await registration.pushManager.getSubscription();
        setIsPushEnabled(!!subscription);
      };
      checkSubscription();
    }, []);

    const handleTogglePush = async (enable) => {
      console.log('🔕 Toggle push notifications:', enable);
      if (!('serviceWorker' in navigator) || !('PushManager' in window)) {
        console.log('🔕 Push not supported');
        toast.error('Le notifiche push non sono supportate da questo browser.');
        return;
      }

      try {
        console.log('🔕 Getting service worker registration');
        const registration = await navigator.serviceWorker.ready;
        console.log('🔕 Registration ready:', !!registration);

        if (enable) {
          console.log('🔕 Enabling push notifications');
          // Enable push notifications
          const permission = await window.Notification.requestPermission();
          console.log('🔕 Permission:', permission);
          if (permission !== 'granted') {
            toast.error('Permesso per le notifiche non concesso.');
            return;
          }
          const vapidPublicKey = process.env.REACT_APP_VAPID_PUBLIC_KEY;
          console.log('🔕 VAPID key present:', !!vapidPublicKey);
          if (!vapidPublicKey) {
            console.error('VAPID public key not found.');
            toast.error('Errore di configurazione: chiave pubblica non trovata.');
            return;
          }

          // Convert VAPID key to Uint8Array
          function urlBase64ToUint8Array(base64String) {
            const padding = '='.repeat((4 - base64String.length % 4) % 4);
            const base64 = (base64String + padding)
              .replace(/-/g, '+')
              .replace(/_/g, '/');

            const rawData = window.atob(base64);
            const outputArray = new Uint8Array(rawData.length);

            for (let i = 0; i < rawData.length; ++i) {
              outputArray[i] = rawData.charCodeAt(i);
            }
            return outputArray;
          }

          const applicationServerKey = urlBase64ToUint8Array(vapidPublicKey);
          console.log('🔕 Subscribing to push');
          const subscription = await registration.pushManager.subscribe({ userVisibleOnly: true, applicationServerKey });
          console.log('🔕 Subscription:', subscription);

          const subscriptionData = {
            endpoint: subscription.endpoint,
            expirationTime: subscription.expirationTime,
            keys: {
              p256dh: subscription.toJSON().keys.p256dh,
              auth: subscription.toJSON().keys.auth,
            },
          };

          console.log('🔕 Updating profile with subscription');
          const updateResult = await supabaseHelpers.updateUserProfile(user.id, { push_subscription: subscriptionData });
          console.log('🔕 Profile update result:', updateResult);
          setIsPushEnabled(true);
          toast.success('Notifiche push abilitate con successo!');
        } else {
          console.log('🔕 Disabling push notifications');
          // Disable push notifications
          const subscription = await registration.pushManager.getSubscription();
          console.log('🔕 Current subscription:', !!subscription);
          if (subscription) {
            await subscription.unsubscribe();
            await supabaseHelpers.updateUserProfile(user.id, { push_subscription: null });
            setIsPushEnabled(false);
            toast.success('Notifiche push disabilitate con successo!');
          } else {
            toast.info('Le notifiche push non sono attive.');
          }
        }
      } catch (error) {
        console.error('Error toggling push notifications:', error);
        toast.error('Impossibile modificare lo stato delle notifiche push.');
      }
    };

    return (
      <div className="min-h-screen app-background">
        <Header title="Impostazioni" onBack={() => navigate('/')} />
        <div className="max-w-sm mx-auto px-6 py-6 space-y-4">
          <button onClick={() => navigate('/user-profile')} className="w-full glass-card p-4 text-left hover:shadow-md transition-all">
            <div className="flex items-center space-x-4">
              <div className="w-12 h-12 bg-gray-200 rounded-full flex items-center justify-center"><User size={24} className="text-gray-500" /></div>
              <div>
                <p className="font-medium text-gray-900">Profilo Utente</p>
                <p className="text-sm text-gray-500">Visualizza e modifica i tuoi dati</p>
              </div>
              <ChevronRight size={20} className="text-gray-300 ml-auto" />
            </div>
          </button>

          <button 
            onClick={async () => {
              const toastId = toast.loading('Esportazione dei dati in corso...');
              try {
                const userData = await supabaseHelpers.exportUserData();
                
                const blob = new Blob([JSON.stringify(userData, null, 2)], { type: 'application/json' });
                const link = document.createElement('a');
                link.href = URL.createObjectURL(blob);
                const fileName = `export-dati-utente-${new Date().toISOString().split('T')[0]}.json`;
                link.setAttribute('download', fileName);
                document.body.appendChild(link);
                link.click();
                
                link.parentNode.removeChild(link);
                URL.revokeObjectURL(link.href);

                toast.success('Dati esportati con successo!', { id: toastId });
              } catch (error) {
                toast.error(`Errore durante l'esportazione: ${error.message}`, { id: toastId });
              }
            }} 
            className="w-full glass-card p-4 text-left hover:shadow-md transition-all"
          >
            <div className="flex items-center space-x-4">
              <div className="w-12 h-12 bg-gray-200 rounded-full flex items-center justify-center"><Download size={24} className="text-gray-500" /></div>
              <div>
                <p className="font-medium text-gray-900">Esporta i miei dati</p>
                <p className="text-sm text-gray-500">Scarica una copia di tutti i tuoi dati</p>
              </div>
              <ChevronRight size={20} className="text-gray-300 ml-auto" />
            </div>
          </button>



          <div className="glass-card p-4 flex items-center justify-between">
            <div>
              <p className="font-medium text-gray-900 dark:text-gray-100">Tema scuro</p>
              <p className="text-xs text-gray-500 dark:text-gray-400">Interfaccia ottimizzata per ambienti poco luminosi</p>
            </div>
            <label className="inline-flex items-center cursor-pointer">
              <input id="theme-toggle" name="theme-toggle" type="checkbox" className="sr-only peer" checked={theme === 'dark'} onChange={(e) => setTheme(e.target.checked ? 'dark' : 'light')} />
              <div className="w-11 h-6 bg-gray-200 dark:bg-gray-700 rounded-full peer peer-checked:bg-blue-600 transition-colors relative">
                <span className="absolute top-0.5 left-0.5 w-5 h-5 bg-white rounded-full shadow transform transition-transform peer-checked:translate-x-5"></span>
              </div>
            </label>
          </div>

          <div className="glass-card p-4 flex items-center justify-between">
            <div>
              <p className="font-medium text-gray-900 dark:text-gray-100">Notifiche Push</p>
              <p className="text-xs text-gray-500 dark:text-gray-400">Ricevi aggiornamenti importanti</p>
            </div>
            <label className="inline-flex items-center cursor-pointer">
              <input id="push-toggle" name="push-toggle" type="checkbox" className="sr-only peer" checked={isPushEnabled} onChange={(e) => handleTogglePush(e.target.checked)} />
              <div className="w-11 h-6 bg-gray-200 dark:bg-gray-700 rounded-full peer peer-checked:bg-blue-600 transition-colors relative">
                <span className="absolute top-0.5 left-0.5 w-5 h-5 bg-white rounded-full shadow transform transition-transform peer-checked:translate-x-5"></span>
              </div>
            </label>
          </div>

          <button onClick={handleLogout} className="w-full bg-red-500 text-white py-3 rounded-lg font-medium mt-6 hover:bg-red-600 transition-colors">Logout</button>
        </div>
      </div>
    );
}

export default SettingsPage;
