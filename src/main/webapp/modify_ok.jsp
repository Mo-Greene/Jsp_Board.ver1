<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  request.setCharacterEncoding("UTF-8");
  Class.forName("org.mariadb.jdbc.Driver");
  String url = "jdbc:mariadb://localhost:3306/board";
  String id = "root";
  String pw = "1234";

  String password = "";

  try {
    long bno = Long.parseLong(request.getParameter("bno"));
    String writer = request.getParameter("writer");
    String passw = request.getParameter("password");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Connection con = DriverManager.getConnection(url, id, pw);
    Statement stmt = con.createStatement();

    String sql = "select password from board where bno = " + bno;
    ResultSet rs = stmt.executeQuery(sql);

    if (rs.next()) {
      password = rs.getString(1);
    }

    if (password.equals(passw)) {
      String updateSql = "update board set writer = '" + writer + "', title = '" + title + "', content = '" +
              content + "', modDate = current_timestamp where bno = " + bno;
      stmt.executeQuery(updateSql);
%>
<script>
  self.window.alert("글이 수정되었습니다.");
  location.href = "view.jsp?bno=<%=bno%>";
</script>
<%
  rs.close();
  stmt.close();
  con.close();
} else {
%>
<script>
  self.window.alert("비밀번호를 틀렷습니다.");
  location.href = "modify.jsp?bno=<%=bno%>";
</script>
<%
    }
  } catch (SQLException e) {
      System.out.println(e.getMessage());
  }
%>
