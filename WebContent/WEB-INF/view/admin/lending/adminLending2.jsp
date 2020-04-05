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
		$("#mber_search").click(function() {
			var choiceValue = $("input[name='choiceMemberColums']:checked").val();
			var searchText = $("input[name='memberSearch']").val();
			var popOption = "width=700, height=360, resizable=no, scrollbars=no, status=no ";
			var url = "${pageContext.request.contextPath}/admin/lending/Member.do?choice=" + choiceValue + "&text=" + searchText;
			window.open(url, "2", popOption);
		})
		$("#mber_id").change(function() {
			
			$("#book_table").append()
		})
	})
</script>
<article class="contentWrap">
	<div id="mber_form_container">
			<p>
				<input type="radio" name="choiceMemberColums" value="id">회원ID
				<input type="radio" name="choiceMemberColums" value="name">회원명
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
				<label>연체여부</label>
				<input type="text" name="overdueCdt" id="overdueCdt">
			</p>
			<p>
				<label>연체횟수</label>
				<input type="text" name="odCnt" id="odCnt">
			</p>			
		</form>
	</div>
	<table id="book_table">
		<tr>
			<th>도서코드</th>
			<th>도서명</th>
			<th>저자/역자</th>
			<th>발행년도</th>
			<th>출판사</th>
			<th>대여일</th>
			<th>반납예정일</th>
			<th>선택</th>
		</tr>
	</table>
</article>
	
<%@ include file="../../adminInclude/adminFooter.jsp" %>