<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDateTime" %>
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
<%
    request.setCharacterEncoding("UTF-8");
    Class.forName("org.mariadb.jdbc.Driver");
    String url = "jdbc:mariadb://localhost:3306/board";
    String id = "root";
    String pw = "1234";

    String category = "";
    String regDate = "";
    String modDate = "";
    int view = 0;
    String writer = "";
    String password = "";
    String title = "";
    String content = "";
    long bno = Long.parseLong(request.getParameter("bno"));

    try {
        Connection con = DriverManager.getConnection(url, id, pw);
        Statement stmt = con.createStatement();

        String sql = "Select category, regDate, modDate, view, writer, password, title, content " +
                "from board where bno = " + bno;
        ResultSet rs = stmt.executeQuery(sql);

        if (rs.next()) {
            category = rs.getString(1);
            regDate = String.valueOf(rs.getDate(2));
            modDate = String.valueOf(rs.getDate(3));
            view = rs.getInt(4);
            writer = rs.getString(5);
            password = rs.getString(6);
            title = rs.getString(7);
            content = rs.getString(8);
        }
        rs.close();
        stmt.close();
        con.close();
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
%>

<table>
    <form name="modifyForm" method="post" action="modify_ok.jsp?bno=<%=bno%>">
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
                        <td><%=category%></td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">등록 일시</td>
                        <td><%=regDate%></td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">수정 일시</td>
                        <td><%=modDate%></td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">조회수</td>
                        <td><%=view%></td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">작성자</td>
                        <td><input name="writer" value="<%=writer%>" size="50" maxlength="50"></td>
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
                        <td><input value="<%=title%>" name="title" size="50" maxlength="100"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">내용</td>
                        <td><textarea name="content" cols="50" rows="13"><%=content%></textarea></td>
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