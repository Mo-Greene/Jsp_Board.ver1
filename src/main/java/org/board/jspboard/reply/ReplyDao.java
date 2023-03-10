package org.board.jspboard.reply;

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
public class ReplyDao {

    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");

    /**
     * 이 메서드의 목적. 의도. 주의할 점.
     * @param bno PK번호
     * @return 목록을 리턴함.
     * @throws Exception
     */
    public List<ReplyVo> getReplyList(long bno) throws Exception {
        log.info("ReplyDao getReplyList.");
        String sql = "select replyContent, regDate from reply " +
                     "where bno = " + bno + " order by regDate desc";

        @Cleanup Connection connection = ConnectUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

        List<ReplyVo> list = new ArrayList<>();
        while (resultSet.next()) {
            ReplyVo vo = new ReplyVo();
            vo.setReplyContent(resultSet.getString(1));
            vo.setRegDate(simpleDateFormat.format(resultSet.getTimestamp(2)));

            list.add(vo);
        }
        return list;
    }

    /**
     * reply_ok.jsp -> 댓글등록
     */
    public void replyInsert(ReplyVo vo) throws Exception {
        log.info("ReplyDao replyInsert.");
        String sql = "insert into reply (replyContent, regDate, bno) " +
                     "values (?, default, ?)";

        @Cleanup Connection connection = ConnectUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, vo.getReplyContent());
        preparedStatement.setLong(2, vo.getBno());

        preparedStatement.executeUpdate();
    }
}
