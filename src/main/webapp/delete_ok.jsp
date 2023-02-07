<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");
    Class.forName("org.mariadb.jdbc.Driver");
    String url = "jdbc:mariadb://localhost:3306/board";
    String id = "root";
    String pw = "1234";

    String password = null;
    long bno = Long.parseLong(request.getParameter("bno"));
    String pass = request.getParameter("password");

    try {
        Connection con = DriverManager.getConnection(url, id, pw);
        Statement stmt = con.createStatement();

        String sql = "select password from board where bno = " + bno;

        ResultSet rs = stmt.executeQuery(sql);

        if (rs.next()) {
            password = rs.getString(1);
        }
        if (password.equals(pass)) {
            sql = "delete from board where bno = " + bno;
            stmt.executeQuery(sql);

%>
<script language=javascript>
    self.window.alert("해당 글을 삭제하였습니다.");
    location.href = "list.jsp";
</script>
<%
    rs.close();
    stmt.close();
    con.close();
} else {
%>
<script language=javascript>
    self.window.alert("비밀번호를 틀렸습니다.");
    location.href = "javascript:history.back()";
</script>
<%
        }
    } catch (SQLException e) {
            System.out.println(e.getMessage());
    }
%>