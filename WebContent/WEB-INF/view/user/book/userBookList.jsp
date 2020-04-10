<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../userInclude/userHeader.jsp" %>
<%@ include file="../../userInclude/userSideMenu1.jsp" %>

<style>
	.wrap {
		padding: 30px;
	}
	
	.wrap h3 {
		margin-bottom: 20px;
	}
	
	div.searchArea {
		background: url("../../images/bg1.png") no-repeat;
		background-size: cover;
		text-align: center;
		padding: 30px;
		margin-bottom: 30px;
	}
	
	div.searchArea h1 {
		color: #fff;
		margin-bottom: 10px;
		font-size: 36px;
	}
	
	.searchArea input {
		border: none;
		font-size: 18px;
		padding: 10px;
	}
	
	.searchArea select {
		font-size: 18px;
		padding: 8px;
		border: none;
	}
	
	.searchArea label {
		color: #fff;
		font-size: 18px;
		font-weight: 700;
	}
	
	.searchArea input[name='bookName'] {
		width: 90%;
		border: none;
		font-size: 18px;
		padding: 10px;
		margin: 0 auto;
		margin-bottom: 20px;
	}
	.bookSchbtn {
		border: none;
		padding: 10px 50px;
		font-size: 18px;
		font-weight: 700;
		background: #E8396F;
		color: #fff;
		cursor: pointer;
	}
	.bookSchbtn:hover {
		background: #FF9900;
	}
	
	.detailP {
		text-align: right;
		margin-right: 30px;
		margin-bottom: 10px;
	}
	
	.detail {
		width: 86%;
		margin: 0 auto;
		padding: 20px;
		background-color: #FF9900;
		margin-bottom: 20px;
		text-align: left;
		display: none;
	}
	
	.detail label {
		margin-right: 10px;
	}
	
	.detailLeft {
		float: left;
		width: 50%;
	}
	
	.detail input,
	.detail select {
		width: 70%;
	}
	
	.detailRight {
		float: right;
		width: 50%;
	}
	
	.bookSchbtn {
		width: 300px;
	}
	
	.listArea {
		border-top: 3px solid #476FAD;
		padding: 10px 10px;
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
		padding-left: 10px;
		padding-right: 30px;
	}
	
	.listArea .infoBox {
		line-height: 25px;
	}	
	
	.topBtn {
		position: fixed;
	    font-size: 25px;
	    padding: 5px 15px;
	    bottom: 30px;
	    right: 50px; 
	    display: none;
	}
</style>
<script>
	$(function(){
		$('.detailBtn').click(function() {
			$(".detail").slideToggle();
		})
		
		$("form").submit(function() {
			var bookName = $("input[name='bookName']").val();
			var authrName = $("input[name='authrName']").val();
			var lcNo = $("select[name='lcNo']").val();
			
			if(bookName == "" && authrName == "" && lcNo == ""){
				alert("검색어를 입력해주세요.");
				location.href="${pageContext.request.contextPath}/user/book/list.do";
				return false;
			}
		})
		
		$(window).scroll(function() {
			if($(this).scrollTop() > 200) {
				$(".topBtn").fadeIn();
			} else {
				$(".topBtn").fadeOut();
			}
		})
		
		$(".topBtn").click(function() {
			$("html, boby").animate({scrollTop: 0}, 400);
			return false;
		})
	})
</script>
<button class="topBtn btnBlue"><i class="fas fa-angle-up white"></i></button>
<div class="articleBg">
	<article class="contentWrap">
		<div class="wrap">
			<h3 class="pageTitle">통합자료검색</h3>
			<div class="searchArea">
				<form action="list.do" method="post">
					<h1>LIBRARY 도서검색</h1>
					<p>
						<input type="text" name="bookName" placeholder="도서 제목을 입력하세요"/>
					</p>
					<p class="detailP">
						<button type="button" class="detailBtn btnLightBlue">상세검색</button>
					</p>
					<div class="detail clearfix">
						<p class="detailLeft">
							<label>저자</label>
							<input type="text" name="authrName"/>
						</p>
						<p class="detailRight">
							<label>카테고리</label>
							<select name="lcNo">
								<option value="">전체</option>
								<c:forEach var="item" items="${lcList }">
									<option value="${item.lclasNo }">${item.lclasName }</option>
								</c:forEach>
							</select>
						</p>
					</div>
					<div class="searchBox">
						<input class="bookSchbtn" type="submit" name="search" value="검색"/>
					</div>
				</form>
			</div>
			
			<c:if test="${viewList != null }">
				<div class="listArea">
					<div class="rows">
						<c:if test="${schList == null }">
							<p class="noData">검색되는 도서가 없습니다.</p>
						</c:if>
						<c:if test="${schList != null }">
							<c:forEach var="item" items="${schList }">
								<div class="item">
									<c:if test="${item.bookImgPath == null }">
										<img class="loadImg" src="${pageContext.request.contextPath }/images/book-noImg.png" alt="book-noImg" />
									</c:if>
									<c:if test="${item.bookImgPath != null }">
										<img class="loadImg" src="${pageContext.request.contextPath }/upload/${item.bookImgPath}" alt="${item.bookName }" />
									</c:if>
									<div class="infoBox">
										<!-- "도서코드", "도서명", "저자/역자", "출판사", "발행일", "분류", "보유권수", "소장위치", "대여가능여부" -->
										<p class="bookName fontW700">${item.bookName }</p>
										<p class="bookCode"><span class="gray">도서코드 : </span>${item.bookCode }</p>
										<p class="wirter"><span class="gray">저자 : </span>${item.authrName } / <span class="gray">역자 : </span>${item.trnslrName }</p>
										<p class="pls"><span class="gray">출판사 : </span>${item.pls.plsName }</p>
										<p class="pblicDate"><span class="gray">발행일 : </span><fmt:formatDate value="${item.pblicteYear }" pattern="yyyy-MM-dd"/></p>
										<p class="cat"><span class="gray">카테고리 : </span>${item.lcNo.lclasName } / ${item.mlNo.mlsfcName }</p>
										<p class="bookCnt"><span class="gray">보유권수 : </span>${item.bookCnt }</p>
										<p class="local"><span class="gray">소장위치 : </span><fmt:formatNumber value="${item.lcNo.lclasNo }" pattern="00"/> </p>
										<p class="lendCdt"><span class="gray">대여가능여부 : </span>
											<c:if test="${item.lendPsbCdt == 0 }"><span class="lightBlue fontW700">대여가능</span></c:if>
											<c:if test="${item.lendPsbCdt == 1 }"><span class="orange fontW700">대여중</span></c:if>
											<c:if test="${item.lendPsbCdt == 2 }"><span class="red fontW700">대여불가도서</span></c:if>
										</p>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</c:if>
		</div>
	</article>
</div>
	
<%@ include file="../../userInclude/userFooter.jsp" %>