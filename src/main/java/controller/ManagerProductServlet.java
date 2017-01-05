/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.oreilly.servlet.*;
import dao.ProductDAO;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author SONPC
 */
@WebServlet(name = "ManagerProductServlet", urlPatterns = {"/ManagerProductServlet"})
@MultipartConfig()
public class ManagerProductServlet extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();
//    private boolean isMultipart;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        String product_id = request.getParameter("ID_Product");

        String url = request.getParameter("URL1204");
        try {
            switch (command) {
                case "delete":
                    productDAO.deleteProductAn(Long.parseLong(product_id));
                    //url = "admin/quanlyproduct.jsp?pages=1";
                    break;
                case "khoiphuc":
                    productDAO.khoiphucProduct(Long.parseLong(product_id));
                    //url = "admin/quanlyproduct.jsp?pages=1";
                    break;
            }
        } catch (Exception e) {
        }
        response.sendRedirect(url);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        MultipartRequest multi = new MultipartRequest(request, ".", 10 * 1024 * 1024, "UTF-8");
         String command = multi.getParameter("command");
                String hinh1b = null;
                String hinh2b = null;
                String hinh3b = null;
                File fileb = multi.getFile("uploadFile");
                File file1b = multi.getFile("hinh2");
                File file2b = multi.getFile("hinh3");
                String myfolderb = getServletContext().getRealPath("upload") + "\\";
                if (fileb == null) {
                    hinh1b = multi.getParameter("anhbia");
                } else {
                    hinh1b = fileb.getName();
                    fileb.renameTo(new File(myfolderb, fileb.getName()));
                }

                if (file1b == null) {
                    hinh2b = multi.getParameter("anh1");
                } else {
                    hinh2b = file1b.getName();
                    file1b.renameTo(new File(myfolderb, file1b.getName()));
                }
                if (file2b == null) {
                    hinh3b = multi.getParameter("anh2");
                } else {
                    hinh3b = file2b.getName();
                    file2b.renameTo(new File(myfolderb, file2b.getName()));
                }

                //String link = myfolder + file.getName();
//                    fileb.renameTo(new File(myfolder1, fileb.getName()));
//                    file1b.renameTo(new File(myfolder1, file1b.getName()));
//                    file2b.renameTo(new File(myfolder1, file2b.getName()));
                long maLoaib = Long.valueOf(multi.getParameter("maLoai"));
                String tenSanphamb = multi.getParameter("tenSanpham");
                long giab = Long.valueOf(multi.getParameter("gia"));
                long giaKMb = Long.valueOf(multi.getParameter("giaKM"));
                String motaNganb = multi.getParameter("motaNgan");
                String motab = multi.getParameter("mota");

                boolean stKMb = Boolean.valueOf(multi.getParameter("trangthaiKM"));
                boolean stHotb = Boolean.valueOf(multi.getParameter("trangthaiHot"));
                boolean stTopb = Boolean.valueOf(multi.getParameter("trangthaiTop"));
                boolean stNew = Boolean.valueOf(multi.getParameter("trangthaiNew"));
                boolean stTopWeekb = Boolean.valueOf(multi.getParameter("trangthaiTopWeek"));
                boolean st = Boolean.valueOf(multi.getParameter("trangthaiSanPham"));
