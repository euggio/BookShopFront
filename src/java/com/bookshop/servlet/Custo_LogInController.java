package com.bookshop.servlet;

import com.bookshop.beans.Address;
import com.bookshop.beans.Customer;
import com.bookshop.dao.CustomerDAO;
import com.bookshop.forms.SignInForm;
import com.bookshop.service.CustomerService;
import com.bookshop.utils.CheckHashProcess;
import com.bookshop.utils.HashProcess;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Custo_LogInController extends HttpServlet {

    public static final String ATT_CUSTOMER = "customer";
    public static final String ATT_FORM = "form";
    public static final String ATT_SESSION_CUSTOMER = "sessionCustomer";

    public static String VIEW_SUCCESS = "/WEB-INF/Customer/showCustomer.jsp";
    public static final String RETURN_HOME = "/controller";
    public static final String VIEW_SIGNIN = "/WEB-INF/Customer/signInCustomer.jsp";
    public static final String VIEW_FORM = "/WEB-INF/Customer/registerCustomer.jsp";
    public static final String WRONG_LOGIN = "Wrong username and/or password";
    public static String VIEW;
    public static String BUTTON_LOGIN = "Login";

    CustomerDAO customerDAO = new CustomerDAO();
    HashProcess hashProcess = new HashProcess();
    CheckHashProcess checkHashProcess = new CheckHashProcess();
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

        if (session.getAttribute(ATT_SESSION_CUSTOMER) == null) {
            this.getServletContext().getRequestDispatcher(VIEW_SIGNIN).forward(request, response);
        } else {
            if ("dashboard".equals(request.getParameter("section"))) {
                VIEW = "/WEB-INF/Customer/showCustomer.jsp";

            }
            if ("editInformations".equals(request.getParameter("section"))) {
                VIEW = "/WEB-INF/Customer/editInformations.jsp";
            }
            if ("showAddressBook".equals(request.getParameter("section"))) {
                try {
                    if (session.getAttribute("mail") != null) {
                        Customer c = getByMail(session.getAttribute("mail").toString(), session.getAttribute("password").toString());
                        Long id = c.getCustomerId();
                        session.setAttribute("newCustoId", id);
                        if (getDeliveryAddress(id) != null) {
                            delAddresses = getDeliveryAddress(id);
                        }
                        if (getInvoiceAddress(id) != null) {
                            invAddresses = getInvoiceAddress(id);
                        }
                    } else {
                        if (getDeliveryAddress(customer.getCustomerId()) != null) {
                            delAddresses = getDeliveryAddress(customer.getCustomerId());
                        }

                        if (getInvoiceAddress(customer.getCustomerId()) != null) {
                            invAddresses = getInvoiceAddress(customer.getCustomerId());
                        }
                    }

                    session.setAttribute("delAddresses", delAddresses);
                    session.setAttribute("invAddresses", invAddresses);
                } catch (SQLException ex) {
                    Logger.getLogger(Custo_LogInController.class.getName()).log(Level.SEVERE, null, ex);
                }

                VIEW = "/WEB-INF/Customer/showAddressBook.jsp";
            }
            if ("showOrder".equals(request.getParameter("section"))) {
                try {
                    if (session.getAttribute("mail") != null) {
                        Long id = Long.parseLong(session.getAttribute("newCustoId").toString());

                        if (getAllOrders(id) != null) {
                            listOrders = getAllOrders(id);
                        }
                    } else {
                        if (getAllOrders(customer.getCustomerId()) != null) {
                            listOrders = getAllOrders(customer.getCustomerId());
                        }
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(Custo_LogInController.class.getName()).log(Level.SEVERE, null, ex);
                }
                session.setAttribute("listOrder", listOrders);
                VIEW = "/WEB-INF/Customer/showOrder.jsp";
            }
            if ("showComments".equals(request.getParameter("section"))) {
                try {
                    if (session.getAttribute("mail") != null) {
                        Long id = Long.parseLong(session.getAttribute("newCustoId").toString());

                        if (getAllComments(id) != null) {
                            listComments = getAllComments(id);
                        }
                    } else {
                        if (getAllComments(customer.getCustomerId()) != null) {
                            listComments = getAllComments(customer.getCustomerId());
                        }
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(Custo_LogInController.class.getName()).log(Level.SEVERE, null, ex);
                }
                session.setAttribute("listComments", listComments);
                VIEW = "/WEB-INF/Customer/showComments.jsp";
            }
            if ("editInvAddress".equals(request.getParameter("section"))) {
                VIEW = "/WEB-INF/Customer/editAddressBook.jsp";
            }
            if ("editDelAddress".equals(request.getParameter("section"))) {
                VIEW = "/WEB-INF/Customer/editAddressBook.jsp";
            }
            if ("disconnection".equals(request.getParameter("section"))) {
                session.setAttribute(ATT_SESSION_CUSTOMER, null);
                VIEW = RETURN_HOME;
            }
            this.getServletContext().getRequestDispatcher(VIEW).forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {

        HttpSession session = request.getSession();

        String logMail = request.getParameter("logMail");
        String logPassword = request.getParameter("logPassword");
        
//////////// vérification du mot de passe de l'utilisateur ////////////////////
        if (session.getAttribute(ATT_SESSION_CUSTOMER) == null) {
            try {
                hashProcess.generateStrongPasswordHash(logPassword);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(Custo_LogInController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvalidKeySpecException ex) {
                Logger.getLogger(Custo_LogInController.class.getName()).log(Level.SEVERE, null, ex);
            }
            boolean exist = false;
            try {
                exist = checkHashProcess.validatePassword(logPassword, customerDAO.getPassword(logMail));
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(Custo_LogInController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvalidKeySpecException ex) {
                Logger.getLogger(Custo_LogInController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(Custo_LogInController.class.getName()).log(Level.SEVERE, null, ex);
            }

//////////// création de l'utilisateur si le password est ok ////////////////////
            if (exist) {
                try {
                    customer = geAlltCustomerByMail(logMail);
                    delAddresses = getDeliveryAddress(customer.getCustomerId());
                    invAddresses = getInvoiceAddress(customer.getCustomerId());
                    lastOrder = getLastOrder(customer.getCustomerId());
                    listOrders = getAllOrders(customer.getCustomerId());
                    lastComment = getLastComment(customer.getCustomerId());
                    listComments = getAllComments(customer.getCustomerId());
                    System.out.println("comment" +lastComment);
                    System.out.println("order" +listOrders);
                    // ajout dans session infos customer qui se connecte
                    session.setAttribute("cucu", customer);
                    // ajout dans session info addresse facturation qui se connecte
                    session.setAttribute("cucuAddInv", invAddresses);
                    // ajout dans session info addresse livraison qui se connecte
                    session.setAttribute("cucuAddDel", delAddresses);
                    session.setAttribute("Log", customer.getMail());
                    session.setAttribute(ATT_CUSTOMER, customer);
                    session.setAttribute("invAddresses", invAddresses);
                    session.setAttribute("delAddresses", delAddresses);
                    session.setAttribute("lastOrder", lastOrder);
                    session.setAttribute("listOrder", listOrders);
                    session.setAttribute("lastComment", lastComment);
                    session.setAttribute("listComments", listComments);
                    session.setAttribute(ATT_SESSION_CUSTOMER, customer);

                } catch (SQLException ex) {
                    Logger.getLogger(Custo_LogInController.class.getName()).log(Level.SEVERE, null, ex);
                }
                this.getServletContext().getRequestDispatcher(VIEW_SUCCESS).forward(request, response);
            } else {
                session.setAttribute("wrongLogin", WRONG_LOGIN);
                session.setAttribute("Log", null);
                session.setAttribute(ATT_CUSTOMER, null);
                session.setAttribute(ATT_SESSION_CUSTOMER, null);
                request.setAttribute("logMail", logMail);
                request.setAttribute("logPassword", logPassword);
                this.getServletContext().getRequestDispatcher(VIEW_SIGNIN).forward(request, response);
            }
        } else {
            if ("editInvAddress".equals(request.getParameter("section"))) {
                VIEW = "/WEB-INF/Customer/editAddressBook.jsp";
            } else {
                VIEW = VIEW_SUCCESS;
            }
            if ("editDelAddress".equals(request.getParameter("section"))) {
                VIEW = "/WEB-INF/Customer/editAddressBook.jsp";
            } else {
                VIEW = VIEW_SUCCESS;
            }
            this.getServletContext().getRequestDispatcher(VIEW).forward(request, response);
        }

//////////// création des listes d'adresses ////////////////////
    }

    private static String getCookieValue(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie != null && name.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    private static void setCookie(HttpServletResponse response, String name, String value, int maxAge) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAge);
        response.addCookie(cookie);
    }

    public List<Customer> getAllCustomers() throws SQLException {
        CustomerService customerService = new CustomerService();

        return customerService.getAll();
    }

    public Customer getByMail(String mail, String password) throws SQLException {
        CustomerService customerService = new CustomerService();

        return customerService.getByMail(mail, password);
    }

    public Customer geAlltCustomerByMail(String mail) throws SQLException {
        CustomerService customerService = new CustomerService();

        return customerService.geAlltCustomerByMail(mail);
    }

    public void doPostEnAttente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // initialisation of the sign in's form
        SignInForm form = new SignInForm();
        // initialisation of the customer's bean
        Customer customer = form.connectCustomer(request);

        HttpSession session = request.getSession();

        // add object at the request
        request.setAttribute(ATT_FORM, form);
        request.setAttribute(ATT_CUSTOMER, customer);

        // if empty erro message
        if (form.getErrors().isEmpty()) {
            session.setAttribute(ATT_SESSION_CUSTOMER, customer);
        } else {
            session.setAttribute(ATT_SESSION_CUSTOMER, null);
        }

        this.getServletContext().getRequestDispatcher(VIEW_SIGNIN).forward(request, response);
    }

    public List<Address> getDeliveryAddress(Long customerId) throws SQLException {
        CustomerService customerService = new CustomerService();

        return customerService.getDeliveryAddress(customerId);
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
