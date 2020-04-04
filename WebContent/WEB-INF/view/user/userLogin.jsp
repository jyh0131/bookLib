<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../userInclude/userHeader.jsp"%>
<style>
.contentBg {
	height: 650px;
}
.member {
	width: 540px;
	height: 480px;
	margin: 35px auto;
	padding-top: 25px;
}

.member p {
	font-size: 35px;
    color: #7388a7;
    padding-left: 138px;
    font-weight: bold;
}

.loginField {
    background: white;
    width: 377px;
    margin: 25px auto;
    border-bottom: 1px solid darkgray;
    height: 280px;
}

#topPoint {
	font-size: 24px;
	font-weight: bold;
	width: 893px;
	padding: 15px;
	border-bottom: 2px solid #7388a7;
	margin-left: 77px;
}

.input-area input {
    margin: 10px;
    width: 360px;
    height: 50px;
}
.input-area::placeholder{
	color:#8e8e8e;
	font-size: 15px;
}
input[type="submit"] {
	margin: 10px;
	width: 365px;
	height: 60px;
	background: #476fad;
	color: white;
	font-size: 20px;
	border:none;
}
.loginALink{
	padding: 20px 108px;
}
.loginALink a {
    font-size: 15px;
    color: #8e8e8e;
    float: left;
    padding: 0 15px;
    border-right: 1px solid #8e8e8e;

}
#aJoin{
	font-size: 15px;
    color: #8e8e8e;
    float: left;
  	padding:0 15px;
  	border:none;
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
				<div class="input-area" >
					<input type="text" name="id" placeholder="  아이디">
				</div>
				<div class="input-area">
					<input type="password" name="password" placeholder="  비밀번호">
				</div>
				<div class="loginBtn">
					<input type="submit" value="로그인">
				</div>
			</div>

			<div class="loginALink">
				<div class="aLink">
					<a href="${pageContext.request.contextPath }/user/findId.do">아이디 찾기</a>
				</div>
				<div class="aLink">
					<a href="#">비밀번호 찾기</a>
				</div>
				<div class="aLink">
					<a href="#" id="aJoin">회원가입</a>
				</div>
			</div>
		</div>
	</form>
</article>
<%@ include file="../userInclude/userFooter.jsp"%>