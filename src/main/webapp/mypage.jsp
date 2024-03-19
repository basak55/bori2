<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String memberId = (String) session.getAttribute("memberId");
if (memberId == null) {
	response.sendRedirect("memberLoginForm.jsp");
}

MemberDao dao = MemberDao.getInstance();
Member member = dao.selectById(memberId);

%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
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
	<h1>My Page</h1>
		<form action="memberUpdate.jsp" method="post">
			<div class="mb-3">
				<input type="hidden" readOnly name="memberno" value="<%=member.getMemberno() %>" class="form-control" id="membernoInput" placeholder="회원번호">
			</div>
			<div class="mb-3">
				<label for="idInput" class="form-label">아이디</label> 
				<input type="text" name="id" value="<%=member.getId() %>" class="form-control" id="idInput" placeholder="아이디">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">이메일</label>
				<input type="email" name="email" value="<%=member.getEmail() %>" class="form-control"
					id="exampleFormControlInput1" placeholder="name@example.com">
			</div>
			<div class="mb-3">
				<label for="nameInput" class="form-label">이름</label> 
				<input type="text" name="name" value="<%=member.getName() %>" class="form-control" id="nameInput" placeholder="이름">
			</div>
			<button class="btn btn-dark">수정</button>
			<a href="memberDelete.jsp" class="btn btn-dark">회원탈퇴</a>
			<button type="button" class="btn btn-dark float-end" onClick="">이전으로</button>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>