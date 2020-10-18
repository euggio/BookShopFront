package com.bookshop.beans;

import java.math.BigDecimal;
import java.util.Objects;

public class Package {
    
    private Long transporterId;
    private String packageNumber;
    private BigDecimal packageShipCost;
    
    public Package (Long transporterId, String packageNumber , BigDecimal packageShipCost ){
        this.transporterId = transporterId;
        this.packageNumber = packageNumber;
        this.packageShipCost = packageShipCost;
    }
    
    public Long getTransporterId() {
        return transporterId;
    }
    
    public void setTransporterId(Long transporterId) {
        this.transporterId = transporterId;
    }
    
    public String getPackageNumber() {
        return packageNumber;
    }

    public void setPackageNumber(String packageNumber) {
        this.packageNumber = packageNumber;
    }

    
    public BigDecimal getPackageShipCost() {
        return packageShipCost;
    }

    public void setPackageShipCost(BigDecimal packageShipCost) {
        this.packageShipCost = packageShipCost;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 79 * hash + Objects.hashCode(this.transporterId);
        hash = 79 * hash + Objects.hashCode(this.packageNumber);
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
        final Package other = (Package) obj;
        if (!Objects.equals(this.transporterId, other.transporterId)) {
            return false;
        }
        if (!Objects.equals(this.packageNumber, other.packageNumber)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Package{" + "transporterId=" + transporterId + ", packageNumber=" + packageNumber + ", packageShipCost=" + packageShipCost + '}';
    }
    
    
}
