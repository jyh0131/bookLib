<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../adminInclude/adminHeader.jsp"%>
<%@ include file="../../adminInclude/adminSideMenu3.jsp"%>
<style>
	#mber_container {
		width: 1130px;		
		overflow: hidden;
	}
	
	#mber_form_container {
		color : #476fad;
		width: 500px;
		height:150px;
		float: left;
	}
	#mber_form_container p{
		margin: 10px 0;
		/* font-size: 2.0em; */
		font-size:2em;
		color: #476fad;
	}
	#mber_form_container p input[type='radio'] {
		margin: 25px 35px 25px 0;
		/* color: #fff; */
		font-size: 2em;
	}
	#mber_form_container p input[type='radio']:nth-child(2) {
		margin: 25px 35px 25px 70px;
	}
	#mber_form_container p input[type='text']{
		height: 50px;
		width: 360px;
		/* margin-left: 20px; */
		border:none;
		border-bottom: 1px solid #476fad;
	}
	#mber_form_container p #mber_search {
		width: 60px;
		height: 52px;
	}
	#hide_lending_mber{
		width: 500px;
		/* height:150px; */
		/* border: 1px solid #476fad; */
		display: none;
		float: right;
	}
	#hide_lending_mber p{
		margin: 4.496px;
	}
	#hide_lending_mber p label{
		font-size: 20px;
		color: #476fad;
		float: left;
		width: 250px;
	}
	#hide_lending_mber p input{
		border: none;
		font-size: 20px;
		color: #476fad;
	}
/* 	
	#mber_form_container2 {
		border: 1px solid #476fad;
		background-color : #476fad;
		width: 500px;
		height: 160px;
		float: right;
		color: #fff;
	}
	
	#mber_form_container #hide_lending_mber p {
		margin: 10px;	
	} 
	
	#mber_form_container #hide_lending_mber p label {
		width: 150px;
		float: left;
		color: #476fad;
	}
	#mber_form_container #hide_lending_mber p input[type='text'] {
		/* border: none; */
	} */

	
	
	
	
	#book_form_container p {
		margin: 10px;
	}
	#book_form_container p {
		margin: 10px;
	}
	
	#book_form_container input[type='text'] {
		height: 20px;
	}
	
	#book_form_container #mber_search {
		padding: 5px 10px;
	}
	
	#book_table {
		width:1128px;
		/* min-height:200px; */
		border-collapse: collapse;
		display: block;
		border-left: 1px solid #aaa;
		border-right: 1px solid #aaa;
		/* margin: 0 auto; */
		text-align: center;
	}
	#book_table tr:first-child th {
		padding: 10px;
		background: #476fad;
		color: #fff;
	}
	#book_table tr {
		width: 100%;
	}
	
	#book_table td, #book_table th {
		border: 1px solid black;
		width: 120px;
	}
	#rentSubmit {
		background-color :#476fad;
		width:1128px;
		border: none;
		border-left:1px solid black;
		border-right:1px solid black;
		border-bottom:1px solid black;
		overflow: hidden;
	}
	#rentSubmit p{
		float: right;
	}
	#rentSubmit button{
		margin: 5px;
	}
	tr:nth-of-type(even) {
		background-color: #D9D9D9;
	}
	.pageTitle{
		width: 1100px;
	}
	#noResult td{
		height: 200px;
	}
</style>
<script>
	$(function() {
		$("#mber_search").click(function() {
			$("#book_table>tr").remove();
			var choiceValue = $("input[name='choiceMemberColums']:checked").val();
							if (choiceValue == undefined) {
								alert("회원 아이디나 회원 명을 선택해주세요");
								return;
							}
							var searchText = $("input[name='memberSearch']").val();
							var popOption = "width=700, height=360, resizable=no, scrollbars=no, status=no ";
							var url = "${pageContext.request.contextPath}/admin/lending/Member.do?choice="
									+ choiceValue + "&text=" + searchText;
							window.open(url, "2", popOption);
							$("input[name='memberSearch']").val("");
							$("#noResult").show();
							$("#hide_lending_mber").hide();
						})
		$("#book_search").click(function() {
			/* $("#noResult").remove(); */		
							var choiceValue = $(
									"input[name='choiceBookColums']:checked")
									.val();
							if (choiceValue == undefined) {
								alert("도서 코드나 도서 명을 선택해주세요");
								return;
							}
							var memberId = $("#mber_id").val();
							if (memberId == "") {
								alert("회원 먼저 검색하고 오세요");
								return;
							}
							var searchText = $("input[name='bookSearch']").val();
							var popOption = "width=1200, height=380, resizable=no, scrollbars=no, status=no";
							var url = "${pageContext.request.contextPath}/admin/lending/Book.do?choice="
									+ choiceValue + "&text=" + searchText;
							window.open(url, "2", popOption);
							$("input[name='bookSearch']").val("");
		})
		$("#cancel").click(function() {
			$("#book_table input[type='checkbox']").prop("checked", false);
		/* 	$("#book_table input[type='checkbox']").val(0); */
			alert("모두 취소되었습니다.");
		})
 		$("#rentForm").submit(function() {
 			/* var i = $("input [name='book_code']:checked").length; */
 			if($("input:checkbox[name='book_code']").is(":checked") == false) {
 				alert("체크 해주세요");
 				return false;
 			}
 			/* alert("체크값 있음"); */
 			/* console.log(i);
 			alert("체크된 값의 길이"+i);
 			if(i == 0){
 				return false;
 			} */
		})
	})
</script>
<article class="contentWrap">
	<h2 class="pageTitle">대여 관리</h2>
	<div id="mber_container">	
		<div id="mber_form_container">
			<p>
				<input type="radio" name="choiceMemberColums" value="id">회원ID
				<input type="radio" name="choiceMemberColums" value="name" checked="checked">회원명
			</p>
			<p>
				<input type="text" name="memberSearch">
				<button id="mber_search" class="btnLightBlue">검색</button>
			</p>
		</div>
		<div id="hide_lending_mber">
			<form>
				<p>
					<label>회원ID</label> <input type="text" name="mber_id" id="mber_id" readonly="readonly">
				</p>
				<p>
					<label>회원이름</label> <input type="text" name="mber_name" id="mber_name" readonly="readonly">
				</p>
				<p>
					<label>회원등급</label> <input type="text" name="grade" id="grade" readonly="readonly">
				</p>
				<p>
					<label>대여가능여부</label> <input type="text" name="overdueCdt" id="overdueCdt" readonly="readonly">
				</p>
				<p>
					<label>대여가능권수</label> <input type="text" name="lendBookCnt" id="lendBookCnt" readonly="readonly">
				</p>
			</form>
		</div>
		<!-- 		<div id="mber_form_container2">

		</div> -->
	</div>
	<div id="book_form_container">
		<p>
			<input type="radio" name="choiceBookColums" value="code">도서코드
			<input type="radio" name="choiceBookColums" value="name" checked="checked">도서명
			<input type="text" name="bookSearch">
			<button id="book_search" class="btnLightBlue">검색</button>
		</p>
	</div>
	<form action="${pageContext.request.contextPath}/admin/lending/Rent.do" method="post" id="rentForm">
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
			<tr id="noResult">
				<td colspan="8">
					대여 도서를 선택해 주세요.
				</td>
			</tr>
		</table>
		<div id="rentSubmit">
			<p>
				<button id="cancel" class="btnOrange">취소</button>
				<button id="rent" class="btnLightBlue">대여</button>
				<input type="hidden" value="" name="member_id" id="member_id">
			</p>
		</div>
	</form>
</article>
<%@ include file="../../adminInclude/adminFooter.jsp"%>