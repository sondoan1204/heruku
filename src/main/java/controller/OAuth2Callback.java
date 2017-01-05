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
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.GooglePojo;
import model.GsonUtility;

/**
 *
 * @author SONPC
 */
@WebServlet(name = "OAuth2Callback", urlPatterns = {"/OAuth2Callback"})
public class OAuth2Callback extends HttpServlet {

    private static final long serialVersionUID = 1L;
    public static final String CLIENT_ID = "1072517011559-98o65aqld7in2j3du772p3uio5le3a2i.apps.googleusercontent.com";
    public static final String CLIENT_SECRET = "kkSgdOX3fukzVYB0E3tIVIPr";
    public static final String REDIRECT_URL = "http://localhost:8080/ShopSW/OAuth2Callback";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String code = request.getParameter("code");
            String urlParameters = "code="
                    + code
                    + "&client_id=" + CLIENT_ID
                    + "&client_secret=" + CLIENT_SECRET
                    + "&redirect_uri=" + REDIRECT_URL
                    + "&grant_type=authorization_code";
            URL url = new URL("https://accounts.google.com/o/oauth2/token");
            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
            OutputStreamWriter writer = new OutputStreamWriter(
                    conn.getOutputStream());
            writer.write(urlParameters);
            writer.flush();
            String line1 = "";
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    conn.getInputStream(),"UTF-8"));
            String line;
            while ((line = reader.readLine()) != null) {
                line1 = line1 + line;
            }
            String s = GsonUtility.getJsonElementString("access_token", line1);

            url = new URL(
                    "https://www.googleapis.com/oauth2/v1/userinfo?access_token="
                    + s);
            conn = url.openConnection();
            line1 = "";
            reader = new BufferedReader(new InputStreamReader(
                    conn.getInputStream(),"UTF-8"));
            while ((line = reader.readLine()) != null) {
                line1 = line1 + line;
            }
            GooglePojo data = (GooglePojo) new Gson().fromJson(line1, GooglePojo.class);
            writer.close();
            reader.close();
            request.setAttribute("auth", data);
            request.getRequestDispatcher("/admin/logingoogle.jsp").forward(request, response);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (ProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
