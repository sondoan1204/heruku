/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author SONPC
 */
public class DonHang {
    private long idDonhang;
    private String tenKhach;
    private String tenThanhtoan;
    private long soluong;
    private long tong;
    private Timestamp ngaydat;
    private String tinhtrangHD;
    private String emailKhach;
    private String shipname;
    private String shipAdd;
    private String shipPhone;
    private boolean st;
    private long idKhach;
    private long idSuly;
    private String magiaodich;

    public  DonHang(){
        
    }
    public DonHang(long idDonhang, String tenKhach, String tenThanhtoan, long soluong, long tong, Timestamp ngaydat, String tinhtrangHD, String emailKhach, String shipname, String shipAdd, String shipPhone, boolean st,long idKhach,long idSuly,String magiaodich) {
        this.idDonhang = idDonhang;
        this.tenKhach = tenKhach;
        this.tenThanhtoan = tenThanhtoan;
        this.soluong = soluong;
        this.tong = tong;
        this.ngaydat = ngaydat;
        this.tinhtrangHD = tinhtrangHD;
        this.emailKhach = emailKhach;
        this.shipname = shipname;
        this.shipAdd = shipAdd;
        this.shipPhone = shipPhone;
        this.st = st;
        this.idKhach = idKhach;
        this.idSuly = idSuly;
        this.magiaodich = magiaodich;
    }

    public long getIdDonhang() {
        return idDonhang;
    }

    public void setIdDonhang(long idDonhang) {
        this.idDonhang = idDonhang;
    }

    public String getTenKhach() {
        return tenKhach;
    }

    public void setTenKhach(String tenKhach) {
        this.tenKhach = tenKhach;
    }

    public String getTenThanhtoan() {
        return tenThanhtoan;
    }

    public void setTenThanhtoan(String tenThanhtoan) {
        this.tenThanhtoan = tenThanhtoan;
    }

    public long getSoluong() {
        return soluong;
    }

    public void setSoluong(long soluong) {
        this.soluong = soluong;
    }

    public long getTong() {
        return tong;
    }

    public void setTong(long tong) {
        this.tong = tong;
    }

    public Timestamp getNgaydat() {
        return ngaydat;
    }

    public void setNgaydat(Timestamp ngaydat) {
        this.ngaydat = ngaydat;
    }

    public String getTinhtrangHD() {
        return tinhtrangHD;
    }

    public void setTinhtrangHD(String tinhtrangHD) {
        this.tinhtrangHD = tinhtrangHD;
    }

    public String getEmailKhach() {
        return emailKhach;
    }

    public void setEmailKhach(String emailKhach) {
        this.emailKhach = emailKhach;
    }

    public String getShipname() {
        return shipname;
    }

    public void setShipname(String shipname) {
        this.shipname = shipname;
    }

    public String getShipAdd() {
        return shipAdd;
    }

    public void setShipAdd(String shipAdd) {
        this.shipAdd = shipAdd;
    }

    public String getShipPhone() {
        return shipPhone;
    }

    public void setShipPhone(String shipPhone) {
        this.shipPhone = shipPhone;
    }

    public boolean getSt() {
        return st;
    }

    public void setSt(boolean st) {
        this.st = st;
    }

    public long getIdKhach() {
        return idKhach;
    }

    public void setIdKhach(long idKhach) {
        this.idKhach = idKhach;
    }

    public long getIdSuly() {
        return idSuly;
    }

    public void setIdSuly(long idSuly) {
        this.idSuly = idSuly;
    }

    public String getMagiaodich() {
        return magiaodich;
    }

    public void setMagiaodich(String magiaodich) {
        this.magiaodich = magiaodich;
    }
    
    
}
