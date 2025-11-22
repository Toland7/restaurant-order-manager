import React, { useState, useEffect } from 'react';
import { supabase } from '../../supabase';
import PinPad from '../ui/PinPad';
import { toast } from 'react-hot-toast';
import { useProfileContext } from '../../ProfileContext';
import Modal from '../ui/Modal';

import logger from '../../utils/logger';
const PinVerificationModal = ({ isOpen, onClose, profile, onSuccess }) => {
  const { setSelectedProfile } = useProfileContext();
  const [pinError, setPinError] = useState('');
  const [isSettingPin, setIsSettingPin] = useState(false);

  useEffect(() => {
    if (profile) {
      // If profile has no PIN, enter setup mode. Otherwise, enter verification mode.
      setIsSettingPin(!profile.pin_hash);
      setPinError(''); // Reset error on profile change
    }
  }, [profile]);

  const handlePinComplete = async (pin) => {
    if (!profile) return;

    try {
      const { data, error } = await supabase.functions.invoke('verify-profile-pin', {
        body: JSON.stringify({ profile_id: profile.id, pin }),
      });

      if (error) throw error;

      if (data.is_valid) {
        toast.success(`Benvenuto, ${profile.profile_name}!`);
        setSelectedProfile(profile); // Update context and localStorage
        onSuccess(profile);
      } else {
        setPinError('PIN errato. Riprova.');
        toast.error('PIN errato.');
      }
    } catch (err) {
      logger.error('Error verifying PIN:', err);
      setPinError('Errore durante la verifica del PIN.');
      toast.error('Errore di sistema.');
    }
  };

  const handleSetPinComplete = async (pin) => {
    if (!profile) return;

    try {
      const { error } = await supabase.functions.invoke('set-profile-pin', {
        body: JSON.stringify({ profile_id: profile.id, pin }),
      });

      if (error) throw error;

      toast.success('PIN impostato con successo!');
      const updatedProfile = { ...profile, pin_hash: 'set' }; // Mock hash to prevent re-triggering setup
      setSelectedProfile(updatedProfile);
      onSuccess(updatedProfile);
    } catch (err) {
      logger.error('Error setting PIN:', err);
      setPinError("Errore durante l'impostazione del PIN.");
      toast.error('Errore di sistema.');
    }
  };

  if (!profile) {
    return null;
  }

  return (
    <Modal isOpen={isOpen} onClose={onClose}>
      <h2 className="text-3xl font-medium mb-6 text-center text-gray-800 dark:text-gray-100">
        {isSettingPin ? `Crea un PIN per ${profile.profile_name}` : `Inserisci PIN per ${profile.profile_name}`}
      </h2>
      {pinError && <p className="text-red-500 text-center mb-4">{pinError}</p>}
      <PinPad 
        onPinComplete={isSettingPin ? handleSetPinComplete : handlePinComplete} 
        onPinChange={() => setPinError('')} 
      />
      <button 
        onClick={onClose}
        className="mt-8 w-full py-3 text-lg font-medium text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition-colors"
      >
        Annulla
      </button>
    </Modal>
  );
};

export default PinVerificationModal;
