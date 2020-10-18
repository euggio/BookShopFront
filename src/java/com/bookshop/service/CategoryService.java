package com.bookshop.service;

import com.bookshop.beans.Category;
import com.bookshop.dao.CategoryDAO;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

public class CategoryService {
    
    public List<Category> getBookBySubCat(String subTheme) {
        CategoryDAO category = new CategoryDAO();
        return category.getBookBySubCat(subTheme);
    }
    
    public List<Category> getByCategory(String themeLabel) {
        CategoryDAO category = new CategoryDAO();
        return category.getByCategory(themeLabel);
    }
    
    public Collection allCategory() {
        CategoryDAO category = new CategoryDAO();
        return category.allCategory();
    }
    
    public HashMap<String, List<String>> categorySubcategory() {
        CategoryDAO category = new CategoryDAO();
        return category.categorySubcategory();
    }
    
    public List<String> showSubCategories(String cat) {
        CategoryDAO category = new CategoryDAO();
        return category.showSubCategories(cat);
    }

    
}
