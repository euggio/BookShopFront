package com.bookshop.dao;

import com.bookshop.beans.Author;
import com.bookshop.utils.Connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author euggio
 */
public class AuthorDAO {
    
    Connection connect = Connect.getInstance();
    private static final String SELECT_AUTHOR = "SELECT * FROM [BookShop].[dbo].[Author]";
    private static final String AUTHOR = "SELECT [bookIsbn] , [bookTitle], [bookSubtitle], [bookSummary], [bookPrice], [bookCover], [bookId], b.[AuthorId]\n"
            + "FROM [BookShop].[dbo].[Book] b\n"
            + "LEFT JOIN [BookShop].[dbo].[Author] a\n"
            + "ON a.[AuthorId] = b.[AuthorId]\n"
            + "WHERE a.[AuthorId] =  ?";
    
    
    public Collection allAuthor() {
        Collection authors = new ArrayList();
        try {
            PreparedStatement pstmt = connect.prepareStatement(SELECT_AUTHOR);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String fullName = (rs.getString("AuthorFirstname") + " " + rs.getString("AuthorLastname"));
                Author p = new Author(fullName, rs.getInt("AuthorId"));
                authors.add(p);
            }
            return authors;
        } catch (SQLException ex) {
            System.err.println("Oops:SQL:" + ex.getErrorCode() + ":" + ex.getMessage());
        }
        return authors;
    }

    public List<Author> getBookByAuthor(int authorId) {
        List<Author> authors = new ArrayList();
        try {
            PreparedStatement stmt = connect.prepareStatement(AUTHOR);
            stmt.setInt(1, authorId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Author author = new Author(
                        rs.getString("bookIsbn"),
                        rs.getString("bookTitle"),
                        rs.getString("bookSubtitle"),
                        rs.getString("bookSummary"),
                        rs.getBigDecimal("bookPrice"),
                        rs.getString("bookCover"),
                        rs.getInt("bookId"),
                        rs.getInt("authorId"));
                authors.add(author);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return authors;
    }
    
}
