<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="css/codpenSlide.css" rel="stylesheet" type="text/css">


<title>코안심 내과</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<!-- style-->
<style>
#menu{
	font-size: 20px;
	text-align: center;
}
nav .subMenu{
	font-size: 16px;
	color : silver;
    display: none;
	text-align: center;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    list-style: none;
}

nav:hover .subMenu{
    display: flex;
}
</style>

</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<i class="fa-solid fa-2xl fa-fade fa-heart-pulse"
				style="color: AliceBlue"></i> <!-- 하트 -->
				<a class="navbar-brand"
				href="pro.kosmo?cmd=index"> 코안심 내과 </a> 
				<i
				class="fa-solid fa-2xl fa-fade fa-heart-pulse"
				style="color: AliceBlue"></i><!-- 하트 -->
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>



			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto" id="menu">
					<li class="nav-item"><a href="#intro" class="nav-link">병원소개</a>
						<ul class="subMenu" id="subMenu1">
							<li><a href="">인사말</a></li>
							<li><a href="">연혁</a></li>
							<li><a href="">진료시간표</a></li>
							<li><a href="">의료진소개</a></li>
							<li><a href="">찾아오시는길</a></li>
						</ul></li>
					<li class="nav-item"><a href="#internal-clinic" class="nav-link">내과클리닉</a>
						<ul class="subMenu" id="subMenu2">
							<li><a href="">위장질환</a></li>
							<li><a href="">간질환</a></li>
							<li><a href="">고혈압</a></li>
							<li><a href="">당뇨</a></li>
						</ul></li>
					<li class="nav-item"><a href="#overweight-clinic" class="nav-link">비만클리닉</a>
						<ul class="subMenu" id="subMenu3">
							<li><a href="">지방분해주사</a></li>
							<li><a href="">뭐시기</a></li>
							<li><a href="">뭐시기1</a></li>
							<li><a href="">뭐시기2</a></li>
						</ul></li>
					<li class="nav-item"><a href="#clinic" class="nav-link">건강검진</a>
						<ul class="subMenu" id="subMenu4">
							<li><a href="">검사 전 유의사항</a></li>
							<li><a href="">건강검진예약</a></li>
							<li><a href="">기본종합검진</a></li>
							<li><a href="">정밀건강검진</a></li>
						</ul></li>
					<li class="nav-item"><a href="" class="nav-link">고객만족센터</a>
						<ul class="subMenu" id="subMenu4">
							<li><a href="">공지사항</a></li>
							<li><a href="">고객의소리</a></li>
							<li><a href="">자유게시판</a></li>
							<li><a href="">건강정보</a></li>
						</ul></li>
					<li class="nav-item"><a href="#contact" class="nav-link">Q&A</a></li>
				</ul>
				<ul class="navbar-nav ms-auto">
					<c:choose>
						<c:when test="${sessionScope.pid==null }">
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded"
								href="pro.kosmo?cmd=login&scmd=form">로그인</a></li>
								<!--  
								<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded"
								href="pro.kosmo?cmd=calen">캘린더</a></li>
								-->
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded"
								href="pro.kosmo?cmd=member&scmd=mform">회원가입</a></li>
						</c:when>

						<c:otherwise>
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded"
								href="pro.kosmo?cmd=member&scmd=mypage">MyPage</a></li>
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded"
								href="pro.kosmo?cmd=nvdate&scmd=nform">Reservation</a></li>
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded"
								href="pro.kosmo?cmd=login&scmd=logout">Logout</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>



		</div>
	</nav>