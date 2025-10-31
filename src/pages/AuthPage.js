import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { toast } from 'react-hot-toast';
import { supabase } from '../supabase';

const AuthPage = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [isLogin, setIsLogin] = useState(true);

    // New profile fields
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [role, setRole] = useState('');
    const [companyName, setCompanyName] = useState('');
    const [companyVatId, setCompanyVatId] = useState('');
    const [headquartersName, setHeadquartersName] = useState('');
    const [headquartersAddress, setHeadquartersAddress] = useState('');
    const [isAuthenticating, setIsAuthenticating] = useState(false);

    const handleLogin = async (e) => {
      e.preventDefault();
      setIsAuthenticating(true);
      try {
        const { error } = await supabase.auth.signInWithPassword({ email, password });
        if (error) throw error;
        toast.success('Accesso effettuato con successo!');
      } catch (error) {
        toast.error(error.message);
      } finally {
        setIsAuthenticating(false);
      }
    };

    const handleSignUp = async (e) => {
      e.preventDefault();
      setIsAuthenticating(true);
      console.log('Starting signup for email:', email);
      try {
        console.log('Calling supabase.auth.signUp...');
        const { data, error } = await supabase.auth.signUp({
          email,
          password,
          options: {
            data: {
              first_name: firstName,
              last_name: lastName,
              role: role,
              company_name: companyName,
              company_vat_id: companyVatId,
              headquarters_name: headquartersName,
              headquarters_address: headquartersAddress,
            }
          }
        });
        console.log('Signup response data:', data);
        console.log('Signup response error:', error);

        // Salva i dati del profilo nella tabella profiles
        if (data.user && !error) {
          console.log('Profile data will be populated by trigger.');
        }
        if (error) throw error;
        if (data.user) {
          toast.success('Registrazione completata! Un amministratore approverà il tuo account a breve.');
          setIsLogin(true);
        }
      } catch (error) {
        console.error('Signup error caught:', error);
        console.error('Error message:', error.message);
        console.error('Error details:', error);
        toast.error(error.message);
      } finally {
        setIsAuthenticating(false);
      }
    };

    return (
      <div className="min-h-screen app-background flex items-center justify-center px-6">
        <div className="max-w-sm w-full">
          <div className="glass-card p-6">
            <div className="text-center mb-6"><h1 className="text-2xl font-light text-gray-900 mb-2">Gestione Ordini</h1><p className="text-gray-500 text-sm">{isLogin ? 'Accedi al tuo account' : 'Crea un nuovo account'}</p></div>
            <form onSubmit={isLogin ? handleLogin : handleSignUp} className="space-y-4">
              {!isLogin && (
                <>
                  <div><label htmlFor="first-name" className="block text-sm font-medium text-gray-700 mb-2">Nome</label><input id="first-name" name="first-name" type="text" value={firstName} onChange={(e) => setFirstName(e.target.value)} required className="input" placeholder="Mario" /></div>
                  <div><label htmlFor="last-name" className="block text-sm font-medium text-gray-700 mb-2">Cognome</label><input id="last-name" name="last-name" type="text" value={lastName} onChange={(e) => setLastName(e.target.value)} required className="input" placeholder="Rossi" /></div>
                  <div><label htmlFor="role" className="block text-sm font-medium text-gray-700 mb-2">Ruolo</label><input id="role" name="role" type="text" value={role} onChange={(e) => setRole(e.target.value)} required className="input" placeholder="Es. Manager" /></div>
                  <h4 className="text-md font-medium text-gray-800 pt-2">Dati Aziendali</h4>
                  <div><label htmlFor="company-name" className="block text-sm font-medium text-gray-700 mb-2">Ragione Sociale</label><input id="company-name" name="company-name" type="text" value={companyName} onChange={(e) => setCompanyName(e.target.value)} required className="input" placeholder="Ristorante S.R.L." /></div>
                  <div><label htmlFor="company-vat-id" className="block text-sm font-medium text-gray-700 mb-2">Partita IVA</label><input id="company-vat-id" name="company-vat-id" type="text" value={companyVatId} onChange={(e) => setCompanyVatId(e.target.value)} required className="input" placeholder="IT12345678901" /></div>
                  <div><label htmlFor="headquarters-name" className="block text-sm font-medium text-gray-700 mb-2">Nome Sede</label><input id="headquarters-name" name="headquarters-name" type="text" value={headquartersName} onChange={(e) => setHeadquartersName(e.target.value)} required className="input" placeholder="Ristorante da Mario" /></div>
                  <div><label htmlFor="headquarters-address" className="block text-sm font-medium text-gray-700 mb-2">Indirizzo Sede</label><input id="headquarters-address" name="headquarters-address" type="text" value={headquartersAddress} onChange={(e) => setHeadquartersAddress(e.target.value)} required className="input" placeholder="Via Roma, 1" /></div>
                </>
              )}
              <div><label htmlFor="auth-email" className="block text-sm font-medium text-gray-700 mb-2">Email</label><input id="auth-email" name="auth-email" type="email" value={email} onChange={(e) => setEmail(e.target.value)} required className="input" placeholder="mario.rossi@email.com" /></div>
              <div><label htmlFor="auth-password" className="block text-sm font-medium text-gray-700 mb-2">Password</label><input id="auth-password" name="auth-password" type="password" value={password} onChange={(e) => setPassword(e.target.value)} required className="input" placeholder="••••••••" /></div>
              <button type="submit" disabled={isAuthenticating} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium flex items-center justify-center">
                {isAuthenticating ? (isLogin ? 'Accesso in corso...' : 'Registrazione in corso...') : (isLogin ? 'Accedi' : 'Registrati')}
              </button>
            </form>
            <div className="mt-6 text-center"><button onClick={() => setIsLogin(!isLogin)} className="text-blue-500 hover:text-blue-600 text-sm">{isLogin ? 'Non hai un account? Registrati' : 'Hai già un account? Accedi'}</button></div>
            <div className="mt-4 text-center text-xs text-gray-500 space-x-2">
              <Link to="/privacy" className="underline hover:text-gray-700">Privacy Policy</Link>
              <span>|</span>
              <Link to="/terms-of-service" className="underline hover:text-gray-700">Termini di Servizio</Link>
            </div>
          </div>
        </div>
      </div>
    );
  };

export default AuthPage;