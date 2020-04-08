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
		if(subUrlName == "Rent.do") {
			$(".item1").addClass("sideView");
			$(".item1").append("<i class='fas fa-angle-right iconView'></i>");
		}
		if(subUrlName == "Return.do") {
			$(".item2").addClass("sideView");
			$(".item2").append("<i class='fas fa-angle-right iconView'></i>");
		}		
		if(subUrlName == "Overdue.do" || subUrlName.match("recom") != null) {
			$(".item4").addClass("sideView");
			$(".item4").append("<i class='fas fa-angle-right iconView'></i>");
		}
	})
</script>


<aside class="sideMenu">
	<ul class="sideUl">
		<li class="sideTitle">대여 / 반납관리</li>
		<li><a class="sideItem item1" href="${pageContext.request.contextPath}/admin/lending/Rent.do">대여관리</a></li>
		<li><a class="sideItem item2" href="${pageContext.request.contextPath}/admin/lending/Return.do">반납관리</a></li>
		<li><a class="sideItem item3" href="${pageContext.request.contextPath}/admin/lending/Overdue.do">연체조회</a></li>
	</ul>
</aside>