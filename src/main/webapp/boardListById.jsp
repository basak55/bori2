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
String id = request.getParameter("id");

BoardDao dao = BoardDao.getInstance();
ArrayList<Board> list = dao.selectById(id);

%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>작성글목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
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
		<h1><%=id %>님 작성글 목록</h1>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">TITLE</th>
					<th scope="col">ID</th>
					<th scope="col">REGTIME</th>					
					<th scope="col">HITS</th>																	
				</tr>
			</thead>
			<tbody>
<%
for (Board board : list){
%>
				<tr>
					<th scope="row"><%=board.getNum() %></th>
					<td><a href="boardView.jsp?num=<%=board.getNum() %>" class="link-secondary"><%=board.getTitle() %></a></td>
					<td><%=board.getId() %></td>
					<td><%=board.getRegtime() %></td>
					<td><%=board.getHits() %></td>
				</tr>
<%
}
%>
			</tbody>
		</table>
		
		<a class="btn btn-dark float-end" href="boardForm.jsp">
		<i class="fas fa-edit"></i> 글 작성</a>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

</body>
</html>