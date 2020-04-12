<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../userInclude/userHeader.jsp" %>
<%@ include file="../../userInclude/userSideMenu3.jsp" %>
<style>
	.wrap {
		padding: 30px;
	}
	
	.formWrap {
    width: 250px;
    margin: 0 auto;
    margin-top: 155px;
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
    padding-left: 10px;
	}
	
	.formWrap p.btns input {
		padding: 10px 20px;
	}

</style>
<script>
	$(function(){
		$(".cancel").click(function(){
			alert("프로필 수정을 취소하셨습니다.");
			location.href = "${pageContext.request.contextPath}/user/home.do";
		})
		
		$("form").submit(function() {
			$(".error").css("visibility", "hidden");
			
			var pass = $("input[name='pass']");
			
			if(pass.val() == "" || pass.val() != "${memberInfo.mberPass}") {
				$(".bookName").css("visibility", "visible");
				pass.next().css("color", "red");
				return false;
			}else if(pass.val() == "${memberInfo.mberPass}"){
				location.href = "${pageContext.request.contextPath}/user/member/profile.do";
			}
		})
	})
</script>
<div class="articleBg">
	<article class="contentWrap">
		<div class="wrap">
			<h3 class="pageTitle">비밀번호 재확인</h3>
			<div class="formWrap">
				<form action="profilePwCheck.do" method="post" autocomplete="off" >
					<p>비밀번호 재입력</p>
					<p>
						<input type="password" name="pass"/> 
						<i class="fas fa-feather-alt"></i>
					</p>
					<span class="error bookName">비밀번호가 일치하지 않습니다.</span>
				
					<p class="btns">
						<input type="button" value="홈 이동" class="btnPink cancel"/>
						<input type="submit" value="입력" class="btnBlue"/>
					</p>
				</form>
			</div>
		</div>
	</article>
</div>
<%@ include file="../../userInclude/userFooter.jsp" %>