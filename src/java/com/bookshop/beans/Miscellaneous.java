package com.bookshop.beans;

import java.math.BigDecimal;
import java.sql.Date;

/**
 *
 * @author euggio
 */
public class Miscellaneous {
    private final String isbn;
    private final int customerId;
    private final String subtheme;
    private final int commentScore;
    private final String commentText;
    private final String authorLastName;
    private final String authorFirstName;
    private final String authorDesc;
    private final String publisherName;
    private final String publisherNote;
    private final String title;
    private final String subtitle;
    private final String summary;
    private final BigDecimal price;
    private final int stock;
    private final String cover;
    private final int id;
    private final int addressId;
    private final Date authorBirthdate;
    private final Date authorDeathdate;

    public Miscellaneous(String isbn, int customerId, String subtheme, int commentScore, String commentText, int addressId, String authorLastName, String authorFirstName, Date authorBirthdate, Date authorDeathdate, String authorDesc, String publisherName, 
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

    public int getAddressId() {
        return addressId;
    }

    public Date getAuthorBirthdate() {
        return authorBirthdate;
    }

    public Date getAuthorDeathdate() {
        return authorDeathdate;
    }

    public String getIsbn() {
        return isbn;
    }

    public int getCustomerId() {
        return customerId;
    }

    public String getSubtheme() {
        return subtheme;
    }

    public int getCommentScore() {
        return commentScore;
    }

    public String getCommentText() {
        return commentText;
    }

    public String getAuthorLastName() {
        return authorLastName;
    }

    public String getAuthorFirstName() {
        return authorFirstName;
    }

    public String getAuthorDesc() {
        return authorDesc;
    }

    public String getPublisherName() {
        return publisherName;
    }

    public String getPublisherNote() {
        return publisherNote;
    }

    public String getTitle() {
        return title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public String getSummary() {
        return summary;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public int getStock() {
        return stock;
    }

    public String getCover() {
        return cover;
    }

    public int getId() {
        return id;
    }
    
}
