<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String memberId = (String)session.getAttribute("memberId");
if (memberId == null){
	response.sendRedirect("memberLoginForm.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 쓰기</title>
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
	<h1>새 글 작성</h1>
		<form action="boardInput.jsp" method="post">
			<div class="mb-3 ">
				<label for="idInput" class="form-label">제목</label> 
				<input type="text" name="title" class="form-control" id="idInput" placeholder="제목 입력">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">내용</label>
				<input type="text" name="content" class="form-control"
					id="exampleFormControlInput1" placeholder="내용 입력">
			</div>
			<button class="btn btn-dark float-end">작성</button>
			<button type="button" class="btn btn-dark" onClick='location.href="boardList.jsp"'>이전으로</button>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>