import { useState, useEffect } from 'react';

const useSubscriptionStatus = () => {
  const [isProUser, setIsProUser] = useState(false);

  useEffect(() => {
    // Check for the environment variable to enable multi-profile features
    // In a real scenario, this would come from a user's subscription data
    const enableMultiProfile = process.env.REACT_APP_ENABLE_MULTI_PROFILE === 'true';
    setIsProUser(enableMultiProfile);
  }, []);

  return { isProUser };
};

export default useSubscriptionStatus;
