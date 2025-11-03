import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useInAppProfiles } from '../hooks/useInAppProfiles';
import { supabase } from '../supabase';
import PinPad from '../components/ui/PinPad';
import { toast } from 'react-hot-toast';
import { useProfileContext } from '../ProfileContext';

const ProfileSelectionPage = () => {
  const { profiles, loading, error } = useInAppProfiles();
  const navigate = useNavigate();
  const { setSelectedProfile } = useProfileContext();

  const [selectedProfileData, setSelectedProfileData] = useState(null);
  const [showPinModal, setShowPinModal] = useState(false);
  const [pinError, setPinError] = useState('');
  const [isSettingPin, setIsSettingPin] = useState(false);

  const handleProfileClick = (profile) => {
    setSelectedProfileData(profile);
    // If profile has no PIN, enter setup mode. Otherwise, enter verification mode.
    if (!profile.pin_hash) {
      setIsSettingPin(true);
    } else {
      setIsSettingPin(false);
    }
    setShowPinModal(true);
    setPinError('');
  };

  const handlePinComplete = async (pin) => {
    if (!selectedProfileData) return;

    try {
      const { data, error } = await supabase.functions.invoke('verify-profile-pin', {
        body: JSON.stringify({ profile_id: selectedProfileData.id, pin }),
      });

      if (error) {
        throw error;
      }

      if (data.is_valid) {
        toast.success(`Benvenuto, ${selectedProfileData.profile_name}!`);
        setSelectedProfile(selectedProfileData); // Store selected profile in context
        navigate('/'); // Navigate to main app
      } else {
        setPinError('PIN errato. Riprova.');
        toast.error('PIN errato.');
      }
    } catch (err) {
      console.error('Error verifying PIN:', err);
      setPinError('Errore durante la verifica del PIN.');
      toast.error('Errore di sistema.');
    }
  };

  const handleSetPinComplete = async (pin) => {
    if (!selectedProfileData) return;

    try {
      const { error } = await supabase.functions.invoke('set-profile-pin', {
        body: JSON.stringify({ profile_id: selectedProfileData.id, pin }),
      });

      if (error) {
        throw error;
      }

      toast.success('PIN impostato con successo!');
      // Log the user in with the newly created profile
      const updatedProfile = { ...selectedProfileData, pin_hash: 'set' }; // Mock hash to prevent re-triggering setup
      setSelectedProfile(updatedProfile);
      navigate('/');

    } catch (err) {
      console.error('Error setting PIN:', err);
      setPinError("Errore durante l'impostazione del PIN.");
      toast.error('Errore di sistema.');
    }
  };

  if (loading) {
    return <div className="flex justify-center items-center h-screen text-lg">Caricamento profili...</div>;
  }

  if (error) {
    return <div className="flex justify-center items-center h-screen text-lg text-red-500">Errore: {error}</div>;
  }

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gray-100 dark:bg-gray-900 text-gray-900 dark:text-gray-100 p-4">
      <h1 className="text-4xl font-bold mb-8">Chi sta usando l'app?</h1>
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
        {profiles.map(profile => (
          <button 
            key={profile.id} 
            className="flex flex-col items-center p-6 bg-white dark:bg-gray-800 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200 ease-in-out transform hover:-translate-y-1"
            onClick={() => handleProfileClick(profile)}
          >
            <div className="text-5xl mb-4">👤</div> {/* Placeholder for avatar */}
            <span className="text-xl font-semibold">{profile.profile_name}</span>
          </button>
        ))}
      </div>

      {showPinModal && selectedProfileData && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center p-4 z-50">
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-xl p-6 w-full max-w-md">
            <h2 className="text-2xl font-bold mb-4 text-center">
              {isSettingPin ? `Crea un PIN per ${selectedProfileData.profile_name}` : `Inserisci PIN per ${selectedProfileData.profile_name}`}
            </h2>
            {pinError && <p className="text-red-500 text-center mb-4">{pinError}</p>}
            <PinPad 
              onPinComplete={isSettingPin ? handleSetPinComplete : handlePinComplete} 
              onPinChange={() => setPinError('')} 
            />
            <button 
              onClick={() => setShowPinModal(false)}
              className="mt-6 w-full py-2 px-4 bg-gray-200 dark:bg-gray-700 text-gray-800 dark:text-gray-200 rounded-md hover:bg-gray-300 dark:hover:bg-gray-600 transition-colors"
            >
              Annulla
            </button>
          </div>
        </div>
      )}
    </div>
  );
};

export default ProfileSelectionPage;
