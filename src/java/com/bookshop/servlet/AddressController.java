package com.bookshop.servlet;

import com.bookshop.beans.Address;
import com.bookshop.forms.AddressForm;
import com.bookshop.service.AddressService;
import com.bookshop.service.CustomerService;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddressController", urlPatterns = {"/AddressController"})
public class AddressController extends HttpServlet {

    private static String VUE = "/WEB-INF/index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        // Section to choose an invoice address
        if ("chooseInvoice".equals(request.getParameter("section"))) {
            
            DecimalFormat df = new DecimalFormat("0.00");
//            request.getParameter("totalCart");
            session.setAttribute("total", request.getParameter("totalCart"));
//            total = total * 1.055;
//            Double.parseDouble(df.format(total));
//            session.setAttribute("total", Double.parseDouble(df.format(total)));
            
            
            
            // If session "Log" is not empty, the customer is logged and see the chooseDelivery page
            if (null != session.getAttribute("Log")) {
                VUE = "/WEB-INF/Cart/chooseInvoice.jsp";
                // Retrieve the session "Log" to take the mail in a String
                String mail = session.getAttribute("Log").toString();
                // And with the mail retrieve the customerId
                session.setAttribute("customerId", getIdbyMail(mail));
                // Retrieves the customer's billing addresses with their Id
                session.setAttribute("adrInvoice", getAddressInvoice(getIdbyMail(mail)));
            } else {
                // If session "Log" is empty, the customer is not logged and see the signIn page
                VUE = "/WEB-INF/Customer/signInCustomer.jsp";
            }
        }

        // Section to choose or add a shipping address
        if ("chooseDelivery".equals(request.getParameter("section"))) {

            VUE = "/WEB-INF/Cart/chooseDelivery.jsp";

            // Get the id of the selected billing address
            session.setAttribute("addrInvoiceId", request.getParameter("invoiceAddress"));
            // Retrieves the customer's shipping addresses with their Id
            Long customerId = Long.parseLong(session.getAttribute("customerId").toString());
            session.setAttribute("adrDelivery", getAddressDelivery(customerId));
        }

        // Section to create a new shipping address
        if ("createDelivery".equals(request.getParameter("section"))) {
            VUE = "/WEB-INF/Cart/Delivery.jsp";

            // Put the invoice address of the customer in a session
            Long customerId = Long.parseLong(session.getAttribute("customerId").toString());
            session.setAttribute("adrInvoice", getAddressInvoice(customerId));
            try {
                //  Retrieve the list of all the countries from BDD
                request.setAttribute("country", getAllCountry());
            } catch (SQLException ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        // Section to verify the new delivery addresse informations
        if ("verifAddr".equals(request.getParameter("section"))) {

            // Check if the basket still exists
            if (session.getAttribute("cart") == null) {
                VUE = "CartController?section=viewCart";
            }
            
            // Controls for checking addresse informations
            AddressForm form = new AddressForm();
            Address addr = form.registerAddress(request);

            request.setAttribute("form", form);
            request.setAttribute("addr", addr);

            // If the informations are correct, the payment page appears otherwise the customer returns to the delivery page
            if (form.getErrors().isEmpty()) {
                VUE = "OrderController?section=payment";
            } else {
                VUE = "/WEB-INF/Cart/Delivery.jsp";
            }

            // Put in a session all the information of a new shipping address
            // "ND" is for a New Delivery address
            session.setAttribute("addressLabelND", request.getParameter("addressLabel"));
            session.setAttribute("companyND", request.getParameter("company"));
            session.setAttribute("firstnameND", request.getParameter("firstName"));
            session.setAttribute("lastnameND", request.getParameter("lastName"));
            session.setAttribute("phoneND", request.getParameter("tel"));
            session.setAttribute("countryND", request.getParameter("country"));
            session.setAttribute("zipND", request.getParameter("zip"));
            session.setAttribute("cityND", request.getParameter("city"));
            session.setAttribute("streetND", request.getParameter("address"));
            session.setAttribute("street2ND", request.getParameter("address2"));
            session.setAttribute("validAddress", "new");
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

    public List<String> getAllCountry() throws SQLException {
        CustomerService customerService = new CustomerService();
        return customerService.getAllCountry();
    }

    // Get the invoice address of the customer
    public Collection getAddressInvoice(Long customerId) {
        AddressService address = new AddressService();
        return address.getAddressInvoice(customerId);
    }

    // Get all shipping address who where link with a customer
    public Collection getAddressDelivery(Long customerId) {
        AddressService address = new AddressService();
        return address.getAddressDelivery(customerId);
    }

    public Long getIdbyMail(String mail) {
        CustomerService customerDAO = new CustomerService();
        return customerDAO.getIdbyMail(mail);
    }

    //Get Address Invoice Id with the customerId
    public Long getAddressInvoiceId(Long customerId) {
        AddressService address = new AddressService();
        return address.getAddressInvoiceId(customerId);
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
