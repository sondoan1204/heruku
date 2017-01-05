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
import model.CTTags;
import model.Category;
import model.Slide;
import model.Tags;
import model.TagsProduct;

/**
 *
 * @author SONPC
 */
public class TagsDAO {

    public boolean insertTag(Tags c) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO tag VALUES(?,?,true)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c.getTag_id());
            ps.setString(2, c.getName());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(TagsDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println(ex);
        } finally {
            connection.close();
        }
        return false;
    }

    public boolean insertTagProduct(TagsProduct c) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO tag_product VALUES(?,?,true)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c.getProduct_id());
            ps.setLong(2, c.getTag_id());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(TagsDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println(ex);
        } finally {
            connection.close();
        }
        return false;
    }
    // get danh sách tags

    public ArrayList<CTTags> getListTags(long id_tags) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT\n"
                + "tag_product.ID_Product,\n"
                + "tag_product.ID_Tag,\n"
                + "tag.`Name` As KeyWords,\n"
                + "product.`Name`\n"
                + "FROM\n"
                + "tag_product\n"
                + "INNER JOIN tag ON tag_product.ID_Tag = tag.ID_Tag\n"
                + "INNER JOIN product ON tag_product.ID_Product = product.ID_Product\n"
                + "WHERE\n"
                + "product.ID_Product = ?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, id_tags);
        ResultSet rs = ps.executeQuery();
        ArrayList<CTTags> list = new ArrayList<>();
        while (rs.next()) {
            CTTags tags = new CTTags();
            tags.setId_product(rs.getLong("ID_Product"));
            tags.setId_tags(rs.getLong("ID_Tag"));
            tags.setKeyword(rs.getString("KeyWords"));
            tags.setName_product(rs.getString("Name"));
            list.add(tags);
        }
        connection.close();
        return list;
    }
    // xóa dữ liệu
    public boolean deleteTag(long tag_id) {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM tag WHERE ID_Tag = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, tag_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println(ex);
        }
        return false;
    }
     // xóa dữ liệu
    public boolean deleteTagProduct(long id_product,long tag_id) {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM tag_product WHERE ID_Product=? AND ID_Tag = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, id_product);
            ps.setLong(2, tag_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println(ex);
        }
        return false;
    }
}
