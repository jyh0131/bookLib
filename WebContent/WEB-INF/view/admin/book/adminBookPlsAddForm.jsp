<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu1.jsp" %>
<style>
	.wrap {
		margin-top: 100px;
		margin-left: 150px;
	}
	
	.wrap p {
		font-size: 18px;
		margin-bottom: 20px;
	}
	
	#overlepChk {
		font-size: 16px;
		margin-left: 10px;
	}
	
	.wrap label {
		font-weight: 700;
	}
	
	.wrap input[type='text'] {
		width: 250px;
		padding: 5px;
	}
	
	.wrap input {
		font-size: 18px;
	}
	
	#cancelBtn {
		margin-right: 10px;
		margin-top: 30px;
	}
	
	.plsNameWrap span {
		display: none;
		margin-left: 10px;
		font-size: 14px;
		font-weight: 700;
	}
	
</style>
<script>
	$(function(){
		$("input[name='plsName']").keydown(function() {
			$(".plsNameWrap span").hide();
		})
		
		$("#cancelBtn").click(function() {
			var cancel = confirm("출판사 등록을 취소하시겠습니까?");
			if(cancel) {
				location.href = "${pageContext.request.contextPath}/admin/book/plsList.do";
				return false;
			}
			return false;
		})
		
		$("#overlepChk").click(function() {
			var plsName = $("input[name='plsName']").val();
			if(plsName == "") {
				alert("출판사 이름을 작성해주세요.");
				return false;
			}
			
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/book/plsAdd.do",
				type:"get", 
				data:{"plsName":plsName},
				dataType:"json",
				success:function(res){
					if(res != null) {
						$(".overlepChkYes").hide();
						$(".overlepChkNo").show();
						return false
					} 
					
					$(".overlepChkYes").show();
					$(".overlepChkNo").hide();
				}
			})
		})
		
		$("form").submit(function() {
			if($("input[name='plsName']").val() == ""){
				alert("출판사 이름을 작성해주세요.");
				return false;
			}
			
			var overlepChk = $(".overlepChkYes").is(":visible");
			if(overlepChk == false) {
				alert("출판사 중복확인을 해주세요.");
				return false;
			}
			
			alert("출판사가 등록되었습니다.");
		})
	})
</script>
<article class="contentWrap">
	<h2 class="pageTitle">출판사 등록</h2>
	
	<div class="wrap">
		<form action="plsAdd.do" method="post">
			<p><label>출판사 코드</label></p>
			<p><input type="text" name="plsNo" value="${lastCode }" readonly/></p>
			<p><label>출판사 이름</label></p>
			<p class="plsNameWrap">
				<input type="text" name="plsName" placeholder="출판사 이름을 작성해주세요."/>
				<a href="#" id="overlepChk" class="btnOrange" type="button">중복확인</a>
				<span class="overlepChkNo red">중복되는 출판사가 있습니다.</span>
				<span class="overlepChkYes lightBlue">등록 가능합니다.</span>
			</p>
			<p class="btns">
				<a id="cancelBtn" class="btnPink" href="#">취소</a>
				<input class="btnAqua" type="submit" value="등록"/>
			</p>			
		</form>
	</div>
</article>

<%@ include file="../../adminInclude/adminFooter.jsp" %>