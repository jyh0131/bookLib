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
	
	.wrap h3 {
		margin-bottom: 20px;
	}

	.listArea {
		padding: 10px 10px;
	}
	
	.listArea .index {
		float: left;
	    font-size: 18px;
	    font-weight: 700;
	    padding-right: 5px;
	}
	
	.listArea .item {
		overflow: hidden;
		padding: 10px 0;
		border-bottom: 1px solid #D9D9D9;
	}
	
	.listArea .item img {
		float: left;
		width: 160px;
		height: 228px;
		margin-left: 10px;
		margin-right: 30px;
		border: 1px solid #D9D9D9;
	}
	
	.listArea .infoBox {
		line-height: 30px;
	}	
	
	.listArea .infoBox .bookName {
		font-size: 18px;
	}
</style>

<button class="topBtn btnBlue"><i class="fas fa-angle-up white"></i></button>
<div class="articleBg">
	<article class="contentWrap">
		<div class="wrap">
			<h3 class="pageTitle">신착도서</h3>

			<div class="listArea">
				<div class="rows">
					<c:if test="${list == null }">
						<p class="noData">신착 도서가 없습니다.</p>
					</c:if>
					<c:if test="${list != null }">
						<c:forEach var="item" items="${list }" varStatus="status">
							<div class="item">
								<div class="index">
									<p><fmt:formatNumber value="${status.index + 1 }" pattern="00"/>.</p>
								</div>
								<c:if test="${item.bookImgPath == null }">
									<a href="${pageContext.request.contextPath }/user/book/detail.do?no=${item.bookCode}">
										<img class="loadImg" src="${pageContext.request.contextPath }/images/book-noImg.png" alt="book-noImg" />
									</a>
								</c:if>
								<c:if test="${item.bookImgPath != null }">
									<a href="${pageContext.request.contextPath }/user/book/detail.do?no=${item.bookCode}">
										<img class="loadImg" src="${pageContext.request.contextPath }/upload/${item.bookImgPath}" alt="${item.bookName }" />
									</a>
								</c:if>
								<div class="infoBox">
									<p class="bookName fontW700">
										<a href="${pageContext.request.contextPath }/user/book/detail.do?no=${item.bookCode}">
											${item.bookName }
										</a>
									</p>
									<p class="wirter">
										<span class="gray">저자 : </span>${item.authrName } / <span
											class="gray">역자 : </span>${item.trnslrName }</p>
									<p class="pls">
										<span class="gray">출판사 : </span>${item.pls.plsName }</p>
									<p class="pblicDate">
										<span class="gray">발행일 : </span>
										<fmt:formatDate value="${item.pblicteYear }"
											pattern="yyyy-MM-dd" />
									</p>
									<p class="cat">
										<span class="gray">카테고리 : </span>${item.lcNo.lclasName } /
										${item.mlNo.mlsfcName }
									</p>
									<p class="bookCnt">
										<span class="gray">보유권수 : </span>${item.bookCnt }</p>
									<p class="local">
										<span class="gray">소장위치 : </span>
										<fmt:formatNumber value="${item.lcNo.lclasNo }" pattern="00" />
									</p>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</article>
</div>
	
<%@ include file="../../userInclude/userFooter.jsp" %>