<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../userInclude/userHeader.jsp"%>

<style>
.contentBg,
.contentWrap {
	background-color: transparent;
}
article.contentWrap {
	padding: 20px 0;
}
div.searchBox {
	background: url("../images/bg1.png") no-repeat;
	background-size: cover;
	text-align: center;
	padding: 30px;
}
div.searchBox h1 {
	color: #fff;
	margin-bottom: 10px;
	font-size: 36px;
}
input[name='bookName'] {
	width: 60%;
	border: none;
	font-size: 18px;
	padding: 10px;
	margin-right: 10px;
}
.bookSchbtn {
	border: none;
	padding: 10px;
	font-size: 18px;
	font-weight: 700;
	background: #E8396F;
	color: #fff;
	cursor: pointer;
}
.bookSchbtn:hover {
	background: #FF9900;
}
.recomWrap {
	margin: 20px 0;
	padding: 20px 45px;
	background: #fff;
	overflow: hidden;
}
.recomWrap p {
	float: left;
	font-size: 18px;
	font-weight: 700;
}
p.recomTitle {
	margin-right: 100px;
}
p.recomPls {
	margin-left: 100px;
	font-size: 14px;
	font-weight: 400;
	line-height: 21px;
}
div.bookRankWrap, div.box {
	overflow: hidden;
}
div.bastBox {
	float: left;
	width: 49%;
	background: #fff;
}
div.newBox {
	float: right;
	width: 49%;
	background: #fff;
}
div.box h1 {
	padding: 20px;
}
.item {
	float: left;
	margin: 0 21px;
	margin-bottom: 25px;
	width: 90px;
	height: 180px;
}
.item p {
	text-align: center;
    font-size: 14px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
.rankImg {
	width: 90px;
	height: 135px;
	margin-bottom: 10px;
}
.rankImg img {
	width: 100%;
	height: 100%;
}
</style>

<article class="contentWrap">
	<div class="searchBox">
		<h1>LIBRARY 도서검색</h1>
		<form action="book/list.do" method="post">
			<input type="text" name="bookName" placeholder="도서 제목을 입력하세요" /> 
			<input type="submit" value="검색" class="bookSchbtn" />
		</form>
	</div>
	<div class="recomWrap">
		<p class="recomTitle">
			<a href="${pageContext.request.contextPath}/uesr/book/recom.do">
				이달의 <span class="orange">추천도서</span> &nbsp;&nbsp;<i class="fas fa-angle-right"></i>
			</a>
		</p>
		<p class="recomBook">
			<span class="purple">${recom.bookCode.bookName }</span> &nbsp;&nbsp;|&nbsp;&nbsp;
		</p>
		<c:if test="${recom.bookCode.trnslrName == null }"><p class="recomWriter">${recom.bookCode.authrName }</p></c:if>
		<c:if test="${recom.bookCode.trnslrName != null }"><p class="recomWriter">${recom.bookCode.authrName } / ${recom.bookCode.trnslrName }</p></c:if>
		<p class="recomPls gray">${recom.bookCode.pls.plsName }</p>
	</div>
	<div class="bookRankWrap">
		<div class="bastBox box">
			<h1><a href="${pageContext.request.contextPath}/user/book/bastList.do">베스트도서 순위 <i class="fas fa-angle-right"></i></a></h1>
			<c:forEach var="item" items="${lendList }">	
				<a href="${pageContext.request.contextPath }/user/book/detail.do?no=${item.bookCd.bookCode}">
					<div class="bastBookItem item">
						<div class="rankImg">
							<c:if test="${item.bookCd.bookImgPath == null }">
								<img class="loadImg" src="${pageContext.request.contextPath }/images/book-noImg.png" alt="book-noImg" />
							</c:if>
							<c:if test="${item.bookCd.bookImgPath != null }">
								<img class="loadImg" src="${pageContext.request.contextPath }/upload/${item.bookCd.bookImgPath}" alt="${item.bookCd.bookName }" />
							</c:if>
						</div>
						<p class="rankTitle">${item.bookCd.bookName }</p>
						<c:if test="${item.bookCd.trnslrName == null }">
							<p class="rankWriter">${item.bookCd.authrName }</p>
						</c:if>
						<c:if test="${item.bookCd.trnslrName != null }">
							<p class="rankWriter">${item.bookCd.authrName } / ${item.bookCd.trnslrName}</p>
						</c:if>
					</div>
				</a>
			</c:forEach>
		</div>
		<div class="newBox box">
			<h1><a href="${pageContext.request.contextPath}/user/book/newList.do">도서관 신착도서 <i class="fas fa-angle-right"></i></a></h1>
			<c:forEach var="newItem" items="${newList }">
				<a href="${pageContext.request.contextPath }/user/book/detail.do?no=${newItem.bookCode}">				
					<div class="bastBookItem item">
						<div class="rankImg">
							<c:if test="${newItem.bookImgPath == null }">
								<img class="loadImg" src="${pageContext.request.contextPath }/images/book-noImg.png" alt="book-noImg" />
							</c:if>
							<c:if test="${newItem.bookImgPath != null }">
								<img class="loadImg" src="${pageContext.request.contextPath }/upload/${newItem.bookImgPath}" alt="${newItem.bookName }" />
							</c:if>
						</div>
						<p class="rankTitle">${newItem.bookName }</p>
						<c:if test="${newItem.trnslrName == null }">
							<p class="rankWriter">${newItem.authrName }</p>
						</c:if>
						<c:if test="${newItem.trnslrName != null }">
							<p class="rankWriter">${newItem.authrName } / ${item.bookCd.trnslrName}</p>
						</c:if>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</article>

<%@ include file="../userInclude/userFooter.jsp"%>