import React, { createContext, useState, useContext } from 'react';

const PrefillContext = createContext();

export const usePrefill = () => useContext(PrefillContext);

export const PrefillProvider = ({ children }) => {
  const [prefilledData, setPrefilledData] = useState(null);

  return (
    <PrefillContext.Provider value={{ prefilledData, setPrefilledData }}>
      {children}
    </PrefillContext.Provider>
  );
};