import React, { useState } from 'react';
import { X, ArrowLeft } from 'lucide-react';

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
    <div className="pin-pad-container p-6 bg-white/50 dark:bg-gray-800/50 backdrop-blur-md rounded-2xl shadow-xl border border-gray-200 dark:border-gray-700">
      <div className="pin-display flex justify-center items-center h-12 mb-6 space-x-3">
        {Array(pinLength).fill('').map((_, index) => (
          <div
            key={index}
            className={`w-4 h-4 rounded-full transition-all duration-200 ease-in-out
              ${pin.length > index ? 'bg-blue-500 scale-100' : 'border-2 border-gray-400 dark:border-gray-600 scale-75'}`}
          ></div>
        ))}
      </div>
      <div className="grid grid-cols-3 gap-3">
        {[1, 2, 3, 4, 5, 6, 7, 8, 9].map((digit) => (
          <button
            key={digit}
            onClick={() => handleDigitClick(digit.toString())}
            className="p-5 text-3xl font-normal bg-gray-100 dark:bg-gray-700 rounded-full shadow-md hover:bg-gray-200 dark:hover:bg-gray-600 transition-all duration-200 ease-in-out active:scale-95"
          >
            {digit}
          </button>
        ))}
        <button
          onClick={handleClear}
          className="p-5 text-3xl font-normal bg-gray-100 dark:bg-gray-700 rounded-full shadow-md hover:bg-gray-200 dark:hover:bg-gray-600 transition-all duration-200 ease-in-out active:scale-95 text-gray-700 dark:text-gray-200 flex items-center justify-center"
        >
          <X size={30} />
        </button>
        <button
          onClick={() => handleDigitClick('0')}
          className="p-5 text-3xl font-normal bg-gray-100 dark:bg-gray-700 rounded-full shadow-md hover:bg-gray-200 dark:hover:bg-gray-600 transition-all duration-200 ease-in-out active:scale-95"
        >
          0
        </button>
        <button
          onClick={handleBackspace}
          className="p-5 text-3xl font-normal bg-gray-100 dark:bg-gray-700 rounded-full shadow-md hover:bg-gray-200 dark:hover:bg-gray-600 transition-all duration-200 ease-in-out active:scale-95 text-gray-700 dark:text-gray-200 flex items-center justify-center"
        >
          <ArrowLeft size={30} />
        </button>
      </div>
    </div>
  );
};

export default PinPad;
