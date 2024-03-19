<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String memberId = (String) session.getAttribute("memberId");
String memberInfo = " ";
if (memberId == null) {
	memberInfo = "로그인을 해주세요.";
} else {
	memberInfo = memberId + "님이 로그인 하셨습니다.";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>