<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardDao dao = BoardDao.getInstance();
dao.update(Integer.parseInt(num), title, content);

response.sendRedirect("boardView.jsp?num="+num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>