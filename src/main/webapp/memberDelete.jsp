<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberno = request.getParameter("memberno");
	MemberDao dao = MemberDao.getInstance();
	dao.delete(Integer.parseInt(memberno));

	response.sendRedirect("memberList.jsp");
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