<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
	//사이드메뉴 포커스
	$(function() {
		$(".sideItem").removeClass("sideView");
		$(".sideItem").find(".fas").remove();
		
		var subUrl = location.href.split("/");
		var	subUrlName = subUrl[subUrl.length-1];
		
		// do 이름으로 구분
		switch (subUrlName) {
		case "add.do":
			$(".item1").addClass("sideView");
			$(".item1").append("<i class='fas fa-angle-right iconView'></i>");
			break
		case "list.do":
			$(".item2").addClass("sideView");
			$(".item2").append("<i class='fas fa-angle-right iconView'></i>");
			break;
		case "update.do":
			$(".item2").addClass("sideView");
			$(".item2").append("<i class='fas fa-angle-right iconView'></i>");
			break;
		} 
	})
</script>

<aside class="sideMenu">
	<ul class="sideUl">
		<li class="sideTitle">도서관리</li>
		<li><a class="sideItem item1" href="${pageContext.request.contextPath}/admin/book/add.do">도서등록</a></li>
		<li><a class="sideItem item2" href="${pageContext.request.contextPath}/admin/book/list.do">보유도서 관리</a></li>
		<li><a class="sideItem item3" href="#">신청도서 조회</a></li>
		<li><a class="sideItem item4" href="#">추천도서 등록</a></li>
		<li><a class="sideItem item5" href="#">출판사 관리</a></li>
		<li><a class="sideItem item6" href="#">분류관리</a></li>
	</ul>
</aside>