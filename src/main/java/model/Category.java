/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author SONPC
 */
public class Category {
    private long categoryID;
    private String categoryName;
    private boolean categorySt;

  
    public boolean getCategorySt() {
        return categorySt;
    }

    public void setCategorySt(boolean categorySt) {
        this.categorySt = categorySt;
    }
    

    
    
     public Category() {
    }

    public Category(long categoryID, String categoryName,boolean categorySt) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.categorySt = categorySt;
    }

    public long getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(long categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
