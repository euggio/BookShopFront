package com.bookshop.beans;

/**
 *
 * @author euggio
 */
public class Comment {
    private int cutomerId;
    private String isbn;

    public Comment(String isbn, int customerId) {
        this.isbn = isbn;
        this.cutomerId = customerId;
    }

    public int getCutomerId() {
        return cutomerId;
    }

    public void setCutomerId(int cutomerId) {
        this.cutomerId = cutomerId;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public Comment() {
    }
    
}
