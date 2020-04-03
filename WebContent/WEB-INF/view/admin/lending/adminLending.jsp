<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu3.jsp" %>
<style>
	#mber_form_container{
		border: 1px solid steelblue;
		width: 350px;
		margin: 10px auto 0;
	}
	#mber_form_container p{
		margin: 10px;
	}
	#mber_form_container input[type='text']{
		height: 20px;
	}
	/* #mber_form_container p label{
		width: 150px;
		float: left;
	} */
	#mber_form_container #mber_search{
		padding:  5px 10px;
	}
	#mber_form_container2{
		border: 1px solid steelblue;
		width: 350px;
		margin: 10px auto 0;
	}
		#mber_form_container2 p{
		margin: 10px;
	}
	#mber_form_container2 p label{
		width: 150px;
		float: left;
	}
	.contentWrap table{
		border-collapse: collapse;
		display: block;
		width: 640px;
		margin: 0 auto;
		background: red;
	}
	.contentWrap table tr{
		width: 100%;
	}
	.contentWrap table td, .contentWrap table th{
		border: 1px solid steelblue;
		width: 80px;
	}
	#book_form_container{
		border: 1px solid steelblue;
		width: 350px;
		margin: 10px auto 0;
	}
	#book_form_container p{
		margin: 10px;
	}
	#book_form_container input[type='text']{
		height: 20px;
	}
	#book_form_container #mber_search{
		padding:  5px 10px;
	}
</style>
<script>
	$(function() {
		/* $("#mber_search").click(function() {
			var s = $("input[name='choiceMemberColums']:checked").val();
		})*/
		$("#book_search").click(function() {
/* 			var choiceValue = $("input[name='choiceBookColums']:checked").val();
			var searchText = $("input[name='bookSearch']").val();
			var popOption = "width=700, height=360, resizable=no, scrollbars=no, status=no ";
			window.open("lendingBook.do", "2",popOption); */
			alert("체크");
			var choiceValue = $("input[name='choiceBookColums']:checked").val();
			var searchText = $("input[name='bookSearch']").val();
			var popOption = "width=700, height=360, resizable=no, scrollbars=no, status=no ";
			var url = "lending/Book.do?choice=" + choiceValue + "&text=" + searchText;
			window.open(url, "2", popOption);
		})
	})

/* 	function bookSearch() {
		alert("SSSSSSSSSSSSSSSSS");
		var choiceValue = $("input[name='choiceBookColums']:checked").val();
		var searchText = $("input[name='bookSearch']").val();
		var popOption = "width=700, height=360, resizable=no, scrollbars=no, status=no ";
		var url = "lendingBook.do?choice=" + choiceValue + "?text=" + searchText;
		window.open(url, "2", popOption);
	} */
</script>
<article class="contentWrap">
	<div id="mber_form_container">
			<p>
				<input type="radio" name="choiceMemberColums" value="id">회원ID
				<input type="radio" name="choiceMemberColums" value="name">회원명
				<input type="text" name="memberSearch">
				<button id="mber_search">검색</button>
				<%-- <a href="lendingBook.do?book=${book}"></a> --%>
			</p>
	</div>
	<div id="mber_form_container2">
		<form>
			<p>
				<label>회원ID</label>
				<input type="text" name="mber_id">
			</p>
			<p>
				<label>회원이름</label>
				<input type="text" name="mber_name">
			</p>
			<p>
				<label>회원등급</label>
				<input type="text" name="mber_id2">
			</p>
			<p>
				<label>대여가능여부</label>
				<input type="text" name="mber_id3">
			</p>
			<p>
				<label>대여가능권수</label>
				<input type="text" name="mber_id4">
			</p>			
		</form>
	</div>
	<div id="book_form_container">
		<!-- <form action="lendingRent.do" method="get">
			<p>
				<input type="radio" name="choiceBookColums">도서코드
				<input type="radio" name="choiceBookColums">도서명
				<input type="text" name="bookSearch" id="bookSearch">
				<input type="submit" value="검색">
			</p>
		</form> -->
		
			<p>
				<input type="radio" name="choiceBookColums" value="code">도서코드
				<input type="radio" name="choiceBookColums" value="name">도서명
				<input type="text" name="bookSearch">
				<button id="book_search">검색</button>
			</p>
		
	</div>
	<table>
		<tr>
			<th>도서코드</th>
			<th>도서명</th>
			<th>저자/역자</th>
			<th>발행년도</th>
			<th>출판사명</th>
			<th>대여일</th>
			<th>반납일</th>
			<th>선택</th>
		</tr>
<%-- 		<c:forEach var="book" items="${rentBook}">
			<tr class="item">
				<td>${book.bookCode}</td>
				<td>${book.bookName }</td>
				<td>${book.authrName }/${book.trnslrName }</td>
				<td>${book.pblicteYear }</td>
				<td>${book.pls.plsName }</td>
				<td>대여일</td>
				<td>반납예정일 </td>
				<td>체크박스</td>
			</tr>
		</c:forEach> --%>
	</table>
</article>
	
<%@ include file="../../adminInclude/adminFooter.jsp" %>