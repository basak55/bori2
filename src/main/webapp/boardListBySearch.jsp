<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String memberId = (String) session.getAttribute("memberId");
if (memberId == null) {
	response.sendRedirect("memberLoginForm.jsp");
}
String title = request.getParameter("searchWord");

BoardDao dao = BoardDao.getInstance();
ArrayList<Board> list = dao.selectForSearch(title);
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티 게시판 - 검색결과</title>
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
	if (memberId == null || !memberId.equals("admin")) {
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
		<h3><%=title %>검색 결과</h3>
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
		<form method="post" action="#">
    		<div class="row">
        		<div class="col-lg-4 d-flex">
            		<input type="text" class="form-control mr-2" placeholder="Search" name="searchWord" />
            		<button class="btn btn-secondary" type="submit">
                		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                    	<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                		</svg>
            		</button>
        		</div>
    		</div>
		</form>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

</body>
</html>