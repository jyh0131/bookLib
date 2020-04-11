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
		width: 250px;
	}
	
	#zip{
		width:140px;
	}
	
	#id{
		width:140px;
	}
	
	.addBox {
		width: 700px;
		margin-left: 300px;
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
		margin: 50px 200px;
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
			if (pass.val() != passCheck.val() || pass=="") {
				errors(pass);
				return false;
			}
		})
		
		$("#IdCheck").click(function() {
			var id = $("input[name='id']").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/login/idCheck.do",
				type : "get",
				data : {"id" : id},
				success : function(res) {
					console.log(res);
					
					
					if (res != null) {
						alert("중복되는 아이디입니다");
						$("input[name='id']").val("");
					}else if(res == null){
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		})
	})
	
</script>
<article class="contentWrap">
	<div class="wrap">
		<h2 class="pageTitle">비밀번호 재확인</h2>
		
		<div class="addBox">
			<form action="profilePwCheck.do" method="post" autocomplete="off">
				<p>
					<label>비밀번호</label>
					<input class="w395" type="password" name="pass" placeholder="비밀번호"/>
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