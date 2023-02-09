<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="dao" class="org.board.jspboard.reply.ReplyDao"/>
<jsp:useBean id="vo" class="org.board.jspboard.reply.ReplyVo"/>
<jsp:setProperty name="vo" property="*"/>

<%
    dao.replyInsert(vo);
%>

<script>
    self.window.alert("댓글 작성 완료")
    location.href = "view.jsp?bno=<%=vo.getBno()%>";
</script>