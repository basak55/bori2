
<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String email = request.getParameter("email");

MemberDao dao = MemberDao.getInstance();
Member member = dao.selectForLogin(id, email);

if(member.getId().equals("admin")){
	session.setAttribute("memberId", id);
	session.setAttribute("memberEmail", email);
	response.sendRedirect("memberList.jsp");
} else {
	session.setAttribute("memberId", id);
	session.setAttribute("memberEmail", email);
	response.sendRedirect("index.jsp");
} 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 만들어보기</title>
</head>
<body>
</body>
</html>