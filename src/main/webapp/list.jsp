<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="org.board.jspboard.board.BoardVo" %>
<%@ page import="java.util.List" %>
<%@ page import="org.board.jspboard.board.BoardDao" %>
<jsp:useBean id="dao" class="org.board.jspboard.board.BoardDao"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>게시판</title>
</head>
<body>
<%
    int total = dao.count();
    int totalPage = (int) Math.ceil((double)total / 10);
    String vPage = request.getParameter("page");
    if (vPage == null || vPage.equals("")){
        vPage = "1";
    }
    int viewPage = Integer.parseInt(vPage);
    int index_no = (viewPage - 1) * 10;
    int currentBlock = viewPage % 10 == 0 ? viewPage / 10 : (viewPage / 10) + 1;
    int startPage = (currentBlock - 1) * 10 + 1;    //페이징 블럭 시작
    int endPage = startPage + 10 - 1;               //페이징 블럭 끝
    if (endPage > totalPage) {
        endPage = totalPage;
    }
%>
<%
    BoardDao boardDao = new BoardDao();
    List<BoardVo> voList = boardDao.getBoardList(index_no);
%>

<div>
    총 <%=total%> 건
</div>

<table class="table" width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr style="text-align: center">
        <td width="10%">카테고리</td>
        <td width="40%">제목</td>
        <td width="10%">작성자</td>
        <td width="10%">조회수</td>
        <td width="15%">등록일자</td>
        <td width="15%">수정일자</td>
    </tr>

    <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>

    <%
        for (int i = 0; i < voList.size(); i++){
            %>
    <tr height="25" align="center">
        <td><%=voList.get(i).getCategory()%>
        </td>
        <td align="center"><a href="view.jsp?bno=<%=voList.get(i).getBno()%>&page=<%=vPage%>"><%=voList.get(i).getTitle()%>
        </td>
        <td align="center"><%=voList.get(i).getWriter()%>
        </td>
        <td align="center"><%=voList.get(i).getView()%>
        </td>
        <td align="center"><%=voList.get(i).getRegDate()%>
        </td>
        <td align="center"><%=voList.get(i).getModDate()%>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr height="1" bgcolor="#D2D2D2">
        <td colspan="6"></td>
    </tr>
    <%
        }
    %>
    <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>

    <table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-bottom: 10px">
        <tr><td colspan="4" height="5"></td></tr>
        <tr align="center">
            <td><input type=button value="등록" onclick="window.location='write.jsp'"></td>
        </tr>
    </table>

    <div style="width: 600px; margin: auto; text-align: center">
        <ul class="pagination justify-content-center">
            <% if (startPage == 1) {%>
            <li class="page-item disabled"><a class="page-link" href="#"
                tabindex="-1" aria-disabled="true">이전</a></li>
            <% } else {%>
            <li class="page-item"><a class="page-link"
                href="list.jsp?page=<%=startPage - 1%>" tabindex="-1" aria-disabled="true">이전</a></li>
            <% }%>
            <%
                for (int i = startPage; i <= endPage; i++) {
            %>
            <li class="page-item">
                <a class="page-link" href="list.jsp?page=<%=i %>"><%=i%></a>
            </li>
            <% }%>
            <%
                if (totalPage == endPage) {
            %>
            <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
            <% } else {%>
            <li class="page-item">
                <a class="page-link" href="list.jsp?page=<%=endPage + 1%>">다음</a>
            </li>
            <% }%>
        </ul>
    </div>

</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>