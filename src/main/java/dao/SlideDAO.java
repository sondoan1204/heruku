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
import model.Slide;

/**
 *
 * @author SONPC
 */
public class SlideDAO {

    //get danhs ach
    public ArrayList<Slide> getListThongtin() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM slide";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Slide> list = new ArrayList<>();
        while (rs.next()) {
            Slide customer = new Slide();
            customer.setSlideID(rs.getLong("ID_Slide"));
            customer.setImage(rs.getString("Image"));
            customer.setDisplayorder(rs.getLong("DisplayOrder"));
            customer.setLink(rs.getString("Link"));
            customer.setDescription(rs.getString("Description"));
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                customer.setSt(false);
            } else {
                customer.setSt(true);
            }
            list.add(customer);
        }
        connection.close();
        return list;
    }

    public Slide getThongtin(long id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM slide WHERE ID_Slide = ?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        Slide customer = new Slide();
        while (rs.next()) {
            customer.setSlideID(rs.getLong("ID_Slide"));
            customer.setImage(rs.getString("Image"));
            customer.setDisplayorder(rs.getLong("DisplayOrder"));
            customer.setLink(rs.getString("Link"));
            customer.setDescription(rs.getString("Description"));
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                customer.setSt(false);
            } else {
                customer.setSt(true);
            }
        }
        connection.close();
        return customer;
    }

    public boolean updateSlide(Slide c) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE slide SET Image = ?,DisplayOrder=?,Link=?,Description=?,Status=? WHERE ID_Slide = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getImage());
            ps.setLong(2, c.getDisplayorder());
            ps.setString(3, c.getLink());
            ps.setString(4, c.getDescription());
            ps.setBoolean(5, c.getSt());
            ps.setLong(6, c.getSlideID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            connection.close();
        }
        return false;
    }
    public boolean insertSlide(Slide c) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO slide VALUES(?,?,?,?,?,true)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c.getSlideID());
            ps.setString(2, c.getImage());
            ps.setLong(3, c.getDisplayorder());
            ps.setString(4, c.getLink());
            ps.setString(5, c.getDescription());
            //ps.setBoolean(6, c.getSt());

            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println(ex);
        }finally{
            connection.close();
        }
        return false;
    }
    // xóa dữ liệu
    public boolean deleteSlider(long id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM slide WHERE ID_Slide = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            connection.close();
        }
        return false;
    }

    public static void main(String[] args) throws SQLException {
        SlideDAO dao = new SlideDAO();
        Slide ds = dao.getThongtin(1);
        System.out.println(ds.getSt());
    }

}
