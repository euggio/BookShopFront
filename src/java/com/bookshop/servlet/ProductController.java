package com.bookshop.servlet;

import com.bookshop.beans.Address;
import com.bookshop.beans.Author;
import com.bookshop.beans.Category;
import com.bookshop.beans.Products;
import com.bookshop.service.AddressService;
import com.bookshop.service.AuthorService;
import com.bookshop.service.CategoryService;
import com.bookshop.service.ProductService;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ProductController", urlPatterns = {"/ProductController"})
public class ProductController extends HttpServlet {
    
    private static String VUE = "/WEB-INF/index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        // Variables being assigned a book quantity
        int ALL = 0;
        int ONE_THIRD = 0;
        int HALF = 0;
        try {
            ALL = getAll().size();
            ONE_THIRD = getAll().size() / 3;
            HALF = getAll().size() / 2;
        } catch (SQLException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String ORDERED = "ordered"; 
        
        // Calls book home
        if ("allProduct".equals(request.getParameter("section"))) {
            
            // Sets limits for available book quantity in dropdown menu
            if (request.getAttribute("limits") == null) {
                request.setAttribute("limits", ALL);
            } else {
                request.setAttribute("limits", request.getParameter("limit"));
            }

            VUE = "/WEB-INF/Products.jsp";

            // Request bundle
            try {
                request.setAttribute("CLOTHINGS", showSubCategories("Clothing"));
                request.setAttribute("PHARMACIES", showSubCategories("Pharmacy"));
                request.setAttribute("BEAUTIES", showSubCategories("Beauty"));
                request.setAttribute("GIFTS", showSubCategories("Gifts"));
                request.setAttribute("TOOLS", showSubCategories("Tools"));
                request.setAttribute("OUTDOORS", showSubCategories("Outdoors"));
                request.setAttribute("order", request.getParameter("order"));
                request.setAttribute("CATEGORIES", allCategory());
                request.setAttribute("AUTHORS", allAuthor());
                request.setAttribute("min", Integer.toString(getMinPrice(getPrice())));
                request.setAttribute("max", Integer.toString(getMaxPrice(getPrice())));
                request.setAttribute("PRODUCTS", getAllProducts());
                request.setAttribute("All", (getAll().size()));
                request.setAttribute("oneThird", (getAll().size() / 3));
                request.setAttribute("half", (getAll().size() / 2));
            } catch (SQLException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }

            // Sorting products
        }

        // Sets book quantity on first visit
        if (("" + ALL).equals(request.getParameter("limit"))) {
            if (request.getAttribute("limits") == null) {
                request.setAttribute("limits", ALL);
            } else {
                request.setAttribute("limits", request.getParameter("limit"));
            }

            VUE = "/WEB-INF/Products.jsp";

            request.setAttribute("order", request.getParameter("order"));

            try {
                request.setAttribute("min", Integer.toString(getMinPrice(getPrice())));
                request.setAttribute("max", Integer.toString(getMaxPrice(getPrice())));
                request.setAttribute("PRODUCTS", getAllProducts());
                request.setAttribute("All", ALL);
                request.setAttribute("oneThird", ONE_THIRD);
                request.setAttribute("half", HALF);
            } catch (SQLException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }

            // Request bundle
            request.setAttribute("CATEGORIES", allCategory());
            request.setAttribute("AUTHORS", allAuthor());

        }

        if ((ONE_THIRD + "").equals(request.getParameter("limit"))) {
            if (request.getAttribute("limits") == null) {
                request.setAttribute("limits", ONE_THIRD);
            } else {
                request.setAttribute("limits", request.getParameter("limit"));
            }

            VUE = "/WEB-INF/Products.jsp";

            request.setAttribute("order", request.getParameter("order"));

            // Request bundle
            try {
                request.setAttribute("min", Integer.toString(getMinPrice(getPrice())));
                request.setAttribute("max", Integer.toString(getMaxPrice(getPrice())));
                request.setAttribute("PRODUCTS", getAllProducts());
                request.setAttribute("All", ALL);
                request.setAttribute("oneThird", ONE_THIRD);
                request.setAttribute("half", HALF);
            } catch (SQLException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("CATEGORIES", allCategory());
            request.setAttribute("AUTHORS", allAuthor());

        }

        if ((HALF + "").equals(request.getParameter("limit"))) {

            if (request.getAttribute("limits") == null) {
                request.setAttribute("limits", HALF);
            } else {
                request.setAttribute("limits", request.getParameter("limit"));
            }

            VUE = "/WEB-INF/Products.jsp";

            request.setAttribute("order", request.getParameter("order"));

            // Request bundle
            try {
                request.setAttribute("CATEGORIES", allCategory());
                request.setAttribute("AUTHORS", allAuthor());
                request.setAttribute("min", Integer.toString(getMinPrice(getPrice())));
                request.setAttribute("max", Integer.toString(getMaxPrice(getPrice())));
                request.setAttribute("PRODUCTS", getAllProducts());
                request.setAttribute("All", ALL);
                request.setAttribute("oneThird", ONE_THIRD);
                request.setAttribute("half", HALF);
            } catch (SQLException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (ORDERED.equals(request.getParameter("order"))) {
                try {
                    request.setAttribute("PRODUCTS", getAllProductsByAsc());
                } catch (SQLException ex) {
                    Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                }

            VUE = "/WEB-INF/Products.jsp";

//            request.setAttribute("order", request.getParameter("order"));

                request.setAttribute("min", Integer.toString(getMinPrice(getPrice())));
                request.setAttribute("max", Integer.toString(getMaxPrice(getPrice())));
                
                request.setAttribute("All", ALL);
                request.setAttribute("oneThird", ONE_THIRD);
                request.setAttribute("half", HALF);
           

            // Request bundle
            request.setAttribute("CATEGORIES", allCategory());
            request.setAttribute("AUTHORS", allAuthor());

        }
        
        if ("viewProduct".equals(request.getParameter("section"))) {

            VUE = "/WEB-INF/viewProduct.jsp";

            request.setAttribute("BOOK", getByIsbn(request.getParameter("view")));
            try {
                request.setAttribute("RELATED_BOOK", getAll());
                request.setAttribute("CUST", getAddress());
                request.setAttribute("MISC", getByIsbn(request.getParameter("view")));
            } catch (SQLException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        
        if ("categorie".equals(request.getParameter("section"))){
            
            VUE = "ProductController?section=allProduct"; 
            
            if (request.getAttribute("limits") == null) {
                request.setAttribute("limits", ALL);
            } else {
                request.setAttribute("limits", request.getParameter("limit"));
            }
            
            if ( request.getParameter("sub") != null) {
                session.removeAttribute("vide");
                session.removeAttribute("theme");
                session.removeAttribute("researchBook");
                session.removeAttribute("authorId");
                String subTheme = request.getParameter("sub");
                if ( getBookBySubCat(subTheme).isEmpty() )
                {
                    session.removeAttribute("subCat");
                    session.setAttribute("vide", "vide");
                }
                else
                {
                    session.setAttribute("subCat", getBookBySubCat(subTheme));
                }
            }
            if ( request.getParameter("cat") != null)
            {
                session.removeAttribute("vide");
                session.removeAttribute("subCat");
                session.removeAttribute("researchBook");
                session.removeAttribute("authorId");
                String theme = request.getParameter("cat");
                session.setAttribute("theme", getByCategory(theme));
            }
            
            if ( request.getParameter("author") != null) {
                session.removeAttribute("vide");
                session.removeAttribute("subCat");
                session.removeAttribute("theme");
                session.removeAttribute("researchBook");
                int author = Integer.parseInt(request.getParameter("author"));
                if ( getBookByAuthor(author).isEmpty() )
                {
                    session.removeAttribute("authorId");
                    session.setAttribute("vide", "vide");
                }
                else
                {
                    session.setAttribute("authorId", getBookByAuthor(author));
                }
            }
        }
        
        if ("delSession".equals(request.getParameter("section"))) {            
            session.removeAttribute("vide");
            session.removeAttribute("subCat");
            session.removeAttribute("theme");
            session.removeAttribute("researchBook");
            session.removeAttribute("authorId");
            
            VUE = "ProductController?section=allProduct";
        }
        
        if("research".equals(request.getParameter("section"))) {
            String stv = request.getParameter("search");
            session.setAttribute("researchBook", getBookByTitle(stv));
            
            VUE = "ProductController?section=allProduct";
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
    
    public List<Products> getAll() throws SQLException {
        ProductService productService = new ProductService();
        return productService.getAll();
    }
    
    public List<Products> getAllByAsc() throws SQLException {
        ProductService productService = new ProductService();
        return productService.getAllByAsc();
    }

    public List<Products> getAllProducts() throws SQLException {
        ProductService productService = new ProductService();
        return productService.getAll();
    }
    
    public List<Products> getAllProductsByAsc() throws SQLException {
        ProductService productService = new ProductService();
        return productService.getAllByAsc();
    }
    
    public Products getById(int id) throws SQLException {
        ProductService productService = new ProductService();
        return productService.getById(id);
    }
    
    public Collection getByIsbn(String isbn) {
        ProductService productService = new ProductService();
        return productService.getByIsbn(isbn);
    }
    
    public ArrayList<BigDecimal> getPrice() {
        ProductService productService = new ProductService();
        return productService.getPrice();
    }
    
    public int getMinPrice(ArrayList<BigDecimal> price) {
        ProductService productService = new ProductService();
        return productService.getMinPrice(price);
    }
    
    public int getMaxPrice(ArrayList<BigDecimal> price) {
        ProductService productService = new ProductService();
        return productService.getMaxPrice(price);
    }
    
    public List<Category> getBookBySubCat(String subTheme) {
        CategoryService category = new CategoryService();
        return category.getBookBySubCat(subTheme);
    }
    
    public List<Category> getByCategory(String themeLabel) {
        CategoryService category = new CategoryService();
        return category.getByCategory(themeLabel);
    }
    
    public Collection allCategory() {
        CategoryService category = new CategoryService();
        return category.allCategory();
    }
    
    public HashMap<String, List<String>> categorySubcategory() {
        CategoryService category = new CategoryService();
        return category.categorySubcategory();
    }
    
    public List<String> showSubCategories(String cat) {
        CategoryService category = new CategoryService();
        return category.showSubCategories(cat);
    }
    
    public Collection allAuthor() {
        AuthorService author = new AuthorService();
        return author.allAuthor();
    }
    
    public List<Author> getBookByAuthor(int authorId) {
        AuthorService author = new AuthorService();
        return author.getBookByAuthor(authorId);
    }
    
     public List<Address> getAddress() throws SQLException {
        AddressService address = new AddressService();
        return address.getAddress();
    }
     
    public List<Products> getBookByTitle(String title) {
        ProductService productService = new ProductService();
        return productService.getBookByTitle(title);
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

    // PRIVATE FIELD -----------------------------------------------------------
     
}
