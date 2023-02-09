<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="org.board.jspboard.board.BoardVo" %>
<%@ page import="java.util.List" %>
<%@ page import="org.board.jspboard.board.BoardDao" %>
<jsp:useBean id="dao" class="org.board.jspboard.board.BoardDao"/>
<%
    final int size = 10; //한페이지 게시물 수
    final int block = 10; //페이지 하단 페이지 최대개수

    int pg = 1; //기본 페이지값

    if (request.getParameter("pg") != null) { //pg값 받았으면 변수 지정
        pg = Integer.parseInt(request.getParameter("pg"));
    }
    int start = (pg * size) - (size - 1); //해당 페이지 시작번호
    int end = pg * size;  //해당 페이지 끝번호

    int totalPage = 0;  //전체 페이지

    int startPage = ((pg - 1) / block * block) + 1; //시작 블럭 숫자(1-10일 경우 1)
    int endPage = ((pg - 1) / block * block) + block; //끝 블럭 숫자(1-10일 경우 10)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>게시판</title>
</head>
<body>

<%
    BoardDao boardDao = new BoardDao();
    List<BoardVo> voList = boardDao.getBoardList();
    int total = dao.count();
%>

<div>
    총 <%=total%> 건
</div>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
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
        <td align="center"><a href="view.jsp?bno=<%=voList.get(i).getBno()%>"><%=voList.get(i).getTitle()%>
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

    <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr><td colspan="4" height="5"></td></tr>
        <tr align="center">
            <td><input type=button value="등록" onclick="window.location='write.jsp'"></td>
        </tr>
    </table>

</table>

</body>
</html>