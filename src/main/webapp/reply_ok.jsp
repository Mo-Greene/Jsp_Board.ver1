<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");
    Class.forName("org.mariadb.jdbc.Driver");
    String url = "jdbc:mariadb://localhost:3306/board";
    String id = "root";
    String pw = "1234";

    String replyContent = request.getParameter("replyContent");
    long bno = Long.parseLong(request.getParameter("bno"));

    try {
        String sql = "insert into reply (replyContent, regDate, bno) " +
                "values (?, default, ?)";

        Connection con = DriverManager.getConnection(url, id, pw);
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setString(1, replyContent);
        stmt.setLong(2, bno);

        stmt.execute();
        stmt.close();

        con.close();
    } catch (SQLException e) {
        System.out.println(e.getErrorCode());
    }
%>

<script>
    self.window.alert("댓글 작성 완료")
    location.href = "view.jsp?bno=<%=bno%>";
</script>