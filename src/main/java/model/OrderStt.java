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
public class OrderStt {
    private int value;
    private String name;
    private boolean St;

    public  OrderStt(){
        
    }
    public OrderStt(int value, String name, boolean St) {
        this.value = value;
        this.name = name;
        this.St = St;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean getSt() {
        return St;
    }

    public void setSt(boolean St) {
        this.St = St;
    }
    
}
