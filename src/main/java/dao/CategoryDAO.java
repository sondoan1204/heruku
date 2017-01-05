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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author SONPC
 */
public class CategoryDAO {

    // get danh sách thể loại
    public ArrayList<Category> getListCategory() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product_category";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Category> list = new ArrayList<>();
        while (rs.next()) {
            Category category = new Category();
            category.setCategoryID(rs.getLong("ID_Category"));
            category.setCategoryName(rs.getString("Name"));
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                category.setCategorySt(false);
            } else {
                category.setCategorySt(true);
            }
            list.add(category);
        }
        connection.close();
        return list;
    }
     // get danh sách thể loại tồn tại true
    public ArrayList<Category> getListLoai() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product_category WHERE Status=true";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Category> list = new ArrayList<>();
        while (rs.next()) {
            Category category = new Category();
            category.setCategoryID(rs.getLong("ID_Category"));
            category.setCategoryName(rs.getString("Name"));
            list.add(category);
        }
        connection.close();
        return list;
    }

    //get 1 ten loai
    public Category getCategory(long category_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product_category WHERE ID_Category = ?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, category_id);
        ResultSet rs = ps.executeQuery();
        Category category = new Category();
        while (rs.next()) {
            category.setCategoryID(rs.getLong("ID_Category"));
            category.setCategoryName(rs.getString("Name"));
            //Boolean.valueOf(rs.getString("Status")
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                category.setCategorySt(false);
            } else {
                category.setCategorySt(true);
            }
        }
        connection.close();
        return category;
    }

    // thêm mới dữ liệu
    public boolean insertCategory(Category c) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO product_category VALUES(?,?,true)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c.getCategoryID());
            ps.setString(2, c.getCategoryName());

            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            connection.close();
        }
        return false;
    }

    // cập nhật dữ liệu
    public boolean updateCategory(Category c) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE product_category SET Name = ?,Status=? WHERE ID_Category = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getCategoryName());
            ps.setLong(3, c.getCategoryID());
            ps.setBoolean(2, c.getCategorySt());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            connection.close();
        }
        return false;
    }

//    // xóa dữ liệu
//    public boolean deleteCategory(long category_id) throws SQLException {
//        Connection connection = DBConnect.getConnection();
//        String sql = "DELETE FROM product_category WHERE ID_Category = ?";
//        try {
//            PreparedStatement ps = connection.prepareCall(sql);
//            ps.setLong(1, category_id);
//            return ps.executeUpdate() == 1;
//        } catch (SQLException ex) {
//            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }finally{
//            connection.close();
//        }
//        return false;
//    }
    // xóa dữ liệu (set trạng thái)
    public boolean deleteCategory(long category_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE product_category SET Status=FALSE WHERE ID_Category = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, category_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            connection.close();
        }
        return false;
    }
    //khôi phục
    public boolean khoiphucCategory(long category_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE product_category SET Status=true WHERE ID_Category = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, category_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            connection.close();
        }
        return false;
    }

    public static void main(String[] args) throws SQLException {
        CategoryDAO dao = new CategoryDAO();
        dao.insertCategory(new Category(new Date().getTime(), "ahih",true));
//        for (Category ds : dao.getListCategory()) {
//            System.out.println(ds.getCategoryID() + " - " + ds.getCategoryName());
//            //System.out.println(dao.deleteCategory(4));
//            Category ds1 = dao.getCategory(1);
//            System.out.println(ds1.getCategoryID() + " - " + ds1.getCategoryName() + " - " + String.valueOf(ds1.getCategorySt()));
//        }
    }
}
