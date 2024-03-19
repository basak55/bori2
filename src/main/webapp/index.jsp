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

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style>
.jumbotron {
  display: flex;
  align-items: center;
  background-image: url("img/vijinx.jpg");
  background-size: cover;
  color: #ffffff;
  height: 500px;
}
.jumbotron h2 {
  font-size: 60px;
  font-weight: 700;
  margin: 0;
  color: #fff;
}
.jumbotron h3 {
  margin: 0 0 20px;
  color: #fff;
}
.btn.btn-secondary {
  border-radius: 30px;
  border: none;
  color: #000000;
  text-shadow: 10px;
  background-color: #ffffff;
  font-size: 15px;
  padding: 10px 20px;
  width: fit-content;
  margin: auto;
}
.ahffk{
  display: flex;
  justify-content: flex-end;
  align-items: center;
  height: 30px;
 }
section .row img {
  width: 500px;
  height: 300px;
  object-fit: cover;
}
#q {
  margin: 30px 40px 40px;
  border-radius: 30px;
  width: 500px;
  height: 300px;
  border : 1px solid #000;
  background-image: url("img/jinx.jpg");
  background-size: cover; /* 이미지를 요소에 맞게 확대 또는 축소하여 채웁니다. */
  background-position: center; /* 이미지를 가운데 정렬합니다. */
}
#w {
  margin: 30px 40px 40px;
  border-radius: 30px;
  width: 500px;
  height: 300px;
  border : 1px solid #000;
  background-image: url("img/ball.jpg");
  background-size: cover; 
  background-position: center; 
}
#e {
  margin: 30px 40px 40px;
  border-radius: 30px;
  width: 500px;
  height: 300px;
  border : 1px solid #000;
  background-image: url("img/powder.jpg");
  background-size: cover; 
  background-position: center; /
}
#r {
  margin: 30px 40px 40px;
  border-radius: 30px;
  width: 500px;
  height: 300px;
  border : 1px solid #000;
  background-image: url("img/vijinx.jpg");
  background-size: cover;
  background-position: center;
}
footer {
  font-size: 12px;
  padding: 20px 0;
}
footer .col-sm-8 {
  display: flex;
  justify-content: flex-end;
}
footer ul {
  list-style: none;
}
footer li img {
  width: auto;
  height: 30px;
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

	<section class="ahffk">
	<p><%=memberInfo %></p>
	<a class="btn btn-outline-dark btn-sm"
		style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" 
		href="memberLoginForm.jsp">로그인</a>
	<a class="btn btn-outline-dark btn-sm" 
		style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;"
		href="memberForm.jsp">회원가입</a>
	</section>
	<section class="jumbotron">
		<div class="container">
			<div class="row text-center">
				<h2>ARCANE</h2>
				<h3>제작 노트</h3>
				<a class="btn btn-secondary" href="#" role="button"><b>알아보기</b></a>
			</div>
		</div>
	</section>


    <section class="container">
        <div class="row justify-content-center">
            <figure class="col-sm-6" id="q">
                <p class="text-white">20240320 Coming soon</p>
            </figure>
            <figure class="col-sm-6 mb-5" id="w">
                <p class="text-white">20240307</p>
            </figure>
        </div>
        <div class="row justify-content-center">
            <figure class="col-sm-6" id="e">
                <p class="text-white">20230727</p>
            </figure>
            <figure class="col-sm-6" id="r">
                <p class="text-white">20230122</p>
            </figure>
        </div>
    </section>

    <footer class="container">
        <div class="row">
            <p class="col-sm-4">&copy; 2024BOMIKIM</p>
            <ul class="col-sm-8">
                <li class="col-sm-1"><a target="_blank" href="https://boriccorii.tistory.com/">
                    <img src="img/logo2.png"/>
                </a></li>
            </ul>
        </div>
    </footer>
    
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>

</html>