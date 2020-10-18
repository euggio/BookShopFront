package com.bookshop.beans;

import java.math.BigDecimal;

/**
 *
 * @author euggio
 */
public class Author {
    
    
    private String fullName;
    private String isbn;
    private String title;
    private String subtitle;
    private String summary;
    private BigDecimal price;
    private String cover;
    private int id;
    private int authorId;
    

    public Author() {

    }

    public Author(String fullName, int authorId) {
        this.fullName = fullName;
        this.authorId = authorId;
    }
    
    public Author(String isbn, String title, String subtitle, String summary, BigDecimal price, String cover, int id, int authorId) {
        this.isbn = isbn;
        this.title = title;
        this.subtitle = subtitle;
        this.summary = summary;
        this.price = price;
        this.cover = cover;
        this.id = id;
        this.authorId = authorId;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
}
