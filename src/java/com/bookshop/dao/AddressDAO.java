package com.bookshop.dao;

import com.bookshop.beans.Address;
import com.bookshop.utils.Connect;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AddressDAO implements Serializable {

    Connection connect = Connect.getInstance();
    private static final String INSERT_ADDRESS = "INSERT INTO ADDRESS (AddressLabel, AddressCompany, AddressLastname, AddressFirstname, AddressStreet, AddressStreet2, AddressZip, AddressCity, AddressCountry, AddressPhone ) "
            + "VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? );";

    private static final String SELECT_ADDRESS_BY_ID = "SELECT AddressId, AddressLabel, AddressCompany, AddressLastname, AddressFirstname, AddressStreet, AddressStreet2, AddressZip, AddressCity, AddressCountry, AddressPhone\n"
            + "FROM [ADDRESS]\n"
            + "WHERE AddressId = ?";
    
    private static final String SELECT_ADDRESSID = "SELECT AddressId\n"
            + "FROM [ADDRESS]\n"
            + "WHERE AddressLastname = ? and AddressFirstname = ? and AddressPhone = ?";

    private static final String SELECT_ADDRESS_DEL = "SELECT a.AddressId, AddressLabel, AddressCompany, AddressLastname, AddressFirstname, AddressStreet, AddressStreet2, AddressZip, AddressCity, AddressCountry, AddressPhone\n"
            + "FROM [ADDRESS] a\n"
            + "inner join HasDelivAdr hda\n"
            + "on a.AddressId = hda.AddressId\n"
            + "WHERE hda.CustomerId = ?";
    
    private static final String SELECT_ADDRESS_INV = "SELECT TOP 1 a.AddressId, AddressLabel, AddressCompany, AddressLastname, AddressFirstname, AddressStreet, AddressStreet2, AddressZip, AddressCity, AddressCountry, AddressPhone\n"
            + "FROM [ADDRESS] a\n"
            + "inner join HasInvoiceAdr hia\n"
            + "on a.AddressId = hia.AddressId\n"
            + "WHERE hia.CustomerId = ?";
    
    private static final String SELECT_ADDRESSID_INV = "SELECT TOP 1 a.AddressId\n"
            + "FROM [ADDRESS] a\n"
            + "inner join HasInvoiceAdr hia\n"
            + "on a.AddressId = hia.AddressId\n"
            + "WHERE hia.CustomerId = ?";
    
    private final String INSERT_HAS_DELIVER = "INSERT INTO HasDelivAdr (AddressId, CustomerId) VALUES ( ? , ? )";
    private static final String SELECT_ALL_ADDRESSES = "SELECT *\n"
            + "  FROM [BookShop].[dbo].[Address]";
    
    // Create a new address delivery when a customer make an order
    public void createAddressDelivery(String label, String company, String lastname, String firstname, String street, String street2, String zip, String city, String country, String phone) {

        try {
            PreparedStatement pstmt = connect.prepareStatement(INSERT_ADDRESS);

            pstmt.setString(1, label);
            pstmt.setString(2, company);
            pstmt.setString(3, lastname);
            pstmt.setString(4, firstname);
            pstmt.setString(5, street);
            pstmt.setString(6, street2);
            pstmt.setString(7, zip);
            pstmt.setString(8, city);
            pstmt.setString(9, country);
            pstmt.setString(10, phone);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Get all shipping address who where link with a customer
    public Collection getAddressDelivery(Long customerId) {
        Collection adrDelivery = new ArrayList();
        try {
            PreparedStatement pstmt = connect.prepareStatement(SELECT_ADDRESS_DEL);
            pstmt.setLong(1, customerId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Address a = new Address(rs.getLong("AddressId"),
                        rs.getString("AddressLabel"),
                        rs.getString("AddressCompany"),
                        rs.getString("AddressLastname"),
                        rs.getString("AddressFirstname"),
                        rs.getString("AddressStreet"),
                        rs.getString("AddressStreet2"),
                        rs.getString("AddressZip"),
                        rs.getString("AddressCity"),
                        rs.getString("AddressCountry"),
                        rs.getString("AddressPhone"));
                adrDelivery.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return adrDelivery;
    }
    
    // Get all invoice address who where link with a customer
    public Collection getAddressInvoice(Long customerId) {
        Collection adrInvoice = new ArrayList();
        try {
            PreparedStatement pstmt = connect.prepareStatement(SELECT_ADDRESS_INV);
            pstmt.setLong(1, customerId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Address a = new Address(rs.getLong("AddressId"),
                        rs.getString("AddressLabel"),
                        rs.getString("AddressCompany"),
                        rs.getString("AddressLastname"),
                        rs.getString("AddressFirstname"),
                        rs.getString("AddressStreet"),
                        rs.getString("AddressStreet2"),
                        rs.getString("AddressZip"),
                        rs.getString("AddressCity"),
                        rs.getString("AddressCountry"),
                        rs.getString("AddressPhone"));
                adrInvoice.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return adrInvoice;
    }
    
    //Get a full address with the address id
    public Collection getAddressById(Long addressId) {
        Collection addressShip = new ArrayList();

        try {
            PreparedStatement pstmt = connect.prepareStatement(SELECT_ADDRESS_BY_ID);
            pstmt.setLong(1, addressId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Address a = new Address(rs.getLong("AddressId"),
                        rs.getString("AddressLabel"),
                        rs.getString("AddressCompany"),
                        rs.getString("AddressLastname"),
                        rs.getString("AddressFirstname"),
                        rs.getString("AddressStreet"),
                        rs.getString("AddressStreet2"),
                        rs.getString("AddressZip"),
                        rs.getString("AddressCity"),
                        rs.getString("AddressCountry"),
                        rs.getString("AddressPhone"));
                addressShip.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return addressShip;
    }
    
    //Get Address Id with full name and phone to link an address with the order
    public Long getAddressId(String firstname, String lastname, String phone){
        Long addressId = null;
        try {
            PreparedStatement pstmt = connect.prepareStatement(SELECT_ADDRESSID);
            pstmt.setString(1, firstname);
            pstmt.setString(2, lastname);
            pstmt.setString(3, phone);
            ResultSet rs = pstmt.executeQuery();
            if ( rs.next()){
                addressId = rs.getLong("AddressId");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return addressId;
    }    
    
    //Get Address Invoice Id with the customerId
    public Long getAddressInvoiceId(Long customerId){
        Long invoiceId = null;
        try {
            PreparedStatement pstmt = connect.prepareStatement(SELECT_ADDRESSID_INV);
            pstmt.setLong(1, customerId);
            ResultSet rs = pstmt.executeQuery();
            if ( rs.next()){
                invoiceId = rs.getLong("AddressId");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return invoiceId;
    }    
    
    // Link the customer with a new address
    public void hasDeliverAddr(Long addressId, Long customerId) {
        try {
            PreparedStatement pstmt = connect.prepareStatement(INSERT_HAS_DELIVER);
            pstmt.setLong(1, addressId);
            pstmt.setLong(2, customerId);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Address> getAddress() throws SQLException {
        List<Address> addresses = new ArrayList();
        PreparedStatement pstmt = connect.prepareStatement(SELECT_ALL_ADDRESSES);
        ResultSet rs = pstmt.executeQuery();

        try {
            while (rs.next()) {
                Address address = new Address(
                        rs.getLong("addressId"),
                        rs.getString("addressLabel"),
                        rs.getString("addressCompany"),
                        rs.getString("addressFirstname").substring(0, 1) + ".",
                        rs.getString("addressLastname"),
                        rs.getString("addressStreet"),
                        rs.getString("addressStreet2"),
                        rs.getString("addressZip"),
                        rs.getString("addressCity"),
                        rs.getString("addressCountry"),
                        rs.getString("addressPhone"));
                addresses.add(address);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return addresses;
    }

}
