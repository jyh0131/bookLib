<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../userInclude/userHeader.jsp" %>
<style>
	
	.contentBg{
	height: 650px;
	}
	.member{
		width: 580px;
	    height: 447px;
	    border: 1px solid black;
	    margin: 30px auto;
	    padding-top: 25px;
	}
	.member p {
		font-size: 30px;	
		color:#7388a7;
		padding-left: 25px;
	}
	.loginField{
	    background: white;
   		width: 410px;
    	margin: 25px auto;
    	border: 1px solid black;
    	height: 335px
	}
	
	#topPoint{
		font-size: 20px;
		font-weight:bold;
	    width: 925px;
	    padding: 10px;
	    border-bottom: 2px solid #7388a7;
	    margin-left: 55px;
	}

	
</style>
	<article>
		<div id="topPoint">
			<p>로그인</p>
		</div>
		<form action="login.do" method="post">
			<div class="member">
				<p>MEMBER LOGIN</p>
			<div class="loginField">
						<p>
							<input type="text" name="id">
						</p>
						<p>
							<input type="password" name="password">
						</p>
						<p>
							<input type="submit" value="로그인">
						</p>
				</div>	
			</div>
		</form>
		
		
		
			<c:if test="${error == 'notMatchId' }">
				<span class="error">아이디와 비밀번호가 일치하지 않습니다.</span>
			</c:if>
	</article>

<%@ include file="../userInclude/userFooter.jsp" %>