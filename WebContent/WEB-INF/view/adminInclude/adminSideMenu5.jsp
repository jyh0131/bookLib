<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>
	// 사이드메뉴 포커스
	$(function() {
		$(".sideItem").removeClass("sideView");
		$(".sideItem").find(".fas").remove();
		
		var subUrl = location.href.split("/");
		var	subUrlName = subUrl[subUrl.length-1];
		
		// do 이름으로 구분 (작업 시작하면 주석풀고 페이지에 맞게 설정하면 됨)
		if(subUrlName == "LendingStatistics.do") {
			$(".item1").addClass("sideView");
			$(".item1").append("<i class='fas fa-angle-right iconView'></i>");
		}
		if(subUrlName == "BookStatistics.do") {
			$(".item2").addClass("sideView");
			$(".item2").append("<i class='fas fa-angle-right iconView'></i>");
		}		
		if(subUrlName == "MemberStatistics.do") {
			$(".item3").addClass("sideView");
			$(".item3").append("<i class='fas fa-angle-right iconView'></i>");
		}
		if(subUrlName == "CategoryStatistics.do") {
			$(".item4").addClass("sideView");
			$(".item4").append("<i class='fas fa-angle-right iconView'></i>");
		}
	})
</script>

<aside class="sideMenu">
	<ul class="sideUl">
		<li class="sideTitle">통계조회</li>
		<li><a class="sideItem item1" href="${pageContext.request.contextPath}/admin/statistics/LendingStatistics.do">대여 / 반납 현황<i class="fas fa-angle-right iconView"></i></a></li>
		<li><a class="sideItem item2" href="${pageContext.request.contextPath}/admin/statistics/BookStatistics.do">도서보유현황</a></li>
		<li><a class="sideItem item3" href="${pageContext.request.contextPath}/admin/statistics/MemberStatistics.do">이용자현황</a></li>
		<li><a class="sideItem item4" href="${pageContext.request.contextPath}/admin/statistics/CategoryStatistics.do">카테고리별 대여 순위</a></li>
	</ul>
</aside>