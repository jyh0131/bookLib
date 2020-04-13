<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../adminInclude/adminHeader.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminCommon.css" type="text/css"/>
<style>
	.homeCnt {
		float: none;
		width: 1400px;
		margin: 0 auto;
		padding: 0;
		padding-top: 100px;
	}
	
	.box {
		overflow: hidden;
		margin-bottom: 30px;
	}
	
	.rentBtnBox {
    float: left;
    width: 21%;
    border: 3px solid #D9D9D9;
    box-sizing: border-box;
    padding: 49px 30px;
	}
	
	.rentBtnBox div {
		border-radius: 10px;
		text-align: center;
		line-height: 50px;
	}
	
	.rentBtnBox a {
		display: block;
		height: 50px;
		color: #fff;
		font-size: 20px;
		font-weight: 700;
	}
	
	.rentBtn {
		margin-bottom: 20px;
	}
	
	.libInfoBox {
		float: right;
		width: 75%;
		box-sizing: border-box;
		background: url("../images/bg1.png") no-repeat;
		background-size: cover;
		overflow: hidden;
		padding: 23px 40px;
	}
	
	.libInfo {
		float:left;
	}
	
	.libInfo h1 {
		color: #fff;
		font-size: 50px;
		margin-bottom: 20px;
	}
	
	.libInfo p {
		color: #fff;
		font-size: 18px;
		line-height: 30px;
		margin-left: 30px;
	}
	
	.libImg {
    float: right;
    width: 180px;
    height: 180px;
    background-color: #fff;
    border-radius: 70px;
    overflow: hidden;
	}
	
	.libImg img {
		width: 100%;
		height: 100%;
	}
	
	.bookCdtBox {
		float: left;
		width: 24.19%;
		height: 200px;
		margin-right: 15px;
		box-sizing: border-box;
		padding: 30px;
		position: relative;
	}
	
	.bookCdtBox:last-child {
		margin: 0;
	}
	
	.bookCdtInfo h3 {
		margin-bottom: 20px;
	}
	
	.bookCdtInfo p{
		line-height: 35px;
		padding-left: 20px;
		font-size: 18px;
	}
	
	.bookBox i{
		position: absolute;
		font-size: 150px;
		bottom: -15px;
		right: -15px;
		color: #fff;
		opacity: .2;
	}
	
	.bookBox:nth-of-type(3) i {
		right: -30px;
	}
	
	.bookBox p {
		font-size: 4rem;
		font-weight: 700;
		line-height: 140px;
	}
	
	.kwon {
		font-size: 3rem;
	}
	
	.recomBookBox {
		border: 2px solid #0CA0AE;
		padding: 15px 40px;
	}
	
	.recomBookBox p {
		float: left;
		font-weight: 700;
	}
	
	.recomTitle {
		margin-right: 200px;
		line-height: 26px;
	}
	
	.recomBook {
		color: #2A3954;
		line-height: 26px;
	}
	
	.recomBook span {
		font-size: 12px;
		color: gray;
		padding-right: 20px;
	}
	
	.recomBook span.recomWriter {
		padding-left: 50px;
	}
	
	.recomBookBox p.recomAdd {
		float: right;
	}
	
	.recomBookBox p.recomAdd a {
		display: block;
		background-color: #ff9900;
		padding: 5px 10px;
		border-radius: 5px;
		color: #fff;
		font-size: 14px;
		font-weight: 700;
	}
