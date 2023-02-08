<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>게시판</title>
</head>
<body>

<%
    Class.forName("org.mariadb.jdbc.Driver");
    String url = "jdbc:mariadb://localhost:3306/board";
    String id = "root";
    String pw = "1234";
    int total = 0;

    try {
        Connection con = DriverManager.getConnection(url, id, pw);
        Statement stmt = con.createStatement();

        String sqlCount = "select count(*) from board";
        ResultSet rs = stmt.executeQuery(sqlCount);

        if (rs.next()) {
            total = rs.getInt(1);
        }
        rs.close();

        String sqlList = "select bno, category, title, writer, view, regDate, modDate from board order by bno desc";
        rs = stmt.executeQuery(sqlList);
%>

총 <%=total%> 건<br/>

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
        if (total == 0) {
    %>
    <tr align="center" bgcolor="#FFFFFF" height="30">
        <td colspan="6">등록된 글이 없습니다.</td>
    </tr>
    <%
    } else {
        while (rs.next()) {
            Long bno = rs.getLong(1);
            String category = rs.getString(2);
            String title = rs.getString(3);
            String writer = rs.getString(4);
            int view = rs.getInt(5);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
            String regDate = simpleDateFormat.format(rs.getTimestamp(6));
            String modDate = null;
            try {
                modDate = simpleDateFormat.format(rs.getTimestamp(7));
            } catch (NullPointerException e) {
                modDate = "-";
            }
    %>
    <tr height="25" align="center">
        <td><%=category%>
        </td>
        <td align="center"><a href="view.jsp?bno=<%=bno%>"><%=title%>
        </td>
        <td align="center"><%=writer%>
        </td>
        <td align="center"><%=view%>
        </td>
        <td align="center"><%=regDate%>
        </td>
        <td align="center"><%=modDate%>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr height="1" bgcolor="#D2D2D2">
        <td colspan="6"></td>
    </tr>
    <%
                }
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
                    System.out.println(e.getErrorCode());
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