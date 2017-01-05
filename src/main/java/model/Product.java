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
public class Product {

    private long productID;
    private long categoryID;
    private String productName;
    private long productPrite;
    private long productPromotionPrice;
    private String productShortDescription;
    private String productDescription;
    private String productImagesFeature;
    private String productSubImages1;
    private String productSubImages2;
    private boolean productStPromotion;
    private boolean productStHot;
    private boolean productStTop;
    private boolean productStNew;
    private boolean productStTopWeek;
    private boolean productSt;

    public long getProductID() {
        return productID;
    }

    public void setProductID(long productID) {
        this.productID = productID;
    }

    public long getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(long categoryID) {
        this.categoryID = categoryID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public long getProductPrite() {
        return productPrite;
    }

    public void setProductPrite(long productPrite) {
        this.productPrite = productPrite;
    }

    public long getProductPromotionPrice() {
        return productPromotionPrice;
    }

    public void setProductPromotionPrice(long productPromotionPrice) {
        this.productPromotionPrice = productPromotionPrice;
    }

    public String getProductShortDescription() {
        return productShortDescription;
    }

    public void setProductShortDescription(String productShortDescription) {
        this.productShortDescription = productShortDescription;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductImagesFeature() {
        return productImagesFeature;
    }

    public void setProductImagesFeature(String productImagesFeature) {
        this.productImagesFeature = productImagesFeature;
    }

    public String getProductSubImages1() {
        return productSubImages1;
    }

    public void setProductSubImages1(String productSubImages1) {
        this.productSubImages1 = productSubImages1;
    }

    public String getProductSubImages2() {
        return productSubImages2;
    }

    public void setProductSubImages2(String productSubImages2) {
        this.productSubImages2 = productSubImages2;
    }

    public boolean getProductStPromotion() {
        return productStPromotion;
    }

    public void setProductStPromotion(boolean productStPromotion) {
        this.productStPromotion = productStPromotion;
    }

    public boolean getProductStHot() {
        return productStHot;
    }

    public void setProductStHot(boolean productStHot) {
        this.productStHot = productStHot;
    }

    public boolean getProductStTop() {
        return productStTop;
    }

    public void setProductStTop(boolean productStTop) {
        this.productStTop = productStTop;
    }

    public boolean getProductStNew() {
        return productStNew;
    }

    public void setProductStNew(boolean productStNew) {
        this.productStNew = productStNew;
    }

    public boolean getProductStTopWeek() {
        return productStTopWeek;
    }

    public void setProductStTopWeek(boolean productStTopWeek) {
        this.productStTopWeek = productStTopWeek;
    }

    public boolean getProductSt() {
        return productSt;
    }

    public void setProductSt(boolean productSt) {
        this.productSt = productSt;
    }

    public Product() {

    }

    public Product(long productID, long categoryID, String productName, long productPrite, long productPromotionPrice, String productShortDescription, String productDescription, String productImagesFeature, String productSubImages1, String productSubImages2, boolean productStPromotion, boolean productStHot, boolean productStTop, boolean productStNew, boolean productStTopWeek, boolean productSt) {
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.productPrite = productPrite;
        this.productPromotionPrice = productPromotionPrice;
        this.productShortDescription = productShortDescription;
        this.productDescription = productDescription;
        this.productImagesFeature = productImagesFeature;
        this.productSubImages1 = productSubImages1;
        this.productSubImages2 = productSubImages2;
        this.productStPromotion = productStPromotion;
        this.productStHot = productStHot;
        this.productStTop = productStTop;
        this.productStNew = productStNew;
        this.productStTopWeek = productStTopWeek;
        this.productSt = productSt;
    }

}
