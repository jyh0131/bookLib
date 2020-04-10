<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	//사이드메뉴 포커스
	$(function(){
		$(".asideMenuItem").removeClass("asidView");
		
		var subUrl = location.href.split("/");
		var	subUrlName = subUrl[subUrl.length-1];
		
		// do 이름으로 구분
		if(subUrlName == "uesList.do") {
			$(".item2").addClass("asidView");
		}
		if(subUrlName == "requestList.do") {
			$(".item3").addClass("asidView");
		}
		
	})
</script>

<aside class="asideMenu">
	<ul>
		<li class="asideTitle">나의도서관</li>
		<li><a class="asideMenuItem item1" href="#">내정보수정</a></li>
		<li><a class="asideMenuItem item2" href="${pageContext.request.contextPath}/user/member/uesList.do">이용현황</a></li>
		<li><a class="asideMenuItem item3" href="${pageContext.request.contextPath}/user/book/requestList.do">희망도서신청현황</a></li>
	</ul>
</aside>