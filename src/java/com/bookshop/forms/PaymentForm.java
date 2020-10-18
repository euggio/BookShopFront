package com.bookshop.forms;

import com.bookshop.beans.Payment;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public class PaymentForm {
    
    private static final String FIELD_FULL_NAME = "username";
    private static final String FIELD_CARD_NUMBER = "cardNumber";
    private static final String FIELD_CVV = "cvv";
    
    private String result;
    private Map<String, String> errors = new HashMap<String, String>();

    public String getResult() {
        return result;
    }

    public Map<String, String> getErrors() {
        return errors;
    }

    public Payment registerPayment(HttpServletRequest request) {
        String username = getValueField(request, FIELD_FULL_NAME);
        String cardNumber = getValueField(request, FIELD_CARD_NUMBER);
        String cvv = getValueField(request, FIELD_CVV);
    
        Payment payment = new Payment();
        
        try {
            validationUsername(username);
        } catch (Exception ex) {
            setError(FIELD_FULL_NAME, ex.getMessage());
        }
        payment.setUsername(username);

        try {
            validationCardNumber(cardNumber);
        } catch (Exception ex) {
            setError(FIELD_CARD_NUMBER, ex.getMessage());
        }
        payment.setCardNumber(cardNumber);

        try {
            validationCvv(cvv);
        } catch (Exception ex) {
            setError(FIELD_CVV, ex.getMessage());
        }
        payment.setCvv(cvv);
        
        if (errors.isEmpty()) {
            result = "Successful registration!";
        } else {
            result = "Registration failed.";
        }

        return payment;
    }    
    
    // validation of the entered lastName
    private void validationUsername(String username) throws Exception {
        if (username != null && !username.matches(username)) {
            throw new Exception("Please enter a valid last name.");
        }
    }
    
    // validation of the entered lastName
    private void validationCardNumber(String cardNumber) throws Exception {
        if (cardNumber != null && !cardNumber.matches(cardNumber)) {
            throw new Exception("Please enter a valid last name.");
        }
    }
    
    // validation of the entered lastName
    private void validationCvv(String cvv) throws Exception {
        if (cvv != null && !cvv.matches(cvv)) {
            throw new Exception("Please enter a valid last name.");
        }
    }
    
    // Adding error message in the map
    private void setError(String field, String message) {
        errors.put(field, message);
    }

    // in case of empty field return null else return the value
    private static String getValueField(HttpServletRequest request, String nameField) {
        String value = request.getParameter(nameField);
        if (value == null || value.trim().length() == 0) {
            return null;
        } else {
            return value;
        }
    }
}
