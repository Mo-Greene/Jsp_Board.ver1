package org.board.jspboard.util;

import java.sql.*;

/**
 * PackageName : org.board.jspboard.util
 * Author : Mo-Greene
 * Date : 2023/02/09
 * Description : DB close();
 */
public class CloseUtil {
    public static void close(Connection conn, PreparedStatement psmt, ResultSet rs) {
        try {
            if (conn != null) {
                conn.close();
            }
            if (psmt != null) {
                psmt.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}