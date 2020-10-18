
package com.bookshop.forms;

import com.bookshop.beans.Customer;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public class RegisterForm {
    private static final String FIELD_MAIL = "inputMail";
    private static final String FIELD_PASSWORD = "inputPassword";
    private static final String FIELD_CONFIRMATION = "inputConfPassword";
    
    private String result;
    private Map<String, String> errors = new HashMap<String, String>();

    public String getResult() {
        return result;
    }

    public Map<String, String> getErrors() {
        return errors;
    }

    public Customer registerCustomer(HttpServletRequest request) {
        String mail = getValueField(request, FIELD_MAIL);
        String password = getValueField(request, FIELD_PASSWORD);
        String confirmation = getValueField(request, FIELD_CONFIRMATION);
        
        Customer customer = new Customer();
        
        try {
            validationMail(mail);
        } catch (Exception ex) {
            setError(FIELD_MAIL, ex.getMessage());
        }
        customer.setMail(mail);
        
        try {
            validationPassword(password, confirmation);
        } catch (Exception ex) {
            setError(FIELD_PASSWORD, ex.getMessage());
            setError(FIELD_CONFIRMATION, null);
        }
        customer.setPassword(password);
        
        if ( errors.isEmpty() ) {
            result = "Successful registration!";
        } else {
            result = "Registration failed.";
        }
        
        
        return customer;
    }
    
    // validation of the entered email address
    private void validationMail( String mail ) throws Exception {
        if ( mail != null && !mail.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
            throw new Exception( "Please enter a valid email address." );
        }
    }
    
    // validation of the entered confirmation password == password
    private void validationPassword( String password, String confirmation ) throws Exception {
        if (password != null && confirmation != null) {
			if (!password.equals(confirmation)) {
				throw new Exception("Passwords are differents. Please try again.");
			}
			if (password.length() < 3) {
				throw new Exception("Password must contain at least 3 characters");
			}
		} else {
			throw new Exception("Please enter your password.");
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
