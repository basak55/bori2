<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//로그인 체크
String memberId = (String)session.getAttribute("memberId");
if (memberId == null){
	response.sendRedirect("loginForm.jsp");
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
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary bg-dark border-bottom border-body" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">BORICCORI</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="boardList.jsp">Community</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Mypage</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.jsp">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

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
					<td><a href="memberUpdateForm.jsp?memberno=<%=member.getMemberno()%>">수정</a></td>
					<td><button onClick='location.href="memberDelete.jsp?memberno=<%=member.getMemberno()%>"'>삭제</button></td>
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