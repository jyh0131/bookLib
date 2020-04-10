<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../adminInclude/adminHeader.jsp"%>
<%@ include file="../../adminInclude/adminSideMenu3.jsp"%>
<style>
	#overdue_header {
		width: 800px;
		margin: 0 auto;
		overflow: hidden;
	}
	
	#overdue_header_left {
		float: left;
	}
	
	#overdue_header_right {
		float: right;
	}
	
	#overdue_table tr:first-child th {
		padding: 10px;
		background: #476fad;
		color: #fff;
	}
	#overdue_table td:first-child {
		width: 250px;
		padding:10px;
	} 
	#overdue_table td:nth-child(2) {
		width: 150px;
		text-align: center;
	} 
	#overdue_table td:nth-child(3) {
		width: 150px;
		padding:10px;
	} 
	#overdue_table td:nth-child(4) {
		width: 150px;
		padding:10px;
	} 
	#overdue_table td:nth-child(5) {
		width: 12	0px;
		text-align: center;
	} 
	#overdue_table td:last-child {
		width:70px;
		text-align: center;
	} 
	#overdueBtn{
		margin-top: 15px;
	}
</style>
<script>
	$(function() {
		var flag = true;
		$("#allCheck").click(function() {
			/* if (flag%2 == 0) { */
			if (flag) {
				$("table input[type='checkbox']").prop("checked", true);
				/* flag++;
				flag%2; */
				flag = false;
			} else {
				$("table input[type='checkbox']").prop("checked", false);
				/* flag++; */
				flag = true;
			}
		})
/* 		$("#emailSend").click(function() {
			
		}) */
	})
</script>
<article class="contentWrap">

	<div>
	<h2 class="pageTitle">연체 조회</h2>
		<form action="/bookLib/admin/lending/Overdue.do" method="post">
			<div id="overdue_body">
				<table id="overdue_table">
					<tr>
						<th>회원ID</th>
						<th>회원명</th>
						<th>대여일</th>
						<th>반납예정일</th>
						<th>대여도서권수</th>
						<th>선택</th>
					</tr>
					<c:forEach var="item" items="${overdueList}">
						<tr class="items">
							<td>${item.mberId.mberId}</td>
							<td>${item.mberId.mberName }</td>
							<td><fmt:formatDate value="${item.lendDate}" /></td>
							<td><fmt:formatDate value="${item.rturnDueDate}" /></td>
							<td>${item.overdueBookCnt}</td>
							<td><input type="checkbox"  name="chk" value="${item.mberId.mberId}"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="overdueBtn">
				<p>
					<button id="allCheck" class="btnOrange">모두 선택/모두 해제</button>
					<button id="emailSend" class="btnLightBlue">이메일 보내기</button>
				</p>
			</div>
		</form>
	</div>
</article>
<%@ include file="../../adminInclude/adminFooter.jsp"%>