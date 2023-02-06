package org.board.jspboard.board;

import lombok.Cleanup;
import org.board.jspboard.util.ConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * PackageName : org.board.jspboard.board
 * Author : Mo-Greene
 * Date : 2023/02/04
 * Description :
 */
public class BoardDao {

    public static int count() throws Exception {
        int cnt = 0;
        String sql = "select count(*) from board";

        @Cleanup Connection con = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement stmt = con.prepareStatement(sql);
        @Cleanup ResultSet resultSet = stmt.executeQuery();

        if (resultSet.next()) {
            cnt = resultSet.getInt(1);
            System.out.println("Board list count : " + cnt);
        }
        return cnt;
    }

    public List<BoardVo> selectAll() throws Exception {
        String sql = "select * from board";

        @Cleanup Connection con = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement stmt = con.prepareStatement(sql);
        @Cleanup ResultSet resultSet = stmt.executeQuery();

        List<BoardVo> list = new ArrayList<>();

        while (resultSet.next()) {
            BoardVo vo = BoardVo.builder()
                    .bno(resultSet.getLong("bno"))
                    .title(resultSet.getString("title"))
                    .category(resultSet.getString("category"))
                    .writer(resultSet.getString("writer"))
                    .view(resultSet.getInt("view"))
                    .regDate(String.valueOf(LocalDateTime.from(resultSet.getDate("regDate").toLocalDate())))
                    .modDate(String.valueOf(LocalDateTime.from(resultSet.getDate("modDate").toLocalDate())))
                    .build();

            list.add(vo);
        }
        return list;
    }
}