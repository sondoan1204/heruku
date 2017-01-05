/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Customer;

/**
 *
 * @author SONPC
 */
@WebServlet(name = "ManagerCustomerServlet", urlPatterns = {"/ManagerCustomerServlet"})
public class ManagerCustomerServlet extends HttpServlet {

    CustomerDAO customerDAO = new CustomerDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String customer_id = request.getParameter("ID_Customer");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    customerDAO.deleteCustomer(Long.parseLong(customer_id));
                    url = "admin/quanlycustomer.jsp";
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
        String command = request.getParameter("command");
        String tenKhach = request.getParameter("tenKhach");
        String userKhach = request.getParameter("userKhach");
        String passKhach = request.getParameter("passKhach");
        String phoneKhach = request.getParameter("phoneKhach");
        String addKhach = request.getParameter("addKhach");
        String emailKhach = request.getParameter("emailKhach");
        boolean st = Boolean.valueOf(request.getParameter("trangthaiKhach"));

        String url = "", error = "";
        if (tenKhach.equals("")) {
            error = "Vui lòng nhập tên danh mục!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        customerDAO.insertCustomer(new Customer(new Date().getTime(), tenKhach, userKhach,
                                passKhach, phoneKhach, addKhach, emailKhach, true));
                        url = "admin/quanlycustomer.jsp";
                        break;
                    case "update":
                       customerDAO.updateCustomer(new Customer(Long.parseLong(request.getParameter("ID_Customer")),
                               tenKhach, userKhach, passKhach, phoneKhach, addKhach, emailKhach, st));
                        url = "admin/quanlycustomer.jsp";
                        break;
                }
            } else {
                url = "admin/themcustomer.jsp";
            }
        } catch (Exception e) {
        }
        //RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        //rd.forward(request, response);
        response.sendRedirect(url);
    }

}
