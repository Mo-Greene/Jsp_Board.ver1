package org.board.jspboard.board;

import lombok.Cleanup;
import lombok.extern.log4j.Log4j2;
import org.board.jspboard.common.util.ConnectUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Log4j2
public class BoardDao {
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");

    public int count() throws Exception {
        String sql = "select count(*) from board";
        int total = 0;

        @Cleanup Connection connection = ConnectUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            total = resultSet.getInt(1);
        }
        return total;
    }

    /**
     * list.jsp -> 전체 조회
     */
    public List<BoardVo> getBoardList(int index_no) throws Exception {
        log.info("BoardDao getBoardList.");
        String sql = "select bno, category, title, writer, view, regDate, modDate from board " +
                "order by bno desc LIMIT " + index_no + ", 10";

        @Cleanup Connection connection = ConnectUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

        List<BoardVo> list = new ArrayList<>();

        while (resultSet.next()) {
            BoardVo vo = new BoardVo();

            vo.setBno(resultSet.getLong(1));
            vo.setCategory(resultSet.getString(2));
            vo.setTitle(resultSet.getString(3));
            vo.setWriter(resultSet.getString(4));
            vo.setView(resultSet.getInt(5));
            vo.setRegDate(simpleDateFormat.format(resultSet.getTimestamp(6)));
            try {
                vo.setModDate(simpleDateFormat.format(resultSet.getTimestamp(7)));
            } catch (NullPointerException e) {
                vo.setModDate("-");
            }
            list.add(vo);
        }
        return list;
    }

    /**
     * write_ok.jsp -> 게시글 작성
     * @param vo
     */
    public void insert(BoardVo vo) throws Exception {
        log.info("BoardDao insert.");
        String sql = "INSERT INTO board(category, writer, password, title, content) VALUES(?,?,?,?,?)";

        @Cleanup Connection connection = ConnectUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, vo.getCategory());
        preparedStatement.setString(2, vo.getWriter());
        preparedStatement.setString(3, vo.getPassword());
        preparedStatement.setString(4, vo.getTitle());
        preparedStatement.setString(5, vo.getContent());

        preparedStatement.executeUpdate();
    }

    /**
     * view.jsp -> 특정게시물 조회
     * @param bno
     */
    public BoardVo getView(long bno) throws Exception {
        log.info("BoardDao getView.");
        String sql = "select writer, title, content, regDate, modDate, view, category " +
                "from board where bno = " + bno;

        @Cleanup Connection connection = ConnectUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

        BoardVo vo = null;
        if (resultSet.next()) {
            vo = new BoardVo();
            vo.setWriter(resultSet.getString(1));
            vo.setTitle(resultSet.getString(2));
            vo.setContent(resultSet.getString(3));
            vo.setRegDate(simpleDateFormat.format(resultSet.getTimestamp(4)));
            try {
                vo.setModDate(simpleDateFormat.format(resultSet.getTimestamp(5)));
            } catch (NullPointerException e) {
                vo.setModDate("-");
            }
            vo.setView(resultSet.getInt(6) + 1);
            vo.setCategory(resultSet.getString(7));
        }
        return vo;
    }

    /**
     * view.jsp -> 조회수 증가
     * @param bno
     */
    public void viewUpdate(long bno) throws Exception {
        log.info("BoardDao viewUpdate.");
        String sql = "update board set view = view + 1 where bno = " + bno;

        @Cleanup Connection connection = ConnectUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setLong(1, bno);
        log.info(getView(bno));

        preparedStatement.executeUpdate();
    }

    /**
     * delete_ok.jsp -> 비밀번호 확인
     * @param bno
     * @param boardVo
     */
    public boolean checkPassword(long bno, BoardVo boardVo) throws Exception {
        log.info("Board checkPassword.");
        String sql = "select bno from board where bno = " + bno + " and password = ?";
        boolean check = false;

        @Cleanup Connection connection = ConnectUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, boardVo.getPassword());

        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) check = true;

        return check;
    }

    /**
     * delete_ok.jsp -> 게시글 삭제
     * @param bno
     */
    public void remove(long bno) throws Exception {
        log.info("BoardDao remove.");
        String sql = "delete from board where bno = " + bno;

        @Cleanup Connection connection = ConnectUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.executeUpdate();
    }

    /**
     * modify_ok.jsp -> 내용 수정
     * @param bno, BoardVo
     */
    public void modify(long bno, BoardVo vo) throws Exception {
        log.info("BoardDao modify.");
        String sql = "update board set writer = ?, title = ?, content = ?, modDate = current_timestamp " +
                "where bno = " + bno;

        @Cleanup Connection connection = ConnectUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, vo.getWriter());
        preparedStatement.setString(2, vo.getTitle());
        preparedStatement.setString(3, vo.getContent());

        preparedStatement.executeUpdate();
    }
}