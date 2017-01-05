/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.oreilly.servlet.MultipartRequest;
import dao.SlideDAO;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Slide;

/**
 *
 * @author SONPC
 */
@WebServlet(name = "ManagerSlideServlet", urlPatterns = {"/ManagerSlideServlet"})
public class ManagerSlideServlet extends HttpServlet {

    SlideDAO slideDAO=new SlideDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        String customer_id = request.getParameter("ID_Slide");
        String url = "";
        try {
            switch (command) {

                case "delete":
                    slideDAO.deleteSlider(Long.parseLong(customer_id));
                    url = "admin/quanlyslider.jsp";
                    break;
            }
        } catch (Exception e) {
        }
        //RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        //rd.forward(request, response);
        response.sendRedirect(url);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        MultipartRequest multi = new MultipartRequest(request, ".", 10 * 1024 * 1024, "UTF-8");
        String command = multi.getParameter("command");
        
        String img = null;
                File file = multi.getFile("img12");
                String myfolderb = getServletContext().getRealPath("upload") + "\\";
                if (file == null) {
                    img = multi.getParameter("tenImg");
                } else {
                    img = file.getName();
                    file.renameTo(new File(myfolderb, file.getName()));
                }
                long display = Long.valueOf(multi.getParameter("tenDisplay"));
        String link = multi.getParameter("tenLink");
        String description = multi.getParameter("tenDescription");
        boolean st=Boolean.valueOf(multi.getParameter("trangthai"));
        try {
            
                switch (command) {
                    case "insert":
                        slideDAO.insertSlide(new Slide(new Date().getTime(),img,display,link,description,true));
                        break;
                    case "update":
                        long id=Long.valueOf(multi.getParameter("idslide"));
                        slideDAO.updateSlide(new Slide(id,img,display,link,description,st));
                        break;
                }
          
        } catch (Exception e) {
        }            
  
        response.sendRedirect("admin/quanlyslider.jsp");
    }

   

}
