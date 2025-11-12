import React, { useState, useRef, useEffect } from 'react';
import { ChevronDown } from 'lucide-react';
import { useProfileContext } from '../../ProfileContext';
import { useInAppProfiles } from '../../hooks/useInAppProfiles';
import { useNavigate } from 'react-router-dom';

const ProfileSwitcherDropdown = () => {
  const { selectedProfile, setSelectedProfile, openPinModal } = useProfileContext();
  const { profiles } = useInAppProfiles();
  const navigate = useNavigate();

  const [isOpen, setIsOpen] = useState(false);
  const dropdownRef = useRef(null);

  const otherProfiles = profiles.filter(p => p.id !== selectedProfile?.id);
  const isSwitchable = profiles && profiles.length > 1;

  // Close dropdown when clicking outside
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
        setIsOpen(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  const handleProfileSelect = (profile) => {
    setIsOpen(false);
    openPinModal(profile);
  };

  const handleLogoutAndSwitch = () => {
    setSelectedProfile(null);
    navigate('/profile-selection');
  }

  if (!isSwitchable) {
    return <span className="font-medium">{selectedProfile?.profile_name}</span>;
  }

  return (
    <div className="relative" ref={dropdownRef}>
      <button 
        onClick={() => setIsOpen(!isOpen)} 
        className="inline-flex items-center font-medium text-gray-700 dark:text-gray-300 hover:bg-gray-200 dark:hover:bg-gray-700 rounded-md px-2 py-1 transition-colors"
      >
        {selectedProfile?.profile_name}
        <ChevronDown size={16} className={`ml-1 transition-transform ${isOpen ? 'rotate-180' : ''}`} />
      </button>

      {isOpen && (
        <div className="absolute mt-2 w-56 rounded-md shadow-lg bg-white dark:bg-gray-800 ring-1 ring-black ring-opacity-5 z-10">
          <div className="py-1" role="menu" aria-orientation="vertical" aria-labelledby="options-menu">
            {otherProfiles.map(profile => (
              <button
                key={profile.id}
                onClick={() => handleProfileSelect(profile)}
                className="w-full text-left block px-4 py-2 text-sm text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700"
                role="menuitem"
              >
                {profile.profile_name}
              </button>
            ))}
            <div className="border-t border-gray-200 dark:border-gray-700 my-1"></div>
            <button
              onClick={handleLogoutAndSwitch}
              className="w-full text-left block px-4 py-2 text-sm text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700"
              role="menuitem"
            >
              Tutti i profili...
            </button>
          </div>
        </div>
      )}
    </div>
  );
};

export default ProfileSwitcherDropdown;
