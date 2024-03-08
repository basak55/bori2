<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//로그인 체크
String memberId = (String)session.getAttribute("memberId");
if (memberId == null){
	response.sendRedirect("MemberLoginForm.jsp");
}

MemberDao dao = MemberDao.getInstance();
ArrayList<Member> list = dao.selectAll();

%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시글리스트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style type="text/css">
a{text-decoration: none;}
</style>
</head>
<body>
<%@ include file="navbarForAdmin.jsp" %>

	<div class="container" style="padding-top: 50px">
		<h1>Member List</h1>
		<table class="table table-bordered table-hover">
			<thead>

				<tr>
					<th scope="col">#</th>
					<th scope="col">ID</th>
					<th scope="col">EMAIL</th>
					<th scope="col">NAME</th>
					<th scope="col"> </th>					
					<th scope="col"> </th>					
				</tr>
			</thead>
			<tbody>
<%
for(Member member : list){
%>
				<tr>
					<th scope="row"><%=member.getMemberno()%></th>
					<td><%=member.getId()%></td>
					<td><%=member.getEmail()%></td>
					<td><%=member.getName()%></td>
					<td><a href="memberUpdateForm.jsp?memberno=<%=member.getMemberno()%>" class="link-secondary">수정</a></td>
					<td><a href="memberDelete.jsp?memberno=<%=member.getMemberno()%>" class="link-secondary">삭제</a></td>
				</tr>
<%
}
%>
			</tbody>
		</table>

		<button type="button" class="btn btn-dark float-end" onClick="move()">회원등록</button>		
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
		
	<script>
		function move(){
			location.href="memberForm.jsp";
		}
	</script>
</body>
</html>