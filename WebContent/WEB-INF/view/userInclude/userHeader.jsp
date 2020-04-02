<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3조 도서관</title>
<link rel="stylesheet" href="../css/userCommon.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/6f2f0f2d95.js"></script>
<script>
	$(function(){
		$(".menu").hover(function() {
			$(this).next().show();
		}, function() {
			$(this).next().hide();
		})
		
		$(".subMenu").hover(function() {
			$(this).show();
		}, function() {
			$(this).hide();
		})
	})
</script>
</head>
<body>
	<header>
		<div class="menuTop container">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/user/home.do"><img src="../images/logo.png" alt="로고" /></a>
			</div>
			<div class="topMenuWrap">
				<c:if test="${Auth == null }">
					<ul class="topMenu">
						<li><a href="${pageContext.request.contextPath }/user/login.do">로그인</a></li>
						<li><a href="#">회원가입</a></li>
						<li class="adminBtn"><a href="${pageContext.request.contextPath}/admin/home.do">관리자</a></li>
					</ul>
				</c:if>
				<c:if test="${Auth !=null }">
					<ul class="topMenu">
						<li>[${Auth}]님 환영합니다!</li>
						<li><a href="${pageContext.request.contextPath }/user/logout.do">로그아웃</a></li>
						<li class="adminBtn"><a href="${pageContext.request.contextPath}/admin/home.do">관리자</a></li>
					</ul>
				</c:if>
			</div>
		</div>
		<nav class="menuBottom">
			<ul class="mainMenu container clearfix">
				<li>
					<a class="menu" href="#">자료검색</a>
					<ul class="subMenu">
						<li><a href="#">통합자료검색</a></li>
						<li><a href="#">신착도서</a></li>
						<li><a href="#">대출베스트</a></li>
						<li><a href="#">이달의 추천도서</a></li>
					</ul>
				</li>
				<li>
					<a class="menu" href="#">독서문화강좌</a>
				</li>
				<li>
					<a class="menu" href="#">도서관서비스</a>
					<ul class="subMenu">
						<li><a href="#">희망도서신청</a></li>
					</ul>
				</li>
				<li>
					<a class="menu" href="#">나의도서관</a>
					<ul class="subMenu">
						<li><a href="#">내정보수정</a></li>
						<li><a href="#">이용현황</a></li>
						<li><a href="#">희망도서신청현황</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</header>
	<section class="content">
		<div class="container clearfix mainCtn">