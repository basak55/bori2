
<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String email = request.getParameter("email");
String ck = request.getParameter("ck");

MemberDao dao = MemberDao.getInstance();
Member member = dao.selectForLogin(id, email);

if(ck != null && ck.equals("on")){
	Cookie cookie = new Cookie("id", id);
	cookie.setMaxAge(60*10);
	response.addCookie(cookie);
} else{
	Cookie cookie = new Cookie("id", null);
	cookie.setMaxAge(0);
	response.addCookie(cookie);
}

//로그인 정보 확인
if(member != null && email.equals(member.getEmail()) && id.equals(member.getId())){ //db정보와 입력정보 확인
	session.setAttribute("memberId", id);
	session.setAttribute("memberEmail", email);
	response.sendRedirect("index.jsp"); 
} else {
	response.sendRedirect("loginError.jsp");
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 만들어보기</title>
</head>
<body>
</body>
</html>