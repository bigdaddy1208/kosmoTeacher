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


<title>�ھȽ� ����</title>
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
				style="color: AliceBlue"></i> <!-- ��Ʈ -->
				<a class="navbar-brand"
				href="pro.kosmo?cmd=index"> �ھȽ� ���� </a> 
				<i
				class="fa-solid fa-2xl fa-fade fa-heart-pulse"
				style="color: AliceBlue"></i><!-- ��Ʈ -->
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>



			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto" id="menu">
					<li class="nav-item"><a href="#intro" class="nav-link">�����Ұ�</a>
						<ul class="subMenu" id="subMenu1">
							<li><a href="">�λ縻</a></li>
							<li><a href="">����</a></li>
							<li><a href="">����ð�ǥ</a></li>
							<li><a href="">�Ƿ����Ұ�</a></li>
							<li><a href="">ã�ƿ��ô±�</a></li>
						</ul></li>
					<li class="nav-item"><a href="#internal-clinic" class="nav-link">����Ŭ����</a>
						<ul class="subMenu" id="subMenu2">
							<li><a href="">������ȯ</a></li>
							<li><a href="">����ȯ</a></li>
							<li><a href="">������</a></li>
							<li><a href="">�索</a></li>
						</ul></li>
					<li class="nav-item"><a href="#overweight-clinic" class="nav-link">��Ŭ����</a>
						<ul class="subMenu" id="subMenu3">
							<li><a href="">��������ֻ�</a></li>
							<li><a href="">���ñ�</a></li>
							<li><a href="">���ñ�1</a></li>
							<li><a href="">���ñ�2</a></li>
						</ul></li>
					<li class="nav-item"><a href="#clinic" class="nav-link">�ǰ�����</a>
						<ul class="subMenu" id="subMenu4">
							<li><a href="">�˻� �� ���ǻ���</a></li>
							<li><a href="">�ǰ���������</a></li>
							<li><a href="">�⺻���հ���</a></li>
							<li><a href="">���аǰ�����</a></li>
						</ul></li>
					<li class="nav-item"><a href="" class="nav-link">����������</a>
						<ul class="subMenu" id="subMenu4">
							<li><a href="">��������</a></li>
							<li><a href="">���ǼҸ�</a></li>
							<li><a href="">�����Խ���</a></li>
							<li><a href="">�ǰ�����</a></li>
						</ul></li>
					<li class="nav-item"><a href="#contact" class="nav-link">Q&A</a></li>
				</ul>
				<ul class="navbar-nav ms-auto">
					<c:choose>
						<c:when test="${sessionScope.pid==null }">
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded"
								href="pro.kosmo?cmd=login&scmd=form">�α���</a></li>
								<!--  
								<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded"
								href="pro.kosmo?cmd=calen">Ķ����</a></li>
								-->
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded"
								href="pro.kosmo?cmd=member&scmd=mform">ȸ������</a></li>
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