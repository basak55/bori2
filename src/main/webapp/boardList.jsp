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
			<div class="col-lg-4">
				<input type="text" class="form-control pull-right"
					placeholder="Search" name="searchWord" />
			</div>
              <div class="input-group">
                <span class="input-group-text" id="basic-addon1">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
</svg>
                </span>
                <input type="text" class="form-control" placeholder="Input group example" aria-label="Input group example" aria-describedby="basic-addon1">
              </div>
                </span>
			</button>
		</form>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

</body>
</html>