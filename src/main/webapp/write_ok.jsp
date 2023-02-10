<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="org.board.jspboard.board.BoardDao"/>
<jsp:useBean id="vo" class="org.board.jspboard.board.BoardVo"/>
<jsp:setProperty name="vo" property="*"/>
<meta charset="UTF-8">

<%
    dao.insert(vo);

    /**
     * Application => 전체 프로젝트에 대한 자원을 관리하는 객체
     * maxSize = 100MB
     */
    String directory = application.getRealPath("/upload/");
    int maxSize = 1024 * 1024 * 100;
    String encoding = "UTF-8";

%>

<script language="javascript">
    self.window.alert("입력한 글을 저장하였습니다.");
    location.href = "list.jsp";
</script>
