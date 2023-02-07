<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%
    Class.forName("org.mariadb.jdbc.Driver");
    String url = "jdbc:mariadb://localhost:3306/board";
    String id = "root";
    String pw = "1234";
    long bno = Long.parseLong(request.getParameter("bno"));

    try {
        Connection con = DriverManager.getConnection(url, id, pw);
        Statement stmt = con.createStatement();

        String sql = "select writer, title, content, regDate, modDate, view, category " +
                "from board where bno = " + bno;

        ResultSet rs = stmt.executeQuery(sql);

        if (rs.next()) {
            String writer = rs.getString(1);
            String title = rs.getString(2);
            String content = rs.getString(3);
            Date regDate = rs.getDate(4);
            Date modDate = rs.getDate(5);
            int view = rs.getInt(6);
            String category = rs.getString(7);
            view++;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>게시판 - 보기</title>
</head>
<body>

<table>
    <tr>
        <td><%=writer%>
        </td>
        <td>등록일시 <%=regDate%>
        </td>
        <br/>
        <td>수정일시 <%=modDate%>
        </td>
    </tr>
    <tr>
        <td>조회수 : <%=view%>
        </td>
    </tr>
    <tr>
        <td align="center">[<%=category%>]</td>
        <td><%=title%>
        </td>
    </tr>
    <tr>
        <td><%=content%>
        </td>
    </tr>
    <%
                sql = "update board set view = " + view + " where bno = " + bno;
                stmt.executeQuery(sql);
                rs.close();
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {}
    %>



    <tr>
        <td colspan="2" width="399">
            <input type="button" value="목록" onclick="window.location='list.jsp'">
            <input type="button" value="수정" onclick="window.location='modify.jsp'">
            <input type="button" value="삭제" onclick="window.location='delete.jsp?bno=<%=bno%>'">
        </td>
    </tr>
</table>

</body>
</html>
