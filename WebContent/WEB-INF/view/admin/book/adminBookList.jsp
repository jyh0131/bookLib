<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	input[name='schType']:nth-of-type(2) {
		margin-left: 15px;
	}
	
	#lcNo {
		margin-left: 15px;
		margin-right: 10px;
		font-size: 16px;
	}
	
	input[name='schText'] {
		font-size: 16px;
		padding: 0 5px;
	}
</style>

<article class="contentWrap">
	<div class="wrap">
		<h2>보유도서관리</h2>
		
		<div class="listWrap">
			<div class="searchBox">
				<form action="">
					<input type="radio" name="schType" value="도서코드"/> 도서코드
					<input type="radio" name="schType" value="도서명"/> 도서명
					<select name="lcNo" id="lcNo">
						<option value="">대분류</option>
					</select>
					<input type="text" name="schText" placeholder="검색어를 입력하세요."/>
					<input type="submit" value="검색" class="btnOrange"/>
				</form>	
				
				<div id="result"></div>
			</div>
		</div>
	</div>
</article>

<%@ include file="../../adminInclude/adminFooter.jsp" %>