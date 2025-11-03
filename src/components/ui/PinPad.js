import React, { useState } from 'react';

const PinPad = ({ pinLength = 4, onPinComplete, onPinChange }) => {
  const [pin, setPin] = useState('');

  const handleDigitClick = (digit) => {
    if (pin.length < pinLength) {
      const newPin = pin + digit;
      setPin(newPin);
      onPinChange && onPinChange(newPin);
      if (newPin.length === pinLength) {
        onPinComplete && onPinComplete(newPin);
      }
    }
  };

  const handleBackspace = () => {
    const newPin = pin.slice(0, -1);
    setPin(newPin);
    onPinChange && onPinChange(newPin);
  };

  const handleClear = () => {
    setPin('');
    onPinChange && onPinChange('');
  };

  return (
    <div className="pin-pad-container p-4 bg-gray-100 dark:bg-gray-800 rounded-lg shadow-lg">
      <div className="pin-display text-center text-3xl font-bold mb-4 tracking-widest">
        {pin.split('').map((char, index) => (
          <span key={index} className="inline-block mx-1">●</span>
        ))}
        {Array(pinLength - pin.length).fill('').map((_, index) => (
          <span key={index + pin.length} className="inline-block mx-1 text-gray-400 dark:text-gray-600">○</span>
        ))}
      </div>
      <div className="grid grid-cols-3 gap-2">
        {[1, 2, 3, 4, 5, 6, 7, 8, 9].map((digit) => (
          <button
            key={digit}
            onClick={() => handleDigitClick(digit.toString())}
            className="p-4 text-2xl font-semibold bg-white dark:bg-gray-700 rounded-lg shadow hover:bg-gray-200 dark:hover:bg-gray-600 transition-colors"
          >
            {digit}
          </button>
        ))}
        <button
          onClick={handleClear}
          className="p-4 text-2xl font-semibold bg-red-100 dark:bg-red-700 rounded-lg shadow hover:bg-red-200 dark:hover:bg-red-600 transition-colors"
        >
          Clear
        </button>
        <button
          onClick={() => handleDigitClick('0')}
          className="p-4 text-2xl font-semibold bg-white dark:bg-gray-700 rounded-lg shadow hover:bg-gray-200 dark:hover:bg-gray-600 transition-colors"
        >
          0
        </button>
        <button
          onClick={handleBackspace}
          className="p-4 text-2xl font-semibold bg-yellow-100 dark:bg-yellow-700 rounded-lg shadow hover:bg-yellow-200 dark:hover:bg-yellow-600 transition-colors"
        >
          ←
        </button>
      </div>
    </div>
  );
};

export default PinPad;
