package com.bookshop.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;

public class Order {
    
    private Long orderId;
    private int shippingNumber;
    private Long packageId;
    private Date orderDate;
    private int orderInvoice;
    private String orderTerms;
    private String orderInstruct;
    private BigDecimal orderTotal;
    private Long customerId;
    private String customerIp;
    private Long addressId;
    private Long addressAddId;
    
    // Constructor to display the id and the date order at the confirm order
    public Order (Long orderId, Date orderDate)
    {
        this.orderId = orderId;
        this.orderDate = orderDate;
    }    
    
    // Constructor to add a new Order in the BDD
    public Order (Long addressId, Long addressAddId, Long packageId , Long customerId, Date orderDate, int orderInvoice, String orderTerms, String orderInstruct, BigDecimal orderTotal, String customerIp ){
        this.addressId = addressId;
        this.addressAddId = addressAddId;
        this.packageId = packageId;
        this.customerId = customerId;
        this.orderDate = orderDate;
        this.orderInvoice = orderInvoice;
        this.orderTerms = orderTerms;
        this.orderInstruct = orderInstruct;
        this.orderTotal = orderTotal;
        this.customerIp = customerIp;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }
    
    public int getShippingNumber() {
        return shippingNumber;
    }
    
    public void setShippingNumber(int shippingNumber) {
        this.shippingNumber = shippingNumber;
    }

    public Long getPackageId() {
        return packageId;
    }

    public void setPackageId(Long packageId) {
        this.packageId = packageId;
    }
    
    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    
    public int getOrderInvoice() {
        return orderInvoice;
    }
    
    public void setOrderInvoice(int orderInvoice) {
        this.orderInvoice = orderInvoice;
    }

    public String getOrderTerms() {
        return orderTerms;
    }

    public void setOrderTerms(String orderTerms) {
        this.orderTerms = orderTerms;
    }
    
    public String getOrderInstruct() {
        return orderInstruct;
    }
    
    public void setOrderInstruct(String orderInstruct) {
        this.orderInstruct = orderInstruct;
    }

    public BigDecimal getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(BigDecimal orderTotal) {
        this.orderTotal = orderTotal;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }
    
    public String getCustomerIp() {
        return customerIp;
    }
    
    public void setCustomerIp(String customerIp) {
        this.customerIp = customerIp;
    }

    public Long getAddressId() {
        return addressId;
    }

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
    }

    public Long getAddressAddId() {
        return addressAddId;
    }

    public void setAddressAddId(Long addressAddId) {
        this.addressAddId = addressAddId;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 83 * hash + Objects.hashCode(this.packageId);
        hash = 83 * hash + Objects.hashCode(this.customerId);
        hash = 83 * hash + Objects.hashCode(this.addressId);
        hash = 83 * hash + Objects.hashCode(this.addressAddId);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Order other = (Order) obj;
        if (!Objects.equals(this.packageId, other.packageId)) {
            return false;
        }
        if (!Objects.equals(this.customerId, other.customerId)) {
            return false;
        }
        if (!Objects.equals(this.addressId, other.addressId)) {
            return false;
        }
        if (!Objects.equals(this.addressAddId, other.addressAddId)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", shippingNumber=" + shippingNumber + ", packageId=" + packageId + ", orderDate=" + orderDate + ", orderInvoice=" + orderInvoice + ", orderTerms=" + orderTerms + ", orderInstruct=" + orderInstruct + ", orderTotal=" + orderTotal + ", customerId=" + customerId + ", customerIp=" + customerIp + ", addressId=" + addressId + ", addressAddId=" + addressAddId + '}';
    }
   
    
}
