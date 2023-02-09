package org.board.jspboard.board;

import lombok.Cleanup;
import org.board.jspboard.util.CloseUtil;
import org.board.jspboard.util.ConnectUtil;
import org.board.jspboard.util.HikariCpUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * PackageName : org.board.jspboard.board
 * Author : Mo-Greene
 * Date : 2023/02/09
 * Description :
 */
public class BoardDao {
    ConnectUtil connectUtil = null;
    String sql = "";

    public BoardDao() {
        connectUtil = new ConnectUtil();
    }

    public int count() throws Exception {
        String sql = "select count(*) from board";
        int total = 0;

        @Cleanup Connection connection = HikariCpUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            total = resultSet.getInt(1);
        }

        return total;
    }
}