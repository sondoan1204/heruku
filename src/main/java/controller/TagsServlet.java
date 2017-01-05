/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.TagsDAO;
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
import model.Category;
import model.Tags;
import model.TagsProduct;

/**
 *
 * @author SONPC
 */
@WebServlet(name = "TagsServlet", urlPatterns = {"/TagsServlet"})
public class TagsServlet extends HttpServlet {

    TagsDAO tagsDAO = new TagsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String idtags = request.getParameter("ID_Tags");
        String idpro = request.getParameter("ID_Product");
        String url = request.getParameter("Url12");
        
        try {
            switch (command) {

                case "delete":
                    tagsDAO.deleteTagProduct(Long.parseLong(idpro),Long.parseLong(idtags));
                    tagsDAO.deleteTag(Long.parseLong(idtags));
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
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            String command = request.getParameter("command");
            String url = request.getParameter("url12");
            String tentag = request.getParameter("tenTag");
            String[] words = tentag.split(",");
            long id_product = Long.valueOf(request.getParameter("idsp"));

            switch (command) {
                case "insert":
                    for (String w : words) {
                        long idtags = new Date().getTime();
                        tagsDAO.insertTag(new Tags(idtags, w, true));
                        tagsDAO.insertTagProduct(new TagsProduct(id_product, idtags, true));
                    }
                    break;
//            case "update":
//                categoryDAO.updateCategory(new Category(Long.parseLong(request.getParameter("ID_Category")),
//                        tenDanhMuc, st));
//                break;
            }
            response.sendRedirect(url);
        } catch (SQLException ex) {
            Logger.getLogger(TagsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