//        isMultipart = ServletFileUpload.isMultipartContent(request);
//        MultipartRequest multi = new MultipartRequest(request, ".", 10 * 1024 * 1024, "UTF-8");
//        String hinh1 =null;
//        String hinh2 = null;
//        String hinh3 = null;
//        String command = multi.getParameter("command");
////        if (isMultipart==true) {
//
//            File file = multi.getFile("uploadFile");
//            File file1 = multi.getFile("hinh2");
//            File file2 = multi.getFile("hinh3");
//            
//            
//            
//           
//             String myfolder = getServletContext().getRealPath("upload") + "\\";
//            if(file==null){
//                hinh1 =multi.getParameter("anhbia");
//            }else{
//                hinh1 = file.getName();
//                file.renameTo(new File(myfolder, file.getName()));
//            }
//            
//            if(file1==null){
//                hinh2 =multi.getParameter("anh1");
//            }else{
//                hinh2 = file1.getName();
//                 file1.renameTo(new File(myfolder, file1.getName()));
//            }
//            if(file2==null){
//                  hinh3 =multi.getParameter("anh2");
//            }else{
//                 hinh3 = file2.getName();
//                file2.renameTo(new File(myfolder, file2.getName()));
//            }
//           
//            //String link = myfolder + file.getName();
//            
//           
//            
//         
//           
////        }else{
////            hinh1 =multi.getParameter("anhbia");
////            hinh2 =multi.getParameter("anh1");
////            hinh3 =multi.getParameter("anh2");
////        }        
//        long maLoai = Long.valueOf(multi.getParameter("maLoai"));
//        String tenSanpham = multi.getParameter("tenSanpham");
//        long gia = Long.valueOf(multi.getParameter("gia"));
//        long giaKM = Long.valueOf(multi.getParameter("giaKM"));
//        String motaNgan = multi.getParameter("motaNgan");
//        String mota = multi.getParameter("mota");
//        boolean stKM = Boolean.valueOf(multi.getParameter("trangthaiKM"));
//        boolean stHot = Boolean.valueOf(multi.getParameter("trangthaiHot"));
//        boolean stTop = Boolean.valueOf(multi.getParameter("trangthaiTop"));
//        boolean stNew = Boolean.valueOf(multi.getParameter("trangthaiNew"));
//        boolean stTopWeek = Boolean.valueOf(multi.getParameter("trangthaiTopWeek"));
//        boolean st = Boolean.valueOf(multi.getParameter("trangthaiSanPham"));
      
        switch (command) {
            case "insert":
                File file = multi.getFile("uploadFile");
                File file1 = multi.getFile("hinh2");
                File file2 = multi.getFile("hinh3");
                String myfolder = getServletContext().getRealPath("upload") + "\\";
                //String link = myfolder + file.getName();
                file.renameTo(new File(myfolder, file.getName()));
                file1.renameTo(new File(myfolder, file1.getName()));
                file2.renameTo(new File(myfolder, file2.getName()));

                long maLoai = Long.valueOf(multi.getParameter("maLoai"));
                String tenSanpham = multi.getParameter("tenSanpham");
                long gia = Long.valueOf(multi.getParameter("gia"));
                long giaKM = Long.valueOf(multi.getParameter("giaKM"));
                String motaNgan = multi.getParameter("motaNgan");
                String mota = multi.getParameter("mota");
                String hinh1 = file.getName();
                // String hinh1 = tentam;
                String hinh2 = file1.getName();
                String hinh3 = file2.getName();
                boolean stKM = Boolean.valueOf(multi.getParameter("trangthaiKM"));
                boolean stHot = Boolean.valueOf(multi.getParameter("trangthaiHot"));
                boolean stTop = Boolean.valueOf(multi.getParameter("trangthaiTop"));
                //boolean stNew = Boolean.valueOf(multi.getParameter("trangthaiNew"));
                boolean stTopWeek = Boolean.valueOf(multi.getParameter("trangthaiTopWeek"));
        {
            try {
                //boolean st = Boolean.valueOf(multi.getParameter("trangthaiSanPham"));
                productDAO.insertProduct(new Product(new Date().getTime(), maLoai, tenSanpham,
                        gia, giaKM, motaNgan, mota, hinh1, hinh2, hinh3, stKM, stHot, stTop, true, stTopWeek, true));
            } catch (SQLException ex) {
                Logger.getLogger(ManagerProductServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
                break;
            case "update":
                
        {
            try {
                productDAO.updateProduct(new Product(Long.parseLong(multi.getParameter("ID_Product")),
                        maLoaib, tenSanphamb, giab, giaKMb, motaNganb, motab,
                        hinh1b, hinh2b, hinh3b, stKMb, stHotb, stTopb, stNew, stTopWeekb, st));
            } catch (SQLException ex) {
                Logger.getLogger(ManagerProductServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
                break;
        }

        response.sendRedirect("admin/quanlyproduct.jsp?pages=1");
    }
}
