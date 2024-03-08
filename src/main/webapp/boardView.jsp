<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String memberId = (String)session.getAttribute("memberId");
if (memberId == null){
	response.sendRedirect("memberLoginForm.jsp");
}

String num = request.getParameter("num");

BoardDao dao = BoardDao.getInstance();
Board board = dao.selectOne(Integer.parseInt(num));

%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티 게시판</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style>
div 
</style>
</head>
<body>
<%
if (!memberId.equals("admin")) {
%>
<%@ include file="navbar.jsp" %>
<%
} else {
%>	
<%@ include file="navbarForAdmin.jsp" %>
<%
}
%>

	<div class="container" style="padding-top: 50px">
		<h1>Community Board</h1>

		<article class="blog-post">
        	<h2 class="display-5 mb-2 text-primary-emphasis"><%=board.getTitle()%></h2>
        	<p class="blog-post-meta">작성시간 <%=board.getRegtime() %>  조회수 <%=board.getHits()%></p>
			<p class="blog-post-meta"><a href="boardListById.jsp" class="link-secondary"><%=board.getId()%></a></p>

       		<p><%=board.getContent()%></p>
        	<hr>

		<button type="button" class="btn btn-dark" onClick='location.href="boardList.jsp"'>이전으로</button>
		<a class="btn btn-dark float-end" href="boardForm.jsp">
		<i class="fas fa-edit"></i> 새글</a>

<%
if (memberId.equals("admin") || memberId.equals(board.getId())) {
%>		
		<a class="btn btn-dark float-end" href="boardDelete.jsp?num=<%=board.getNum()%>">
		<i class="fas fa-edit"></i> 삭제</a>
		
		<a class="btn btn-dark float-end" href="boardUpdateForm.jsp?num=<%=board.getNum()%>">
		<i class="fas fa-edit"></i> 수정</a>
	</div>
<%
}
%>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

</body>
</html>