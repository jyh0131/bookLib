<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	// 사이드메뉴 포커스
	$(function() {
		$(".sideItem").removeClass("sideView");
		$(".sideItem").find(".fas").remove();
		
		var subUrl = location.href.split("/");
		var	subUrlName = subUrl[subUrl.length-1];
		
		if(subUrlName == "profile.do") {
			$(".item1").addClass("sideView");
			$(".item1").append("<i class='fas fa-angle-right iconView'></i>");
		}
	})
</script>


<aside class="sideMenu">
	<ul class="sideUl">
		<li class="sideTitle">프로필</li>
		<li><a class="sideItem item1" href="${pageContext.request.contextPath}/admin/profile/profile.do">프로필 수정</a></li>
	</ul>
</aside>