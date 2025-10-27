import { useState, useEffect } from 'react';
import { supabaseHelpers } from '../supabase';

export const useSuppliers = (user) => {
    const [suppliers, setSuppliers] = useState([]);

    useEffect(() => {
        const fetchSuppliers = async () => {
            if (user) {
                try {
                    const suppliersData = await supabaseHelpers.getSuppliers(user.id);
                    const formattedSuppliers = suppliersData.map(supplier => ({ ...supplier, products: supplier.products ? supplier.products.map(p => p.name) : [] }));
                    setSuppliers(formattedSuppliers);
                } catch (error) {
                    console.error('Error fetching suppliers:', error);
                    setSuppliers([]);
                }
            } else {
                setSuppliers([]);
            }
        };

        fetchSuppliers();
    }, [user]);

    return { suppliers, setSuppliers };
};