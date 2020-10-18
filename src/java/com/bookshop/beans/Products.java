package com.bookshop.beans;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Products implements Serializable {

    private String isbn;
    private String title;
    private String subtitle;
    private String summary;
    private BigDecimal price;
    private int stock;
    private String cover;
    private int quantity;
    private int id;
    private String subtheme;
    private int commentScore;
    private String commentText;
    private String authorLastName;
    private String authorFirstName;
    private String authorDesc;
    private String publisherName;
    private String publisherNote;
    private int customerId;
    private Date authorBirthdate;
    private Date authorDeathdate;
    private int addressId;

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public Products() {
    }

    public Products(String title, String summary, BigDecimal price) {
        this.title = title;
        this.summary = summary;
        this.price = price;
    }
    
    public Products(String isbn, String title, String summary, BigDecimal price) {
        this.isbn = isbn;
        this.title = title;
        this.summary = summary;
        this.price = price;
    }

    public Products(String isbn, String title, String subtitle, BigDecimal price, int quantity, String cover, int id) {
        this.isbn = isbn;
        this.title = title;
        this.subtitle = subtitle;
        this.price = price;
        this.quantity = quantity;
        this.cover = cover;
        this.id = id;
        
    }

    public Products(String isbn, String title, String subtitle, String summary, BigDecimal price, String cover, int id) {
        this.isbn = isbn;
        this.title = title;
        this.subtitle = subtitle;
        this.summary = summary;
        this.price = price;
        this.cover = cover;
        this.id = id;
    }

    public Date getAuthorBirthdate() {
        return authorBirthdate;
    }

    public void setAuthorBirthdate(Date authorBirthdate) {
        this.authorBirthdate = authorBirthdate;
    }

    public Date getAuthorDeathdate() {
        return authorDeathdate;
    }

    public void setAuthorDeathdate(Date authorDeathdate) {
        this.authorDeathdate = authorDeathdate;
    }
    
    public Products(String isbn, int customerId, String subtheme, int commentScore, String commentText, int addressId, String authorLastName, String authorFirstName, Date authorBirthdate, Date authorDeathdate, String authorDesc, String publisherName, 
            String publisherNote, String title, String subtitle, String summary, BigDecimal price, int stock, String cover, int id) {
        this.isbn = isbn;
        this.customerId = customerId;
        this.subtheme = subtheme;
        this.commentScore = commentScore;
        this.commentText = commentText;
        this.addressId = addressId;
        this.authorLastName = authorLastName;
        this.authorFirstName = authorFirstName;
        this.authorBirthdate = authorBirthdate;
        this.authorDeathdate = authorDeathdate;
        this.authorDesc = authorDesc;
        this.publisherName = publisherName;
        this.publisherNote = publisherNote;
        this.title = title;
        this.subtitle = subtitle;
        this.summary = summary;
        this.price = price;
        this.stock = stock;
        this.cover = cover;
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getSubtheme() {
        return subtheme;
    }

    public void setSubtheme(String subtheme) {
        this.subtheme = subtheme;
    }

    public int getCommentScore() {
        return commentScore;
    }

    public void setCommentScore(int commentScore) {
        this.commentScore = commentScore;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public String getAuthorLastName() {
        return authorLastName;
    }

    public void setAuthorLastName(String authorLastName) {
        this.authorLastName = authorLastName;
    }

    public String getAuthorFirstName() {
        return authorFirstName;
    }

    public void setAuthorFirstName(String authorFirstName) {
        this.authorFirstName = authorFirstName;
    }

    public String getAuthorDesc() {
        return authorDesc;
    }

    public void setAuthorDesc(String authorDesc) {
        this.authorDesc = authorDesc;
    }

    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }

    public String getPublisherNote() {
        return publisherNote;
    }

    public void setPublisherNote(String publisherNote) {
        this.publisherNote = publisherNote;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    
    public int getStock() {
        return stock;
    }
    
    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void addProduct(int quantity) {
        this.quantity += quantity;
    }

    @Override
    public String toString() {
        return "Products{" + "isbn=" + isbn + ", title=" + title + ", subtitle=" + subtitle + ", summary=" + summary + ", price=" + price + ", stock=" + stock + ", cover=" + cover + ", quantity=" + quantity + ", id=" + id + '}';
    }
}
