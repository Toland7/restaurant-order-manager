import React, { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import Header from '../components/ui/Header';
import { supabaseHelpers } from '../supabase';
import { useNavigate } from 'react-router-dom';

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

    useEffect(() => {
        if (profile) {
            setFirstName(profile.first_name || '');
            setLastName(profile.last_name || '');
            setRole(profile.role || '');
            setCompanyName(profile.company_name || '');
            setCompanyVatId(profile.company_vat_id || '');
            setHeadquartersName(profile.headquarters_name || '');
            setHeadquartersAddress(profile.headquarters_address || '');
        }
    }, [profile]);

    const handleSaveProfile = async () => {
        if (!user) { toast.error('Sessione utente non valida.'); return; }
        setIsSubmitting(true);
        try {
            const updatedProfile = await supabaseHelpers.updateUserProfile(user.id, {
                first_name: firstName,
                last_name: lastName,
                role: role,
                company_name: companyName,
                company_vat_id: companyVatId,
                headquarters_name: headquartersName,
                headquarters_address: headquartersAddress
            });
            setProfile(prev => ({ ...prev, ...updatedProfile }));
            toast.success('Profilo aggiornato con successo!');
        } catch (error) {
            console.error('Error updating profile:', error);
            toast.error('Errore durante l\'aggiornamento del profilo.');
        } finally {
            setIsSubmitting(false);
        }
    };

    return (
        <div className="min-h-screen app-background">
            <Header title="Profilo Utente" onBack={() => navigate('/settings')} />
            <div className="max-w-sm mx-auto px-6 py-6 space-y-4">
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
            </div>
        </div>
    );
};

export default UserProfilePage;
