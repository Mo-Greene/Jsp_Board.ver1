<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="org.board.jspboard.board.BoardVo"/>

<%
    request.setCharacterEncoding("UTF-8");

    Class.forName("org.mariadb.jdbc.Driver");

    String url = "jdbc:mariadb://localhost:3306/board";
    String id = "root";
    String pw = "1234";
    String category = request.getParameter("category");
    String writer = request.getParameter("writer");
    String password = request.getParameter("password");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    try {
        Connection conn = DriverManager.getConnection(url,id,pw);

        String sql = "INSERT INTO board(category, writer, password, title, content) VALUES(?,?,?,?,?)";
        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt.setString(1, category);
        stmt.setString(2, writer);
        stmt.setString(3, password);
        stmt.setString(4, title);
        stmt.setString(5, content);

        stmt.execute();
        stmt.close();

        conn.close();
    } catch(SQLException e) {
        System.out.println(e.getErrorCode());
    }
%>

<script language="javascript">
    self.window.alert("입력한 글을 저장하였습니다.");
    location.href = "list.jsp";
</script>
