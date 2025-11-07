import React, { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import Header from '../components/ui/Header';
import { supabaseHelpers } from '../supabase';
import { useNavigate } from 'react-router-dom';
import DeleteAccountModal from '../components/modals/DeleteAccountModal'; // Import the new modal

const UserProfilePage = ({ user, profile, setProfile }) => {
    const navigate = useNavigate();
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [role, setRole] = useState('');
    const [companyName, setCompanyName] = useState('');
    const [companyVatId, setCompanyVatId] = useState('');
    const [headquartersName, setHeadquartersName] = useState('');
    const [headquartersAddress, setHeadquartersAddress] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false); // State for modal visibility
    const [isDropdownOpen, setIsDropdownOpen] = useState(false); // State for dropdown visibility

    useEffect(() => {
        if (profile) {
            setFirstName(profile.first_name || '');
            setLastName(profile.last_name || '');
            setRole(profile.role || '');
            // Populate company fields from the nested companies object
            setCompanyName(profile.companies?.name || '');
            setCompanyVatId(profile.companies?.vat_id || '');
            setHeadquartersName(profile.companies?.name || ''); // Assuming headquartersName is company name
            setHeadquartersAddress(profile.companies?.address || '');
        }
    }, [profile]);

    const handleSaveProfile = async () => {
        if (!user) { toast.error('Sessione utente non valida.'); return; }
        setIsSubmitting(true);
        try {
            const profileUpdates = {
                first_name: firstName,
                last_name: lastName,
                role: role,
            };

            const companyUpdates = {
                name: companyName,
                vat_id: companyVatId,
                address: headquartersAddress,
            };

            const { updatedProfileData, updatedCompanyData } = await supabaseHelpers.updateUserProfile(user.id, profileUpdates, companyUpdates);
            
            // Update the local profile state with combined data
            setProfile(prev => ({
                ...prev,
                ...updatedProfileData,
                companies: updatedCompanyData || prev.companies // Merge updated company data
            }));
            toast.success('Profilo aggiornato con successo!');
        } catch (error) {
            console.error('Error updating profile:', error);
            toast.error('Errore durante l\'aggiornamento del profilo.');
        } finally {
            setIsSubmitting(false);
        }
    };

    const handleDeleteAccountClick = () => {
        setIsDeleteModalOpen(true);
        setIsDropdownOpen(false); // Close dropdown when modal opens
    };

    const handleConfirmDelete = async (email, password) => {
        if (!user) {
            toast.error('Sessione utente non valida.');
            return;
        }

        // Re-authenticate user before deleting
        const { data: { user: reauthenticatedUser }, error: reauthError } = await supabaseHelpers.signInWithPassword(email, password);

        if (reauthError || !reauthenticatedUser || reauthenticatedUser.id !== user.id) {
            toast.error('Credenziali non valide. Impossibile eliminare l\'account.');
            return;
        }

        try {
            const { success, error } = await supabaseHelpers.deleteCurrentUser();
            if (success) {
                toast.success('Account eliminato con successo. Verrai reindirizzato alla pagina di autenticazione.');
                navigate('/auth'); // Redirect to auth page after deletion
            } else {
                throw error;
            }
        } catch (error) {
            console.error('Error deleting account:', error);
            toast.error('Errore durante l\'eliminazione dell\'account.');
        } finally {
            setIsDeleteModalOpen(false); // Close modal
        }
    };

    return (
        <div className="min-h-screen app-background"> {/* Removed flex flex-col */}
            <Header title="Profilo Utente" onBack={() => navigate('/settings')} />
            <div className="max-w-sm mx-auto px-6 py-6 space-y-4"> {/* Removed flex-grow overflow-y-auto */}
                <div className="glass-card p-4">
                    <label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-2">Email</label>
                    <input id="email" type="email" value={user?.email || ''} className="input bg-gray-100 dark:bg-gray-700" disabled />
                </div>

                <div className="glass-card p-4">
                    <h3 className="text-lg font-medium text-gray-900 dark:text-gray-100 mb-4">Dati Personali</h3>
                    <div className="space-y-4">
                        <div>
                            <label htmlFor="first-name" className="block text-sm font-medium text-gray-700 mb-2">Nome</label>
                            <input id="first-name" type="text" value={firstName} onChange={(e) => setFirstName(e.target.value)} className="input" placeholder="Il tuo nome" />
                        </div>
                        <div>
                            <label htmlFor="last-name" className="block text-sm font-medium text-gray-700 mb-2">Cognome</label>
                            <input id="last-name" type="text" value={lastName} onChange={(e) => setLastName(e.target.value)} className="input" placeholder="Il tuo cognome" />
                        </div>
                        <div>
                            <label htmlFor="role" className="block text-sm font-medium text-gray-700 mb-2">Ruolo</label>
                            <input id="role" type="text" value={role} onChange={(e) => setRole(e.target.value)} className="input" placeholder="Es. Manager, Chef, etc." />
                        </div>
                    </div>
                </div>

                <div className="glass-card p-4">
                    <h3 className="text-lg font-medium text-gray-900 dark:text-gray-100 mb-4">Dati Aziendali</h3>
                    <div className="space-y-4">
                        <div>
                            <label htmlFor="company-name" className="block text-sm font-medium text-gray-700 mb-2">Ragione Sociale</label>
                            <input id="company-name" type="text" value={companyName} onChange={(e) => setCompanyName(e.target.value)} className="input" placeholder="Nome della tua azienda" />
                        </div>
                        <div>
                            <label htmlFor="company-vat-id" className="block text-sm font-medium text-gray-700 mb-2">Partita IVA</label>
                            <input id="company-vat-id" type="text" value={companyVatId} onChange={(e) => setCompanyVatId(e.target.value)} className="input" placeholder="IT12345678901" />
                        </div>
                        <div>
                            <label htmlFor="headquarters-name" className="block text-sm font-medium text-gray-700 mb-2">Nome Sede</label>
                            <input id="headquarters-name" type="text" value={headquartersName} onChange={(e) => setHeadquartersName(e.target.value)} className="input" placeholder="Nome della sede principale" />
                        </div>
                        <div>
                            <label htmlFor="headquarters-address" className="block text-sm font-medium text-gray-700 mb-2">Indirizzo Sede</label>
                            <input id="headquarters-address" type="text" value={headquartersAddress} onChange={(e) => setHeadquartersAddress(e.target.value)} className="input" placeholder="Indirizzo completo della sede" />
                        </div>
                    </div>
                </div>
                <button onClick={handleSaveProfile} disabled={isSubmitting} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium hover:bg-blue-600 transition-colors">
                    {isSubmitting ? 'Salvataggio...' : 'Salva Modifiche'}
                </button>

                {/* Dropdown for Delete Account button */}
                <div className="relative inline-block text-center w-full mt-4">
                    <div>
                        <button
                            type="button"
                            className="text-red-600 dark:text-red-400 hover:underline font-medium text-sm px-4 py-2"
                            id="options-menu"
                            aria-haspopup="true"
                            aria-expanded="true"
                            onClick={() => setIsDropdownOpen(!isDropdownOpen)}
                        >
                            Altre Azioni
                        </button>
                    </div>

                    {isDropdownOpen && (
                        <div
                            className="origin-top-right absolute right-0 mt-2 w-full rounded-md shadow-lg bg-white dark:bg-gray-800 ring-1 ring-black ring-opacity-5 focus:outline-none"
                            role="menu"
                            aria-orientation="vertical"
                            aria-labelledby="options-menu"
                        >
                            <div className="py-1" role="none">
                                <button
                                    onClick={handleDeleteAccountClick}
                                    className="block w-full text-left px-4 py-2 text-sm text-red-600 hover:bg-red-100 dark:hover:bg-red-700"
                                    role="menuitem"
                                >
                                    Elimina Account
                                </button>
                            </div>
                        </div>
                    )}
                </div>
            </div>

            <DeleteAccountModal
                isOpen={isDeleteModalOpen}
                onClose={() => setIsDeleteModalOpen(false)}
                onConfirm={handleConfirmDelete}
            />
        </div>
    );
};

export default UserProfilePage;
