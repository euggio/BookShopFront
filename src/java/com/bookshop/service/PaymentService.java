package com.bookshop.service;

import com.bookshop.dao.PaymentDAO;
import java.util.Collection;

public class PaymentService {

    // Collection for all months for the expiration card
    public Collection months() {
        PaymentDAO payment = new PaymentDAO();
        return payment.months();
    }

    // Collection to regroup a few years for the expiration card
    public Collection years() {
        PaymentDAO payment = new PaymentDAO();
        return payment.years();
    }

}
