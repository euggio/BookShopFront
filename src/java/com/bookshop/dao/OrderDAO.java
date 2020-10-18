package com.bookshop.dao;

import com.bookshop.beans.Order;
import com.bookshop.utils.Connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDAO {

    Connection connect = Connect.getInstance();
    Random r = new Random();
    Integer n = null;

    private final String INSERT_ORDER = "INSERT INTO OrderData (AddressId, AddAddressId, PackageId, CustomerId, OrderdataDate, OrderdataInvoice, OrderdataTerms, OrderdataTotalAmount, OrderdataCustomerIp) VALUES (?, ? , ? , ? , ?, ? , ? , ? , ? )";
    private final String INSERT_PACK = "INSERT INTO PACKAGE (TransporterId, PackageNumber) VALUES ( ? , ? )";
    private final String SELECT_PACKAGE_ID = "SELECT [PackageId]\n"
            + "FROM [BookShop].[dbo].[Package]\n"
            + "WHERE [PackageNumber] = ?";
    
    private final String SELECT_ORDER_ID = "SELECT OrderdataNum\n"
            + "FROM OrderData\n"
            + "WHERE OrderdataInvoice = ? ";
    
    private final String SELECT_ORDER = "SELECT OrderdataNum, OrderdataDate\n"
            + "FROM OrderData\n"
            + "WHERE OrderdataInvoice = ? ";

    // Create an order when a customer places one
    public void createOrder(Long addressInvId, Long addressDelId, Long packageId, Long customerId, Date orderDate, String orderInvoice, String orderTerms, Double orderTotal) throws SQLException {

        // Random generation of an Ip address
        Integer s = r.nextInt(255);
        Integer d = r.nextInt(255);
        Integer u = r.nextInt(255);
        Integer f = r.nextInt(255);
        String ip = (s + "." + d + "." + u + "." + f);

        PreparedStatement pstmt = connect.prepareStatement(INSERT_ORDER);
        pstmt.setLong(1, addressInvId);
        pstmt.setLong(2, addressDelId);
        pstmt.setLong(3, packageId);
        pstmt.setLong(4, customerId);
        pstmt.setObject(5, orderDate);
        pstmt.setString(6, orderInvoice);
        pstmt.setString(7, orderTerms);
        pstmt.setDouble(8, orderTotal);
        pstmt.setString(9, ip);
        pstmt.executeUpdate();
    }

    // Create a package with the transporter Id and the package number
    public void createPackage(String packageNumber) throws SQLException {

        PreparedStatement pstmt = connect.prepareStatement(INSERT_PACK);
        pstmt.setLong(1, 1);
        pstmt.setString(2, packageNumber);
        pstmt.executeUpdate();
    }

    // Get the packageId with the package Number to link with the order
    public Long getPackageId(String packageNumber) {
        Long packageId = null;
        try {
            PreparedStatement pstmt = connect.prepareStatement(SELECT_PACKAGE_ID);
            pstmt.setString(1, packageNumber);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()){
                packageId = rs.getLong("PackageId");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return packageId;
    }

    // Get the orderId with the order invoice to link with the commandLine
    public Long getOrderId(String invoice) {
        Long orderId = null;
        try {
            PreparedStatement pstmt = connect.prepareStatement(SELECT_ORDER_ID);
            pstmt.setString(1, invoice);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                orderId = rs.getLong("OrderdataNum");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderId;
    }
    
    //Get orderId and orderDate with the invoice order for the confirmOrder
    public Collection getOrderById(String invoice) {
        Collection order = new ArrayList();
        try {
            PreparedStatement pstmt = connect.prepareStatement(SELECT_ORDER);
            pstmt.setString(1, invoice);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Order o = new Order(rs.getLong("OrderdataNum"), 
                        rs.getDate("OrderdataDate"));
                order.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }
}
