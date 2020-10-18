package com.bookshop.service;

import com.bookshop.beans.Author;
import com.bookshop.dao.AuthorDAO;
import java.util.Collection;
import java.util.List;

public class AuthorService {
    
    public Collection allAuthor() {
        AuthorDAO category = new AuthorDAO();
        return category.allAuthor();
    }
    
    public List<Author> getBookByAuthor(int authorId) {
        AuthorDAO authorDAO = new AuthorDAO();
        return authorDAO.getBookByAuthor(authorId);
    }

}
