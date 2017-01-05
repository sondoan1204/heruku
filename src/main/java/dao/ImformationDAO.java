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
import model.Customer;
import model.Imformation;

/**
 *
 * @author SONPC
 */
public class ImformationDAO {
     public Imformation getThongtin() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM information WHERE ID_Information = 1";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
         Imformation customer = new Imformation();
        while (rs.next()) {
           customer.setInformationID(rs.getLong("ID_Information"));
            customer.setLogo(rs.getString("Logo"));
            customer.setHotline(rs.getString("Hotline"));
            customer.setFacebook(rs.getString("Facebook"));
            customer.setLinkfacebook(rs.getString("Link_Facebook"));
            customer.setTimeopen(rs.getString("TimeOpen"));
            customer.setAddress(rs.getString("Address"));
            customer.setEmail(rs.getString("Email"));
            customer.setSitename(rs.getString("Sitename"));
            customer.setMota(rs.getString("Description"));
            customer.setIcon(rs.getString("Icon"));
            customer.setKeyword(rs.getString("Keyword"));
            customer.setGoogleapi(rs.getString("Google_api_key"));
            customer.setXlocation(rs.getString("X_Location"));
            customer.setYlocation(rs.getString("Y_Location"));
            if (Integer.parseInt(rs.getString("Hot_ShowOnHome")) == 0) {
                customer.setHotshow(false);
            } else {
                customer.setHotshow(true);
            }
            if (Integer.parseInt(rs.getString("New_ShowOnHome")) == 0) {
                customer.setNewshow(false);
            } else {
                customer.setNewshow(true);
            }
            if (Integer.parseInt(rs.getString("TopWeek_ShowOnHome")) == 0) {
                customer.setTopweekshow(false);
            } else {
                customer.setTopweekshow(true);
            }
           
        }
        connection.close();
        return customer;
    }
      // cập nhật dữ liệu
    public boolean updateThongtin(Imformation c) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE information SET Logo = ?,Hotline=?,Facebook=?,Link_Facebook=?,TimeOpen=?,Address=?,Email=?,Sitename=?,Description=?, "
                + "Icon=?,Keyword=?, Google_api_key=?,X_Location=?, Y_Location=?,Hot_ShowOnHome=?,New_ShowOnHome=?,TopWeek_ShowOnHome=? WHERE ID_Information = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getLogo());
            ps.setString(2, c.getHotline());
            ps.setString(3,c.getFacebook());
            ps.setString(4, c.getLinkfacebook());
            ps.setString(5, c.getTimeopen());
            ps.setString(6, c.getAddress());
            ps.setString(7, c.getEmail());
            ps.setString(8, c.getSitename());
            ps.setString(9, c.getMota());
            ps.setString(10, c.getIcon());
            ps.setString(11, c.getKeyword());
            ps.setString(12, c.getGoogleapi());
            ps.setString(13, c.getXlocation());
            ps.setString(14, c.getYlocation());
            ps.setBoolean(15, c.getHotshow());
            ps.setBoolean(16, c.getNewshow());
            ps.setBoolean(17, c.getTopweekshow());
            ps.setLong(18,c.getInformationID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            connection.close();
        }
        return false;
    }
     public static void main(String[] args) throws SQLException {
        ImformationDAO dao = new ImformationDAO();
            Imformation ds=dao.getThongtin();
             System.out.println(ds.getMota());
        }
    
}
