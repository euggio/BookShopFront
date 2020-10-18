package com.bookshop.dao;

import com.bookshop.beans.Comment;
import com.bookshop.utils.Connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author euggio
 */
public class CommentDAO {

    Connection connect = Connect.getInstance();
    private static final String SELECT_COMMENT = "SELECT [CommentId]\n"
            + "      ,[BookIsbn]\n"
            + "      ,[CustomerId]\n"
            + "      ,[CommentScore]\n"
            + "      ,[CommentText]\n"
            + "      ,[CommentCustomerIp]\n"
            + "      ,[CommentNote]\n"
            + "  FROM [BookShop].[dbo].[Comment] \n"
            + "  WHERE [BookIsbn] = ?";
    
    
    public Collection getByIsbn(String isbn) {

        Collection comments = new ArrayList();
        Comment comment = new Comment();
        try {

            PreparedStatement stmt = connect.prepareStatement(SELECT_COMMENT);
            stmt.setObject(1, isbn);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                comment = new Comment(
                        rs.getString("bookIsbn"),
                        rs.getInt("customerId"));
                comments.add(comment);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comments;
    }
}
