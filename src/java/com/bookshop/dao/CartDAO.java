package com.bookshop.dao;

import com.bookshop.beans.Products;
import com.bookshop.utils.Connect;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CartDAO {

    Connection connect = Connect.getInstance();

    // Create a HashMap with the Id of the product and Products class
    private HashMap< Integer, Products> map = null;
    private static final String SELECT_CART = "SELECT [BookIsbn], [BookTitle], [BookSubtitle], [BookPrice], [BookCover], [BookId]\n"
            + "FROM [BookShop].[dbo].[Book]"
            + "WHERE [BookId] = ? ";

    public CartDAO() {
        this.map = new HashMap();
    }

    // Function to add 1 product if it already exist in the basket or delete it if the quantity is 0
    public void add(String isbn, String title, String subtitle, BigDecimal price, int quantity, String cover, int id) {
        if (map.containsKey(id)) {
            Products i = map.get(id);
            i.addProduct(quantity);
            if (i.getQuantity() < 1) {
                del(id);
            }
        } else {
            map.put(id, new Products(isbn, title, subtitle, price, quantity, cover, id));
        }
    }

    // Function to add a product in the basket
    public void add(int id) {

        try {

            PreparedStatement pstmt = connect.prepareStatement(SELECT_CART);
            pstmt.setObject(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                add(rs.getString("BookIsbn"), rs.getString("BookTitle"), rs.getString("BookSubtitle"), rs.getBigDecimal("BookPrice"), +1, rs.getString("BookCover"), id);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Function to increase the quantity of a product in the basket
    public void inc(int id) {
        try {
            PreparedStatement pstmt = connect.prepareStatement(SELECT_CART);
            pstmt.setObject(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                add(rs.getString("BookIsbn"), rs.getString("BookTitle"), rs.getString("BookSubtitle"), rs.getBigDecimal("BookPrice"), +1, rs.getString("BookCover"), id);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Function to deacrease the quantity of a product in the basket
    public void dec(int id) {
        try {
            PreparedStatement pstmt = connect.prepareStatement(SELECT_CART);
            pstmt.setObject(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                add(rs.getString("BookIsbn"), rs.getString("BookTitle"), rs.getString("BookSubtitle"), rs.getBigDecimal("BookPrice"), -1, rs.getString("BookCover"), id);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Delete a product in the basket
    public void del(int id) {
        map.remove(id);
    }

    // Delete all product in the basket
    public void clear() {
        map.clear();
    }

    // Function to tell if there are products in the basket
    public boolean isEmpty() {
        return map.isEmpty();
    }

    // Function to get all products in the basket
    public Collection<Products> getList() {
        return map.values();
    }
}
