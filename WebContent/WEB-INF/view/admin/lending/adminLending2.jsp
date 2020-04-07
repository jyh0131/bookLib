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
	#book_table{
		width: 969px;
		border-collapse: collapse;
		display: block;
		margin: 50px auto 0;
	}
	#book_table tr{
		width: 100%;		
	}
	#book_table td, #book_table th{
		border: 1px solid steelblue;
		width: 120px;
	}
	#returnSubmit{
		width: 969px;
		border: 1px solid steelblue;
		margin: 0 auto;
	}
</style>
<script>
	$(function() {
		$("#mber_search").click(function() {
			var choiceValue = $("input[name='choiceMemberColums']:checked").val();
			if(choiceValue == undefined){
				alert("회원 아이디나 회원 명을 선택해주세요");
				return;
			}
			var searchText = $("input[name='memberSearch']").val();
			var popOption = "width=700, height=360, resizable=no, scrollbars=no, status=no ";
			var url = "${pageContext.request.contextPath}/admin/lending/Member.do?choice=" + choiceValue + "&text=" + searchText;
			window.open(url, "2", popOption);
		})
	})
	$("#cancel").click(function() {
			$("#book_table input[type='checkbox']").prop("checked", false);
		/* 	$("#book_table input[type='checkbox']").val(0); */
			alert("모두 취소되었습니다.");
		})
</script>
<article class="contentWrap">

		<div id="mber_container">
			<div id="mber_form_container">
					<p>
						<input type="radio" name="choiceMemberColums" value="id">회원ID
						<input type="radio" name="choiceMemberColums" value="name">회원명
						<input type="text" name="memberSearch">
						<button id="mber_search">검색</button>
					</p>
			</div>
			<div id="mber_form_container2">
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
			</div>
		</div>
	<form action="${pageContext.request.contextPath}/admin/lending/Return.do" method="post">
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
		<div id="returnSubmit">
			<button id="cancel">취소</button>
			<input type="submit" value="반납">
			<!-- <button id="return">반납</button> -->
			<input type="hidden" value="" name="member_id" id="member_id">
		</div>
	</form>
</article>
	
<%@ include file="../../adminInclude/adminFooter.jsp" %>