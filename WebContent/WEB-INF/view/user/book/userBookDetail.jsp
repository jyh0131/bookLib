<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../userInclude/userHeader.jsp" %>
<%@ include file="../../userInclude/userSideMenu1.jsp" %>

<style>
	.wrap {
		padding: 30px;
	}
	
	.pageTitle {
		margin-bottom: 30px;
	}
	
	.box {
		overflow: hidden;
		padding: 0 30px;
		margin-bottom: 30px;
	}
	
	.box img {
		width: 198px;
		float: left;
		margin-right: 30px;
		border: 1px solid #D9D9D9;
	}
	
	.box .info {
		float: left;
		line-height: 35px;
    	padding-top: 20px;
	} 
	
	.list {
		clear: both;
		margin-bottom: 20px;
	}
	
	table {
		width: 100%;
		font-size: 14px;
		text-align: center;
		border-top: 2px solid #5F6062;
		border-bottom: 2px solid #D2D2D2;
	}
	
	tr {
		border-bottom: 1px solid #D2D2D2;
	}
	
	tr:first-child {
		background-color: #F6F6F6;
	}
		
	th, td {
		padding: 10px;
	}
	
	.backBtnWrap {
		text-align: right;
	}
	
	.backBtn {
		display: inline-block;
		background-color: #7388A7;
		padding: 10px 20px;
		color: #fff;
		font-weight: 700;
	}
</style>

<div class="articleBg">
	<article class="contentWrap">
		<div class="wrap">
			<h3 class="pageTitle">도서 상세 정보</h3>
			
			<div class="box">
				<c:if test="${item.bookImgPath == null }">
					<img src="${pageContext.request.contextPath }/images/book-noImg.png" alt="이미지없음" />
				</c:if>
				<c:if test="${item.bookImgPath != null }">
					<img src="${pageContext.request.contextPath }/upload/${item.bookImgPath}" alt="${item.bookName }" />
				</c:if>
				<div class="info">
					<p>도서명 : <span>${item.bookName }</span></p>
					<p>저자 : <span>${item.authrName }</span></p>
					<p>역자 : <span>${item.trnslrName }</span></p>
					<p>발행사항 : 
						<span>${item.pls.plsName } / 
						<fmt:formatDate value="${item.pblicteYear }" pattern="yyyy-MM-dd"/> / 
						￦<fmt:formatNumber value="${item.bookPrice }" />
						</span>
					</p>
					<p>분류 : <span>${item.lcNo.lclasName } / ${item.mlNo.mlsfcName }</span></p>
				</div>
			</div>
			
			<div class="list">
				<table>
					<tr>
						<th>도서코드</th>
						<th>도서위치</th>
						<th>보유도서권수</th>
						<th>반납예정일</th>
						<th>대여여부</th>
					</tr>
					<tr>
						<td>${item.bookCode }</td>
						<td><fmt:formatNumber value="${item.lcNo.lclasNo }" pattern="00"/></td>
						<td>${item.bookCnt }</td>
						<td><fmt:formatDate value="${rtunDate }" pattern="yyyy/MM/dd"/></td>
						<c:if test="${item.lendPsbCdt == 0}"><td class="lightBlue fontW700">대여가능</td></c:if>
						<c:if test="${item.lendPsbCdt == 1}"><td class="orange fontW700">대여중</td></c:if>
						<c:if test="${item.lendPsbCdt == 2}"><td class="red fontW700">대여불가도서</td></c:if>
					</tr>
				</table>
			</div>
			<div class="backBtnWrap">
				<a class="backBtn" href="${pageContext.request.contextPath }/user/book/list.do" >목록</a>
			</div>
		</div>
	</article>
</div>
	
<%@ include file="../../userInclude/userFooter.jsp" %>