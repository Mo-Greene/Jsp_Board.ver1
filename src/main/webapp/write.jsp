<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>게시판</title>
</head>
<body>
<table>

  <form name="writeForm" action="write_ok.jsp" method="post">
      <tr>
      <td>
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
          <tr>
            <td width="5"></td>
            <td>게시판 - 등록</td>
            <td width="5"></td>
          </tr>
        </table>
        <table>
          <tr>
            <td>&nbsp;</td>
            <td align="center">카테고리</td>
            <td>
              <select name="category">
                <option value="null">카테고리 선택</option>
                <option value="Java">Java</option>
                <option value="C">C</option>
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
          <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
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

    if (form.category.value == "null") {
      alert("카테고리를 정해주세요")
      form.category.focus();
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