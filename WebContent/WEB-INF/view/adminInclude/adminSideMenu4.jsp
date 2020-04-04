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
		/* switch (subUrlName) {
		case "add.do":
			$(".item1").addClass("sideView");
			$(".item1").append("<i class='fas fa-angle-right iconView'></i>");
			break
		case "list.do":
			$(".item2").addClass("sideView");
			$(".item2").append("<i class='fas fa-angle-right iconView'></i>");
			break;
		}   */
	})
</script>


<aside class="sideMenu">
	<ul class="sideUl">
		<li class="sideTitle">직원관리</li>
		<li><a class="sideItem sideView" href="#">직원 등록 / 수정<i class="fas fa-angle-right iconView"></i></a></li>
	</ul>
</aside>