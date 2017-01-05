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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.GithubPojo;

/**
 *
 * @author SONPC
 */
@WebServlet(name = "Oauth2git", urlPatterns = {"/Oauth2git"})
public class Oauth2git extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String clientID = "02edf4e25d434e53b086";
    private static final String clientSecret = "677d4b8b880841ba4a9b04ac8aaf40689abc3f0b";
    private static final String redirectURI = "http://localhost:8080/ShopSW/Oauth2git";
    private static final String appName = "AdminSonDoan";

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            String code = request.getParameter("code");
            if (code == null) {
                response.sendRedirect("https://github.com/login/oauth/authorize?client_id="
                        + clientID
                        + "&redirect_uri="
                        + redirectURI
                        + "&scope=user");
            } else {
                URL url = new URL(
                        "https://github.com/login/oauth/access_token?client_id="
                        + clientID + "&redirect_uri=" + redirectURI
                        + "&client_secret=" + clientSecret + "&code="
                        + code);
                HttpURLConnection conn = (HttpURLConnection) url
                        .openConnection();
                conn.setRequestMethod("POST");
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
                    accessToken = outputString.substring(13,
                            outputString.indexOf("&"));
                }
                System.out.println(accessToken);
                url = new URL("https://api.github.com/user");
                System.out.println(url);

                HttpURLConnection myURLConnection = (HttpURLConnection) url
                        .openConnection();
                myURLConnection.setRequestProperty("Authorization", "token "
                        + accessToken);
                myURLConnection.setRequestProperty("User-Agent", appName);
                myURLConnection.setRequestMethod("GET");
                myURLConnection.setUseCaches(false);
                myURLConnection.setDoInput(true);
                myURLConnection.setDoOutput(true);
                myURLConnection.setConnectTimeout(7000);

                outputString = "";
                reader = new BufferedReader(new InputStreamReader(
                        myURLConnection.getInputStream(),"UTF-8"));
                while ((line = reader.readLine()) != null) {
                    outputString = outputString + line;
                }
                reader.close();
                System.out.println(outputString);
                GithubPojo gp = (GithubPojo) new Gson().fromJson(outputString,
                        GithubPojo.class);
                System.out.println(gp);
                request.setAttribute("auth", gp);
                request.getRequestDispatcher("/admin/login.jsp").forward(
                        request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
