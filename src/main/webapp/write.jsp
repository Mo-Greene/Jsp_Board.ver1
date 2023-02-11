<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <title>게시판</title>
</head>
<body>
<table>

  <form name="writeForm" action="write_ok.jsp" method="post" accept-charset="UTF-8">
      <tr>
      <td>
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
          <tr>
            <td width="5"></td>
            <td><h1>게시판 - 등록</h1></td>
            <td width="5"></td>
          </tr>
        </table>
        <table>
          <tr>
            <td>&nbsp;</td>
            <td align="center">카테고리</td>
            <td>
              <select name="cno">
                <option value="null">카테고리 선택</option>
                <option value="1">Java</option>
                <option value="2">C</option>
              </select>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
          <tr>
            <td>&nbsp;</td>
            <td align="center">작성자</td>
            <td><input name="writer" size="20" maxlength="5"></td>
            <td>&nbsp;</td>
          </tr>
          <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
          <tr>
            <td>&nbsp;</td>
            <td align="center">비밀번호</td>
            <td><input type="password" name="password" size="20" maxlength="10" placeholder="비밀번호">
              <input type="password" name="passwordCheck" size="20" maxlength="10" placeholder="비밀번호 확인"></td>
            <td>&nbsp;</td>
          </tr>
          <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
          <tr>
            <td>&nbsp;</td>
            <td align="center">제목</td>
            <td><input name="title" size="20" maxlength="100"></td>
            <td>&nbsp;</td>
          </tr>
          <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
          <tr>
            <td>&nbsp;</td>
            <td align="center">내용</td>
            <td><textarea name="content" cols="50" rows="13"></textarea></td>
            <td>&nbsp;</td>
          </tr>
          <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>

          <tr align="center">
            <td>&nbsp;</td>
            <td colspan="2">
              <input type=button value="저장" onclick="writeCheck()">
              <input type=button value="취소" onclick="javascript:history.back(-1)">
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </form><%--form end--%>

</table>
</body>

<script language="JavaScript">
  function writeCheck() {
    var form = document.writeForm;

    if (form.cno.value == "null") {
      alert("카테고리를 정해주세요")
      form.cno.focus();
      return;
    }
    if (!form.writer.value) {
      alert("작성자를 적어주세요");
      form.writer.focus();
      return;
    }
    if (!form.password.value) {
      alert("비밀번호를 적어주세요")
      form.password.focus();
      return;
    }
    if (form.password.value != form.passwordCheck.value) {
      alert("비밀번호 확인을 정확히 적어주세요")
      form.passwordCheck.focus()
      return;
    }
    if (!form.title.value) {
      alert("내용을 적어주세요")
      form.title.focus();
      return;
    }
    if (!form.content.value) {
      alert("내용을 적어주세요")
      form.content.focus();
      return;
    }
    form.submit();
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>