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
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>게시판 - 보기</title>
</head>
<body>
<div class="row" style="margin-bottom:20px; margin-left:1px;">
    <div class="col-lg-12">
        <table id="datatable-scroller" class="table table">
            <tbody>
                <tr>
                    <th><%=boardVo.getWriter()%></th>
                    <td></td>
                </tr>
                <tr>
                    <th>등록일시 <%=boardVo.getRegDate()%></th>
                    <td></td>
                </tr>
                <tr>
                    <th>수정일시 <%=boardVo.getModDate()%></th>
                    <td></td>
                </tr>
                <tr>
                    <th>조회수 : <%=boardVo.getView()%></th>
                    <td></td>
                </tr>
                <tr>
                    <th>[<%=boardVo.getCategory()%>]</th>
                    <td></td>
                </tr>
                <tr>
                    <td><%=boardVo.getTitle()%>
                    </td>
                </tr>
                <tr>
                    <td style="height: 200px"><%=boardVo.getContent()%>
                    </td>
                </tr>
            </tbody>

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

            <form name="replyForm" action="reply_ok.jsp?bno=<%=bno%>&page=<%=vPage%>" method="post">
                <tr>
                    <td class="form-floating">
                        <textarea class="form-control" name="replyContent" placeholder="댓글 작성" id="floatingTextarea2" style="height: 100px"></textarea>
                        <label for="floatingTextarea2">Comments</label>
                    </td>
                    <td><button type="submit" class="btn btn-primary">댓글 저장</button></td>
                </tr>
            </form>

            <tr>
                <td colspan="2" width="399" style="text-align: center">
                    <input type="button" class="btn btn-primary" value="목록" onclick="window.location='list.jsp?page=<%=vPage%>'">
                    <input type="button" class="btn btn-light" value="수정" onclick="window.location='modify.jsp?bno=<%=bno%>&page=<%=vPage%>'">
                    <input type="button" class="btn btn-danger" value="삭제" onclick="window.location='delete.jsp?bno=<%=bno%>&page=<%=vPage%>'">
                </td>
            </tr>
        </table>
    </div>
</div>

<%
    boardDao.viewUpdate(bno);
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>