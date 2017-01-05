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
public class Admin {
    private long id_admin;
    private String id_git;
    private String username;
    private String pass;
    private String avata;
    private String email;
    private String name;
    private boolean st;

    public Admin(){
        
    }
    public Admin(long id_admin, String id_git, String username, String pass, String avata, String email, String name, boolean st) {
        this.id_admin = id_admin;
        this.id_git = id_git;
        this.username = username;
        this.pass = pass;
        this.avata = avata;
        this.email = email;
        this.name = name;
        this.st = st;
    }

    

    public long getId_admin() {
        return id_admin;
    }

    public void setId_admin(long id_admin) {
        this.id_admin = id_admin;
    }

    public String getId_git() {
        return id_git;
    }

    public void setId_git(String id_git) {
        this.id_git = id_git;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getAvata() {
        return avata;
    }

    public void setAvata(String avata) {
        this.avata = avata;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
