<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	//사이드메뉴 포커스
	$(function(){
		$(".asideMenuItem").removeClass("asidView");
		
		var subUrl = location.href.split("/");
		var	subUrlName = subUrl[subUrl.length-1];
		
		// do 이름으로 구분
		if(subUrlName == "list.do") {
			$(".item1").addClass("asidView");
		}
		
	})
</script>
<aside class="asideMenu">
	<ul>
		<li class="asideTitle">자료검색</li>
		<li><a class="asideMenuItem item1" href="#">통합자료검색</a></li>
		<li><a class="asideMenuItem item2" href="#">신착도서</a></li>
		<li><a class="asideMenuItem item3" href="#">대출베스트</a></li>
		<li><a class="asideMenuItem item4" href="#">이달의 추천도서</a></li>
	</ul>
</aside>