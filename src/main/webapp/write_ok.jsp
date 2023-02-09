
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="org.board.jspboard.board.BoardDao"/>
<jsp:useBean id="vo" class="org.board.jspboard.board.BoardVo"/>
<jsp:setProperty name="vo" property="*"/>
<meta charset="UTF-8">

<%
    dao.insert(vo);
    System.out.println("write_ok.jsp vo : " + vo);
%>

<script language="javascript">
    self.window.alert("입력한 글을 저장하였습니다.");
    location.href = "list.jsp";
</script>
