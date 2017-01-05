/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.oreilly.servlet.MultipartRequest;
import dao.ImformationDAO;
import java.io.File;
import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Imformation;

/**
 *
 * @author SONPC
 */
@WebServlet(name = "ManagerInfomationServlet", urlPatterns = {"/ManagerInfomationServlet"})
public class ManagerInfomationServlet extends HttpServlet {
ImformationDAO informationDAO=new ImformationDAO();
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        MultipartRequest multi = new MultipartRequest(request, ".", 10 * 1024 * 1024, "UTF-8");
        String command = multi.getParameter("command");
                String logo = null;
                String icon = null;
                File file = multi.getFile("logo12");
                File file1 = multi.getFile("icon12");
                String myfolderb = getServletContext().getRealPath("upload") + "\\";
                if (file == null) {
                    logo = multi.getParameter("tenLogo");
                } else {
                    logo = file.getName();
                    file.renameTo(new File(myfolderb, file.getName()));
                }
                if (file1 == null) {
                    icon = multi.getParameter("tenIcon");
                } else {
                    icon = file.getName();
                    file1.renameTo(new File(myfolderb, file1.getName()));
                }
        //String logo = multi.getParameter("tenLogo");
        String hotline = multi.getParameter("tenHotline");
        String facebook = multi.getParameter("tenFacebook");
        String facebooklink = multi.getParameter("tenLinkFacebook");
        String timeopen = multi.getParameter("tenTimeopen");
        String address = multi.getParameter("tenAddress");
        String email = multi.getParameter("tenEmail");
        String sitename = multi.getParameter("tenSitename");
        String mota = multi.getParameter("tenMota");
        //String icon = multi.getParameter("tenIcon");
        String keyword = multi.getParameter("tenKeyword");
        String googleapi = multi.getParameter("tenGoogle");
        String xgoogle = multi.getParameter("tenXGoogle");
        String ygoogle = multi.getParameter("tenYGoogle");
        boolean sthot=Boolean.valueOf(multi.getParameter("trangthaiHot"));
        boolean stnew=Boolean.valueOf(multi.getParameter("trangthaiNew"));
        boolean sttopweek=Boolean.valueOf(multi.getParameter("trangthaiTopWeek"));
        try {
            
                switch (command) {
                    case "update":
                        informationDAO.updateThongtin(new Imformation(1,logo,hotline,facebook,facebooklink,timeopen,address,email,
                                sitename, mota, icon, keyword, googleapi, xgoogle, ygoogle, sthot, stnew, sttopweek));
                        
                        break;
                }
          
        } catch (Exception e) {
        }            
  
        response.sendRedirect("admin/suathongtin.jsp");

    }

  
}
