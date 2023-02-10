package org.board.jspboard.file;

import lombok.Cleanup;
import lombok.extern.log4j.Log4j2;
import org.board.jspboard.common.util.ConnectUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;

@Log4j2
public class FileDao {

    public int upload(String fileName, String fileRealName) {
        String sql = "INSERT INTO file VALUES (?, ?)";
        try {
            @Cleanup Connection connection = ConnectUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, fileName);
            preparedStatement.setString(2, fileRealName);

            return preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

}
