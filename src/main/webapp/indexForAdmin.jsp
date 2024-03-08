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
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>

<%@ include file="navbarForAdmin.jsp" %>

<div>
관리자페이지
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-2OiA9F3kUJ8OVrZ9YGJoPb4O9gFoY03jzkg25pL54vqoff4IFiwBofxfvbq6PwIc" crossorigin="anonymous"></script>
</body>
</html>