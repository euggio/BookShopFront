package com.bookshop.service;

import com.bookshop.beans.Address;
import com.bookshop.dao.AddressDAO;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

public class AddressService {

    // Create a new address delivery when a customer make an order
    public void createAddressDelivery(String label, String company, String lastname, String firstname, String street, String street2, String zip, String city, String country, String phone) {
        AddressDAO address = new AddressDAO();
        address.createAddressDelivery(label, company, lastname, firstname, street, street2, zip, city, country, phone);
    }

    // Get all shipping address who where link with a customer
    public Collection getAddressDelivery(Long customerId) {
        AddressDAO address = new AddressDAO();
        return address.getAddressDelivery(customerId);
    }

    // Get all invoice address who where link with a customer
    public Collection getAddressInvoice(Long customerId) {
        AddressDAO address = new AddressDAO();
        return address.getAddressInvoice(customerId);
    }

    //Get a full address with the address id
    public Collection getAddressById(Long addressId) {
        AddressDAO address = new AddressDAO();
        return address.getAddressById(addressId);
    }

    //Get Address Id with full name and phone to link an address with the order
    public Long getAddressId(String firstname, String lastname, String phone) {
        AddressDAO address = new AddressDAO();
        return address.getAddressId(firstname, lastname, phone);
    }

    //Get Address Invoice Id with the customerId
    public Long getAddressInvoiceId(Long customerId) {
        AddressDAO address = new AddressDAO();
        return address.getAddressInvoiceId(customerId);
    }

    // Link the customer with a new address
    public void hasDeliverAddr(Long addressId, Long customerId) {
        AddressDAO address = new AddressDAO();
        address.hasDeliverAddr(addressId, customerId);
    }
    
    public List<Address> getAddress() throws SQLException {
        AddressDAO address = new AddressDAO();
        return address.getAddress();
    }
}
