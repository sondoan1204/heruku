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
public class Customer {

    private long customerID;
    private String customerName;
    private String customerUser;
    private String customerPass;
    private String customerPhone;
    private String customerAdd;
    private String customerEmail;
    private boolean customerSt;

    public Customer() {

    }

    public Customer(long customerID, String customerName, String customerUser,
            String customerPass, String customerPhone,
            String customerAdd, String customerEmail, boolean customerSt) {
        this.customerID = customerID;
        this.customerName = customerName;
        this.customerUser = customerUser;
        this.customerPass = customerPass;
        this.customerPhone = customerPhone;
        this.customerAdd = customerAdd;
        this.customerEmail = customerEmail;
        this.customerSt = customerSt;
    }

    public long getCustomerID() {
        return customerID;
    }

    public void setCustomerID(long customerID) {
        this.customerID = customerID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerUser() {
        return customerUser;
    }

    public void setCustomerUser(String customerUser) {
        this.customerUser = customerUser;
    }

    public String getCustomerPass() {
        return customerPass;
    }

    public void setCustomerPass(String customerPass) {
        this.customerPass = customerPass;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerAdd() {
        return customerAdd;
    }

    public void setCustomerAdd(String customerAdd) {
        this.customerAdd = customerAdd;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public boolean getCustomerSt() {
        return customerSt;
    }

    public void setCustomerSt(boolean customerSt) {
        this.customerSt = customerSt;
    }

}
