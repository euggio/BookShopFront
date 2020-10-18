package com.bookshop.utils;

import com.bookshop.dao.CustomerDAO;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.SQLException;
import java.util.Base64;

public class HashPassword {

    public static byte[] getRandomSalt() throws NoSuchAlgorithmException {
		// Uses a secure Random not a simple Random
        // Salt generation 64 bits long
        byte[] bSalt = new byte[8];

        SecureRandom.getInstance("SHA1PRNG").nextBytes(bSalt);
        return bSalt;
    }

    public static String hashPass(byte[] password, byte[] salt) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-512");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return Base64.getEncoder().encodeToString(md.digest(combine(salt, password)));
    }

    public static byte[] combine(byte[] a, byte[] b) {
        byte[] c = new byte[a.length + b.length];
        System.arraycopy(a, 0, c, 0, a.length);
        System.arraycopy(b, 0, c, a.length, b.length);
        return c;
    }
    
    public static String validatePassword(String mail) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();
        
        return customerDAO.getSalt(mail);  
    }
    
    public static String getPassword(String mail) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();
        
        return customerDAO.getPassword(mail);
    }
    
    public static boolean getMail(String mail) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();
        
        return customerDAO.getMail(mail);
    }

    

}
