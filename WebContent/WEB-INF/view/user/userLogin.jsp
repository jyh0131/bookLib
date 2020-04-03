<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../userInclude/userHeader.jsp" %>
<style>
	.contentBg{
	height: 650px;
	}
	.member{
	    width: 540px;
    	height: 480px;
   		border: 1px solid black;
    	margin: 35px auto;
    	padding-top: 25px;
	}
	.member p {
		font-size: 30px;	
		color:#7388a7;
		padding-left: 25px;
	}
	.loginField{
	     background: white;
	    width: 323px;
	    margin: 21px auto;
	    border: 1px solid black;
	    height: 225px;
	}
	#topPoint{
		font-size: 24px;
	    font-weight: bold;
	    width: 893px;
	    padding: 15px;
	    border-bottom: 2px solid #7388a7;
	    margin-left: 77px;
	}
	input[name="id"]{
		margin:10px;
		width:300px;
		height:50px;
	}
	input[name="password"]{
		margin:10px;
		width:300px;
		height:50px;
	}
	input[type="submit"]{
		margin:10px;
		width:300px;
		height:50px;
		background: #476fad;
		color:white;
		font-size: 20px;
		
	}
	
</style>
<script>
	$(function() {
		<c:if test="${error == 'retire'}">
			alert("로그인 권한이 없습니다.");
		</c:if>
		<c:if test="${error == 'notMatchId' }">
			alert("비밀번호가 틀렸거나 등록하지 않은 아이디입니다.");
		</c:if>
	})
</script>

	<article>
		<div id="topPoint">
			<p>로그인</p>
		</div>
		<form action="login.do" method="post">
			<div class="member">
				<p>MEMBER LOGIN</p>
			<div class="loginField">
			
						<div class="idText">
							<i class="far fa-id-badge"><input type="text" name="id"></i>
							
						</div>
						<div class="passText">
							<input type="password" name="password">
						</div>
					<div class="loginBtn">
						<input type="submit" value="로그인">
					</div>
				</div>	
			</div>
		</form>
			
	</article>

<%@ include file="../userInclude/userFooter.jsp" %>