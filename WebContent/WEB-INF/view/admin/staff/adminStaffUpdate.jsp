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
	
	#id{
   	 	width: 251px;
    	background: lightgray;
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
	.addBox input[type="text"],
	.addBox select {
		font-size: 18px;
		padding: 5px;
	}

	.addBox .fas {
		color: #D9D9D9;
	}
	
	.error {
		font-size: 14px;
		color: red;
		display: none;
	}

	.submitBtn{
		width:100px;
		position: relative;
	}
	
		
	#cancel{
    font-size: 20px;
    width: 100px;
    text-align: center;
    position: absolute;
    top: 16px;
    left: 344px;

	}
	
	.addBox input[type="submit"]{
    font-size: 20px;
    margin: 31px 150px;
    position: absolute;
    top: -15px;
    left: 55px;
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
	
			
			var nameReg = /^[가-힣a-zA-Z]{1,20}$/;
			var name = $("input[name='name']");			
			if(name.val() == "" || nameReg.test(name.val())==false) {
				errors(name);
				return false;
			}
			
			var titleNo = $("select[name='title']");
			if(titleNo.val()=="직급 선택"){
				errors(titleNo);
				return false;
			}
			
			var workCdt = $("select[name='workCdt']");
			if(workCdt.val()=="근무여부 선택"){
				errors(workCdt);
				return false;
			}
			

				alert("[" +  $("#name").val() + "]님의 정보수정이 완료되었습니다.");
		})
		
		$("#cancel").click(function() {
			var cancel = confirm("직원정보 수정을 취소하시겠어요?");
			if(cancel){
				location.href="${pageContext.request.contextPath}/admin/staff/management.do";
				return false;
			}
			return false;
		})
		
	})
	
</script>
<article class="contentWrap">
	<div class="wrap">
		<h2 class="pageTitle">직원정보 수정</h2>
		
		<div class="addBox">
			<form action="staffUpdate.do" method="post">
				<p>
					<label>아이디 </label>
					<input class="w395" type="text" name="id" id="id" readonly value="${item.lbId }"/>
				</p>
				<p>
					<label>이 름</label>
					<input class="w395" type="text" name="name" id="name" value="${item.lbName}"/>
					<i class="fas fa-feather-alt"></i>
					<span class="error">한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</span>
				</p>
				
					<p>
					<label>직급</label>
					<select name="title">
						<option>직급 선택</option>
						 <option value=0 <c:if test="${item.title.titleNo == 0}">selected</c:if>>총관리자</option>
						<option value=1 <c:if test="${item.title.titleNo == 1}">selected</c:if>>사서</option>
					</select>
					<i class="fas fa-feather-alt"></i>
					<span class="error">직급을 선택해주세요.</span>
				</p>
				
				<p>
					<label>근무여부</label>
					<select name="workCdt">
						<option>근무여부 선택</option>
						 <option value=1 <c:if test="${item.workCdt == 1}">selected</c:if>>재직</option>
						<option value=0 <c:if test="${item.workCdt == 0}">selected</c:if>>퇴직</option>
					</select>
					<i class="fas fa-feather-alt"></i>
					<span class="error">근무여부를 선택해주세요.</span>
				</p>
				
				<div class="submitBtn">
					<input type="submit" value="정보 수정" class="btnPurple"/>
					<button class="btnPurple" id="cancel">취소</button>
				</div>
			</form>
		</div>
	</div>
</article>

<%@ include file="../../adminInclude/adminFooter.jsp" %>