<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String memberId = (String) session.getAttribute("memberId");
if (memberId == null) {
	response.sendRedirect("memberLoginForm.jsp");
}

BoardDao dao = BoardDao.getInstance();
ArrayList<Board> list = dao.selectAll();
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
<style type="text/css">
a {
	text-decoration: none;
}
</style>
</head>

<body>

	<%
	if (!memberId.equals("admin")) {
	%>
	<%@ include file="navbar.jsp"%>
	<%
	} else {
	%>
	<%@ include file="navbarForAdmin.jsp"%>
	<%
	}
	%>

	<div class="container" style="padding-top: 50px">
		<h1>Community Board</h1>
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
				for (Board board : list) {
				%>
				<tr>
					<th scope="row"><%=board.getNum()%></th>
					<td><a href="boardView.jsp?num=<%=board.getNum()%>"
						class="link-secondary"><%=board.getTitle()%></a></td>
					<td><a href="boardListById.jsp?id=<%=board.getId()%>"
						class="link-secondary"><%=board.getId()%></a></td>
					<td><%=board.getRegtime()%></td>
					<td><%=board.getHits()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<a class="btn btn-dark float-end" href="boardForm.jsp"> <i
			class="fas fa-edit"></i> 글 작성
		</a>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

</body>
</html>