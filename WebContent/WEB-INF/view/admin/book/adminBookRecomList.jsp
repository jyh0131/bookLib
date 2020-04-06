<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu1.jsp" %>

<style>
	.recomInfoBox {
		float: left;
		width: 48%;
		min-width: 300px;
		margin-right: 30px;
	}
	
	.recomListBox {
		float: left;
		width: 48%;
		min-width: 300px;
	}
	
	.box {
		overflow: hidden;
		margin-left: 30px;
		margin-bottom: 30px;
	}
	
	.imgBox {
		float: left;
	}
	
	.imgBox img {
		width: 198px;
	}
	
	.infoBox {
		float: left;
	    padding-top: 10px;
	    padding-left: 20px;
	    line-height: 50px;
	}
	
	.infoBox p span {
		font-weight: 700;
	}
	
	.detailBox {
		clear: both;
	}
	
	.detailBox h3 {
		border-left: 5px solid #3493dd;
		padding-left: 10px;
		margin-bottom: 10px;
	}
	
	.detail {
		text-align: justify;
		line-height: 25px;
	}
	
	.addBtn {
		margin-bottom: 20px;
		text-align: right;
	}
	
	.recomList {
		overflow: auto;
    	max-height: 600px;
    	border-bottom: 1px solid #D9D9D9;
    	border-top: 1px solid #D9D9D9
	}
	
	.recomList table {
		width: 100%;
		text-align: center;
	}
	
	
	tr:nth-of-type(odd) {
	    background-color: #D9D9D9;
	}
	
	tr:first-child {
    	background-color: #476fad;
	}
	
	td, th {
		padding: 5px;
	}
	
	th {
		color: #fff;
	}
</style>

<article class="contentWrap clearfix">
	<div class="recomInfoBox">
		<h2 class="pageTitle">현재 추천도서</h2>
		<div class="infoWrap">
			<div class="box">
				<div class="imgBox">
					<c:if test="${recom.bookCode.bookImgPath != null}">
						<img src="${pageContext.request.contextPath }/upload/${recom.bookCode.bookImgPath}" alt="" />
					</c:if>
					<c:if test="${recom.bookCode.bookImgPath == null }">
						<img class="loadImg" src="${pageContext.request.contextPath }/images/book-noImg.png" alt="book-noImg" />
					</c:if>
				</div>
				<div class="infoBox">
					<p>도서명 : <span>${recom.bookCode.bookName }</span></p>
					<p>저자 : <span>${recom.bookCode.authrName }</span></p>
					<p>역자 : <span>${recom.bookCode.trnslrName }</span></p>
					<p>출판사 : <span>${recom.bookCode.pls.plsName }</span></p>
					<p>분류 : <span>${recom.bookCode.lcNo.lclasName } / ${recom.bookCode.mlNo.mlsfcName }</span></p>
				</div>
			</div>
			<div class="detailBox">
				<h3>추천글</h3>
				<p class="detail">${recom.bookCont }</p>
			</div>
		</div>
	</div>
	<div class="recomListBox">
		<h2 class="pageTitle">추천도서 리스트</h2>
		<div class="addBtn"><a href="${pageContext.request.contextPath}/admin/book/list.do?page=recom" class="btnOrange">NEW추천도서 등록</a></div>
		<div class="recomList">
			<table>
				<tr>
					<th>no</th>
					<th>도서명</th>
					<th>저자</th>
					<th>역자</th>
					<th>출판사</th>
					<th>분류</th>
				</tr>
				<c:forEach var="list" items="${list }">
					<c:if test="${list != null }">
						<tr>
							<td>${list.recomBookNo}</td>
							<td>${list.bookCode.bookName}</td>
							<td>${list.bookCode.authrName}</td>
							<td>${list.bookCode.trnslrName}</td>
							<td>${list.bookCode.pls.plsName}</td>
							<td>${list.bookCode.lcNo.lclasName} / ${list.bookCode.mlNo.mlsfcName }</td>
						</tr>
					</c:if>
					<c:if test="${list == null }">
						<tr>
							<td colspan="6" style="padding: 20px;">
								등록된 추천도서 기록이 없습니다.
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
</article>

<%@ include file="../../adminInclude/adminFooter.jsp" %>