<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String memberId = (String) session.getAttribute("memberId");

request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String email = request.getParameter("email");
String name = request.getParameter("name");

MemberDao dao = MemberDao.getInstance();
Member member = dao.insert(id, email, name);

response.sendRedirect("index.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<body>
</body>
</html>