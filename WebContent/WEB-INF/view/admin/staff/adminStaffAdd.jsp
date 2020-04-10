<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu4.jsp" %>
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
			
			var idReg = /^[a-z0-9@\_\-\.]{5,20}$/;
			var id = $("input[name='id']");			
			if(id.val() == "" || idReg.test(id.val())==false) {
				errors(id);
				return false;
			}
			
			var nameReg = /^[가-힣a-zA-Z]{1,20}$/;
			var name = $("input[name='name']");			
			if(name.val() == "" || nameReg.test(name.val())==false) {
				errors(name);
				return false;
			}
			
			var passReg = /^[a-zA-Z0-9!@#$%^&]{8,16}$/;
			var pass = $("input[name='pass']");			
			if(pass.val() == "" || passReg.test(pass.val())==false) {
				errors(pass);
				return false;
			}
			
			var pass = $("input[name='pass']");		
			var passCheck = $("input[name='passCheck']");
			if (pass.val() != passCheck.val() || passCheck=="") {
				errors(passCheck);
				return false;
			}
			
			var titleNo = $("select[name='title']");
			if(titleNo.val()=="직급 선택"){
				errors(titleNo);
				return false;
			}
				
				alert("[" +  $("#name").val() + "]님의 사서가입이 완료되었습니다.");
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
		<h2 class="pageTitle">사서 등록</h2>
		
		<div class="addBox">
			<form action="staffAdd.do" method="post" autocomplete="off">
				<p>
					<label>아이디 </label>
					<input type="text" name="id" id="id" placeholder="사서아이디"/>
					<button class="btnOrange plsSearch" type="button" id="IdCheck">중복확인</button>
					<i class="fas fa-feather-alt"></i>
					<span class="error">5~20자의 영문 소문자와 숫자,특수기호(@_-.)만 사용 가능합니다.</span>
				</p>
				<p>
					<label>이 름</label>
					<input class="w395" type="text" name="name" id="name" placeholder="이름"/>
					<i class="fas fa-feather-alt"></i>
					<span class="error">한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</span>
				</p>
				<p>
					<label>비밀번호</label>
					<input class="w395" type="password" name="pass" placeholder="비밀번호"/>
					<i class="fas fa-feather-alt"></i>
					<span class="error">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
				</p>
				<p>
					<label>비밀번호 확인</label>
					<input class="w395" type="password" name="passCheck" placeholder="비밀번호 확인"/>
					<i class="fas fa-feather-alt"></i>
					<span class="error">비밀번호가 일치하지않습니다.</span>
				</p>
				<p>
					<label>직급</label>
					<select name="title">
						<option>직급 선택</option>
						<c:forEach var="list" items="${titleList }">
							<option value="${list.titleNo }">${list.titleName }</option>
						</c:forEach>
					</select>
					<i class="fas fa-feather-alt"></i>
					<span class="error">직급을 선택해주세요.</span>
				</p>

				<div class="submitBtn">
					<input type="submit" value="사서 등록" class="btnPurple"/>
				</div>
			</form>
		</div>
	</div>
</article>

<%@ include file="../../adminInclude/adminFooter.jsp" %>