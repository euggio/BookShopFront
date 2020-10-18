package com.bookshop.service;

import com.bookshop.beans.Address;
import com.bookshop.beans.Customer;
import com.bookshop.dao.CustomerDAO;
import com.bookshop.servlet.Custo_RegisterController;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author euggio
 */
public class CustomerService {

    public List<Customer> getAll() throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();

        return customerDAO.getAll();
    }

    public Customer getByMail(String mail, String password) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();

        return customerDAO.getByMail(mail, password);
    }

    public Customer geAlltCustomerByMail(String mail) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();

        return customerDAO.geAlltCustomerByMail(mail);
    }

    public List<String> getAllCountry() throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();

        return customerDAO.getAllCountry();
    }

    public Long getIdbyMail(String mail) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.getIdbyMail(mail);
    }

    public void createNewCustomer(String mail, String password) throws SQLException, NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeySpecException {
        CustomerDAO customerDAO = new CustomerDAO();

        customerDAO.createNewCustomer(mail, password);
    }

    public void updateAccountInformations(Long idSocial, Date birthdate, String mail, String lastname, String firstname, String phone) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();

        customerDAO.updateAccountInformations(idSocial, birthdate, mail, lastname, firstname, phone);
    }
    
    public void updateAddressBook(String mail, String label, String company, String lastname, String firstname, String street, String street2, String zip, String city, String country) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();

        customerDAO.updateAddressBook(mail, label, company, lastname, firstname, street, street2, zip, city, country);
    }

    public Long getLongValue(String name) {
        Long value;
        if (name.equals("1")) {
            value = 1L;
        } else {
            value = 2L;
        }

        return value;
    }

    public Date getDateValue(String date) {
        Date finaleDate = null;
        try {
            finaleDate = (Date) new SimpleDateFormat("yyyy-mm-dd").parse(date);
        } catch (ParseException ex) {
            Logger.getLogger(Custo_RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return finaleDate;
    }
    
    public List<Address> getDeliveryAddress(Long customerId) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();

        return customerDAO.getDeliveryAddress(customerId);
    }
    
    public List<Address> getInvoiceAddress(Long customerId) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();

        return customerDAO.getInvoiceAddress(customerId);
    }
    
    public List<Customer> getAllOrders(Long customerId) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();

        return customerDAO.getAllOrders(customerId);
    }

    public Customer getLastOrder(Long customerId) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();

        return customerDAO.getLastOrder(customerId);
    }
    
    public List<Customer> getAllComments(Long customerId) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();

        return customerDAO.getAllComments(customerId);
    }

    public Customer getLastComment(Long customerId) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAO();

        return customerDAO.getLastComment(customerId);
    }

    
}
