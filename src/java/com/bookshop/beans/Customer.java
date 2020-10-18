package com.bookshop.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;

public class Customer {
    private Long customerId;
    private String lastname;
    private String firstname;
    private String mail;
    private String phone;
    private Date birthdate;
    private String password;
    private Date dateSignIn;
    private String labelAddress;
    private String companyAddress;
    private String address;
    private String address2;
    private String zip;
    private String city;
    private String country;
    private Long socialTitleId;
    private String socialTitleLabel;
    private String salt;
    private String passEncrypt;
    private String orderInvoice;
    private Long orderNumber;
    private BigDecimal orderTotal;
    private BigDecimal price;
    private int quantity;
    private String title;
    private Date orderDate;
    private String commentText;
    private int commentNote;

    public Customer() {
    }
    
    // basic creation of a cutomer
    public Customer(Long customerId, String mail, String password) {
        this.customerId = customerId;
        this.mail = mail;
        this.password = password;
    }

    // basic creation of a customer with encrypt password
    public Customer(Long customerId, String mail, String password, Date birthdate, Date dateSignIn, String salt, String passEncrypt) {
        this.customerId = customerId;
        this.mail = mail;
        this.birthdate = birthdate;
        this.password = password;
        this.dateSignIn = dateSignIn;
        this.salt = salt;
        this.passEncrypt = passEncrypt;
    }
    
    // datas of the cusotmer's orders
    public Customer(Long orderNumber, Date orderDate, String orderInvoice, String title, int quantity, BigDecimal price, BigDecimal orderTotal) {
        this.orderNumber = orderNumber;
        this.orderDate = orderDate;
        this.orderInvoice = orderInvoice;
        this.title = title;
        this.quantity = quantity;
        this.price = price;
        this.orderTotal = orderTotal;
    }

    // datas of the customer's comments
    public Customer(Long orderNumber, Date orderDate, String title, String commentText, int commentNote) {
        this.orderNumber = orderNumber;
        this.orderDate = orderDate;
        this.title = title;
        this.commentText = commentText;
        this.commentNote = commentNote;
    }
    
    // all customer's informations
    public Customer(Long customerId, Long socialTitleId, String lastname, String firstname, String mail, String phone, Date birthdate, String password, Date dateSignIn, String socialTitleLabel, String labelAddress, String companyAddress, String address, String address2, String zip, String city, String country) {
        this.socialTitleId = socialTitleId;
        this.customerId = customerId;
        this.lastname = lastname;
        this.firstname = firstname;
        this.mail = mail;
        this.phone = phone;
        this.birthdate = birthdate;
        this.password = password;
        this.dateSignIn = dateSignIn;
        this.labelAddress = labelAddress;
        this.companyAddress = companyAddress;
        this.address = address;
        this.address2 = address2;
        this.zip = zip;
        this.city = city;
        this.country = country;
        this.socialTitleLabel = socialTitleLabel;
    }

    public Long getSocialTitleId() {
        return socialTitleId;
    }

    public void setSocialTitleId(Long socialTitleId) {
        this.socialTitleId = socialTitleId;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public int getCommentNote() {
        return commentNote;
    }

    public void setCommentNote(int commentNote) {
        this.commentNote = commentNote;
    }

    public String getOrderInvoice() {
        return orderInvoice;
    }

    public void setOrderInvoice(String orderInvoice) {
        this.orderInvoice = orderInvoice;
    }

    public Long getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(Long orderNumber) {
        this.orderNumber = orderNumber;
    }

    public BigDecimal getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(BigDecimal orderTotal) {
        this.orderTotal = orderTotal;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getPassEncrypt() {
        return passEncrypt;
    }

    public void setPassEncrypt(String passEncrypt) {
        this.passEncrypt = passEncrypt;
    }

    public String getSocialTitleLabel() {
        return socialTitleLabel;
    }

    public void setSocialTitleLabel(String socialTitleLabel) {
        this.socialTitleLabel = socialTitleLabel;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDateSignIn() {
        return dateSignIn;
    }

    public void setDateSignIn(Date dateSignIn) {
        this.dateSignIn = dateSignIn;
    }

    public String getLabelAddress() {
        return labelAddress;
    }

    public void setLabelAddress(String labelAddress) {
        this.labelAddress = labelAddress;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 83 * hash + Objects.hashCode(this.mail);
        hash = 83 * hash + Objects.hashCode(this.password);
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
        final Customer other = (Customer) obj;
        if (!Objects.equals(this.mail, other.mail)) {
            return false;
        }
        if (!Objects.equals(this.password, other.password)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return lastname + " " + firstname;
    }
    
    
    
    
}
