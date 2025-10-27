import React, { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import Header from '../components/ui/Header';
import { supabaseHelpers } from '../supabase';
import { useNavigate } from 'react-router-dom';

const UserProfilePage = ({ user, profile, setProfile }) => {
    const navigate = useNavigate();
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);

    useEffect(() => {
        if (profile) {
            setFirstName(profile.first_name || '');
            setLastName(profile.last_name || '');
        }
    }, [profile]);

    const handleSaveProfile = async () => {
        if (!user) { toast.error('Sessione utente non valida.'); return; }
        setIsSubmitting(true);
        try {
            const updatedProfile = await supabaseHelpers.updateUserProfile(user.id, { first_name: firstName, last_name: lastName });
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
                    <label htmlFor="first-name" className="block text-sm font-medium text-gray-700 mb-2">Nome</label>
                    <input id="first-name" type="text" value={firstName} onChange={(e) => setFirstName(e.target.value)} className="input" placeholder="Il tuo nome" />
                </div>
                <div className="glass-card p-4">
                    <label htmlFor="last-name" className="block text-sm font-medium text-gray-700 mb-2">Cognome</label>
                    <input id="last-name" type="text" value={lastName} onChange={(e) => setLastName(e.target.value)} className="input" placeholder="Il tuo cognome" />
                </div>
                <button onClick={handleSaveProfile} disabled={isSubmitting} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium hover:bg-blue-600 transition-colors">
                    {isSubmitting ? 'Salvataggio...' : 'Salva Modifiche'}
                </button>
            </div>
        </div>
    );
};

export default UserProfilePage;
