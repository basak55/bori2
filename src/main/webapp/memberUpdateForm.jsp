<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String mno = request.getParameter("memberno");
	String memberId = (String) session.getAttribute("memberId");

	MemberDao dao = MemberDao.getInstance();
	Member member = dao.selectOne(Integer.parseInt(mno));
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
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
	<%@ include file="navbar.jsp"%>
	<%
	} else {
	%>
	<%@ include file="navbarForAdmin.jsp"%>
	<%
	}
	%>


	<div class="container" style="padding-top: 50px">
	<h1>Member Information Management</h1>
		<form action="memberUpdate.jsp" method="post">
			<div class="mb-3">
				<label for="membernoInputInput" class="form-label">회원번호</label> 
				<input type="text" readOnly name="memberno" value="<%=member.getMemberno() %>" class="form-control" id="membernoInput" placeholder="회원번호">
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
			<button type="button" class="btn btn-dark float-end" onClick="move()">이전으로</button>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script>
		function move(){
			location.href="memberList.jsp";
		}
	</script>
</body>
</html>