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
import model.ChartPie;
import model.Customer;

/**
 *
 * @author SONPC
 */
public class ChartDAO {

    // lấy theo năm hiện tại 
    public ArrayList<ChartPie> getAll() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT\n"
                + "product_category.`Name`, COUNT(ID_Product) As Tong \n"
                + "FROM\n"
                + "product_category\n"
                + "INNER JOIN product ON product.ID_Category = product_category.ID_Category\n"
                + "GROUP BY\n"
                + "product.ID_Category";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<ChartPie> list = new ArrayList<>();
        while (rs.next()) {
            ChartPie c = new ChartPie();
            c.setName(rs.getString("Name"));
            c.setValue(rs.getInt("Tong"));
            list.add(c);
        }
        connection.close();
        return list;
    }

    //số lượng dơn hàng theo tháng lấy theo năm hiện tại
    public ArrayList<ChartPie> getDonhangThang() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT\n"
                + "MONTH(orders.CreatedDate) As Thang,COUNT(ID_Order) As SL\n"
                + "FROM\n"
                + "orders\n WHERE YEAR(orders.CreatedDate) = YEAR(NOW()) \n"
                + "GROUP BY\n"
                + "MONTH(orders.CreatedDate)";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<ChartPie> list = new ArrayList<>();
        while (rs.next()) {
            ChartPie c = new ChartPie();
            c.setName(rs.getString("Thang"));
            c.setValue(rs.getInt("SL"));
            list.add(c);
        }
        connection.close();
        return list;
    }

    //Đên đơn hàng
    public int countDonHang() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(ID_Order) FROM orders WHERE Status=true";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        connection.close();
        return count;
    }
    //đế sản phẩm

    public int countSP() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(ID_Product) FROM product WHERE Status=true";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        connection.close();
        return count;
    }
    //tong doanh thu

    public int sumDoanhThu() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT\n"
                + "Sum(orders.Total)\n"
                + "FROM\n"
                + "orders WHERE Status=true";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        connection.close();
        return count;
    }
}
