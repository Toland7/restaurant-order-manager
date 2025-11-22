import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useInAppProfiles } from '../hooks/useInAppProfiles';
import { supabase } from '../supabase';
import PinPad from '../components/ui/PinPad';
import { toast } from 'react-hot-toast';
import { useProfileContext } from '../ProfileContext';

import logger from '../utils/logger';
const ProfileSelectionPage = ({ preSelectedProfile, onPinVerificationSuccess, onPinVerificationFailure }) => {
  const { profiles, loading, error } = useInAppProfiles();
  const navigate = useNavigate();
  const { setSelectedProfile } = useProfileContext();

  const [selectedProfileData, setSelectedProfileData] = useState(null);
  const [showPinModal, setShowPinModal] = useState(false);
  const [pinError, setPinError] = useState('');
  const [isSettingPin, setIsSettingPin] = useState(false);

  useEffect(() => {
    if (preSelectedProfile) {
      setSelectedProfileData(preSelectedProfile);
      setShowPinModal(true);
    } else {
      // Clear selected profile from context and localStorage on mount
      setSelectedProfile(null);
    }
  }, [preSelectedProfile, setSelectedProfile]);

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
        if (onPinVerificationSuccess) {
          onPinVerificationSuccess();
        } else {
          navigate('/'); // Navigate to main app
        }
      } else {
        setPinError('PIN errato. Riprova.');
        toast.error('PIN errato.');
        if (onPinVerificationFailure) {
          onPinVerificationFailure();
        }
      }
    } catch (err) {
      logger.error('Error verifying PIN:', err);
      setPinError('Errore durante la verifica del PIN.');
      toast.error('Errore di sistema.');
      if (onPinVerificationFailure) {
        onPinVerificationFailure();
      }
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
      if (onPinVerificationSuccess) {
        onPinVerificationSuccess();
      } else {
        navigate('/');
      }

    } catch (err) {
      logger.error('Error setting PIN:', err);
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
    <div className="min-h-screen flex flex-col items-center justify-center app-background text-gray-900 dark:text-gray-100 p-6">
      <h1 className="text-5xl font-light mb-12 text-gray-800 dark:text-gray-100">Chi sta usando l'app?</h1>
      <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8 max-w-5xl mx-auto">
        {profiles.map(profile => (
          <button 
            key={profile.id} 
            className="flex flex-col items-center justify-center p-8 bg-white/70 dark:bg-gray-800/70 backdrop-blur-sm rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300 ease-in-out transform hover:-translate-y-2 cursor-pointer border border-gray-200 dark:border-gray-700"
            onClick={() => handleProfileClick(profile)}
          >
            <div className="w-20 h-20 rounded-full bg-blue-500 flex items-center justify-center text-white text-3xl font-semibold mb-4">
              {profile.profile_name.charAt(0).toUpperCase()}
            </div>
            <span className="text-2xl font-medium text-gray-900 dark:text-gray-100">{profile.profile_name}</span>
          </button>
        ))}
      </div>

      {showPinModal && selectedProfileData && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center p-4 z-50">
          <div className="bg-white/50 dark:bg-gray-800/50 backdrop-blur-md rounded-2xl shadow-xl p-8 w-full max-w-md border border-gray-200 dark:border-gray-700">
            <h2 className="text-3xl font-medium mb-6 text-center text-gray-800 dark:text-gray-100">
              {isSettingPin ? `Crea un PIN per ${selectedProfileData.profile_name}` : `Inserisci PIN per ${selectedProfileData.profile_name}`}
            </h2>
            {pinError && <p className="text-red-500 text-center mb-4">{pinError}</p>}
            <PinPad 
              onPinComplete={isSettingPin ? handleSetPinComplete : handlePinComplete} 
              onPinChange={() => setPinError('')} 
            />
            <button 
              onClick={() => setShowPinModal(false)}
              className="mt-8 w-full py-3 text-lg font-medium text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition-colors"
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
