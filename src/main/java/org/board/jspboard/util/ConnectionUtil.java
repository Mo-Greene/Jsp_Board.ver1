package org.board.jspboard.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * PackageName : org.board.jspboard.util
 * Author : Mo-Greene
 * Date : 2023/02/06
 * Description :
 */
public class ConnectionUtil {
    public ConnectionUtil() {}

    public static Connection getConnection() {
        String url = "jdbc:mariadb://localhost:3306/board";
        String username = "root";
        String password = "1234";

        Connection con = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
