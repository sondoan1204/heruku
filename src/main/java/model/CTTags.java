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
public class CTTags {
    private long id_product;
    private long id_tags;
    private String keyword;
    private String name_product;

    public CTTags(){
        
    }
    public CTTags(long id_product, long id_tags, String keyword, String name_product) {
        this.id_product = id_product;
        this.id_tags = id_tags;
        this.keyword = keyword;
        this.name_product = name_product;
    }

    public long getId_product() {
        return id_product;
    }

    public void setId_product(long id_product) {
        this.id_product = id_product;
    }

    public long getId_tags() {
        return id_tags;
    }

    public void setId_tags(long id_tags) {
        this.id_tags = id_tags;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getName_product() {
        return name_product;
    }

    public void setName_product(String name_product) {
        this.name_product = name_product;
    }
    
    
}
