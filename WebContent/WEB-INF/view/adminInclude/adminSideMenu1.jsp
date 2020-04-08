<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	//사이드메뉴 포커스
	$(function() {
		$(".sideItem").removeClass("sideView");
		$(".sideItem").find(".fas").remove();
		
		var subUrl = location.href.split("/");
		var	subUrlName = subUrl[subUrl.length-1];
		
		
		// do 이름으로 구분
		if(subUrlName == "add.do") {
			$(".item1").addClass("sideView");
			$(".item1").append("<i class='fas fa-angle-right iconView'></i>");
		}
		if(subUrlName == "list.do") {
			$(".item2").addClass("sideView");
			$(".item2").append("<i class='fas fa-angle-right iconView'></i>");
		}
		
		if(subUrlName.match("update.do") != null) {
			$(".item2").addClass("sideView");
			$(".item2").append("<i class='fas fa-angle-right iconView'></i>");
		}
		
		if(subUrlName == "recomList.do" || subUrlName.match("recom") != null) {
			$(".item4").addClass("sideView");
			$(".item4").append("<i class='fas fa-angle-right iconView'></i>");
		}
		
		if(subUrlName == "plsList.do" || subUrlName.match("pls") != null) {
			$(".item5").addClass("sideView");
			$(".item5").append("<i class='fas fa-angle-right iconView'></i>");
		}
		
		if(subUrlName == "bookCatList.do" || subUrlName.match("bookCat") != null) {
			$(".item6").addClass("sideView");
			$(".item6").append("<i class='fas fa-angle-right iconView'></i>");
		}
	})
</script>
<aside class="sideMenu">
	<ul class="sideUl">
		<li class="sideTitle">도서관리</li>
		<li><a class="sideItem item1" href="${pageContext.request.contextPath}/admin/book/add.do">도서등록</a></li>
		<li><a class="sideItem item2" href="${pageContext.request.contextPath}/admin/book/list.do">보유도서 관리</a></li>
		<li><a class="sideItem item3" href="#">신청도서 조회</a></li>
		<li><a class="sideItem item4" href="${pageContext.request.contextPath}/admin/book/recomList.do">추천도서 등록</a></li>
		<!-- 임시주석처리 -->
		<c:if test="${Title==0 }"> 
			<li><a class="sideItem item5" href="${pageContext.request.contextPath}/admin/book/plsList.do">출판사 관리</a></li>
			<li><a class="sideItem item6" href="${pageContext.request.contextPath}/admin/book/bookCatList.do">분류관리</a></li>
		</c:if>
			<%-- <li><a class="sideItem item5" href="${pageContext.request.contextPath}/admin/book/plsList.do">출판사 관리</a></li>
			<li><a class="sideItem item6" href="${pageContext.request.contextPath}/admin/book/bookCatList.do">분류관리</a></li> --%>
	</ul>
</aside>