</style>
<script>
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth()+1;
</script>
<article class="contentWrap homeCnt">
	<div class="box">
		<div class="rentBtnBox">
			<div class="rentBtn orangeBg"><a href="${pageContext.request.contextPath}/admin/lending/Rent.do">대여</a></div>
			<div class="returnBtn blueBg"><a href="${pageContext.request.contextPath}/admin/lending/Return.do">반납</a></div>
		</div>
		<div class="libInfoBox">
			<div class="libInfo">
				
				<h1>환영합니다. ${Lib }님</h1>
				<p>이름 : [ ${Lib } ]</p>
				<c:choose>
					<c:when test="${Title==0 }">
						<p>직책 : [ 총관리자 ] </p>
					</c:when>
					<c:otherwise>
						<p>직책 : [ 사서 ] </p>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="libImg">
				<%-- <c:if>으로 이미지가 있으면 넣고 없으면 no-img로 나타나게 하기. 지금은 임시로 no-img넣어둠 --%>
			<c:choose>
				<c:when test="${LibImage !=null}">
					<img class="loadImg" src="${pageContext.request.contextPath }/upload/${LibImage}"/>
				</c:when>
				<c:when test="${LibImage ==null}">
					<img class="loadImg" src="${pageContext.request.contextPath }/images/no-image.png" />
				</c:when>
			</c:choose>
			</div>			
		</div>
	</div>
	<div class="box">
		<div class="bookCdtBox lightGreyBg bookCdtInfo">
			<h3>도서현황(월별)</h3>
			<c:choose>
				<c:when test="${newRes>0}">
					<p>신착도서<span class="updown">증가 <i class="fas fa-caret-up cntUp">(${newRes}권)</i></span></p>	
				</c:when>
				<c:when test="${newRes<0}">
					<p>신착도서<span class="updown">감소 <i class="fas fa-caret-down cntDown" >(${newRes}권)</i></span></p>	
				</c:when>
				<c:when test="${newRes==0}">
					<p>신착도서<span class="updown"> -- (${newRes}권)</span></p>	
				</c:when>				
			</c:choose>
			<c:choose>
				<c:when test="${lendingRes>0}">
					<p>대여도서<span class="updown"> 증가 <i class="fas fa-caret-up cntUp">(${lendingRes}권)</i></span></p>	
				</c:when>
				<c:when test="${lendingRes<0}">
					<p>대여도서<span class="updown"> <i class="fas fa-caret-down cntDown"></i> (${lendingRes}권)</span></p>	
				</c:when>
				<c:when test="${lendingRes==0}">
					<p>대여도서<span class="updown"> -- (${lendingRes}권)</span></p>	
				</c:when>				
			</c:choose>
			<c:choose>
				<c:when test="${overdueRes>0}">
					<p>연체도서<span class="updown"> 증가 <i class="fas fa-caret-up cntUp">(${overdueRes}권)</i></span></p>	
				</c:when>
				<c:when test="${overdueRes<0}">
					<p>연체도서<span class="updown"> 감소 <i class="fas fa-caret-down cntDown">(${overdueRes}권)</i></span></p>	
				</c:when>
				<c:when test="${overdueRes==0}">
					<p>연체도서<span class="updown"> -- (${overdueRes}권)</span></p>	
				</c:when>				
			</c:choose>
		</div>
		<div class="bookCdtBox pinkBg bookBox">
			<h3 class="white">총신착도서(${y}년)</h3>
			<p class="white">${newYearCnt } <span class="kwon white">권</span></p>
			<i class="fas fa-book-reader"></i>
		</div>
		<div class="bookCdtBox purpleBg bookBox">
			<h3 class="white">총대여도서(${y}년)</h3>
			<p class="white">${lendYearCnt } <span class="kwon white">권</span></p>
			<i class="fas fa-retweet"></i>
		</div>
		<div class="bookCdtBox orangeBg bookBox">
			<h3 class="white">연체도서(${y}년)</h3>
			<p class="white">${overdueYearCnt } <span class="kwon white">권</span></p>
			<i class="far fa-calendar-minus"></i>
		</div>
	</div>
	<div class="box recomBookBox">
		<p class="recomTitle">추천도서</p>	
		<p class="recomBook">${recom.bookCode.bookName }
			<span class="recomWriter">${recom.bookCode.authrName }</span>
			<span>/</span>
			<span class="recomPls">${recom.bookCode.pls.plsName }</span>
		</p>
		<p class="recomAdd"><a href="${pageContext.request.contextPath }/admin/book/recomList.do">추천도서 등록</a></p>
	</div>
</article>
	
<%@ include file="../adminInclude/adminFooter.jsp" %>