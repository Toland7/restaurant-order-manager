import React, { useState, useEffect } from 'react';
import Header from '../components/ui/Header';
import { useNavigate } from 'react-router-dom';
import { useInAppProfiles } from '../hooks/useInAppProfiles';
import { supabase } from '../supabase';
import { toast } from 'react-hot-toast';
import { Plus, Edit, Trash2, KeyRound } from 'lucide-react';

import PinPad from '../components/ui/PinPad';

const ProfileManagerPage = () => {
  const navigate = useNavigate();
  const { profiles, loading, error, setProfiles } = useInAppProfiles();
  
  const [showEditModal, setShowEditModal] = useState(false);
  const [showPinModal, setShowPinModal] = useState(false);
  const [editingProfile, setEditingProfile] = useState(null);
  const [availablePermissions, setAvailablePermissions] = useState([]);
  const [profilePermissions, setProfilePermissions] = useState([]);

  const permissionLabels = {
    'orders:send': 'Invia Ordini Immediati',
    'orders:schedule': 'Programma Ordini Futuri',
    'orders:view_all_history': 'Visualizza Storico Ordini Completo',
    'suppliers:manage': 'Gestisci Fornitori',
    'analytics:view': 'Visualizza Dashboard Analitica',
    'settings:view': 'Accedi alle Impostazioni',
    'profiles:manage': 'Gestisci Profili e Permessi',
  };

  useEffect(() => {
    const fetchPermissions = async () => {
      const { data, error } = await supabase.from('permissions').select('*');
      if (error) {
        console.error('Error fetching available permissions:', error);
      } else {
        setAvailablePermissions(data);
      }
    };
    fetchPermissions();
  }, []);

  const handleAddNew = () => {
    setEditingProfile({ profile_name: '', position: '' });
    setProfilePermissions([]); // Initialize permissions for new profile
    setShowEditModal(true);
  };

  const handleEdit = async (profile) => {
    setEditingProfile(profile);
    // Fetch permissions for the selected profile
    const { data, error } = await supabase
      .from('profile_permissions')
      .select('permissions(name)')
      .eq('profile_id', profile.id);

    if (error) {
      console.error('Error fetching profile permissions for editing:', error);
      setProfilePermissions([]);
    } else {
      const fetchedPermissions = data.map(pp => pp.permissions.name);
      setProfilePermissions(fetchedPermissions);

      // If the profile has 'profiles:manage' permission, set position to 'Proprietario' and make it non-editable
      if (fetchedPermissions.includes('profiles:manage')) {
        setEditingProfile(prev => ({ ...prev, position: 'Proprietario' }));
      }
    }
    setShowEditModal(true);
  };

  const handleSetPin = (profile) => {
    setEditingProfile(profile);
    setShowPinModal(true);
  };

  const handleDelete = async (profile) => {
    if (window.confirm(`Sei sicuro di voler eliminare il profilo "${profile.profile_name}"?`)) {
      const toastId = toast.loading('Eliminazione...');
      try {
        const { error } = await supabase.from('in_app_profiles').delete().eq('id', profile.id);
        if (error) throw error;
        setProfiles(profiles.filter(p => p.id !== profile.id));
        toast.success('Profilo eliminato', { id: toastId });
      } catch (error) {
        toast.error(`Errore: ${error.message}`, { id: toastId });
      }
    }
  };

  const handlePinComplete = async (pin) => {
    const toastId = toast.loading('Impostazione PIN...');
    try {
      const { error } = await supabase.functions.invoke('set-profile-pin', {
        body: JSON.stringify({ profile_id: editingProfile.id, pin }),
      });
      if (error) throw error;
      toast.success('PIN impostato con successo!', { id: toastId });
      setShowPinModal(false);
      setEditingProfile(null);
    } catch (error) {
      toast.error(`Errore: ${error.message}`, { id: toastId });
    }
  };

  const handleSave = async () => {
    if (!editingProfile || !editingProfile.profile_name) {
      toast.error('Il nome del profilo non può essere vuoto.');
      return;
    }

    const toastId = toast.loading(editingProfile.id ? 'Aggiornamento...' : 'Creazione...');

    const { data: { user } } = await supabase.auth.getUser();
    if (!user) throw new Error('Utente non autenticato');

    try {
      let savedProfile;
      if (editingProfile.id) {
        // Update existing profile
        const { data, error } = await supabase
          .from('in_app_profiles')
          .update({
            profile_name: editingProfile.profile_name,
            position: editingProfile.position,
          })
          .eq('id', editingProfile.id)
          .select()
          .single();

        if (error) throw error;
        savedProfile = data;

        // Update permissions for existing profile
        const { error: deleteError } = await supabase.from('profile_permissions').delete().eq('profile_id', savedProfile.id);
        if (deleteError) {
          console.error('Error deleting existing permissions:', deleteError);
          throw deleteError;
        }

        const permissionsToInsert = profilePermissions.map(permName => {
          const permission = availablePermissions.find(ap => ap.name === permName);
          return { profile_id: savedProfile.id, permission_id: permission.id };
        });

        if (permissionsToInsert.length > 0) {
          const { error: insertPermError } = await supabase.from('profile_permissions').insert(permissionsToInsert);
          if (insertPermError) {
            console.error('Error inserting new permissions:', insertPermError);
            throw insertPermError;
          }
        }

      } else {
        // Create new profile
        const { data: { user } } = await supabase.auth.getUser();
        if (!user) throw new Error('Utente non autenticato');

        const { data, error } = await supabase
          .from('in_app_profiles')
          .insert({
            user_id: user.id,
            profile_name: editingProfile.profile_name,
            position: editingProfile.position,
          })
          .select()
          .single();

        if (error) throw error;
        savedProfile = data;

        // Insert permissions for new profile
        const permissionsToInsert = profilePermissions.map(permName => {
          const permission = availablePermissions.find(ap => ap.name === permName);
          return { profile_id: savedProfile.id, permission_id: permission.id };
        });
        if (permissionsToInsert.length > 0) {
          const { error: insertPermError } = await supabase.from('profile_permissions').insert(permissionsToInsert);
          if (insertPermError) throw insertPermError;
        }

        setProfiles([...profiles, savedProfile]);
        toast.success('Profilo creato!', { id: toastId });
      }

      setShowEditModal(false);
      setEditingProfile(null);
      setProfilePermissions([]); // Clear permissions state after saving

    } catch (error) {
      console.error('Error saving profile:', error);
      toast.error(`Errore: ${error.message}`, { id: toastId });
    }
  };

  if (loading) return <div>Caricamento...</div>;
  if (error) return <div>Errore: {error}</div>;

  return (
    <div className="min-h-screen app-background">
      <Header title="Gestione Profili" onBack={() => navigate('/settings')} />
      <div className="max-w-4xl mx-auto px-6 py-6">
        <div className="flex justify-end mb-4">
          <button onClick={handleAddNew} className="flex items-center bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600 transition-colors">
            <Plus size={20} className="mr-2" />
            Aggiungi Profilo
          </button>
        </div>

        <div className="bg-white dark:bg-gray-800 rounded-lg shadow">
          <ul className="divide-y divide-gray-200 dark:divide-gray-700">
            {profiles.map(profile => (
              <li key={profile.id} className="p-4 flex items-center justify-between">
                <div>
                  <p className="font-semibold text-lg text-gray-900 dark:text-gray-100">{profile.profile_name}</p>
                  {profile.position && <p className="text-sm text-gray-500 dark:text-gray-400">{profile.position}</p>}

                </div>
                <div className="flex items-center space-x-2">
                  <button onClick={() => handleSetPin(profile)} className="p-2 hover:bg-gray-200 dark:hover:bg-gray-700 rounded-full" title="Imposta/Cambia PIN"><KeyRound size={18} /></button>
                  <button onClick={() => handleEdit(profile)} className="p-2 hover:bg-gray-200 dark:hover:bg-gray-700 rounded-full" title="Modifica Profilo"><Edit size={18} /></button>
                  <button onClick={() => handleDelete(profile)} className="p-2 hover:bg-red-100 dark:hover:bg-red-700 rounded-full text-red-500" title="Elimina Profilo"><Trash2 size={18} /></button>
                </div>
              </li>
            ))}
          </ul>
        </div>
      </div>

      {showEditModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center p-4 z-50">
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-xl p-6 w-full max-w-md">
            <h2 className="text-2xl font-bold mb-4">{editingProfile?.id ? 'Modifica Profilo' : 'Nuovo Profilo'}</h2>
            <div className="space-y-4">
              <div>
                <label htmlFor="profile_name" className="block text-sm font-medium text-gray-700 dark:text-gray-300">Nome Profilo</label>
                <input 
                  type="text" 
                  id="profile_name"
                  value={editingProfile?.profile_name || ''}
                  onChange={(e) => setEditingProfile({ ...editingProfile, profile_name: e.target.value })}
                  className="mt-1 block w-full px-3 py-2 bg-white dark:bg-gray-700 border border-gray-300 dark:border-gray-600 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                />
              </div>
              <div>
                <label htmlFor="position" className="block text-sm font-medium text-gray-700 dark:text-gray-300">Carica</label>
                <input 
                  type="text" 
                  id="position"
                  value={editingProfile?.position || ''}
                  onChange={(e) => setEditingProfile({ ...editingProfile, position: e.target.value })}
                  className="mt-1 block w-full px-3 py-2 bg-white dark:bg-gray-700 border border-gray-300 dark:border-gray-600 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                  disabled={profilePermissions.includes('profiles:manage')} // Add this line
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Permessi</label>
                <div className="space-y-2">
                  {availablePermissions.map(permission => (
                    <div key={permission.id} className="flex items-center">
                      <input
                        type="checkbox"
                        id={`perm-${permission.id}`}
                        checked={profilePermissions.includes(permission.name)}
                        onChange={(e) => {
                          if (e.target.checked) {
                            setProfilePermissions([...profilePermissions, permission.name]);
                          } else {
                            setProfilePermissions(profilePermissions.filter(name => name !== permission.name));
                          }
                        }}
                        className="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
                      />
                      <label htmlFor={`perm-${permission.id}`} className="ml-2 block text-sm text-gray-900 dark:text-gray-100">
                        {permissionLabels[permission.name] || permission.name} <span className="text-gray-500 dark:text-gray-400 text-xs">({permission.description})</span>
                      </label>
                    </div>
                  ))}
                </div>
              </div>

            </div>
            <div className="mt-6 flex justify-end space-x-3">
              <button onClick={() => setShowEditModal(false)} className="py-2 px-4 bg-gray-200 dark:bg-gray-600 rounded-md hover:bg-gray-300 dark:hover:bg-gray-500">Annulla</button>
              <button onClick={handleSave} className="py-2 px-4 bg-blue-500 text-white rounded-md hover:bg-blue-600">Salva</button>
            </div>
          </div>
        </div>
      )}

      {showPinModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center p-4 z-50">
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-xl p-6 w-full max-w-md">
            <h2 className="text-2xl font-bold mb-4 text-center">Imposta PIN per {editingProfile?.profile_name}</h2>
            <PinPad onPinComplete={handlePinComplete} />
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

export default ProfileManagerPage;