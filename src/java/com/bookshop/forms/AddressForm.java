package com.bookshop.forms;

import com.bookshop.beans.Address;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public class AddressForm {

    private static final String FIELD_FIRST_NAME = "firstName";
    private static final String FIELD_LAST_NAME = "lastName";
    private static final String FIELD_PHONE = "tel";
    private static final String FIELD_CITY = "city";
    private static final String FIELD_ZIP = "zip";
    private static final String FIELD_STREET = "address";

    private String result;
    private Map<String, String> errors = new HashMap<String, String>();

    public String getResult() {
        return result;
    }

    public Map<String, String> getErrors() {
        return errors;
    }

    public Address registerAddress(HttpServletRequest request) {
        String firstName = getValueField(request, FIELD_FIRST_NAME);
        String lastName = getValueField(request, FIELD_LAST_NAME);
        String tel = getValueField(request, FIELD_PHONE);
        String city = getValueField(request, FIELD_CITY);
        String zip = getValueField(request, FIELD_ZIP);
        String street = getValueField(request, FIELD_STREET);

        Address addr = new Address();

        try {
            validationFirstName(firstName);
        } catch (Exception ex) {
            setError(FIELD_FIRST_NAME, ex.getMessage());
        }
        addr.setFirstname(firstName);

        try {
            validationLastName(lastName);
        } catch (Exception ex) {
            setError(FIELD_LAST_NAME, ex.getMessage());
        }
        addr.setLastname(lastName);

        try {
            validationPhone(tel);
        } catch (Exception ex) {
            setError(FIELD_PHONE, ex.getMessage());
        }
        addr.setPhone(tel);

        try {
            validationCity(city);
        } catch (Exception ex) {
            setError(FIELD_CITY, ex.getMessage());
        }
        addr.setCity(city);

        try {
            validationZip(zip);
        } catch (Exception ex) {
            setError(FIELD_ZIP, ex.getMessage());
        }
        addr.setZip(zip);

        try {
            validationStreet(street);
        } catch (Exception ex) {
            setError(FIELD_STREET, ex.getMessage());
        }
        addr.setStreet(street);

        if (errors.isEmpty()) {
            result = "Successful registration!";
        } else {
            result = "Registration failed.";
        }

        return addr;
    }

    // validation of the entered firstName
    private void validationFirstName(String firstName) throws Exception {
        if (firstName != null && !firstName.matches("\\p{L}*(-\\p{L}*)*")) {
            throw new Exception("Please enter a valid first name.");
        }
    }

    // validation of the entered lastName
    private void validationLastName(String lastName) throws Exception {
        if (lastName != null && !lastName.matches("\\p{L}*(-\\p{L}*)*")) {
            throw new Exception("Please enter a valid last name.");
        }
    }

    // validation of the entered phone
    private void validationPhone(String phone) throws Exception {
        if (phone != null && !phone.matches("^(?:(?:\\+|00)33[\\s.-]{0,3}(?:\\(0\\)[\\s.-]{0,3})?|0)[1-9](?:(?:[\\s.-]?\\d{2}){4}|\\d{2}(?:[\\s.-]?\\d{3}){2})$")) {
            throw new Exception("Please enter a valid phone number.");
        }
    }

    // validation of the entered city
    private void validationCity(String city) throws Exception {
        if (city != null && !city.matches("\\p{L}*(-\\p{L}*)*")) {
            throw new Exception("Please enter a valid city.");
        }
    }

    // validation of the entered zip
    private void validationZip(String zip) throws Exception {
        if (zip != null && !zip.matches("^(([0-8][0-9])|(9[0-5]))[0-9]{3}$")) {
            throw new Exception("Please enter a valid zip code.");
        }
    }

    // validation of the entered street
    private void validationStreet(String street) throws Exception {
        if (street != null && !street.matches("((^[0-9]*).?((BIS)|(TER)|(QUATER))?)?((\\W+)|(^))(([a-z]+.)*)([0-9]{5})?.(([a-z\\'']+.)*)$")) {
            throw new Exception("Please enter a valid street.");
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