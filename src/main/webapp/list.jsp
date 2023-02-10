<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="org.board.jspboard.board.BoardVo" %>
<%@ page import="java.util.List" %>
<%@ page import="org.board.jspboard.board.BoardDao" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="dao" class="org.board.jspboard.board.BoardDao"/>
<!DOCTYPE html>
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
    if (viewPage > totalPage || viewPage < 1) viewPage = 1;
    int index_no = (viewPage - 1) * 10;
    int currentBlock = viewPage % 10 == 0 ? viewPage / 10 : (viewPage / 10) + 1;
    int startPage = (currentBlock - 1) * 10 + 1;    //페이징 블럭 시작
    int endPage = startPage + 10 - 1;               //페이징 블럭 끝
    if (endPage > totalPage) {
        endPage = totalPage;
    }
%>
<div style="margin-left: 20px">
        <h1><a href="list.jsp">자유 게시판 - 목록</a></h1>
</div>


<form action="list.jsp" method="post">
    <div class="container">
        <div class="row" style="padding: inherit">
            <div class="col-sm-1">
                <input type="date" name="searchStartDate" id="searchStartDate" value="searchStartDate" style="width: 100px">
            </div>
            <div class="col-sm-1">
                <input type="date" name="searchEndDate" id="searchEndDate" value="searchEndDate" style="width: 100px">
            </div>
            <div class="col-md-2">
                <select name = "cno" id = "searchType"  class="form-select form-select mb-3">
                    <option value="null">전체 카테고리</option>
                    <option value="1">JAVA</option>
                    <option value="2">C</option>
                </select>
            </div>
            <div class="col-md-5">
                <input type="text" name = "searchKeyword" class="form-control" placeholder="검색어를 입력해 주세요.(제목 + 작성자 + 내용)" aria-describedby="button-addon2" maxlength='20'>
            </div>
            <div class="col-md-1"><button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
            </div>
        </div>
    </div>
</form>

<%
    BoardDao boardDao = new BoardDao();
    List<BoardVo> voList = new ArrayList<>();

    if (request.getParameter("searchStartDate") != null ||
            request.getParameter("searchEndDate") != null ||
            request.getParameter("cno") != null ||
            request.getParameter("searchKeyword") != null){
        long cno = Long.parseLong(request.getParameter("cno"));
        String searchStartDate = request.getParameter("searchStartDate");
        String searchEndDate = request.getParameter("searchEndDate");
        String searchKeyword = request.getParameter("searchKeyword");

        voList = boardDao.searchBoardList(cno, searchStartDate, searchEndDate, searchKeyword);
    } else voList = boardDao.getBoardList(index_no);
//    if (request.getParameter("searchStartDate").equals("") &&
//            request.getParameter("searchEndDate").equals("") &&
//            request.getParameter("cno").equals("") &&
//            request.getParameter("searchKeyword").equals("")){
//
//        voList = boardDao.getBoardList(index_no);
//    }
//    voList = boardDao.getBoardList(index_no);
%>

<div style="margin-left: 20px">
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
    <br/>

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
    <%
        }
    %>
    <tr height="0" bgcolor="#82B5DF"><td colspan="6" width="1"></td></tr>

    <table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-bottom: 10px">
        <tr><td colspan="4" height="5"></td></tr>
        <tr align="center">
            <td><input type=button class="btn btn-primary" value="등록" onclick="window.location='write.jsp'"></td>
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