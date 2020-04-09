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
		padding: 20px 10px;
	}
</style>
<script>
	$(function(){
		$('.detailBtn').click(function() {
			$(".detail").slideToggle();
		})
	})
</script>
<div class="articleBg">
	<article class="contentWrap">
		<div class="wrap">
			<h3 class="pageTitle">통합자료검색</h3>
			<div class="searchArea">
				<form action="">
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
							</select>
						</p>
					</div>
					<div class="searchBox">
						<input class="bookSchbtn" type="submit" name="search" value="검색"/>
					</div>
				</form>
			</div>
			
			<div class="listArea">
				<div class="row">
					도서이미지/도서정보 나타내기
				</div>
			</div>
		</div>
	</article>
</div>
	
<%@ include file="../../userInclude/userFooter.jsp" %>