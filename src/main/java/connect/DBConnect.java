/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;

/**
 *
 * @author SONPC
 */
public class DBConnect {
     public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/shop2_12?user=root&password=sondoan1204");
            conn= (Connection) DriverManager.getConnection("jdbc:mysql://s156.eatj.com:3307/sondoan1993?autoReconnect=true","sondoan1993", "123456");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void main(String[] args) {
        System.out.println(getConnection());
    }
}
