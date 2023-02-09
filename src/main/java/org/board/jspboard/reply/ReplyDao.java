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
     * view.jsp -> 댓글목록 조회
     */
    public List<ReplyVo> getReplyList(long bno) throws Exception {
        String sql = "select replyContent, regDate from reply where bno = " + bno +
                " order by regDate desc";

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
}
