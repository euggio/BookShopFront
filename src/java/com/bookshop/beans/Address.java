package com.bookshop.beans;

import java.io.Serializable;
import java.util.Objects;

public class Address implements Serializable{
    
    private Long addressId;
    private String lastname;
    private String firstname;
    private String mail;
    private String phone;
    private String labelAddress;
    private String companyAddress;
    private String street;
    private String street2;
    private String zip;
    private String city;
    private String country;

    public Address() {
    }

    // Constructor to add a new address created during the order in the BDD
    public Address(Long addressId, String labelAddress, String companyAddress, String firstname, String lastname, String street, String street2, String zip, String city, String country, String phone) {
        this.addressId = addressId;
        this.lastname = lastname;
        this.firstname = firstname;
        this.phone = phone;
        this.labelAddress = labelAddress;
        this.companyAddress = companyAddress;
        this.street = street;
        this.street2 = street2;
        this.zip = zip;
        this.city = city;
        this.country = country;
    }

    public Long getAddressId() {
        return addressId;
    }

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
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

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getStreet2() {
        return street2;
    }

    public void setStreet2(String street2) {
        this.street2 = street2;
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
        int hash = 7;
        hash = 83 * hash + Objects.hashCode(this.lastname);
        hash = 83 * hash + Objects.hashCode(this.firstname);
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
        final Address other = (Address) obj;
        if (!Objects.equals(this.lastname, other.lastname)) {
            return false;
        }
        if (!Objects.equals(this.firstname, other.firstname)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Address{" + " lastname=" + lastname + ", firstname=" + firstname + ", phone=" + phone + ", labelAddress=" + labelAddress + ", companyAddress=" + companyAddress + ", street=" + street + ", street2=" + street2 + ", zip=" + zip + ", city=" + city + ", country=" + country + '}';
    }
    
    
}
