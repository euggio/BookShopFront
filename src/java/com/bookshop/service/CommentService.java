package com.bookshop.service;

import com.bookshop.dao.CommentDAO;
import java.sql.SQLException;
import java.util.Collection;

/**
 *
 * @author euggio
 */
public class CommentService {
    public Collection getComment(String isbn) throws SQLException {
        CommentDAO commentDAO = new CommentDAO();

        return commentDAO.getByIsbn(isbn);
    }
}
