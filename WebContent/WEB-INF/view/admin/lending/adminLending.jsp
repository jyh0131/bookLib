<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu3.jsp" %>
<style>
	#mber_container{
		width: 1000px;
		margin: 0 auto;
		overflow: hidden;
	}
	#mber_form_container{
		border: 1px solid steelblue;
		width: 350px;
		height:150px;
		float: left;
		margin: 10px 0 0 50px;
	}
	#mber_form_container p{
		margin: 10px;
		font-size: 1.5em;
	}	
	#mber_form_container input[type='radio']{
		margin: 25px;
	}
	#mber_form_container input[type='text']{
		height: 50px;
		width: 240px;
	}
	#mber_form_container #mber_search{
		width: 60px;
		height: 52px;
	}
	#mber_form_container2{
		border: 1px solid steelblue;
		width: 350px;
		height:150px;
		margin: 10px 50px 0 0;
		float: right;
	}
		#mber_form_container2 p{
		margin: 10px;
	}
	#mber_form_container2 p label{
		width: 150px;
		float: left;
	}
	#book_form_container{
		border: 1px solid steelblue;
		width: 969px;
		margin: 50px auto 0;
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
	#book_table{
		width: 969px;
		border-collapse: collapse;
		display: block;
		margin: 0 auto;
	}
	#book_table tr{
		width: 100%;		
	}
	#book_table td, #book_table th{
		border: 1px solid steelblue;
		width: 120px;
	}
	#rentSubmit{
		width: 969px;
		border: 1px solid steelblue;
		margin: 0 auto;
	}
</style>
<script>
	$(function() {

		$("#mber_search").click(function() {
			var choiceValue = $("input[name='choiceMemberColums']:checked").val();
			var searchText = $("input[name='memberSearch']").val();
			var popOption = "width=700, height=360, resizable=no, scrollbars=no, status=no ";
			var url = "${pageContext.request.contextPath}/admin/lending/Member.do?choice=" + choiceValue + "&text=" + searchText;
			window.open(url, "2", popOption);
		})
		$("#book_search").click(function() {
			var choiceValue = $("input[name='choiceBookColums']:checked").val();
			var searchText = $("input[name='bookSearch']").val();
			var popOption = "width=700, height=360, resizable=no, scrollbars=no, status=no ";
			var url = "${pageContext.request.contextPath}/admin/lending/Book.do?choice=" + choiceValue + "&text=" + searchText;
			window.open(url, "2", popOption);	
		})
	})
</script>
<article class="contentWrap">
	<form>
	<div id="mber_container">
		<div id="mber_form_container">
				<p>
					<input type="radio" name="choiceMemberColums" value="id">회원ID
					<input type="radio" name="choiceMemberColums" value="name">회원명
				</p>
				<p>	
					<input type="text" name="memberSearch">
					<button id="mber_search">검색</button>
				</p>
		</div>
		<div id="mber_form_container2">
			<form>
				<p>
					<label>회원ID</label>
					<input type="text" name="mber_id" id="mber_id">
				</p>
				<p>
					<label>회원이름</label>
					<input type="text" name="mber_name" id="mber_name">
				</p>
				<p>
					<label>회원등급</label>
					<input type="text" name="grade" id="grade">
				</p>
				<p>
					<label>대여가능여부</label>
					<input type="text" name="overdueCdt" id="overdueCdt">
				</p>
				<p>
					<label>대여가능권수</label>
					<input type="text" name="lendBookCnt" id="lendBookCnt">
				</p>			
			</form>
		</div>
	</div>
	<div id="book_form_container">
		<p>
			<input type="radio" name="choiceBookColums" value="code">도서코드
			<input type="radio" name="choiceBookColums" value="name">도서명
			<input type="text" name="bookSearch">
			<button id="book_search">검색</button>
		</p>
	</div>
	<table id="book_table">
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
	</table>
	<div id="rentSubmit">
		<input type="reset" value="취소">
		<input type="submit" value="대여">
	</div>
	</form>
</article>	
<%@ include file="../../adminInclude/adminFooter.jsp" %>