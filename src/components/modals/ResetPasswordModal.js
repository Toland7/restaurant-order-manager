import React, { useState } from 'react';
import { toast } from 'react-hot-toast';
import { supabase } from '../../supabase';

const ResetPasswordModal = ({ show, onClose }) => {
    const [email, setEmail] = useState('');
    const [loading, setLoading] = useState(false);
    const [isSent, setIsSent] = useState(false);

    const handlePasswordReset = async (e) => {
        e.preventDefault();
        setLoading(true);
        try {
            const { error } = await supabase.auth.resetPasswordForEmail(email, {
                redirectTo: `${window.location.origin}/update-password`,
            });
            if (error) throw error;
            setIsSent(true);
        } catch (error) {
            toast.error(error.message);
        } finally {
            setLoading(false);
        }
    };

    if (!show) return null;

    return (
        <div className="modal-overlay">
            <div className="bg-surface p-6 max-w-sm w-full rounded-xl shadow-lg border border-border">
                <h3 className="font-medium text-dark-gray dark:text-gray-100 mb-4">Recupera Password</h3>
                {isSent ? (
                    <div>
                        <p className="text-sm text-dark-gray dark:text-gray-300">
                            Se un account con questa email esiste, abbiamo inviato un link per il recupero della password. Controlla la tua casella di posta.
                        </p>
                        <button onClick={onClose} className="btn btn-primary w-full mt-4">Chiudi</button>
                    </div>
                ) : (
                    <form onSubmit={handlePasswordReset}>
                        <p className="text-sm text-dark-gray dark:text-gray-300 mb-4">
                            Inserisci il tuo indirizzo email e ti invieremo un link per reimpostare la password.
                        </p>
                        <div className="mb-4">
                            <label htmlFor="reset-email" className="block text-sm font-medium text-gray-700 mb-2">Email</label>
                            <input
                                id="reset-email"
                                name="reset-email"
                                type="email"
                                value={email}
                                onChange={(e) => setEmail(e.target.value)}
                                required
                                className="input"
                                placeholder="mario.rossi@email.com"
                                autoComplete="email"
                            />
                        </div>
                        <div className="flex space-x-3">
                            <button type="button" onClick={onClose} className="btn btn-outline flex-1">Annulla</button>
                            <button type="submit" disabled={loading} className="btn btn-primary flex-1">
                                {loading ? 'Invio...' : 'Invia Link'}
                            </button>
                        </div>
                    </form>
                )}
            </div>
        </div>
    );
};

export default ResetPasswordModal;
