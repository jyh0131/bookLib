<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../userInclude/userHeader.jsp" %>
<%@ include file="../../userInclude/userSideMenu2.jsp" %>
<style>
	.wrap {
		padding: 30px;
	}
	
	.formWrap {
		width: 250px;
		margin: 0 auto;
		margin-top: 50px;
	}
	
	.formWrap p {
		font-weight: 700;
		padding: 5px;
	}
	
	.formWrap input {
		padding: 5px;
		font-size: 16px;
	}
	
	.formWrap .error {
		font-size: 14px;
		color: red;
		font-weight: 400;
		padding-left: 5px;
		padding-bottom: 5px;
		display: block;
		visibility: hidden;
	}
	
	.formWrap p.noError {
		padding-bottom: 25px;
	}
	
	.formWrap .fas {
		color: #d9d9d9;
	}
	
	.formWrap p.btns {
		padding-top: 30px;
		padding-left: 20px;
	}
	
	.formWrap p.btns input {
		padding: 10px 20px;
	}
</style>
<div class="articleBg">
	<article class="contentWrap">
		<div class="wrap">
			<h3 class="pageTitle">희망도서신청</h3>
			<div class="formWrap">
				<form action="">
					<p>신청도서명</p>
					<p>
						<input type="text" name="bookName"/> 
						<i class="fas fa-feather-alt"></i>
					</p>
						<span class="error">도서명을 작성해주세요.</span>
					
					<p>저자</p>
					<p>
						<input type="text" name="authr"/>	
						<i class="fas fa-feather-alt"></i>					
					</p>
						<span class="error">저자를 작성해주세요.</span>
					<p>역자</p>
					<p class="noError">
						<input type="text" name="trnslr"/>
					</p>
					<p>출판사</p>
					<p>
						<input type="text" name="pls"/>
						<i class="fas fa-feather-alt"></i>
					</p>
						<span class="error">출판사를 작성해주세요.</span>
					<p class="btns">
						<input type="reset" value="취소" class="btnPink"/>
						<input type="submit" value="신청" class="btnBlue"/>
					</p>
				</form>
			</div>
		</div>
	</article>
</div>
	
<%@ include file="../../userInclude/userFooter.jsp" %>