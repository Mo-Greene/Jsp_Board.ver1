<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Jsp 파일 업로드</title>
</head>
<body>

<%
    String directory = "/Users/mogreene/Desktop/upload/";
    String[] files = new File(directory).list();

    for (String file : files) {
        out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file=" +
        java.net.URLEncoder.encode(file, "UTF-8") + "\">" + file + "</a><br>");
    }
%>

</body>
</html>
