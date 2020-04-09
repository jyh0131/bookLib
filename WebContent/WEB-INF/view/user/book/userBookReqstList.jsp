<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../userInclude/userHeader.jsp" %>
<%@ include file="../../userInclude/userSideMenu3.jsp" %>

<style>
	.wrap {
		padding: 30px;
	}
	
	.wrap .box {
		margin-top: 30px;
	}
	
	.yearBox {
		text-align: right;
		margin-bottom: 10px;
	}
	
	.yearBox select {
		font-size: 15px;
	}
	
	.list {
		width: 100%;
		min-height: 600px;
		border-top: 3px solid #476FAD;
		border-bottom: 1px solid #999;
	}
	
	.list table {
		width: 100%;
		text-align: center;
	}
	
	.list table tr {
		border-bottom: 1px solid #d9d9d9;
	}
	
	.list table tr:first-child {
		background-color: #F8F6F5;
	}
	
	
	th, td {
		padding: 10px 5px;
	}
	
	
</style>

<div class="articleBg">
	<article class="contentWrap">
		<div class="wrap">
			<h3 class="pageTitle">희망도서신청현황</h3>
			<div class="box">
				<div class="yearBox">			
					<select name="year">
						<option value="">선택</option>
						<c:forEach var="year" items="${yearList }">
							<option value="${year }">${year }</option>
						</c:forEach>
					</select>
					년도
				</div>
				<div class="list">
					<table>
						<tr>
							<th>no</th>
							<th>신청도서명</th>
							<th>저자</th>
							<th>역자</th>
							<th>출판사</th>
							<th>신청일</th>
							<th>입고여부</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</article>
</div>
	
<%@ include file="../../userInclude/userFooter.jsp" %>