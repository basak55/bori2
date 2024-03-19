<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String memberId = (String) session.getAttribute("memberId");
	String memberno = request.getParameter("memberno");
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	
	MemberDao dao = MemberDao.getInstance();
	dao.update(id,email,name,Integer.parseInt(memberno));

	if(memberId != null && memberId.equals("admin"))
		response.sendRedirect("memberList.jsp");
	else
		response.sendRedirect("mypage.jsp");
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