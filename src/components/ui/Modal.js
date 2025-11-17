import React, { useState, useEffect } from 'react';

const Modal = ({ isOpen, onClose, children }) => {
  const [isModalVisible, setIsModalVisible] = useState(false);

  useEffect(() => {
    if (isOpen) {
      // When the modal is told to open, we first mount it, then trigger the animation
      setIsModalVisible(true);
    }
    // The parent component controls the mounting/unmounting via isOpen
    // The closing animation is handled by the handleClose function
  }, [isOpen]);

  if (!isOpen) {
    return null;
  }

  // This function starts the closing animation and then calls the parent's onClose
  const handleClose = () => {
    setIsModalVisible(false);
    setTimeout(onClose, 300); // This duration should match the transition duration
  };

  return (
    <div
      className={`fixed inset-0 bg-black flex justify-center items-center p-4 z-50 transition-opacity duration-300 ${isModalVisible ? 'bg-opacity-50' : 'bg-opacity-0'}`}
      onClick={handleClose}
    >
      <div
        className={`bg-white dark:bg-gray-800 rounded-lg shadow-xl p-6 w-full max-w-md transition-all duration-300 ${isModalVisible ? 'opacity-100 scale-100' : 'opacity-0 scale-95'}`}
        onClick={e => e.stopPropagation()}
      >
        {children}
      </div>
    </div>
  );
};

export default Modal;
