<%@ page import="org.board.jspboard.board.BoardVo" %>
<%@ page import="org.board.jspboard.reply.ReplyVo" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<jsp:useBean id="boardDao" class="org.board.jspboard.board.BoardDao"/>
<jsp:useBean id="replyDao" class="org.board.jspboard.reply.ReplyDao"/>
<%
    int vPage = Integer.parseInt(request.getParameter("page"));
    long bno = Long.parseLong(request.getParameter("bno"));
    BoardVo boardVo = boardDao.getView(bno);
    List<ReplyVo> replyVo = replyDao.getReplyList(bno);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>게시판 - 보기</title>
</head>
<body>

<table>
    <tr>
        <td><%=boardVo.getWriter()%>
        </td>
        <td>등록일시 <%=boardVo.getRegDate()%>
        </td>
        <br/>
        <td>수정일시 <%=boardVo.getModDate()%>
        </td>
    </tr>
    <tr>
        <td>조회수 : <%=boardVo.getView()%>
        </td>
    </tr>
    <tr>
        <td align="center">[<%=boardVo.getCategory()%>]</td>
        <td><%=boardVo.getTitle()%>
        </td>
    </tr>
    <tr>
        <td><%=boardVo.getContent()%>
        </td>
    </tr>
    <%
        for (int i = 0; i < replyVo.size(); i++) {
    %>
    <tr>
        <td><%=replyVo.get(i).getReplyContent()%></td>
        <td><%=replyVo.get(i).getRegDate()%></td>
    </tr>
    <%
        }
    %>

    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <form name="replyForm" action="reply_ok.jsp?bno=<%=bno%>&page=<%=vPage%>" method="post">
        <tr>
            <td><textarea name="replyContent" cols="50" rows="6"></textarea></td>
            <td><button type="submit">댓글 저장</button></td>
        </tr>
    </form>
    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>

    <tr>
        <td colspan="2" width="399">
            <input type="button" value="목록" onclick="window.location='list.jsp?page=<%=vPage%>'">
            <input type="button" value="수정" onclick="window.location='modify.jsp?bno=<%=bno%>&page=<%=vPage%>'">
            <input type="button" value="삭제" onclick="window.location='delete.jsp?bno=<%=bno%>&page=<%=vPage%>'">
        </td>
    </tr>
</table>
<%
    boardDao.viewUpdate(bno);
%>
</body>
</html>