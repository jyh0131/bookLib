<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu1.jsp" %>

<style>
	.btnsLeft {
		float: left;
	}
	
	.btnsLeft select {
		font-size: 14px;
	}
	
	.btnsRight {
		float: right;
	}
	
	a.excelBtn {
		font-size: 13px;
	}
	
	.listBox {
		margin-top: 20px;
		overflow: auto;
    	max-height: 600px;
    	border-bottom: 1px solid #D9D9D9;
    	border-top: 1px solid #D9D9D9;
	}
	
	.listBox table {
		width: 100%;
		text-align: center;
	}
	
	tr:nth-of-type(odd) {
		background-color: #D9D9D9;
	}
	
	tr:first-child {
		background-color: #476fad;
	}
	
	th {
		color: #fff;
	}
	
	th, td {
		padding: 5px;
		font-size: 14px;
	}

</style>
<script>
	$(function(){
		
	})
</script>
<article class="contentWrap">
	<h2 class="pageTitle">신청도서 조회</h2>
	
	<div class="listWrap">
		<div class="btnsTop clearfix">
			<div class="btnsLeft">
				<form action="bookReqstList.do" method="get">
					<select name="year">
						<option value="">선택</option>
						<c:forEach var="year" items="${yearList }">
							<option value="${year }">${year }</option>
						</c:forEach>
					</select>
					<span>년</span>
					<select name="month">
						<option value="">선택</option>
						<c:forEach var="month" begin="1" end="12">
							<option value="${month}">${month}</option>
						</c:forEach>
					</select>
					<span>월</span>
					<select name="whCdt">
						<option value="">입고여부</option>
						<option value="0">미입고</option>
						<option value="1">입고완료</option>
					</select>
					<input type="submit" value="검색" class="btnOrange"/>
				</form>
			</div>
			<div class="btnsRight">
				<form action="bookReqstList.do" method="post">
					<a href="#" class="btnOrange excelBtn">조회리스트 엑셀저장</a>
					<input type="submit" value="입고처리" class="btnPurple whCdtBtn"/>
					<button type="button" class="btnLightBlue">모두선택</button>
				</form>
			</div>
		</div>
		
		<div class="listBox">
			<table>
				<tr>
					<th>no</th>
					<th>신청도서명</th>
					<th>저저/역자</th>
					<th>출판사</th>
					<th>신청회원수</th>
					<th>신청일자</th>
					<th>입고여부</th>
					<th>선택</th>
				</tr>
			</table>
		</div>
	</div>
</article>

<%@ include file="../../adminInclude/adminFooter.jsp" %>