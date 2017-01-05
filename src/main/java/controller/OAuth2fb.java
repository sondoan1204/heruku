/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FaceBookPojo;

/**
 *
 * @author SONPC
 */
@WebServlet(name = "OAuth2fb", urlPatterns = {"/OAuth2fb"})
public class OAuth2fb extends HttpServlet {

    private static final long serialVersionUID = 1L;
    public static final String CLIENT_ID = "825850937514684";
    public static final String CLIENT_SECRET = "bec8fd922ac74abc76ea98c73bd3d39b";
    public static final String REDIRECT_URI = "http://localhost:8080/ShopSW/OAuth2fb";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String rid = request.getParameter("request_ids");
            if (rid != null) {
                response.sendRedirect("https://www.facebook.com/dialog/oauth?client_id=" + CLIENT_ID + "&redirect_uri=" + REDIRECT_URI + "");
            } else {
                String code = request.getParameter("code");
                if (code != null) {
                    URL url = new URL(
                            "https://graph.facebook.com/oauth/access_token?client_id=" + CLIENT_ID + "&redirect_uri=" + REDIRECT_URI + "&client_secret=" + CLIENT_SECRET + "&code="
                            + code);
                    HttpURLConnection conn = (HttpURLConnection) url
                            .openConnection();
                    conn.setRequestMethod("GET");
                    conn.setConnectTimeout(20000);
                    String outputString = "";
                    BufferedReader reader = new BufferedReader(
                            new InputStreamReader(conn.getInputStream()));
                    String line;
                    while ((line = reader.readLine()) != null) {
                        outputString = outputString + line;
                    }
                    System.out.println(outputString);
                    String accessToken = null;
                    if (outputString.indexOf("access_token") != -1) {
                        accessToken = outputString.substring(13, outputString.indexOf("&"));
                    }
                    System.out.println(accessToken);
                    url = new URL("https://graph.facebook.com/me?access_token="
                            + accessToken);
                    System.out.println(url);
                    URLConnection conn1 = url.openConnection();
                    conn1.setConnectTimeout(7000);
                    outputString = "";
                    reader = new BufferedReader(new InputStreamReader(
                            conn1.getInputStream()));
                    while ((line = reader.readLine()) != null) {
                        outputString = outputString + line;
                    }
                    reader.close();
                    System.out.println(outputString);
                    FaceBookPojo fbp = (FaceBookPojo) new Gson().fromJson(outputString,
                            FaceBookPojo.class);
                    System.out.println(fbp);
                    request.setAttribute("auth", fbp);
                    request.getRequestDispatcher("/admin/loginfb.jsp").forward(
                            request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
