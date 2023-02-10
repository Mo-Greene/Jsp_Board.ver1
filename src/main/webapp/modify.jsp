<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="org.board.jspboard.board.BoardDao"/>
<jsp:useBean id="vo" class="org.board.jspboard.board.BoardVo"/>
<%@ page import="org.board.jspboard.board.BoardVo" %>
<%
    int vPage = Integer.parseInt(request.getParameter("page"));
    long bno = Long.parseLong(request.getParameter("bno"));
    BoardVo boardVo = dao.getView(bno);
%>
<script language = "javascript">
    function modifyCheck() {
        var form = document.modifyForm;

        if( !form.writer.value )
        {
            alert( "작성자를 적어주세요" );
            form.writer.focus();
            return;
        }
        if( !form.password.value )
        {
            alert( "비밀번호를 적어주세요" );
            form.password.focus();
            return;
        }
        if( !form.title.value )
        {
            alert( "제목을 적어주세요" );
            form.title.focus();
            return;
        }
        if( !form.content.value )
        {
            alert( "내용을 적어주세요" );
            form.content.focus();
            return;
        }
        form.submit();
    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>게시판</title>
</head>
<body>
<table>
    <form name="modifyForm" method="post" action="modify_ok.jsp?bno=<%=bno%>&page=<%=vPage%>">
        <tr>
            <td>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr style="text-align:center;">
                        <td width="5"></td>
                        <td>게시판 - 수정</td>
                        <td width="5"></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">카테고리</td>
                        <td><%=boardVo.getCategory()%></td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">등록 일시</td>
                        <td><%=boardVo.getRegDate()%></td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">수정 일시</td>
                        <td><%=boardVo.getModDate()%></td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">조회수</td>
                        <td><%=boardVo.getView()%></td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">작성자</td>
                        <td><input name="writer" value="<%=boardVo.getWriter()%>" size="50" maxlength="50"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">비밀번호</td>
                        <td><input type="password" name="password" size="50" maxlength="50" placeholder="비밀번호"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">제목</td>
                        <td><input value="<%=boardVo.getTitle()%>" name="title" size="50" maxlength="100"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">내용</td>
                        <td><textarea name="content" cols="50" rows="13"><%=boardVo.getContent()%></textarea></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
                    <tr align="center">
                        <td>&nbsp;</td>
                        <td colspan="2"><input type=button value="수정" onclick="modifyCheck()">
                            <input type=button value="취소" onclick="history.back(-1)">
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </form>
</table>
</body>