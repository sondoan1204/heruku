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
public class Tags {

    private long tag_id;
    private String name;
    private boolean st;

    public Tags(){
        
    }
    public Tags(long tag_id, String name, boolean st) {
        this.tag_id = tag_id;
        this.name = name;
        this.st = st;
    }

    public long getTag_id() {
        return tag_id;
    }

    public void setTag_id(long tag_id) {
        this.tag_id = tag_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean getSt() {
        return st;
    }

    public void setSt(boolean st) {
        this.st = st;
    }

}
