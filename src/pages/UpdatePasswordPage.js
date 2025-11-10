import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { toast } from 'react-hot-toast';
import { supabase } from '../supabase';

const UpdatePasswordPage = () => {
    const [password, setPassword] = useState('');
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);
    const navigate = useNavigate();

    useEffect(() => {
        const { data: { subscription } } = supabase.auth.onAuthStateChange((event, session) => {
            if (event === 'PASSWORD_RECOVERY') {
                if (!session) {
                    toast.error('Link di recupero non valido o scaduto. Richiedine uno nuovo.');
                    navigate('/auth');
                }
            }
        });

        return () => {
            subscription.unsubscribe();
        };
    }, [navigate]);

    const handleUpdatePassword = async (e) => {
        e.preventDefault();
        setLoading(true);
        setError(null);
        try {
            const { error } = await supabase.auth.updateUser({ password });
            if (error) throw error;
            toast.success('Password aggiornata con successo! Verrai reindirizzato alla pagina di login.');
            setTimeout(() => navigate('/'), 3000);
        } catch (error) {
            setError(error.message);
            toast.error(error.message);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="min-h-screen app-background flex items-center justify-center px-6">
            <div className="max-w-sm w-full">
                <div className="glass-card p-6">
                    <div className="text-center mb-6">
                        <h1 className="text-2xl font-light text-gray-900 mb-2">Reimposta Password</h1>
                        <p className="text-gray-500 text-sm">Inserisci la tua nuova password.</p>
                    </div>
                    <form onSubmit={handleUpdatePassword} className="space-y-4">
                        <div>
                            <label htmlFor="new-password" className="block text-sm font-medium text-gray-700 mb-2">Nuova Password</label>
                            <input
                                id="new-password"
                                name="new-password"
                                type="password"
                                value={password}
                                onChange={(e) => setPassword(e.target.value)}
                                required
                                className="input"
                                placeholder="••••••••"
                            />
                        </div>
                        <button type="submit" disabled={loading} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium">
                            {loading ? 'Aggiornamento...' : 'Aggiorna Password'}
                        </button>
                        {error && <p className="text-red-500 text-sm mt-2 text-center">{error}</p>}
                    </form>
                </div>
            </div>
        </div>
    );
};

export default UpdatePasswordPage;
