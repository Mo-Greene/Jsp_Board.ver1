<%--
  Created by IntelliJ IDEA.
  User: mogreene
  Date: 2023/02/11
  Time: 10:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table>
  <form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
    파일 : <input type="file" name="file1"><br>
    파일 : <input type="file" name="file2"><br>
    파일 : <input type="file" name="file3"><br>
    <input type="submit" value="Submit">
  </form>
</table>

<br>
<a href="fileDownload.jsp">파일 다운로드</a>

</body>
</html>
