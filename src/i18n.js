import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';

import en from './locales/en.json';
import it from './locales/it.json';

const resources = {
  en: {
    translation: en,
  },
  it: {
    translation: it,
  },
};

i18n
  .use(initReactI18next)
  .init({
    resources,
    lng: 'it', // lingua di default
    fallbackLng: 'en',
    interpolation: {
      escapeValue: false, // React già fa escape
    },
  });

export default i18n;