import React from 'react';
import { Outlet } from 'react-router-dom'; // Import Outlet
import ModernCookieBanner from './components/ui/ModernCookieBanner';

function App() {
  return (
    <>
      <Outlet /> {/* Render child routes here */}
      <ModernCookieBanner />
    </>
  );
}

export default App;