package org.board.jspboard.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * PackageName : org.board.jspboard.util
 * Author : Mo-Greene
 * Date : 2023/02/09
 * Description : Jdbc connection
 */
public class ConnectUtil {
    public ConnectUtil() {}

    public Connection getConnection() {
        String url = "jdbc:mariadb://localhost:3306/board";
        String username = "root";
        String password = "1234";

        Connection con = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return con;
    }
}