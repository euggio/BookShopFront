package com.bookshop.dao;

import com.bookshop.beans.Category;
import com.bookshop.utils.Connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CategoryDAO {

    Connection connect = Connect.getInstance();
    private static final String SELECT_CATEGORY = "SELECT [ThemeLabel] FROM [BookShop].[dbo].[Theme]";
    String CATEGORY_SUBCATEGORY = "SELECT [t].[ThemeLabel], [s].[SubThemeLabel] "
            + "FROM [BookShop].[dbo].[Theme] AS t\n"
            + "INNER JOIN [BookShop].[dbo].[SubTheme] AS s ON [t].[ThemeID] = [s]."
            + "[ThemeID]";

    private static final String SUB_CATEGORY = "SELECT [bookIsbn] , [bookTitle], [bookSubtitle], [bookSummary], [bookPrice], [bookCover], [bookId]\n"
            + "FROM [BookShop].[dbo].[Book] b\n"
            + "LEFT JOIN [SubTheme] st\n"
            + "ON st.[SubThemeId] = b.[SubThemeId]\n"
            + "LEFT JOIN [Theme] t\n"
            + "ON st.[ThemeId] = t.[ThemeId]\n"
            + "WHERE [SubThemeLabel] =  ?";

    private static final String CATEGORY = "SELECT [bookIsbn] , [bookTitle], [bookSubtitle], [bookSummary], [bookPrice], [bookCover], [bookId]\n"
            + "FROM [BookShop].[dbo].[Book] b\n"
            + "inner join [BookShop].[dbo].[SubTheme] st\n"
            + "on st.SubThemeId = b.SubThemeId \n"
            + "inner join [BookShop].[dbo].[Theme] t\n"
            + "on t.ThemeId = st.ThemeId \n"
            + "WHERE [ThemeLabel] = ?";

    public Collection allCategory() {
        Collection categories = new ArrayList();
        try {

            PreparedStatement pstmt = connect.prepareStatement(SELECT_CATEGORY);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Category p = new Category(rs.getString("ThemeLabel"));
                categories.add(p);
            }

            return categories;
        } catch (SQLException ex) {
            System.err.println("Oops:SQL:" + ex.getErrorCode() + ":" + ex.getMessage());
        }
        return categories;
    }

    /**
     *
     * @return
     */
    public HashMap<String, List<String>> categorySubcategory() {
        HashMap<String, List<String>> map = new HashMap<>();
        List<String> subCategories1 = new ArrayList<>();
        List<String> subCategories2 = new ArrayList<>();
        List<String> subCategories3 = new ArrayList<>();
        List<String> subCategories4 = new ArrayList<>();
        List<String> subCategories5 = new ArrayList<>();
        List<String> subCategories6 = new ArrayList<>();

        // Sends query to the database
        try (
                PreparedStatement pstmt = connect.prepareStatement(CATEGORY_SUBCATEGORY);
                ResultSet resultSetCategory = pstmt.executeQuery();) {

            // Retrieves the first category from the result set
            // Iterates through the result set for categories and subcategories
            for (int i = 0; i < 5; i++) {
                try {
                    resultSetCategory.next();
                    if ("Clothing".equals(resultSetCategory.getString("ThemeLabel"))) {
                        subCategories1.add(resultSetCategory.getString(""
                                + "SubThemeLabel"));
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            map.put("Clothing", subCategories1);

            for (int i = 0; i < 7; i++) {
                try {
                    resultSetCategory.next();
                    if ("Pharmacy".equals(resultSetCategory.getString("ThemeLabel"))) {
                        subCategories2.add(resultSetCategory.getString(""
                                + "SubThemeLabel"));
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            map.put("Pharmacy", subCategories2);

            for (int i = 0; i < 4; i++) {
                try {
                    resultSetCategory.next();
                    if ("Beauty".equals(resultSetCategory.getString("ThemeLabel"))) {
                        subCategories3.add(resultSetCategory.getString(""
                                + "SubThemeLabel"));
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            map.put("Beauty", subCategories3);

            for (int i = 0; i < 6; i++) {
                try {
                    resultSetCategory.next();
                    if ("Gifts".equals(resultSetCategory.getString("ThemeLabel"))) {
                        subCategories4.add(resultSetCategory.getString(""
                                + "SubThemeLabel"));
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            map.put("Gifts", subCategories4);

            for (int i = 0; i < 5; i++) {
                try {
                    resultSetCategory.next();
                    if ("Tools".equals(resultSetCategory.getString("ThemeLabel"))) {
                        subCategories5.add(resultSetCategory.getString(""
                                + "SubThemeLabel"));
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            map.put("Tools", subCategories5);

            for (int i = 0; i < 3; i++) {
                try {
                    resultSetCategory.next();
                    if ("Outdoors".equals(resultSetCategory.getString("ThemeLabel"))) {
                        subCategories6.add(resultSetCategory.getString(""
                                + "SubThemeLabel"));
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            map.put("Outdoors", subCategories6);

        } catch (SQLException ex) {
            System.err.println("Oops:SQL:" + ex.getErrorCode() + ":"
                    + ex.getMessage());
        }

        return map;
    }

    public List<String> showSubCategories(String category) {
        HashMap<String, List<String>> map = categorySubcategory();
        List<String> subCategoriesMapped = null;
        if (map.containsKey(category)) {
            subCategoriesMapped = map.get(category);
        }
        return subCategoriesMapped;
    }

    public List<Category> getByCategory(String category) {
        List<Category> categories = new ArrayList<>();

        try {
            PreparedStatement stmt = connect.prepareStatement(CATEGORY);
            stmt.setObject(1, category);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Category cat = new Category(
                        rs.getString("bookIsbn"),
                        rs.getString("bookTitle"),
                        rs.getString("bookSubtitle"),
                        rs.getString("bookSummary"),
                        rs.getBigDecimal("bookPrice"),
                        rs.getString("bookCover"),
                        rs.getInt("bookId"));
                categories.add(cat);

            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return categories;
    }

    public List<Category> getBookBySubCat(String subTheme) {
        List<Category> subCat = new ArrayList();
        try {
            PreparedStatement stmt = connect.prepareStatement(SUB_CATEGORY);
            stmt.setString(1, subTheme);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Category cat = new Category(
                        rs.getString("bookIsbn"),
                        rs.getString("bookTitle"),
                        rs.getString("bookSubtitle"),
                        rs.getString("bookSummary"),
                        rs.getBigDecimal("bookPrice"),
                        rs.getString("bookCover"),
                        rs.getInt("bookId"));
                subCat.add(cat);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return subCat;
    }

}
