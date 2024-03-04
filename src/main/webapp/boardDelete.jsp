<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String num = request.getParameter("num");

BoardDao dao = BoardDao.getInstance();
dao.delete(Integer.parseInt(num));

response.sendRedirect("boardList.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>