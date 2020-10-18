package com.bookshop.dao;

import com.bookshop.beans.Products;
import com.bookshop.utils.Connect;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDAO {

    Connection connect = Connect.getInstance();
    private static final String SELECT_ALL = "SELECT * from Book";
    private static final String SELECT_ALL_ASC = "SELECT * from Book ORDER BY [BookTitle]";
    private static final String SELECT_BY_ID = "SELECT * from Book where bookId = ? ";
    private static final String SELECT_BY_ISBN = "SELECT *\n"
            + "  FROM [BookShop].[dbo].[Book] as b\n"
            + "  LEFT JOIN [BookShop].[dbo].[Comment] AS c ON [b].[BookIsbn] = [c].[BookIsbn]\n"
            + "  LEFT JOIN [BookShop].[dbo].[SubTheme] AS s ON [b].[SubThemeId] = [s].[SubThemeId] \n"
            + "  LEFT JOIN [BookShop].[dbo].[Author] AS a ON [b].[AuthorId] = [a].[AuthorId]  \n"
            + "  LEFT JOIN [BookShop].[dbo].[Publisher] AS p ON [b].[PublisherId] = [p].[PublisherId] WHERE [b].[BookIsbn] = ? ";
    private static final String SELECT_BOOK_TITLE = "SELECT [BookIsbn], [BookTitle], [BookSubtitle], [BookSummary], [BookPrice], [BookCover], [BookId]"
            + "From [BookShop].[dbo].[Book]"
            + "where [BookTitle] like ? ";

    public List<Products> getAll() throws SQLException {

        List<Products> products = new ArrayList();
        PreparedStatement pstmt = connect.prepareStatement(SELECT_ALL);
        ResultSet rs = pstmt.executeQuery();

        try {
            while (rs.next()) {
                Products prod = new Products(
                        rs.getString("bookIsbn"),
                        rs.getString("bookTitle"),
                        rs.getString("bookSubtitle"),
                        rs.getString("bookSummary").substring(0, 60),
                        rs.getBigDecimal("bookPrice"),
                        rs.getString("bookCover"),
                        rs.getInt("bookId"));
                products.add(prod);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public Products getById(int id) throws SQLException {

        Products product = new Products();
        PreparedStatement stmt = connect.prepareStatement(SELECT_BY_ID);
        stmt.setObject(1, id);
        ResultSet rs = stmt.executeQuery();

        try {
            while (rs.next()) {
                product = new Products(
                        rs.getString("bookIsbn"),
                        rs.getString("bookTitle"),
                        rs.getString("bookSubtitle"),
                        rs.getString("bookSummary"),
                        rs.getBigDecimal("bookPrice"),
                        rs.getString("bookCover"),
                        rs.getInt("bookId"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return product;

    }

    public List<Products> getAllByAsc() throws SQLException {

        List<Products> products = new ArrayList();
        PreparedStatement pstmt = connect.prepareStatement(SELECT_ALL_ASC);
        ResultSet rs = pstmt.executeQuery();

        try {
            while (rs.next()) {
                Products prod = new Products(
                        rs.getString("bookIsbn"),
                        rs.getString("bookTitle"),
                        rs.getString("bookSubtitle"),
                        rs.getString("bookSummary").substring(0, 60),
                        rs.getBigDecimal("bookPrice"),
                        rs.getString("bookCover"),
                        rs.getInt("bookId"));
                products.add(prod);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public Collection getByIsbn(String isbn) {

        Collection book = new ArrayList();
        try {

            PreparedStatement stmt = connect.prepareStatement(SELECT_BY_ISBN);
            stmt.setObject(1, isbn);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Products product = new Products(
                        rs.getString("bookIsbn"),
                        rs.getInt("customerId"),
                        rs.getString("subthemeLabel"),
                        rs.getInt("commentScore"),
                        rs.getString("commentText"),
                        rs.getInt("addressId"),
                        rs.getString("authorLastName"),
                        rs.getString("authorFirstName"),
                        rs.getDate("authorBirthdate"),
                        rs.getDate("authorDeathdate"),
                        rs.getString("authorDesc"),
                        rs.getString("publisherName"),
                        rs.getString("publisherNote"),
                        rs.getString("bookTitle"),
                        rs.getString("bookSubtitle"),
                        rs.getString("bookSummary"),
                        rs.getBigDecimal("bookPrice"),
                        rs.getInt("bookStock"),
                        rs.getString("bookCover"),
                        rs.getInt("bookId"));
                book.add(product);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(book.toString());
        return book;
    }

    //// - Product List - Product Page - ////
    public ArrayList<BigDecimal> getPrice() {

        ArrayList<BigDecimal> price = new ArrayList<>();

        try {
            PreparedStatement stmt = connect.prepareStatement(SELECT_ALL);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                price.add(rs.getBigDecimal("bookPrice"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return price;
    }

    public int getMinPrice(ArrayList<BigDecimal> price) {
        BigDecimal min = price.get(0);
        for (int i = 1; i < price.size(); i++) {
            min = min.min(price.get(i));
        }
        return min.intValue();
    }

    public int getMaxPrice(ArrayList<BigDecimal> price) {
        BigDecimal max = price.get(0);
        for (int i = 1; i < price.size(); i++) {
            max = max.max(price.get(i));
        }
        return max.intValue();
    }

    public List<Products> getBookByTitle(String title) {

        List<Products> products = new ArrayList();
        try {
            PreparedStatement pstmt = connect.prepareStatement(SELECT_BOOK_TITLE);
            pstmt.setString(1, '%'+title+'%');
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Products prod = new Products(
                        rs.getString("bookIsbn"),
                        rs.getString("bookTitle"),
                        rs.getString("bookSubtitle"),
                        rs.getString("bookSummary"),
                        rs.getBigDecimal("bookPrice"),
                        rs.getString("bookCover"),
                        rs.getInt("bookId"));
                products.add(prod);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

}
