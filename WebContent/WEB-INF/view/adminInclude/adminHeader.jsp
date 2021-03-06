<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관리 - 관리자용</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminCommon.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminSideMenu.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/6f2f0f2d95.js"></script>
<script src="${pageContext.request.contextPath}/js/adminCommon.js"></script>

<script>
	$(function(){
		$(".menu").removeClass("menuView")
		
		var url = location.href.split("/");
		var urlName = url[url.length-2];
		
		// 기능명으로 구분
		
		switch (urlName) {
		//도서관리
		case "book":
			$(".menu2").addClass("menuView");
			break
		//회원관리
		case "user":
			$(".menu3").addClass("menuView");
			break
		//직원관리
		case "staff":
			$(".menu5").addClass("menuView");
			break
		//프로필
		case "profile":
			$(".menu7").addClass("menuView");
			break
		//대여반납
		case "lending":
			$(".menu4").addClass("menuView");
			break
		//통계
		case "statistics":
			$(".menu6").addClass("menuView");
			break
			
			
		default:
			$(".menu1").addClass("menuView");
			break;
		}
	})
</script>

</head>
<body>
	<header>
		<nav>
			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/home.do" class="menu menu1"><i class="fas fa-home icon"></i><br>HOME</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/book/add.do" class="menu menu2"><i class="fas fa-book icon"></i><br>도서관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/user/userAdd.do" class="menu menu3"><i class="fas fa-users icon"></i><br>회원관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/lending/Rent.do" class="menu menu4"><i class="fas fa-window-restore icon"></i><br>대여/반납관리</a></li>
				<c:if test="${Title == 0 }">
					<li><a href="${pageContext.request.contextPath}/admin/staff/management.do" class="menu menu5"><i class="fas fa-user-tie icon"></i><br>직원관리</a></li>
				</c:if>
				<li><a href="${pageContext.request.contextPath}/admin/statistics/LendingStatistics.do" class="menu menu6"><i class="fas fa-chart-pie icon"></i><br>통계조회</a></li>

				<li><a href="${pageContext.request.contextPath}/admin/profile/adminProfilePwCheck.do" class="menu menu7"><i class="far fa-id-card icon"></i><br>프로필</a></li>
				<li><a href="${pageContext.request.contextPath}/user/home.do" class="menu menu8"><i class="fas fa-door-open icon"></i><br>나가기</a></li>
				<li><a class="blue" href="${pageContext.request.contextPath }/login/logout.do"><i class="blue fas fa-sign-in-alt icon"></i><br>로그아웃</a></li>

			</ul>
			<div class="logoWrap">
				<img src="${pageContext.request.contextPath}/images/logo2.png" alt="로고" />
			</div>
		</nav>
	</header>
	<section class="content clearfix">