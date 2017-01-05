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
import model.Customer;

/**
 *
 * @author SONPC
 */
public class CustomerDAO {

    // get danh sách khách hàng
    public ArrayList<Customer> getListCustomer() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM customer";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Customer> list = new ArrayList<>();
        while (rs.next()) {
            Customer customer = new Customer();
            customer.setCustomerID(rs.getLong("ID_Customer"));
            customer.setCustomerName(rs.getString("Name"));
            customer.setCustomerUser(rs.getString("Username"));
            customer.setCustomerPass(rs.getString("Password"));
            customer.setCustomerPhone(rs.getString("Phone"));
            customer.setCustomerAdd(rs.getString("Address"));
            customer.setCustomerEmail(rs.getString("Email"));
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                customer.setCustomerSt(false);
            } else {
                customer.setCustomerSt(true);
            }
            list.add(customer);

        }
        connection.close();
        return list;
    }
  
    //get 1 ten Khách hàng
    public Customer getCustomer(long customer_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM customer WHERE ID_Customer = ?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, customer_id);
        ResultSet rs = ps.executeQuery();
         Customer customer = new Customer();
        while (rs.next()) {
           customer.setCustomerID(rs.getLong("ID_Customer"));
            customer.setCustomerName(rs.getString("Name"));
            customer.setCustomerUser(rs.getString("Username"));
            customer.setCustomerPass(rs.getString("Password"));
            customer.setCustomerPhone(rs.getString("Phone"));
            customer.setCustomerAdd(rs.getString("Address"));
            customer.setCustomerEmail(rs.getString("Email"));
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                customer.setCustomerSt(false);
            } else {
                customer.setCustomerSt(true);
            }
           
        }
        connection.close();
        return customer;
    }
    // thêm mới dữ liệu
    public boolean insertCustomer(Customer c) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO customer VALUES(?,?,?,?,?,?,?,true)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c.getCustomerID());
            ps.setString(2, c.getCustomerName());
            ps.setString(3,c.getCustomerUser());
            ps.setString(4, c.getCustomerPass());
            ps.setString(5, c.getCustomerPhone());
            ps.setString(6, c.getCustomerAdd());
            ps.setString(7, c.getCustomerEmail());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            connection.close();
        }
        return false;
    }
      // cập nhật dữ liệu
    public boolean updateCustomer(Customer c) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE customer SET Name = ?,Username=?,Password=?,Phone=?,Address=?,Email=?,Status=? WHERE ID_Customer = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getCustomerName());
            ps.setString(2, c.getCustomerUser());
            ps.setString(3,c.getCustomerPass());
            ps.setString(4, c.getCustomerPhone());
            ps.setString(5, c.getCustomerAdd());
            ps.setString(6, c.getCustomerEmail());
            ps.setLong(8, c.getCustomerID());
            ps.setBoolean(7, c.getCustomerSt());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            connection.close();
        }
        return false;
    }
     // xóa dữ liệu
    public boolean deleteCustomer(long customer_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM customer WHERE ID_Customer = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, customer_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            connection.close();
        }
        return false;
    }
     public static void main(String[] args) throws SQLException {
        CustomerDAO dao = new CustomerDAO();
        //dao.insertCategory(new Category(new Date().getTime(), "ahih"));
        for (Customer ds : dao.getListCustomer()) {
            System.out.println(ds.getCustomerID() + " - " + ds.getCustomerName()+" - "+ds.getCustomerUser());
            //System.out.println(dao.deleteCategory(4));
            Customer ds1 = dao.getCustomer(1);
             System.out.println(ds1.getCustomerID() + " - " + ds1.getCustomerName()+" - "+ds1.getCustomerUser());
            //System.out.println(ds1.getCategoryID() + " - " + ds1.getCategoryName() + " - " + String.valueOf(ds1.getCategorySt()));
        }
    }
}
