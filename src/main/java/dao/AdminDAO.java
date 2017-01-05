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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin;

/**
 *
 * @author SONPC
 */
public class AdminDAO {

    // thêm mới dữ liệu
    public boolean insertAdmin(Admin c) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO administration VALUES(?,?,?,?,?,?,?,true)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c.getId_admin());
            ps.setString(2, c.getId_git());
            ps.setString(3, c.getUsername());
            ps.setString(4, c.getPass());
            ps.setString(5, c.getAvata());
            ps.setString(6, c.getEmail());
            ps.setString(7, c.getName());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            connection.close();
        }
        return false;
    }


    // kiểm tra đăng nhập
    public Admin logingit(String id_git) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT\n"
                + "*\n"
                + "FROM\n"
                + "administration\n"
                + "WHERE\n"
                + "administration.ID_Git=?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, id_git);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Admin a = new Admin();
                a.setId_admin(rs.getLong("ID_Admin"));
                a.setId_git(rs.getString("ID_Git"));
                a.setUsername(rs.getString("Username"));
                a.setPass(rs.getString("Password"));
                a.setAvata(rs.getString("Avata"));
                a.setEmail(rs.getString("Email"));
                a.setName(rs.getString("Name"));
                a.setSt(rs.getBoolean("Status"));
                connection.close();
                return a;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connection.close();
        }
        return null;
    }
}
