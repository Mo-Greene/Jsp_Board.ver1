<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script language="javascript">

    function deleteCheck() {
        var form = document.deleteForm;

        if (!form.password.value) {
            alert("비밀번호를 적어주세요");
            return;
        }
        form.submit();
    }
</script>
<%
    int vPage = Integer.parseInt(request.getParameter("page"));
    long bno = Long.parseLong(request.getParameter("bno"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>게시글 삭제 확인</title>
</head>
<body>
<table>
    <form name="deleteForm" method="post" action="delete_ok.jsp?bno=<%=bno%>&page=<%=vPage%>">
        <tr>
            <td>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr style="text-align:center;">
                        <td width="5"></td>
                        <td>삭제확인</td>
                        <td width="5"></td>
                    </tr>
                </table>

                <table>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">비밀번호</td>
                        <td><input name="password" type="password" size="50" maxlength="100"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
                    <tr align="center">
                        <td>&nbsp;</td>
                        <td colspan="2"><input type=button class="btn btn-danger" value="삭제" onclick="javascript:deleteCheck();">
                            <input type=button class="btn btn-light" value="취소" onclick="javascript:history.back(-1)">
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </form>

</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>