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
public class Slide {

    private long slideID;
    private String image;
    private long displayorder;
    private String link;
    private String description;
    private boolean st;
    public Slide(){
        
    }
    public Slide(long slideID, String image, long displayorder, String link, String description, boolean st) {
        this.slideID = slideID;
        this.image = image;
        this.displayorder = displayorder;
        this.link = link;
        this.description = description;
        this.st = st;
    }

    public long getSlideID() {
        return slideID;
    }

    public void setSlideID(long slideID) {
        this.slideID = slideID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public long getDisplayorder() {
        return displayorder;
    }

    public void setDisplayorder(long displayorder) {
        this.displayorder = displayorder;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean getSt() {
        return st;
    }

    public void setSt(boolean st) {
        this.st = st;
    }
   
}
