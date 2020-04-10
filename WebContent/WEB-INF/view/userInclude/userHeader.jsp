<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3조 도서관</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userCommon.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userSideMenu.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/6f2f0f2d95.js"></script>
<script src="${pageContext.request.contextPath}/js/userCommon.js"></script>
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
		
		// 로그인 회원만 이동 가능 [관리자, 비회원은 들어갈 수 없도록 함]
		$(".joinMem").click(function() {
			var isMenu = $(this).text();
			
			if(isMenu == "도서관서비스" || isMenu == "희망도서신청"){
				$.ajax({
					url:"${pageContext.request.contextPath}/user/book/requestAdd.do",
					type:"get",
					datatype: "json", 
					success:function(res){
						console.log(res);
						if(res.result == "notLogin") {
							alert("로그인 후 이용가능합니다.");
							location.href = "${pageContext.request.contextPath}/login/login.do";
							return false;
						}
						
						if(res.result == "libLogin") {
							alert("회원에게 제공되는 서비스입니다.");
							location.href = "${pageContext.request.contextPath}/user/home.do";
							return false;
						}
					}
				})
			}
			
			if(isMenu == "나의 도서관" || isMenu == "내정보수정"){
				return false;
			}
			
			if(isMenu == "이용현황"){
				$.ajax({
					url:"${pageContext.request.contextPath}/user/member/uesList.do",
					type:"get",
					datatype: "json", 
					success:function(res){
						console.log(res);
						if(res.result == "notLogin") {
							alert("로그인 후 이용가능합니다.");
							location.href = "${pageContext.request.contextPath}/login/login.do";
							return false;
						}
						
						if(res.result == "libLogin") {
							alert("회원에게 제공되는 서비스입니다.");
							location.href = "${pageContext.request.contextPath}/user/home.do";
							return false;
						}
					}
				})
			}
			
			if(isMenu == "희망도서신청현황"){
				$.ajax({
					url:"${pageContext.request.contextPath}/user/book/requestList.do",
					type:"get",
					datatype: "json", 
					success:function(res){
						console.log(res);
						if(res.result == "notLogin") {
							alert("로그인 후 이용가능합니다.");
							location.href = "${pageContext.request.contextPath}/login/login.do";
							return false;
						}
						
						if(res.result == "libLogin") {
							alert("회원에게 제공되는 서비스입니다.");
							location.href = "${pageContext.request.contextPath}/user/home.do";
							return false;
						}
					}
				})
			}
			
			//return false;
		})
	})
</script>
</head>
<body>
	<header>
		<div class="menuTop container">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/user/home.do"><img src="${pageContext.request.contextPath}/images/logo.png" alt="로고" /></a>
			</div>
			<div class="topMenuWrap">
				<ul class="topMenu">
 					
						<c:if test="${Lib ==null }">
							<c:if test="${Mem ==null }">
								<li><a href="${pageContext.request.contextPath }/login/login.do">로그인</a></li>
								<li><a href="${pageContext.request.contextPath }/user/member/Join.do">회원가입</a></li>
							</c:if>
						</c:if>
						
						<c:if test="${Lib != null }">
							<li><a href="#">[${Lib }]</a> 님 환영합니다!</li>
							<li><a href="${pageContext.request.contextPath }/login/logout.do">로그아웃</a></li>
							<li class="adminBtn"><a href="${pageContext.request.contextPath}/admin/home.do">관리자</a></li>
						</c:if>
						
						<c:if test="${Mem != null }">
							<li><a href="#">[${Mem }]</a> 님 환영합니다!</li>
							<li><a href="${pageContext.request.contextPath }/login/logout.do">로그아웃</a></li>
						</c:if>
				</ul>
			</div>
		</div>
		<nav class="menuBottom">
			<ul class="mainMenu container clearfix">
				<li>
					<a class="menu" href="${pageContext.request.contextPath}/user/book/list.do">자료검색</a>
					<ul class="subMenu">
						<li><a href="${pageContext.request.contextPath}/user/book/list.do">통합자료검색</a></li>
						<li><a href="#">신착도서</a></li>
						<li><a href="#">대출베스트</a></li>
						<li><a href="#">이달의 추천도서</a></li>
					</ul>
				</li>
				<li>
					<a class="menu" href="#">독서문화강좌</a>
				</li>
				<li>
					<a class="menu joinMem" href="${pageContext.request.contextPath}/user/book/requestAdd.do">도서관서비스</a>
					<ul class="subMenu">
						<li><a class="joinMem" href="${pageContext.request.contextPath}/user/book/requestAdd.do">희망도서신청</a></li>
					</ul>
				</li>
				<li>
					<a class="menu joinMem" href="#">나의도서관</a>
					<ul class="subMenu">
						<li><a class="joinMem" href="#">내정보수정</a></li>
						<li><a class="joinMem" href="${pageContext.request.contextPath}/user/member/uesList.do">이용현황</a></li>
						<li><a class="joinMem" href="${pageContext.request.contextPath}/user/book/requestList.do">희망도서신청현황</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</header>
	<section class="content">
		<div class="container mainCtn">
			<div class="contentBg clearfix">