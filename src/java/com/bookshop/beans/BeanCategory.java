package com.bookshop.beans;

import com.bookshop.utils.Connect;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * A bean for both categories and subcategories
 * @author euggio
 */
public class BeanCategory implements Serializable {
    
    public BeanCategory(String ThemeLabel) {
        this.ThemeLabel = ThemeLabel;
    }

    /**
     * No-args bean contructor
     */
    public BeanCategory() {
        Connection connect = Connect.getInstance();
        hashMapOfCategoriesAndSubCategories = new HashMap<>();
        String category = null;
        List<String> subCategories = new ArrayList<>();
        subCategoriesMapped = new ArrayList<>();        
        
        // Sends query to the database
        try (
                PreparedStatement pstmt = connect.prepareStatement(CATEGORY_SUBCATEGORY);
                ResultSet resultSetCategory = pstmt.executeQuery();
            ) 
        {
            // Retrieves the first category from the result set
            resultSetCategory.next();
            category = resultSetCategory.getString("ThemeLabel");
            // Iterates through the result set for categories and subcategories
            while (resultSetCategory.next()) 
            {   
                // Holds a specific category ...
                if (category.equals(resultSetCategory.getString(
                    "ThemeLabel")))   
                    // ... and saves the corresponding subcategory
                    subCategories.add(resultSetCategory.getString(""
                        + "SubThemeLabel"));
                // Fills the hashmap and changes the category's value
                else 
                {
                    hashMapOfCategoriesAndSubCategories.put(category, 
                        subCategories);
                    category = resultSetCategory.getString("ThemeLabel");
                } 
            }

        } catch (SQLException ex) {
            System.err.println("Oops:SQL:" + ex.getErrorCode() + ":" + 
                ex.getMessage());
        }
    }

    /**
     * Shows categories
     */
    public void showCategories() {
        Set<String> keys = hashMapOfCategoriesAndSubCategories.keySet();
        List<String> keysSorted = keys.stream().sorted()
                                               .collect(Collectors.toList());
        for(String key: keysSorted){
        }
    }

    /**
     * Shows subcategories based on a certain category
     * @param category, a category for use as key
     */
    public void showSubCategories(String category) {
        if (hashMapOfCategoriesAndSubCategories.containsKey(category)) {
            subCategoriesMapped = hashMapOfCategoriesAndSubCategories.get(
                category);
        } else {
            subCategoriesMapped = null;
        }
    }

    /**
     * Protects singleton's property
     * @return the singleton
     */
    protected Object readResolve() {
        return INSTANCE;
    }

    // PUBLIC FIELD ------------------------------------------------------------
    /**
     * Creates a singleton with public final field
     */
    public static final BeanCategory INSTANCE = new BeanCategory();
    
    // PRIVATE FIELDS ----------------------------------------------------------    
    // Associates a category to a list of subcategories
    private HashMap<String, List<String>> hashMapOfCategoriesAndSubCategories;
    // Mapped subcategories
    private List<String> subCategoriesMapped;
    // SQL query
    String CATEGORY_SUBCATEGORY = "SELECT [t].[ThemeLabel], [s].[SubThemeLabel] "
        + "FROM [BookShop].[dbo].[Theme] AS t\n"
        + "INNER JOIN [BookShop].[dbo].[SubTheme] AS s ON [t].[ThemeID] = [s]."
        + "[SubThemeID]";
    
    private String ThemeLabel;
}