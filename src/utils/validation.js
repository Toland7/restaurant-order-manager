import { z } from 'zod';

/**
 * Validation schemas using Zod
 * Provides type-safe validation for user inputs
 */

// Email validation
export const emailSchema = z.string().email('Email non valida');

// Phone number validation (Italian format)
export const phoneSchema = z.string().regex(
  /^[+]?[(]?[0-9]{1,4}[)]?[-\s.]?[(]?[0-9]{1,4}[)]?[-\s.]?[0-9]{1,9}$/,
  'Numero di telefono non valido'
);

// Product quantity validation
export const quantitySchema = z.union([
  z.string().regex(/^\d+(\.\d+)?$/, 'Quantità non valida'),
  z.number().positive('La quantità deve essere positiva')
]);

// Text input validation (general purpose)
export const textSchema = z.string()
  .min(1, 'Campo obbligatorio')
  .max(500, 'Testo troppo lungo (max 500 caratteri)');

// Supplier name validation
export const supplierNameSchema = z.string()
  .min(1, 'Nome fornitore obbligatorio')
  .max(100, 'Nome troppo lungo (max 100 caratteri)')
  .regex(/^[a-zA-Z0-9\s\-.'àèéìòùÀÈÉÌÒÙ]+$/, 'Nome fornitore contiene caratteri non validi');

// Product name validation
export const productNameSchema = z.string()
  .min(1, 'Nome prodotto obbligatorio')
  .max(200, 'Nome troppo lungo (max 200 caratteri)');

// Additional items validation (free text but limited)
export const additionalItemsSchema = z.string()
  .max(1000, 'Testo troppo lungo (max 1000 caratteri)');

// Company name validation
export const companyNameSchema = z.string()
  .min(1, 'Nome azienda obbligatorio')
  .max(200, 'Nome troppo lungo (max 200 caratteri)');

// Person name validation
export const personNameSchema = z.string()
  .min(1, 'Nome obbligatorio')
  .max(100, 'Nome troppo lungo (max 100 caratteri)')
  .regex(/^[a-zA-Z\s\-'àèéìòùÀÈÉÌÒÙ]+$/, 'Nome contiene caratteri non validi');

/**
 * Validate input against a schema
 * @param {z.ZodSchema} schema - Zod schema to validate against
 * @param {any} value - Value to validate
 * @returns {{ success: boolean, data?: any, error?: string }}
 */
export const validate = (schema, value) => {
  const result = schema.safeParse(value);
  if (result.success) return { success: true, data: result.data };
  return { 
    success: false, 
    error: result.error.errors?.[0]?.message || 'Validazione fallita' 
  };
};

export const safeParse = (schema, value, defaultValue = '') => {
  const result = schema.safeParse(value);
  return result.success ? result.data : defaultValue;
};
