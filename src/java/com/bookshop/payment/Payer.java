/*package com.bookshop.payment;

import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;


public class Payer {
    
    // Set payer details
Payer payer = new Payer();
payer.setPaymentMethod("paypal");

// Set redirect URLs
RedirectUrls redirectUrls = new RedirectUrls();
redirectUrls.setCancelUrl("http://localhost:3000/cancel");
redirectUrls.setReturnUrl("http://localhost:3000/process");

// Set payment details
Details details = new Details();
details.setShipping("1");
details.setSubtotal("5");
details.setTax("1");

// Payment amount
Amount amount = new Amount();
amount.setCurrency("USD");
// Total must be equal to sum of shipping, tax and subtotal.
amount.setTotal("7");
amount.setDetails(details);

// Transaction information
Transaction transaction = new Transaction();
transaction.setAmount(amount);
transaction
  .setDescription("This is the payment transaction description.");

// Add transaction to a list
List<Transaction> transactions = new ArrayList<Transaction>();
transactions.add(transaction);

// Add payment details
Payment payment = new Payment();
Payer.setIntent("sale");
Payer.setPayer(payer);
Payer.setRedirectUrls(redirectUrls);
Payer.setTransactions(transactions);
    
}*/
