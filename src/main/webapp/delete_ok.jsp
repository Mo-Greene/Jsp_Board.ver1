<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="dao" class="org.board.jspboard.board.BoardDao"/>
<jsp:useBean id="vo" class="org.board.jspboard.board.BoardVo"/>
<jsp:setProperty name="vo" property="*"/>

<%
    int vPage = Integer.parseInt(request.getParameter("page"));
    long bno = Long.parseLong(request.getParameter("bno"));
    boolean check = dao.checkPassword(bno, vo);
    if (check) {
        dao.remove(bno);
%>
<script language=javascript>
    self.window.alert("해당 글을 삭제하였습니다.");
    location.href = "list.jsp?page=<%=vPage%>";
</script>
<%
    } else {
%>
<script language=javascript>
    self.window.alert("비밀번호를 틀렸습니다.");
    location.href = "javascript:history.back()";
</script>
<%
    }
%>