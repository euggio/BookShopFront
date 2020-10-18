package com.bookshop.beans;

public class Payment {
    
    private String username;
    private String cardNumber;
    private String cvv;
    
    public Payment() {
        
    }
    
    public Payment ( String username, String cardNumber, String cvv) {
        this.username = username;
        this.cardNumber = cardNumber;
        this.cvv = cvv;
    }

    public String getUsername() {
        return username;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public String getCvv() {
        return cvv;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }
    
    
}
