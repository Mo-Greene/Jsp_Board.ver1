<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="dao" class="org.board.jspboard.board.BoardDao"/>
<jsp:useBean id="vo" class="org.board.jspboard.board.BoardVo"/>
<jsp:setProperty name="vo" property="*"/>

<%
    int vPage = Integer.parseInt(request.getParameter("page"));
    long bno = Long.parseLong(request.getParameter("bno"));
    boolean check = dao.checkPassword(bno, vo);
    if (check){
      dao.modify(bno, vo);
    %>
<script>
  self.window.alert("글이 수정되었습니다.");
  location.href = "view.jsp?bno=<%=bno%>&page=<%=vPage%>";
</script>
<%
} else {
%>
<script>
  self.window.alert("비밀번호를 틀렷습니다.");
  location.href = "modify.jsp?bno=<%=bno%>&page=<%=vPage%>";
</script>
<%
    }
%>