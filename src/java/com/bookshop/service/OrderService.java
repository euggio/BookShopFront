package com.bookshop.service;

import com.bookshop.dao.OrderDAO;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Date;

public class OrderService {

    // Create an order when a customer places one
    public void createOrder(Long addressInvId, Long addressDelId, Long packageId, Long customerId, Date orderDate, String orderInvoice, String orderTerms, Double orderTotal) throws SQLException {
        OrderDAO order = new OrderDAO();
        order.createOrder(addressInvId, addressDelId, packageId, customerId, orderDate, orderInvoice, orderTerms, orderTotal);
    }

    // Create a package with the transporter Id and the package number
    public void createPackage(String packageNumber) throws SQLException {
        OrderDAO order = new OrderDAO();
        order.createPackage(packageNumber);
    }

    // Get the packageId with the package Number to link with the order
    public Long getPackageId(String packageNumber) throws SQLException {
        OrderDAO order = new OrderDAO();
        return order.getPackageId(packageNumber);
    }
    
    // Get the orderId with the order invoice to link with the commandLine
    public Long getOrderId(String invoice) {
        OrderDAO order = new OrderDAO();
        return order.getOrderId(invoice);
    }
    
    //Get orderId and orderDate with the invoice order for the confirmOrder
    public Collection getOrderById(String invoice) {
        OrderDAO order = new OrderDAO();
        return order.getOrderById(invoice);
    }
}
