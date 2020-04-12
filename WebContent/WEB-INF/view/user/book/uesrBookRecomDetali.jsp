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
		margin-bottom: 20px;
	}
	
	.box {
		padding: 0 20px;	
	}
	
	.infobox {
		overflow: hidden;
		margin-bottom: 40px;
	}
	
	.infobox img {
		width: 198px;
		float: left;
		margin-right: 30px;
		border: 1px solid #D9D9D9;
	}
	
	.info {
		float: left;
		line-height: 50px;
    	padding-top: 20px;
	}
	
	.info span {
		font-weight: 700;
	}
	
	.detalibox {
		clear: both;
	}
	
	.detalibox h3 {
		border-left: 3px solid #7388a7;
		padding: 0 10px;
		margin-bottom: 10px;
	}
	
	.detail {
		text-align: justify;
		line-height: 25px;
	}
</style>

<div class="articleBg">
	<article class="contentWrap">
		<div class="wrap">
			<h3 class="pageTitle">이달의 추천도서</h3>
			<div class="box">
				<div class="infobox">
					<c:if test="${item.bookCode.bookImgPath == null }">
						<img src="${pageContext.request.contextPath }/images/book-noImg.png" alt="이미지없음" />
					</c:if>
					<c:if test="${item.bookCode.bookImgPath != null }">
						<img src="${pageContext.request.contextPath }/upload/${item.bookCode.bookImgPath}" alt="${item.bookCode.bookName }" />
					</c:if>
					<div class="info">
						<p>도서명 : <span>${item.bookCode.bookName }</span></p>
						<p>저자 : <span>${item.bookCode.authrName }</span></p>
						<p>역자 : <span>${item.bookCode.trnslrName }</span></p>
						<p>출판사 : <span>${item.bookCode.pls.plsName }</span></p>
						<p>분류 : <span>${item.bookCode.lcNo.lclasName } / ${item.bookCode.mlNo.mlsfcName }</span></p>
					</div>
				</div>
				<div class="detalibox">
					<h3>추천글</h3>
					<p class="detail">${item.bookCont }</p>
				</div>
			</div>
		</div>
	</article>
</div>
	
<%@ include file="../../userInclude/userFooter.jsp" %>