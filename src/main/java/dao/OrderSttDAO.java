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
import model.OrderStt;
import model.Slide;

/**
 *
 * @author SONPC
 */
public class OrderSttDAO {
    //get danhs stt
    public ArrayList<OrderStt> getListSTT() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM status_order ";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<OrderStt> list = new ArrayList<>();
        while (rs.next()) {
            OrderStt orderStt = new OrderStt();
            orderStt.setValue(rs.getInt("ID_Status"));
            orderStt.setName(rs.getString("Name"));
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                orderStt.setSt(false);
            } else {
                orderStt.setSt(true);
            }
            list.add(orderStt);
        }
        connection.close();
        return list;
    }
    // chuyển đổi trạng thái
    public boolean setTrangthai(long idOrder,int idTT) {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE orders SET ID_Status=? WHERE ID_Order = ?;";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, idTT);
            ps.setLong(2, idOrder);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
