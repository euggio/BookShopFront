package com.bookshop.dao;

import java.util.ArrayList;
import java.util.Collection;

public class PaymentDAO {
    
    // Collection for all months for the expiration card
    public Collection months(){
        Collection months = new ArrayList();
        for (int i = 1; i < 13; i++) {
            months.add(i);
        }
        return months;
    }
    
    // Collection to regroup a few years for the expiration card
    public Collection years(){
        Collection years = new ArrayList();
        for (int i = 21; i < 30; i++) {
            years.add(i);
        }
        return years;
    }
}
