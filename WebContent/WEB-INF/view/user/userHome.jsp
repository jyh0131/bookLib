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
input[name='bookSch'] {
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
}
.item p {
	text-align: center;
	font-size: 14px;
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
		<form action="">
			<input type="text" name="bookSch" placeholder="검색어를 입력하세요." /> <input
				type="submit" value="검색" class="bookSchbtn" />
		</form>
	</div>
	<div class="recomWrap">
		<p class="recomTitle">
			<span class="orange">N</span>월 추천도서 &nbsp;&nbsp;&gt;
		</p>
		<p class="recomBook">
			<span class="purple">도서 제목</span> &nbsp;&nbsp;|&nbsp;&nbsp;
		</p>
		<p class="recomWriter">작가</p>
		<p class="recomPls gray">출판사</p>
	</div>
	<div class="bookRankWrap">
		<div class="bastBox box">
			<h1>베스트도서 순위</h1>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/작은 아씨들.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/작은 아씨들.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/작은 아씨들.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/작은 아씨들.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/작은 아씨들.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/작은 아씨들.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/작은 아씨들.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/작은 아씨들.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
		</div>
		<div class="newBox box">
			<h1>도서관 신착도서</h1>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/아직 멀었다는 말.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/아직 멀었다는 말.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/아직 멀었다는 말.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/아직 멀었다는 말.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/아직 멀었다는 말.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/아직 멀었다는 말.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/아직 멀었다는 말.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
			<div class="bastBookItem item">
				<div class="rankImg">
					<img src="../images/아직 멀었다는 말.jpg" alt="" />
				</div>
				<p class="rankTitle">책 이름</p>
				<p class="rankWriter">작가/역자</p>
			</div>
		</div>
	</div>
</article>

<%@ include file="../userInclude/userFooter.jsp"%>