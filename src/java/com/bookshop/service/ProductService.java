package com.bookshop.service;

import com.bookshop.beans.Products;
import com.bookshop.dao.ProductDAO;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author euggio
 */
public class ProductService {

    public List<Products> getAll() throws SQLException {
        ProductDAO productDAO = new ProductDAO();
        return productDAO.getAll();
    }
    
    public List<Products> getAllByAsc() throws SQLException {
        ProductDAO productDAO = new ProductDAO();
        return productDAO.getAllByAsc();
    }

    public Products getById(int id) throws SQLException {
        ProductDAO productDAO = new ProductDAO();
        return productDAO.getById(id);
    }
    
    public Collection getByIsbn(String isbn) {
        ProductDAO productDAO = new ProductDAO();
        return productDAO.getByIsbn(isbn);
    }
    
    public ArrayList<BigDecimal> getPrice() {
        ProductDAO productDAO = new ProductDAO();
        return productDAO.getPrice();
    }
     
    public int getMinPrice(ArrayList<BigDecimal> price) {
        ProductDAO productDAO = new ProductDAO();
        return productDAO.getMinPrice(price);
    }
   
    public int getMaxPrice(ArrayList<BigDecimal> price) {
        ProductDAO productDAO = new ProductDAO();
        return productDAO.getMaxPrice(price);
    }
    
    public List<Products> getBookByTitle(String title) {
        ProductDAO productDAO = new ProductDAO();
        return productDAO.getBookByTitle(title);
    }
}
