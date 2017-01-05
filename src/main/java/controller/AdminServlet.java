/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin;

/**
 *
 * @author SONPC
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {
    AdminDAO adminDAO=new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String idgit = request.getParameter("Idgit");
        String user = request.getParameter("User");
        String anhdaidien = request.getParameter("Anhdaidien");
        String ten = request.getParameter("ten");
        String email = request.getParameter("Email");
        HttpSession session = request.getSession();
        Admin admin=new Admin();
        try {
            if(adminDAO.logingit(idgit)==null){
                try {
                    
                    switch (command) {
                        case "insert":
                            adminDAO.insertAdmin(new Admin(new Date().getTime(), idgit, user,
                                    null, anhdaidien, email,ten , true));
                            break;
                            
                    }
                    
                } catch (Exception e) {
                }
                //RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
                //rd.forward(request, response);
                admin=adminDAO.logingit(idgit);
                //response.sendRedirect("index.jsp");
                session.setAttribute("admin", admin);
                response.sendRedirect("admin/index.jsp");
            }else{
                admin=adminDAO.logingit(idgit);
                session.setAttribute("admin", admin);
                response.sendRedirect("admin/index.jsp");
            }  
        } catch (SQLException ex) {
            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
