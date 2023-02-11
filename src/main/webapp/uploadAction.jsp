<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="org.board.jspboard.file.FileDao" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  /**
   * Application => 전체 프로젝트에 대한 자원을 관리하는 객체
   * maxSize = 100MB
   */
  String directory = "/Users/mogreene/Desktop/upload/";
  int maxSize = 1024 * 1024 * 100;
  String encoding = "UTF-8";
  DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

  MultipartRequest multipartRequest =
          new MultipartRequest(request, directory, maxSize, encoding, policy);

  Enumeration fileNames = multipartRequest.getFileNames();
  while (fileNames.hasMoreElements()) {
    String parameter = (String) fileNames.nextElement();

    String fileName = multipartRequest.getOriginalFileName(parameter);
    String fileRealName = multipartRequest.getFilesystemName(parameter);

    if (fileName == null) continue;
    if (!fileName.endsWith(".png") && !fileName.endsWith(".hwp") &&
            !fileName.endsWith(".pdf") && !fileName.endsWith(".jpg")) {
      File file = new File(directory + fileRealName);
      file.delete();
      out.write("업로드 할 수 없는 확장입니다.");
    } else {
      new FileDao().upload(fileName, fileRealName);
      out.write("파일명 : " + fileName + "<br>");
      out.write("실제파일명 : " + fileRealName + "<br>");
    }
  }
%>
