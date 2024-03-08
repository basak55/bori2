<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String memberId = (String)session.getAttribute("memberId");
if (memberId == null){
	response.sendRedirect("memberLoginForm.jsp");
}

String num = request.getParameter("num");

BoardDao dao = BoardDao.getInstance();
Board board = dao.updateSelect(Integer.parseInt(num));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
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
	<h1>글 수정</h1>
		<form action="boardUpdate.jsp" method="post">
			<div class="mb-3 ">
				<label class="form-label">글번호</label> 
				<input type="text" name="num" class="form-control" id="idInput" readOnly value="<%=board.getNum() %>" >
			</div>
			<div class="mb-3 ">
				<label for="idInput" class="form-label">제목</label> 
				<input type="text" name="title" class="form-control" id="idInput" value="<%=board.getTitle() %>" >
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">내용</label>
				<input type="text" name="content" class="form-control"
					id="exampleFormControlInput1" value="<%=board.getContent() %>">
			</div>
			<button class="btn btn-dark float-end">수정</button>
			<button type="button" class="btn btn-dark" onClick='location.href="boardList.jsp"'>이전으로</button>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>