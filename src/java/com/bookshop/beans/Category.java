package com.bookshop.beans;

import com.bookshop.utils.Connect;
import java.math.BigDecimal;
import java.sql.Connection;
import java.util.Objects;

public class Category {

    Connection connect = Connect.getInstance();
    private String themeLabel;
    private String isbn;
    private String title;
    private String subtitle;
    private String summary;
    private BigDecimal price;
    private String cover;
    private int id;
    

    public Category() {

    }

    public Category(String themeLabel) {
        this.themeLabel = themeLabel;
    }

    public Category(String isbn, String title, String subtitle, String summary, BigDecimal price, String cover, int id) {
        this.isbn = isbn;
        this.title = title;
        this.subtitle = subtitle;
        this.summary = summary;
        this.price = price;
        this.cover = cover;
        this.id = id;
    }

    public String getThemeLabel() {
        return themeLabel;
    }

    public void setThemeLabel(String themeLabel) {
        this.themeLabel = themeLabel;
    }

    public Connection getConnect() {
        return connect;
    }

    public String getIsbn() {
        return isbn;
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

    public String getCover() {
        return cover;
    }

    public int getId() {
        return id;
    }

    public void setConnect(Connection connect) {
        this.connect = connect;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 47 * hash + Objects.hashCode(this.themeLabel);
        hash = 47 * hash + Objects.hashCode(this.isbn);
        hash = 47 * hash + Objects.hashCode(this.title);
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
        final Category other = (Category) obj;
        if (!Objects.equals(this.themeLabel, other.themeLabel)) {
            return false;
        }
        if (!Objects.equals(this.isbn, other.isbn)) {
            return false;
        }
        if (!Objects.equals(this.title, other.title)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Category{" + "connect=" + connect + ", themeLabel=" + themeLabel + ", isbn=" + isbn + ", title=" + title + ", subtitle=" + subtitle + ", summary=" + summary + ", price=" + price + ", cover=" + cover + ", id=" + id + '}';
    }
    
    
}
