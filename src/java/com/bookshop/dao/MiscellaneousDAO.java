package com.bookshop.dao;

import com.bookshop.beans.Miscellaneous;
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
public class MiscellaneousDAO {

    Connection connect = Connect.getInstance();
    private static final String SELECT_ALL = "SELECT *\n"
            + "  FROM [BookShop].[dbo].[Theme] t, "
            + "  [BookShop].[dbo].[SubTheme] s,   "
            + "  [BookShop].[dbo].[Book] b ,      "
            + "  [BookShop].[dbo].[OrderData] o,  "
            + "  [BookShop].[dbo].[Address] a,    "
            + "  [BookShop].[dbo].[Customer] cu   "
            + "  [BookShop].[dbo].[Comment] co,"
            + "  WHERE [BookShop].[dbo].[BookIsbn] = ? ";

    public Collection getByIsbn(String isbn) {

        Collection book = new ArrayList();
        try {

            PreparedStatement stmt = connect.prepareStatement(SELECT_ALL);
            stmt.setObject(1, isbn);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Miscellaneous miscellaneous = new Miscellaneous(
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
                book.add(miscellaneous);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return book;
    }

    public MiscellaneousDAO() {
    }
}
