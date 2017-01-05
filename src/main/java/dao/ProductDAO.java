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
import model.Product;

/**
 *
 * @author SONPC
 */
public class ProductDAO {

    // get danh sách sản phẩm
    public ArrayList<Product> getListProduct(int firstResult, int maxResult) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getLong("ID_Product"));
            product.setCategoryID(rs.getLong("ID_Category"));
            product.setProductName(rs.getString("Name"));
            product.setProductPrite(rs.getLong("Price"));
            product.setProductPromotionPrice(rs.getLong("PromotionPrice"));
            product.setProductShortDescription(rs.getString("ShortDescription"));
            product.setProductDescription(rs.getString("Description"));
            product.setProductImagesFeature(rs.getString("ImagesFeature"));
            product.setProductSubImages1(rs.getString("Subimage1"));
            product.setProductSubImages2(rs.getString("Subimage2"));
            if (Integer.parseInt(rs.getString("StatusPromotion")) == 0) {
                product.setProductStPromotion(false);
            } else {
                product.setProductStPromotion(true);
            }
            if (Integer.parseInt(rs.getString("StatusHot")) == 0) {
                product.setProductStHot(false);
            } else {
                product.setProductStHot(true);
            }
            if (Integer.parseInt(rs.getString("StatusTop")) == 0) {
                product.setProductStTop(false);
            } else {
                product.setProductStTop(true);
            }
            if (Integer.parseInt(rs.getString("StatusNew")) == 0) {
                product.setProductStNew(false);
            } else {
                product.setProductStNew(true);
            }
            if (Integer.parseInt(rs.getString("StatusTopWeek")) == 0) {
                product.setProductStTopWeek(false);
            } else {
                product.setProductStTopWeek(true);
            }
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                product.setProductSt(false);
            } else {
                product.setProductSt(true);
            }
            list.add(product);

        }
        connection.close();
        return list;
    }
    public  int countSanPham()throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(ID_Product) FROM product";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count=0;
        while (rs.next()) {
        count=rs.getInt(1);
        }
        connection.close();
        return count;
    }
    
    
     // get danh sách sản phẩm hiện có
    public ArrayList<Product> getListProductHien(int firstResult, int maxResult) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product Where Status=true limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getLong("ID_Product"));
            product.setCategoryID(rs.getLong("ID_Category"));
            product.setProductName(rs.getString("Name"));
            product.setProductPrite(rs.getLong("Price"));
            product.setProductPromotionPrice(rs.getLong("PromotionPrice"));
            product.setProductShortDescription(rs.getString("ShortDescription"));
            product.setProductDescription(rs.getString("Description"));
            product.setProductImagesFeature(rs.getString("ImagesFeature"));
            product.setProductSubImages1(rs.getString("Subimage1"));
            product.setProductSubImages2(rs.getString("Subimage2"));
            if (Integer.parseInt(rs.getString("StatusPromotion")) == 0) {
                product.setProductStPromotion(false);
            } else {
                product.setProductStPromotion(true);
            }
            if (Integer.parseInt(rs.getString("StatusHot")) == 0) {
                product.setProductStHot(false);
            } else {
                product.setProductStHot(true);
            }
            if (Integer.parseInt(rs.getString("StatusTop")) == 0) {
                product.setProductStTop(false);
            } else {
                product.setProductStTop(true);
            }
            if (Integer.parseInt(rs.getString("StatusNew")) == 0) {
                product.setProductStNew(false);
            } else {
                product.setProductStNew(true);
            }
            if (Integer.parseInt(rs.getString("StatusTopWeek")) == 0) {
                product.setProductStTopWeek(false);
            } else {
                product.setProductStTopWeek(true);
            }
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                product.setProductSt(false);
            } else {
                product.setProductSt(true);
            }
            list.add(product);

        }
        connection.close();
        return list;
    }
    public  int countSanPhamHien()throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(ID_Product) FROM product  Where Status=true";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count=0;
        while (rs.next()) {
        count=rs.getInt(1);
        }
        connection.close();
        return count;
    }
    
    //cout sp moi
     public  int countSanPhamMoi()throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(ID_Product) FROM product WHERE StatusNew=true";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count=0;
        while (rs.next()) {
        count=rs.getInt(1);
        }
        connection.close();
        return count;
    }
    // get danh sách sản phẩm New
    public ArrayList<Product> getListProductNew(int firstResult, int maxResult) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product WHERE StatusNew=true limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getLong("ID_Product"));
            product.setCategoryID(rs.getLong("ID_Category"));
            product.setProductName(rs.getString("Name"));
            product.setProductPrite(rs.getLong("Price"));
            product.setProductPromotionPrice(rs.getLong("PromotionPrice"));
            product.setProductShortDescription(rs.getString("ShortDescription"));
            product.setProductDescription(rs.getString("Description"));
            product.setProductImagesFeature(rs.getString("ImagesFeature"));
            product.setProductSubImages1(rs.getString("Subimage1"));
            product.setProductSubImages2(rs.getString("Subimage2"));
            if (Integer.parseInt(rs.getString("StatusPromotion")) == 0) {
                product.setProductStPromotion(false);
            } else {
                product.setProductStPromotion(true);
            }
            if (Integer.parseInt(rs.getString("StatusHot")) == 0) {
                product.setProductStHot(false);
            } else {
                product.setProductStHot(true);
            }
            if (Integer.parseInt(rs.getString("StatusTop")) == 0) {
                product.setProductStTop(false);
            } else {
                product.setProductStTop(true);
            }
            if (Integer.parseInt(rs.getString("StatusNew")) == 0) {
                product.setProductStNew(false);
            } else {
                product.setProductStNew(true);
            }
            if (Integer.parseInt(rs.getString("StatusTopWeek")) == 0) {
                product.setProductStTopWeek(false);
            } else {
                product.setProductStTopWeek(true);
            }
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                product.setProductSt(false);
            } else {
                product.setProductSt(true);
            }
            list.add(product);

        }
        connection.close();
        return list;
    }
    
    //cout sp hot
     public  int countSanPhamHot()throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(ID_Product) FROM product WHERE StatusHot=true";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count=0;
        while (rs.next()) {
        count=rs.getInt(1);
        }
        connection.close();
        return count;
    }
    // get danh sách sản phẩm Hot
    public ArrayList<Product> getListProductHot(int firstResult, int maxResult) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product WHERE StatusHot=true limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getLong("ID_Product"));
            product.setCategoryID(rs.getLong("ID_Category"));
            product.setProductName(rs.getString("Name"));
            product.setProductPrite(rs.getLong("Price"));
            product.setProductPromotionPrice(rs.getLong("PromotionPrice"));
            product.setProductShortDescription(rs.getString("ShortDescription"));
            product.setProductDescription(rs.getString("Description"));
            product.setProductImagesFeature(rs.getString("ImagesFeature"));
            product.setProductSubImages1(rs.getString("Subimage1"));
            product.setProductSubImages2(rs.getString("Subimage2"));
            if (Integer.parseInt(rs.getString("StatusPromotion")) == 0) {
                product.setProductStPromotion(false);
            } else {
                product.setProductStPromotion(true);
            }
            if (Integer.parseInt(rs.getString("StatusHot")) == 0) {
                product.setProductStHot(false);
            } else {
                product.setProductStHot(true);
            }
            if (Integer.parseInt(rs.getString("StatusTop")) == 0) {
                product.setProductStTop(false);
            } else {
                product.setProductStTop(true);
            }
            if (Integer.parseInt(rs.getString("StatusNew")) == 0) {
                product.setProductStNew(false);
            } else {
                product.setProductStNew(true);
            }
            if (Integer.parseInt(rs.getString("StatusTopWeek")) == 0) {
                product.setProductStTopWeek(false);
            } else {
                product.setProductStTopWeek(true);
            }
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                product.setProductSt(false);
            } else {
                product.setProductSt(true);
            }
            list.add(product);

        }
        connection.close();
        return list;
    }
    
    
     //cout sp khuyen mãi
     public  int countSanPhamKM()throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(ID_Product) FROM product WHERE StatusPromotion=true";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count=0;
        while (rs.next()) {
        count=rs.getInt(1);
        }
        connection.close();
        return count;
    }
    // get danh sách sản phẩm KM
    public ArrayList<Product> getListProductKM(int firstResult, int maxResult) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product WHERE StatusPromotion=true limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getLong("ID_Product"));
            product.setCategoryID(rs.getLong("ID_Category"));
            product.setProductName(rs.getString("Name"));
            product.setProductPrite(rs.getLong("Price"));
            product.setProductPromotionPrice(rs.getLong("PromotionPrice"));
            product.setProductShortDescription(rs.getString("ShortDescription"));
            product.setProductDescription(rs.getString("Description"));
            product.setProductImagesFeature(rs.getString("ImagesFeature"));
            product.setProductSubImages1(rs.getString("Subimage1"));
            product.setProductSubImages2(rs.getString("Subimage2"));
            if (Integer.parseInt(rs.getString("StatusPromotion")) == 0) {
                product.setProductStPromotion(false);
            } else {
                product.setProductStPromotion(true);
            }
            if (Integer.parseInt(rs.getString("StatusHot")) == 0) {
                product.setProductStHot(false);
            } else {
                product.setProductStHot(true);
            }
            if (Integer.parseInt(rs.getString("StatusTop")) == 0) {
                product.setProductStTop(false);
            } else {
                product.setProductStTop(true);
            }
            if (Integer.parseInt(rs.getString("StatusNew")) == 0) {
                product.setProductStNew(false);
            } else {
                product.setProductStNew(true);
            }
            if (Integer.parseInt(rs.getString("StatusTopWeek")) == 0) {
                product.setProductStTopWeek(false);
            } else {
                product.setProductStTopWeek(true);
            }
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                product.setProductSt(false);
            } else {
                product.setProductSt(true);
            }
            list.add(product);

        }
        connection.close();
        return list;
    }
    //cout sp xoá
     public  int countSanPhamXoa()throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(ID_Product) FROM product WHERE Status=FALSE";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count=0;
        while (rs.next()) {
        count=rs.getInt(1);
        }
        connection.close();
        return count;
    }
    // get danh sách sản phẩm đã xoá
    public ArrayList<Product> getListProductXoa(int firstResult, int maxResult) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product WHERE Status=FALSE limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getLong("ID_Product"));
            product.setCategoryID(rs.getLong("ID_Category"));
            product.setProductName(rs.getString("Name"));
            product.setProductPrite(rs.getLong("Price"));
            product.setProductPromotionPrice(rs.getLong("PromotionPrice"));
            product.setProductShortDescription(rs.getString("ShortDescription"));
            product.setProductDescription(rs.getString("Description"));
            product.setProductImagesFeature(rs.getString("ImagesFeature"));
            product.setProductSubImages1(rs.getString("Subimage1"));
            product.setProductSubImages2(rs.getString("Subimage2"));
            if (Integer.parseInt(rs.getString("StatusPromotion")) == 0) {
                product.setProductStPromotion(false);
            } else {
                product.setProductStPromotion(true);
            }
            if (Integer.parseInt(rs.getString("StatusHot")) == 0) {
                product.setProductStHot(false);
            } else {
                product.setProductStHot(true);
            }
            if (Integer.parseInt(rs.getString("StatusTop")) == 0) {
                product.setProductStTop(false);
            } else {
                product.setProductStTop(true);
            }
            if (Integer.parseInt(rs.getString("StatusNew")) == 0) {
                product.setProductStNew(false);
            } else {
                product.setProductStNew(true);
            }
            if (Integer.parseInt(rs.getString("StatusTopWeek")) == 0) {
                product.setProductStTopWeek(false);
            } else {
                product.setProductStTopWeek(true);
            }
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                product.setProductSt(false);
            } else {
                product.setProductSt(true);
            }
            list.add(product);

        }
        connection.close();
        return list;
    }

    // get 1 1sản phẩm
    public Product getProduct(long product_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product WHERE ID_Product = ?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, product_id);
        ResultSet rs = ps.executeQuery();
        Product product = new Product();
        while (rs.next()) {
            product.setProductID(rs.getLong("ID_Product"));
            product.setCategoryID(rs.getLong("ID_Category"));
            product.setProductName(rs.getString("Name"));
            product.setProductPrite(rs.getLong("Price"));
            product.setProductPromotionPrice(rs.getLong("PromotionPrice"));
            product.setProductShortDescription(rs.getString("ShortDescription"));
            product.setProductDescription(rs.getString("Description"));
            product.setProductImagesFeature(rs.getString("ImagesFeature"));
            product.setProductSubImages1(rs.getString("Subimage1"));
            product.setProductSubImages2(rs.getString("Subimage2"));
            if (Integer.parseInt(rs.getString("StatusPromotion")) == 0) {
                product.setProductStPromotion(false);
            } else {
                product.setProductStPromotion(true);
            }
            if (Integer.parseInt(rs.getString("StatusHot")) == 0) {
                product.setProductStHot(false);
            } else {
                product.setProductStHot(true);
            }
            if (Integer.parseInt(rs.getString("StatusTop")) == 0) {
                product.setProductStTop(false);
            } else {
                product.setProductStTop(true);
            }
            if (Integer.parseInt(rs.getString("StatusNew")) == 0) {
                product.setProductStNew(false);
            } else {
                product.setProductStNew(true);
            }
            if (Integer.parseInt(rs.getString("StatusTopWeek")) == 0) {
                product.setProductStTopWeek(false);
            } else {
                product.setProductStTopWeek(true);
            }
            if (Integer.parseInt(rs.getString("Status")) == 0) {
                product.setProductSt(false);
            } else {
                product.setProductSt(true);
            }
        }
        
            connection.close();
        
        return product;
    }

    // thêm mới dữ liệu
    public boolean insertProduct(Product c) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO product VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,true,?,true)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c.getProductID());
            ps.setLong(2, c.getCategoryID());
            ps.setString(3, c.getProductName());
            ps.setLong(4, c.getProductPrite());
            ps.setLong(5, c.getProductPromotionPrice());
            ps.setString(6, c.getProductShortDescription());
            ps.setString(7, c.getProductDescription());
            ps.setString(8, c.getProductImagesFeature());
            ps.setString(9, c.getProductSubImages1());
            ps.setString(10, c.getProductSubImages2());
            ps.setBoolean(11, c.getProductStPromotion());
            ps.setBoolean(12, c.getProductStHot());
            ps.setBoolean(13, c.getProductStTop());
            ps.setBoolean(14, c.getProductStTopWeek());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            connection.close();
        }
        return false;
    }
    // cập nhật dữ liệu

     public boolean updateProduct(Product c) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE product SET "
                + "ID_Category = ?,Name=?,Price=?,PromotionPrice=?,ShortDescription=?,"
                + "Description=?,ImagesFeature=?,Subimage1=?,Subimage2=? ,StatusPromotion=?,"
                + "StatusHot=?,StatusTop=?,StatusNew=?,StatusTopWeek=?,Status=? "
                + "WHERE ID_Product = ?;";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c.getCategoryID());
            ps.setString(2, c.getProductName());
            ps.setLong(3, c.getProductPrite());
            ps.setLong(4,c.getProductPromotionPrice());
            ps.setString(5, c.getProductShortDescription());
            ps.setString(6, c.getProductDescription());
            ps.setString(7, c.getProductImagesFeature());
            ps.setString(8, c.getProductSubImages1());
            ps.setString(9, c.getProductSubImages2());
            ps.setBoolean(10, c.getProductStPromotion());
            ps.setBoolean(11, c.getProductStHot());
            ps.setBoolean(12, c.getProductStTop());
            ps.setBoolean(13, c.getProductStNew());
            ps.setBoolean(14, c.getProductStTopWeek());
            ps.setBoolean(15, c.getProductSt());
            ps.setLong(16, c.getProductID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println(ex);
        }finally{
            connection.close();
        }
        return false;
    }
  // xóa dữ liệu
    public boolean deleteProductAn(long product_id) {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE product SET Status= FALSE WHERE ID_Product = ?;";
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
    public boolean khoiphucProduct(long product_id) {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE product SET Status= TRUE WHERE ID_Product = ?;";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, product_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    // xóa dữ liệu
    public boolean deleteProduct(long product_id) {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM product WHERE ID_Product = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, product_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static void main(String[] args) throws SQLException {
        ProductDAO dao = new ProductDAO();
        System.out.println(dao.countSanPhamMoi());
        //dao.insertCategory(new Category(new Date().getTime(), "ahih"));
//        for (Product ds : dao.getListProduct()) {
//            System.out.println(ds.getProductID() + " - " + ds.getProductName()+" - "+ds.getProductPrite()+" - "+ds.getProductDescription()+" - "+ds.getProductImagesFeature()
//            +" - "+String.valueOf(ds.getProductSt())+" - "+String.valueOf(ds.getProductStTop()));
//            
//        Product ds = dao.getProduct(2);
//        System.out.println(ds.getProductID() + " - " + ds.getProductName() + " - " + ds.getProductPrite() + " - " + ds.getProductDescription() + " - " + ds.getProductImagesFeature()
//                + " - " + String.valueOf(ds.getProductSt()) + " - " + String.valueOf(ds.getProductStTop()));
        //System.out.println(dao.deleteCategory(4));
        //Customer ds1 = dao.getCustomer(1);
        //System.out.println(ds1.getCustomerID() + " - " + ds1.getCustomerName()+" - "+ds1.getCustomerUser());
        //System.out.println(ds1.getCategoryID() + " - " + ds1.getCategoryName() + " - " + String.valueOf(ds1.getCategorySt()));
    }
}
