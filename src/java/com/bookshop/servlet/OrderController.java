package com.bookshop.servlet;

import com.bookshop.beans.Payment;
import com.bookshop.forms.PaymentForm;
import com.bookshop.service.AddressService;
import com.bookshop.service.OrderService;
import com.bookshop.service.PaymentService;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {

    private static String VUE = "/WEB-INF/index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        // Function to randomize number
        Random r = new Random();

        if (("initPayment").equals(request.getParameter("section"))) {

            // Collection for all months and years for the expiration date of bluecards
            request.setAttribute("months", months());
            request.setAttribute("years", years());

            VUE = "/WEB-INF/Cart/Payment.jsp";
        }

        // Section to the order payment
        if ("payment".equals(request.getParameter("section"))) {

            VUE = "/WEB-INF/Cart/Payment.jsp";

            // Check if the basket still exists
            if (session.getAttribute("cart") == null || "".equals(session.getAttribute("cart"))) {
                VUE = "CartController?section=viewCart";
            }

            // Collection for all months and years for the expiration date of bluecards
            request.setAttribute("months", months());
            request.setAttribute("years", years());

            // If the customer choose an existing delivery address
            if (request.getParameter("deliverAddress") != null) {

                session.removeAttribute("validAddress");
                Long addressId = Long.parseLong(request.getParameter("deliverAddress"));
                // Add in a session the addressId selected
                session.setAttribute("addressId", addressId);
                // Retrieve all the information of the selected address with the id
                session.setAttribute("deliveryAddr", getAddressById(addressId));
            }
        }

        // Section to verify payment informations
        if ("verifPayment".equals(request.getParameter("section"))) {

            // Controls for checking payment informations
            PaymentForm form = new PaymentForm();
            Payment payment = form.registerPayment(request);
            request.setAttribute("form", form);
            request.setAttribute("payment", payment);

            // If the informations are correct, the overview page appears otherwise the customer returns to the payment page
            if (form.getErrors().isEmpty()) {
                VUE = "OrderController?section=overview";
            } else {
                VUE = "OrderController?section=initPayment";
            }
        }

        // Section to verify the order
        if ("overview".equals(request.getParameter("section"))) {
           
            // Check if the basket still exists
            if (session.getAttribute("cart") == null) {
                VUE = "CartController?section=viewCart";
            } else {
                VUE = "/WEB-INF/Cart/OverviewCart.jsp";
            }
        }

        // Section where the customer confirms his order
        if ("confirmOrder".equals(request.getParameter("section"))) {
            
            Long addressDelId = null;
            Long customerId;
            // If the customer has choose a new Shipping address
            if (session.getAttribute("validAddress") != null) {

                // Retrieve all informations of the new address in the sessions
                String addressLabel = session.getAttribute("addressLabelND").toString();
                String company = session.getAttribute("companyND").toString();
                String firstName = session.getAttribute("firstnameND").toString();
                String lastName = session.getAttribute("lastnameND").toString();
                String tel = session.getAttribute("phoneND").toString();
                String country = session.getAttribute("countryND").toString();
                String zip = session.getAttribute("zipND").toString();
                String city = session.getAttribute("cityND").toString();
                String address = session.getAttribute("streetND").toString();
                String address2 = session.getAttribute("street2ND").toString();
                // Create the new shipping address
                createAddressDelivery(addressLabel, company, firstName, lastName, address, address2, zip, city, country, tel);
                // Find the id of the  previously created address
                addressDelId = getAddressId(firstName, lastName, tel);
                // Link the new address with the customer
                customerId = Long.parseLong(session.getAttribute("customerId").toString());
                hasDeliverAddr(addressDelId, customerId);
            }

            try {
                // Randomize the package number and create a package for the order
                String packageNumber = String.valueOf(r.nextInt(999999999));
                createPackage(packageNumber);
                // Retrieve the Id of the address selected
                if (session.getAttribute("addressId") != null) {
                    addressDelId = Long.parseLong(session.getAttribute("addressId").toString());
                    // Remove the session with the selected shipping address
                    session.removeAttribute("addressId");
                }
                // Retrieve the id with the previously created package number
                Long packageId = getPackageId(packageNumber);
                // Current date to know when the order has been placed
                Date date = new Date();
                // Randomize the invoice order and put in a session
                String invoice = String.valueOf(r.nextInt(999999999));
                session.setAttribute("invoice", invoice);
                // Retrieve the total of the cart and add VAT
                Double totalCart = Double.parseDouble(session.getAttribute("total").toString());
                totalCart = totalCart * 1.055;
                // Create the order and link with the customer
                customerId = Long.parseLong(session.getAttribute("customerId").toString());
                Long addressInvId = Long.parseLong(session.getAttribute("addrInvoiceId").toString());
                createOrder(addressInvId, addressDelId, packageId, customerId, date, invoice, " ", totalCart);
                session.setAttribute("orderData", getOrderById(invoice));

                VUE = "/WEB-INF/Cart/ConfirmOrder.jsp";
                request.getRequestDispatcher(VUE).forward(request, response);

                // Clear the cart session
                session.removeAttribute("cart");
                session.removeAttribute("cartSession");

            } catch (SQLException ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        request.getRequestDispatcher(VUE).include(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // Collection for all months for the expiration card
    public Collection months() {
        PaymentService payment = new PaymentService();
        return payment.months();
    }

    // Collection to regroup a few years for the expiration card
    public Collection years() {
        PaymentService payment = new PaymentService();
        return payment.years();
    }

    //Get a full address with the address id
    public Collection getAddressById(Long addressId) {
        AddressService address = new AddressService();
        return address.getAddressById(addressId);
    }

    //Get Address Id with full name and phone to link an address with the order
    public Long getAddressId(String firstname, String lastname, String phone) {
        AddressService address = new AddressService();
        return address.getAddressId(firstname, lastname, phone);
    }

    // Create a new address delivery when a customer make an order
    public void createAddressDelivery(String label, String company, String lastname, String firstname, String street, String street2, String zip, String city, String country, String phone) {
        AddressService address = new AddressService();
        address.createAddressDelivery(label, company, lastname, firstname, street, street2, zip, city, country, phone);
    }

    // Link the customer with a new address
    public void hasDeliverAddr(Long addressId, Long customerId) {
        AddressService address = new AddressService();
        address.hasDeliverAddr(addressId, customerId);
    }

    // Get the packageId with the package Number to link with the order
    public Long getPackageId(String packageNumber) throws SQLException {
        OrderService order = new OrderService();
        return order.getPackageId(packageNumber);
    }

    // Create a package with the transporter Id and the package number
    public void createPackage(String packageNumber) throws SQLException {
        OrderService order = new OrderService();
        order.createPackage(packageNumber);
    }

    // Create an order when a customer places one
    public void createOrder(Long addressInvId, Long addressDelId, Long packageId, Long customerId, Date orderDate, String orderInvoice, String orderTerms, Double orderTotal) throws SQLException {
        OrderService order = new OrderService();
        order.createOrder(addressInvId, addressDelId, packageId, customerId, orderDate, orderInvoice, orderTerms, orderTotal);
    }

    // Get the orderId with the order invoice to link with the commandLine
    public Long getOrderId(String invoice) {
        OrderService order = new OrderService();
        return order.getOrderId(invoice);
    }

    //Get orderId and orderDate with the invoice order for the confirmOrder
    public Collection getOrderById(String invoice) {
        OrderService order = new OrderService();
        return order.getOrderById(invoice);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
