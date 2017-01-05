/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DonHangDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SONPC
 */
@WebServlet(name = "DonHangServlet", urlPatterns = {"/DonHangServlet"})
public class DonHangServlet extends HttpServlet {
DonHangDAO donhangDAO=new DonHangDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        String product_id = request.getParameter("ID_Order");
        String url = request.getParameter("URL1204");
        try {
            switch (command) {
                case "deletean":
                    donhangDAO.deleteDonHang(Long.parseLong(product_id));
                    //url = "admin/quanlyproduct.jsp?pages=1";
                    break;
                case "khoiphuchang":
                   donhangDAO.khoiphucDonHang(Long.parseLong(product_id));
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
       // processRequest(request, response);
    }

}
