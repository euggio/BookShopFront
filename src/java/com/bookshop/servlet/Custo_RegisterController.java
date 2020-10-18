package com.bookshop.servlet;

import com.bookshop.beans.Address;
import com.bookshop.beans.Customer;
import com.bookshop.forms.RegisterForm;
import com.bookshop.service.CustomerService;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Custo_RegisterController extends HttpServlet {

    private static final String ATT_FORM = "form";
    private static final String ATT_CUSTOMER = "customer";
    public static final String ATT_SESSION_CUSTOMER = "sessionCustomer";

    private static final String VIEW_FORM = "/WEB-INF/Customer/registerCustomer.jsp";
    private static final String VIEW_SUCCESS = "/WEB-INF/Customer/showCustomer.jsp";
    private static final String VIEW_SIGNIN = "/WEB-INF/Customer/signInCustomer.jsp";
    private static final String RETURN_HOME = "/controller";

    Customer customer = null;
    Customer lastOrder = null;
    Customer lastComment = null;
    List<Address> delAddresses = new ArrayList<>();
    List<Address> invAddresses = new ArrayList<>();
    List<Customer> listOrders = new ArrayList<>();
    List<Customer> listComments = new ArrayList<>();
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        this.getServletContext().getRequestDispatcher(VIEW_SIGNIN).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {

        HttpSession session = request.getSession();

        // list of all the country in the database for drop down
        try {
            request.setAttribute("listCountry", getAllCountry());
        } catch (SQLException ex) {
            Logger.getLogger(Custo_RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }

        if ("create".equals(request.getParameter("section"))) {
            String inputMail = request.getParameter("inputMail");
            String inputPassword = request.getParameter("inputPassword");

            request.setAttribute("inputMail", inputMail);
            request.setAttribute("inputPassword", inputPassword);
            session.setAttribute("mail", inputMail);
            session.setAttribute("password", inputPassword);

            // creation of a customer int the database with default attribute
            try {
                createNewCustomer(inputMail, inputPassword);
            } catch (SQLException ex) {
                Logger.getLogger(Custo_RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(Custo_RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvalidKeySpecException ex) {
                Logger.getLogger(Custo_RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }

            RegisterForm form = new RegisterForm();
            Customer customer = form.registerCustomer(request);

            request.setAttribute(ATT_CUSTOMER, customer);
            request.setAttribute(ATT_FORM, form);
            session.setAttribute(ATT_SESSION_CUSTOMER, customer);
            try {
                // ajout dans session des infos du nouveau customer
                session.setAttribute("cucu", geAlltCustomerByMail(inputMail));
                // récupéraiton du customer par le mail - toutes ses infos
                customer = geAlltCustomerByMail(inputMail);
                // initialisation de la liste des adresses de facturation
                invAddresses = getInvoiceAddress(customer.getCustomerId());
                // suppression session adresse livraison existante
                session.removeAttribute("cucuAddDel");
                // ajout dans session les addresses de facturation
                session.setAttribute("cucuAddInv", invAddresses);

                lastOrder = getLastOrder(customer.getCustomerId());
                session.setAttribute("lastOrder", lastOrder);
                listOrders = getAllOrders(customer.getCustomerId());
                session.setAttribute("listOrders", listOrders);
                lastComment = getLastComment(customer.getCustomerId());
                session.setAttribute("lastComment", lastComment);
                listComments = getAllComments(customer.getCustomerId());
                session.setAttribute("listComments", listComments);

            } catch (SQLException ex) {
                Logger.getLogger(Custo_RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }

            session.setAttribute("Log", customer.getMail());

            if (form.getErrors().isEmpty()) {
                this.getServletContext().getRequestDispatcher(VIEW_FORM).forward(request, response);
            } else {
                this.getServletContext().getRequestDispatcher(VIEW_SIGNIN).forward(request, response);
            }
        }
        /////////////////////////////////////////////////////////////

        if ("register".equals(request.getParameter("section"))) {
            Long idSocial = Long.parseLong(request.getParameter("inputFormSocial"));
            String birthdate = request.getParameter("inputFormBirthdate");
            String mail = request.getParameter("inputFormMail");
            String label = request.getParameter("inputFormLabel");
            String company = request.getParameter("inputFormCompany");
            String lastname = request.getParameter("inputFormLastName");
            String firstname = request.getParameter("inputFormFirstName");
            String street = request.getParameter("inputFormAddress");
            String street2 = request.getParameter("inputFormAddress2");
            String zip = request.getParameter("inputFormZip");
            String city = request.getParameter("inputFormCity");
            String country = request.getParameter("inputFormCountry");
            String phone = request.getParameter("inputFormPhone");

            boolean exist = false;
            try {
                updateAccountInformations(idSocial, getDateValue(birthdate), mail, lastname, firstname, phone);
                updateAddressBook(mail, label, company, lastname, firstname, street, street2, zip, city, country);
                exist = true;
            } catch (SQLException ex) {
                Logger.getLogger(Custo_RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (exist) {
                try {
                    customer = geAlltCustomerByMail(mail);
                } catch (SQLException ex) {
                    Logger.getLogger(Custo_RegisterController.class.getName()).log(Level.SEVERE, null, ex);
                }
                session.setAttribute("Log", customer.getMail());
                session.setAttribute(ATT_CUSTOMER, customer);
                this.getServletContext().getRequestDispatcher(VIEW_SUCCESS).forward(request, response);
            } else {
                this.getServletContext().getRequestDispatcher(RETURN_HOME).forward(request, response);
            }

        }

        /////////////////////////////////////////////////////////////
        if ("editInformations".equals(request.getParameter("section"))) {
            Long idSocial = Long.parseLong(request.getParameter("editSocial"));
            String birthdate = request.getParameter("editBirthdate");
            String mail = request.getParameter("editMail");
            String lastname = request.getParameter("editLastname");
            String firstname = request.getParameter("editFirstname");
            String phone = request.getParameter("editPhone");

            boolean exist = false;
            try {
                updateAccountInformations(idSocial, getDateValue(birthdate), mail, lastname, firstname, phone);
                exist = true;

            } catch (SQLException ex) {
                Logger.getLogger(Custo_RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (exist) {
                try {
                    customer = geAlltCustomerByMail(mail);
                    invAddresses = getInvoiceAddress(customer.getCustomerId());
                } catch (SQLException ex) {
                    Logger.getLogger(Custo_RegisterController.class.getName()).log(Level.SEVERE, null, ex);
                }
                session.setAttribute("Log", customer.getMail());
                session.setAttribute("invAddresses", invAddresses);
                session.setAttribute(ATT_CUSTOMER, customer);
                this.getServletContext().getRequestDispatcher(VIEW_SUCCESS).forward(request, response);
            } else {
                this.getServletContext().getRequestDispatcher("/controller").forward(request, response);
            }

        }

    }

    public List<String> getAllCountry() throws SQLException {
        CustomerService customerService = new CustomerService();

        return customerService.getAllCountry();
    }

    public void createNewCustomer(String mail, String password) throws SQLException, NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeySpecException {
        CustomerService customerService = new CustomerService();
        customerService.createNewCustomer(mail, password);
    }

    public void updateAccountInformations(Long idSocial, Date birthdate, String mail, String lastname, String firstname, String phone) throws SQLException {
        CustomerService customerService = new CustomerService();

        customerService.updateAccountInformations(idSocial, birthdate, mail, lastname, firstname, phone);
    }

    public void updateAddressBook(String mail, String label, String company, String lastname, String firstname, String street, String street2, String zip, String city, String country) throws SQLException {
        CustomerService customerService = new CustomerService();

        customerService.updateAddressBook(mail, label, company, lastname, firstname, street, street2, zip, city, country);
    }

    public Customer geAlltCustomerByMail(String mail) throws SQLException {
        CustomerService customerService = new CustomerService();

        return customerService.geAlltCustomerByMail(mail);
    }

    public Date getDateValue(String date) {
        CustomerService customerService = new CustomerService();

        return customerService.getDateValue(date);
    }

    public List<Address> getInvoiceAddress(Long customerId) throws SQLException {
        CustomerService customerService = new CustomerService();

        return customerService.getInvoiceAddress(customerId);
    }

    public List<Customer> getAllOrders(Long customerId) throws SQLException {
        CustomerService customerService = new CustomerService();

        return customerService.getAllOrders(customerId);
    }

    public Customer getLastOrder(Long customerId) throws SQLException {
        CustomerService customerService = new CustomerService();

        return customerService.getLastOrder(customerId);
    }

    public List<Customer> getAllComments(Long customerId) throws SQLException {
        CustomerService customerService = new CustomerService();

        return customerService.getAllComments(customerId);
    }

    public Customer getLastComment(Long customerId) throws SQLException {
        CustomerService customerService = new CustomerService();

        return customerService.getLastComment(customerId);
    }

}
