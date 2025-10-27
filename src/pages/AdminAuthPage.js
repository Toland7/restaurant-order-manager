import React, { useState } from 'react';
import { toast } from 'react-hot-toast';
import Header from '../components/ui/Header';
import { supabaseHelpers } from '../supabase';

const AdminAuthPage = ({ setCurrentPage, setIsAdminAuthenticated }) => {
    const [password, setPassword] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);

    const handleAdminLogin = async () => {
        setIsSubmitting(true);
        try {
            const { data, error } = await supabaseHelpers.adminLogin(password);
            if (error) throw error;
            if (data.authenticated) {
                setIsAdminAuthenticated(true);
                setCurrentPage('adminPanel');
                toast.success('Accesso admin effettuato!');
            } else {
                toast.error('Password admin errata.');
            }
        } catch (error) {
            console.error('Error during admin login:', error);
            toast.error('Errore durante l\'accesso admin.');
        } finally {
            setIsSubmitting(false);
        }
    };

    return (
        <div className="min-h-screen app-background">
            <Header title="Accesso Admin" onBack={() => setCurrentPage('settings')} />
            <div className="max-w-sm mx-auto px-6 py-6 space-y-4">
                <div className="glass-card p-4">
                    <label htmlFor="admin-password" className="block text-sm font-medium text-gray-700 mb-2">Password Admin</label>
                    <input
                        id="admin-password"
                        type="password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        className="input"
                        placeholder="Inserisci la password admin"
                    />
                </div>
                <button onClick={handleAdminLogin} disabled={isSubmitting} className="w-full bg-yellow-500 text-white py-3 rounded-lg font-medium hover:bg-yellow-600 transition-colors">
                    {isSubmitting ? 'Accesso in corso...' : 'Accedi come Admin'}
                </button>
            </div>
        </div>
    );
};

export default AdminAuthPage;
