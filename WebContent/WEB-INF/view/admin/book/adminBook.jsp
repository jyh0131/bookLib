<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu1.jsp" %>

<style>
	.wrap {
		padding: 50px;
	}
	
	.wrap h2 {
		padding: 10px;
		border-bottom : 1px solid #D9D9D9;
		border-left: 10px solid #014E9E;
		margin-bottom: 30px;
	}
	
	.addBox {
		padding-left: 30px;
		width: 900px;
		margin: 0 auto;
	}
	
	.addBox p {
		padding-top: 10px;
		padding-bottom: 10px;
		font-size: 18px;
	}
	
	.addBox label {
		width: 200px;
		display: inline-block;
	}
	
	.addBox input[type="text"],
	.addBox input[type="date"],
	.addBox select {
		font-size: 18px;
		padding: 5px;
	}
	
	input[type="radio"]:nth-of-type(2) {
		margin-left: 30px;
	}
	
	.addBox input[type="submit"]{
		font-size: 20px;
		margin: 50px 200px;
	}
	
	.fas {
		color: #D9D9D9;
	}
	
</style>

<script>
	$(function(){
		// 정규표현식 및 입력 확인
		$()
	})
</script>

<article class="contentWrap">
	<div class="wrap">
		<h2>도서등록</h2>
		
		<div class="addBox">
			<form action="">
				<p>
					<label>도서명 </label>
					<input type="text" name="bookName"/>
					<i class="fas fa-feather-alt"></i>
				</p>
				<p>
					<label>저 자</label>
					<input type="text" name="authrName"/>
					<i class="fas fa-feather-alt"></i>
				</p>
				<p>
					<label>역 자</label>
					<input type="text" name="trnslrName"/>
				</p>
				<p>
					<label>도서가격</label>
					<input type="text" name="bookPrice"/>
					<i class="fas fa-feather-alt"></i>
				</p>
				<p>
					<label>카테고리(분류)</label>
					<select name="lcNo" id="lcNo">
						<option value="noNum">대분류 선택</option>
						<option value="번호넣기">데이터 넣기</option>
					</select>
					<select name="mlNo" id="mlNo">
						<option value="noNum">중분류 선택</option>
						<option value="번호넣기">데이터넣기</option>
					</select>
					<i class="fas fa-feather-alt"></i>
				</p>
				<p>
					<label>출판사</label>
					<select name="pls" id="pls">
						<option value="번호넣기">출판사 선택</option>
						<option value="번호넣기">데이터넣기</option>
					</select>
					<button class="btnOrange plsSearch">검색</button>
					<i class="fas fa-feather-alt"></i>
				</p>
				<p>
					<label>출간일</label>
					<input type="date" name="pblicteYear"/>
					<i class="fas fa-feather-alt"></i>
				</p>
				<p>
					<label>대여가능겨부</label>
					<input type="radio" name="lendPsbCdt"/> 대여 가능
					<input type="radio" name="lendPsbCdt"/> 대여 불가능
					<i class="fas fa-feather-alt"></i>
				</p>
				
				<div class="submitBtn">
					<input type="submit" value="도서 등록" class="btnPurple"/>
				</div>
			</form>
		</div>
	</div>

</article>

<div>

</div>
	
<%@ include file="../../adminInclude/adminFooter.jsp" %>