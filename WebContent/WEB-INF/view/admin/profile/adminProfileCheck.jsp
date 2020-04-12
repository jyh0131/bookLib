<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../adminInclude/adminHeader.jsp"%>
<%@ include file="../../adminInclude/adminSideMenu6.jsp"%>
<style>
	.wrap {
		position: relative;
	}
	
	.w395 {
		width: 475px;
   		height: 50px;
	}
	
	#zip{
		width:140px;
	}
	
	#id{
		width:140px;
	}
	
	.addBox {
    width: 606px;
    margin-left: 300px;
    margin-top: 70px;
	}
	
	.addBox p {
    padding-top: 10px;
    padding-bottom: 10px;
    font-size: 18px;
    width: 284px;
	}
	
	.addBox label {
width: 200px;
    display: inline-block;
    margin-bottom: 20px;
    margin-left: 146px;
    font-size: 28px;
	}
	#base, #detail{
		margin-left: 204px;
	}
	.addBox input[type="text"],
	.addBox input[type="date"],
	.addBox input[type="password"],
	.addBox select {
		font-size: 18px;
		padding: 5px;
	}
	
	.addBox input[type="submit"]{
    font-size: 20px;
    margin: 26px 125px;
    width: 227px;
    height: 62px;
	}
	
	.addBox .fas {
		color: #D9D9D9;
	}
	
	.error {
		font-size: 14px;
		color: red;
		display: none;
	}

	.getImg {
		position: absolute;
    	top: 90px;
   		border: 1px solid #ddd;
    	padding: 5px;
	}
	
	.getImg img {
		width: 215px;
	    border: 1px solid #ddd;
	    display: block;
	    height: 250px;
	}
	
</style>
<script>
	
	$(function(){
		//정규표현식
		$("form").submit(function(){
			$(".error").hide();
			$(".fas").css("color", "#D9D9D9");
			
			function errors(item) {
				$(item).nextAll(".error").show();
				$(item).nextAll(".fas").css("color", "#E8396F");
			}
			
			var pass = $("input[name='pass']");		
			if (pass.val() != "${libInfo.lbPass}" || pass.val()=="") {
				errors(pass);
				return false;
			}else if(pass.val() == "${libInfo.lbPass}"){
				location.href = "${pageContext.request.contextPath}/admin/profile/adminProfile.do";
			}
		})
	})
	
</script>
<article class="contentWrap">
	<div class="wrap">
		<h2 class="pageTitle">비밀번호 재확인</h2>
		<div class="addBox">
			<form action="adminProfilePwCheck.do" method="post" autocomplete="off">
				<p>
					<label>비밀번호 재입력</label>
					<input class="w395" type="password" name="pass"/>
					<i class="fas fa-feather-alt"></i>
					<span class="error">비밀번호가 일치하지 않습니다.</span>
				</p>

				<div class="submitBtn">
					<input type="submit" value="입력" class="btnPurple"/>
				</div>
			</form>
		</div>
	</div>
</article>
<%@ include file="../../adminInclude/adminFooter.jsp"%>