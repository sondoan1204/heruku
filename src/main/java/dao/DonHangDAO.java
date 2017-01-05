/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CTHD;
import model.Customer;
import model.DonHang;

/**
 *
 * @author SONPC
 */
public class DonHangDAO {

    // get danh sách Dơn hàng
    public ArrayList<DonHang> getListDonHang() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT\n"
                + "orders.ID_Order,\n"
                + "customer.`Name` AS Tenkhach,\n"
                + "payment_menthod.`Name` AS Tenthanhtoan,\n"
                + "orders.Quanlity,\n"
                + "orders.Total,\n"
                + "orders.CreatedDate,\n"
                + "status_order.`Name` AS TinhtrangDH,\n"
                + "customer.Email AS EmailKhach,\n"
                + "orders.ShipName,\n"
                + "orders.ShipAddress,\n"
                + "orders.ShipPhone,\n"
                + "orders.`Status`,\n"
                + "orders.ID_Customer,\n"
                + "status_order.ID_Status AS SulyDH,\n"
                + "orders.Transaction\n"
                + "FROM\n"
                + "orders\n"
                + "INNER JOIN customer ON orders.ID_Customer = customer.ID_Customer\n"
                + "INNER JOIN status_order ON orders.ID_Status = status_order.ID_Status\n"
                + "INNER JOIN payment_menthod ON orders.ID_Payment = payment_menthod.ID_Payment\n"
                +"WHERE orders.`Status` = True";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<DonHang> list = new ArrayList<>();
        while (rs.next()) {
            DonHang dh = new DonHang();
            dh.setIdDonhang(rs.getLong("ID_Order"));
            dh.setTenKhach(rs.getString("Tenkhach"));
            dh.setTenThanhtoan(rs.getString("Tenthanhtoan"));
            dh.setSoluong(rs.getLong("Quanlity"));
            dh.setTong(rs.getLong("Total"));
            dh.setNgaydat(rs.getTimestamp("CreatedDate"));
            dh.setTinhtrangHD(rs.getString("TinhtrangDH"));
            dh.setEmailKhach(rs.getString("EmailKhach"));
            dh.setShipname(rs.getString("ShipName"));
            dh.setShipAdd(rs.getString("ShipAddress"));
            dh.setShipPhone(rs.getString("ShipPhone"));
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                dh.setSt(false);
            } else {
                dh.setSt(true);
            }
            dh.setIdKhach(rs.getLong("ID_Customer"));
            dh.setIdSuly(rs.getLong("SulyDH"));
            dh.setMagiaodich(rs.getString("Transaction"));
            list.add(dh);

        }
        connection.close();
        return list;
    }

    // get Chi tiết đơn hàng
    public ArrayList<CTHD> getListCTHD(long id_dh) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT\n"
                + "order_detail.ID_Product,\n"
                + "order_detail.ID_Order,\n"
                + "order_detail.Quanlity,\n"
                + "order_detail.Subtotal,\n"
                + "product.`Name`\n"
                + "FROM\n"
                + "order_detail\n"
                + "INNER JOIN product ON order_detail.ID_Product = product.ID_Product\n"
                + "WHERE\n"
                + "order_detail.ID_Order = ?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, id_dh);
        ResultSet rs = ps.executeQuery();
        ArrayList<CTHD> list = new ArrayList<>();
        while (rs.next()) {
            CTHD ct = new CTHD();
            ct.setIdSanpham(rs.getLong("ID_Product"));
            ct.setIdHoadon(rs.getLong("ID_Order"));
            ct.setSoluong(rs.getLong("Quanlity"));
            ct.setTongcong(rs.getLong("Subtotal"));
            ct.setTensanpham(rs.getString("Name"));
            list.add(ct);
        }
        connection.close();
        return list;
    }

    // xóa dữ liệu 
    public boolean deleteDonHang(long product_id) {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE orders SET Status= FALSE WHERE ID_Order = ?;";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, product_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // phuc hồi dữ liệu
    public boolean khoiphucDonHang(long product_id) {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE orders SET Status= True WHERE ID_Order = ?;";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, product_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // get danh sách Dơn hàng đã xoá
    public ArrayList<DonHang> getListDonHangRac() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT\n"
                + "orders.ID_Order,\n"
                + "customer.`Name` AS Tenkhach,\n"
                + "payment_menthod.`Name` AS Tenthanhtoan,\n"
                + "orders.Quanlity,\n"
                + "orders.Total,\n"
                + "orders.CreatedDate,\n"
                + "status_order.`Name` AS TinhtrangDH,\n"
                + "customer.Email AS EmailKhach,\n"
                + "orders.ShipName,\n"
                + "orders.ShipAddress,\n"
                + "orders.ShipPhone,\n"
                + "orders.`Status`,\n"
                + "orders.ID_Customer,\n"
                + "status_order.ID_Status AS SulyDH\n"
                + "FROM\n"
                + "orders\n"
                + "INNER JOIN customer ON orders.ID_Customer = customer.ID_Customer\n"
                + "INNER JOIN status_order ON orders.ID_Status = status_order.ID_Status\n"
                + "INNER JOIN payment_menthod ON orders.ID_Payment = payment_menthod.ID_Payment \n"
                +"WHERE orders.`Status` = FALSE";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<DonHang> list = new ArrayList<>();
        while (rs.next()) {
            DonHang dh = new DonHang();
            dh.setIdDonhang(rs.getLong("ID_Order"));
            dh.setTenKhach(rs.getString("Tenkhach"));
            dh.setTenThanhtoan(rs.getString("Tenthanhtoan"));
            dh.setSoluong(rs.getLong("Quanlity"));
            dh.setTong(rs.getLong("Total"));
            dh.setNgaydat(rs.getTimestamp("CreatedDate"));
            dh.setTinhtrangHD(rs.getString("TinhtrangDH"));
            dh.setEmailKhach(rs.getString("EmailKhach"));
            dh.setShipname(rs.getString("ShipName"));
            dh.setShipAdd(rs.getString("ShipAddress"));
            dh.setShipPhone(rs.getString("ShipPhone"));
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                dh.setSt(false);
            } else {
                dh.setSt(true);
            }
            dh.setIdKhach(rs.getLong("ID_Customer"));
            dh.setIdSuly(rs.getLong("SulyDH"));
            list.add(dh);

        }
        connection.close();
        return list;
    }

    public static void main(String[] args) throws SQLException {
        DonHangDAO dao = new DonHangDAO();
        //dao.insertCategory(new Category(new Date().getTime(), "ahih"));
        for (CTHD ds : dao.getListCTHD(1)) {
            System.out.println(ds.getTensanpham() + " - " + ds.getSoluong() + " - " + ds.getTongcong());
        }

    }
}
