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
public class CTHD {
    private long idSanpham;
    private long idHoadon;
    private long soluong;
    private long tongcong;
    private String tensanpham;

    public  CTHD(){
        
    }
    public CTHD(long idSanpham, long idHoadon, long soluong, long tongcong, String tensanpham) {
        this.idSanpham = idSanpham;
        this.idHoadon = idHoadon;
        this.soluong = soluong;
        this.tongcong = tongcong;
        this.tensanpham = tensanpham;
    }

    public long getIdSanpham() {
        return idSanpham;
    }

    public void setIdSanpham(long idSanpham) {
        this.idSanpham = idSanpham;
    }

    public long getIdHoadon() {
        return idHoadon;
    }

    public void setIdHoadon(long idHoadon) {
        this.idHoadon = idHoadon;
    }

    public long getSoluong() {
        return soluong;
    }

    public void setSoluong(long soluong) {
        this.soluong = soluong;
    }

    public long getTongcong() {
        return tongcong;
    }

    public void setTongcong(long tongcong) {
        this.tongcong = tongcong;
    }

    public String getTensanpham() {
        return tensanpham;
    }

    public void setTensanpham(String tensanpham) {
        this.tensanpham = tensanpham;
    }

    public void set(long aLong) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
