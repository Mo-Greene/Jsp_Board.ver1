package org.board.jspboard.board;

import lombok.Cleanup;
import org.board.jspboard.util.ConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static java.time.LocalDateTime.from;

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

        @Cleanup Connection con = ConnectionUtil.getConnection();
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

        @Cleanup Connection con = ConnectionUtil.getConnection();
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
                    .regDate(String.valueOf(from(resultSet.getDate("regDate").toLocalDate())))
                    .modDate(String.valueOf(from(resultSet.getDate("modDate").toLocalDate())))
                    .build();

            list.add(vo);
        }
        return list;
    }

    public void insert(BoardVo vo) throws Exception {
        String sql = "insert into board (category, writer, password, title, content) values (?, ?, ?, ?, ?)";
        System.out.println("BoardDao insert vo : " + vo);

        try {
            @Cleanup Connection connection = ConnectionUtil.getConnection();
            @Cleanup PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, vo.getCategory());
            stmt.setString(2, vo.getWriter());
            stmt.setString(3, vo.getPassword());
            stmt.setString(4, vo.getTitle());
            stmt.setString(5, vo.getContent());

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}