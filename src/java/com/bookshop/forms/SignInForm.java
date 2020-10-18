package com.bookshop.forms;

import com.bookshop.beans.Customer;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

public class SignInForm {
    private static final String FIELD_MAIL = "mail";
    private static final String FIELD_PASSWORD = "password";
    
    private String result;
    private Map<String, String> errors = new HashMap<String, String>();

    public String getResult() {
        return result;
    }

    public Map<String, String> getErrors() {
        return errors;
    }
    
    public Customer connectCustomer(HttpServletRequest request) {
        String mail = getValueField(request, FIELD_MAIL);
        String password = getValueField(request, FIELD_PASSWORD);
        
        Customer customer = new Customer();
        
        try {
            validationMail(mail);
        } catch (Exception ex) {
            setError(FIELD_MAIL, ex.getMessage());
        }
        customer.setMail(mail);
        
        try {
            validationPassword(password);
        } catch (Exception ex) {
            setError(FIELD_PASSWORD, ex.getMessage());
        }
        customer.setPassword(password);
        
        if ( errors.isEmpty() ) {
            result = "Successful connection!";
        } else {
            result = "Connection failed.";
        }
        
        return customer;
    }
    
    public Customer connectACustomer(HttpServletRequest request) {
        String mail = getValueField(request, FIELD_MAIL);
        String password = getValueField(request, FIELD_PASSWORD);
        
        Customer customer = new Customer();
        try {
            validationMail(mail);
        } catch (Exception ex) {
            Logger.getLogger(SignInForm.class.getName()).log(Level.SEVERE, null, ex);
        }
        customer.setMail(mail);
        
        try {
            validationPassword(password);
        } catch (Exception ex) {
            Logger.getLogger(SignInForm.class.getName()).log(Level.SEVERE, null, ex);
        }
        customer.setPassword(password);
        
        return customer;
    }
    
    // validation of the entered email address
    private void validationMail( String mail ) throws Exception {
        if ( mail != null && !mail.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
            throw new Exception( "Please enter a valid email address." );
        }
    }
    
    // validation of the entered password
    private void validationPassword( String password ) throws Exception {
        if ( password != null ) {
            if ( password.length() < 3 ) {
                throw new Exception( "Password must contain at least 3 characters." );
            }
        } else {
            throw new Exception( "Please enter your password." );
        }
    }
    
    // Adding error message in the map
    private void setError( String field, String message ) {
        errors.put( field, message );
    }
    
    // in case of empty field return null else return the value
    private static String getValueField( HttpServletRequest request, String nameField ) {
        String value = request.getParameter( nameField );
        if ( value == null || value.trim().length() == 0 ) {
            return null;
        } else {
            return value;
        }
    }
}
