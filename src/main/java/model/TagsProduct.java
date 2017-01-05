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
public class TagsProduct {
    private long product_id;
    private long tag_id;
    private boolean st;

    public TagsProduct(){
        
    }
    public TagsProduct(long product_id, long tag_id, boolean st) {
        this.product_id = product_id;
        this.tag_id = tag_id;
        this.st = st;
    }

    public long getProduct_id() {
        return product_id;
    }

    public void setProduct_id(long product_id) {
        this.product_id = product_id;
    }

    public long getTag_id() {
        return tag_id;
    }

    public void setTag_id(long tag_id) {
        this.tag_id = tag_id;
    }

    public boolean getSt() {
        return st;
    }

    public void setSt(boolean st) {
        this.st = st;
    }
    
}
