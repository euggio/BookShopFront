package com.bookshop.servlet;

import com.bookshop.dao.CartDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

    private static String VUE = "/WEB-INF/index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        
        // Section for view the cart
        if ("viewCart".equals(request.getParameter("section"))) {

            VUE = "/WEB-INF/Cart/Cart.jsp";

            // Retrieve cart information from the session
            CartDAO basket = (CartDAO) session.getAttribute("cart");

            // If the cart didn't exist a new one is create
            
                if (basket == null) {
                    basket = new CartDAO();
                    session.setAttribute("cart", basket);

                    // Put all the products of the cart in a session
                    session.setAttribute("cartSession", basket.getList());
                
            }
            // Request for the empty cart
            request.setAttribute("emptyCart", basket.isEmpty());
            // Put all the products of the cart in a request
            request.setAttribute("list", basket.getList());
        }

        // Section for the cart manage
        if ("manageCart".equals(request.getParameter("section"))) {

            // Retrieve cart information from the session
            CartDAO basket = (CartDAO) session.getAttribute("cart");
            
                // If the cart didn't exist a new one is create
                if (basket == null) {
                    basket = new CartDAO();
                    session.setAttribute("cart", basket);

                    // Put all the products of the cart in a session
                    session.setAttribute("cartSession", basket.getList());
                
            }
            // Increase the quantity of a product from the cart
            if (request.getParameter("inc") != null) {
                basket.inc(Integer.parseInt(request.getParameter("inc")));
            }

            // Decrease the quantity of a product from the cart
            if (request.getParameter("dec") != null) {
                basket.dec(Integer.parseInt(request.getParameter("dec")));
            }

            // Remove a product from the cart
            if (request.getParameter("del") != null) {
                basket.del(Integer.parseInt(request.getParameter("del")));
            }

            // Remove all product of the cart
            if (request.getParameter("clear") != null) {
                basket.clear();
            }
            
            // The view cart page when the customer interact with the basket
            VUE = "CartController?section=viewCart";

            // Add a product in the cart
            if (request.getParameter("add") != null) {
                basket.add(Integer.parseInt(request.getParameter("add")));

                // View in all products when the customer add a book
                VUE = "ProductController?section=allProduct";
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
