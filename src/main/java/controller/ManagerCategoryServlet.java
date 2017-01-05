package controller;

import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;

/**
 *
 * @author SONPC
 */
public class ManagerCategoryServlet extends HttpServlet {

    CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String category_id = request.getParameter("ID_Category");
        //RequestDispatcher view = request.getRequestDispatcher("/path/to/file.html");
        String url = "";
        try {
            switch (command) {

                case "delete":
                    categoryDAO.deleteCategory(Long.parseLong(category_id));
                    url = "admin/quanlycategory.jsp";
                    break;
                case "khoiphuc":
                    categoryDAO.khoiphucCategory(Long.parseLong(category_id));
                    url = "admin/quanlycategory.jsp";
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
        String tenDanhMuc = request.getParameter("tenDanhMuc");
        boolean st = Boolean.valueOf(request.getParameter("trangthaiDM"));

        String url = "", error = "";
        if (tenDanhMuc.equals("")) {
            error = "Vui lòng nhập tên danh mục!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        categoryDAO.insertCategory(new Category(new Date().getTime(), tenDanhMuc, true));
                        url = "admin/quanlycategory.jsp";
                        break;
                    case "update":
                        categoryDAO.updateCategory(new Category(Long.parseLong(request.getParameter("ID_Category")),
                                tenDanhMuc, st));
                        url = "admin/quanlycategory.jsp";
                        break;
                }
            } else {
                url = "admin/themcategory.jsp";
            }
        } catch (Exception e) {
        }
        //RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        //rd.forward(request, response);
        response.sendRedirect(url);

    }
}
