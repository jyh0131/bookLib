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
		font-size: 14px;
		font-weight: 700;
	}
	
	.wrap .fas, 
	.wrap .far {
		font-size: 20px;
		padding: 10px;
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
					
			var overlepYes = $(".overlepChkYes").is(":visible");
			if(overlepYes == false) {
				alert("출판사 중복확인을 확인해주세요.");
				return false;
			}
			
			var type = $(".pageTitle").text();
			
			if(type == '출판사 등록') {				
				alert("출판사가 등록되었습니다.");
			}
			if(type == "출판사 수정"){
				alert("출판사가 수정되었습니다.");
			}
		})
	})
</script>
<article class="contentWrap">
	<c:if test="${type == 'add' }">
		<h2 class="pageTitle">출판사 등록</h2>
	</c:if>
	<c:if test="${type == 'update' }">
		<h2 class="pageTitle">출판사 수정</h2>		
	</c:if>
	
	<div class="wrap">
		<form action="plsAdd.do?type=${type }&no=${pls.plsNo }" method="post">
			<p><label>출판사 코드</label></p>
			<p>
				<c:if test="${type == 'add' }">
					<input type="text" name="plsNo" value="${lastCode }" readonly/>
				</c:if>
				<c:if test="${type == 'update' }">
					<input type="text" name="plsNo" value="${pls.plsNo }" readonly/>
				</c:if>
			</p>
			<p><label>출판사 이름</label></p>
			<p class="plsNameWrap">
				<c:if test="${type == 'add' }">					
					<input type="text" name="plsName" placeholder="출판사 이름을 작성해주세요."/>
				</c:if>
				<c:if test="${type == 'update' }">
					<input type="text" name="plsName" value="${pls.plsName }" placeholder="출판사 이름을 작성해주세요."/>				
				</c:if>
				<a href="#" id="overlepChk" class="btnOrange" type="button">중복확인</a>
				<span class="overlepChkNo red"><i class="far fa-times-circle red"></i>중복되는 출판사가 있습니다.</span>
				<span class="overlepChkYes lightBlue"><i class="fas fa-check-circle aqua"></i></span>
			</p>
			<p class="btns">
				<a id="cancelBtn" class="btnPink" href="#">취소</a>
				<c:if test="${type == 'add' }">
					<input class="btnAqua" type="submit" value="등록"/>				
				</c:if>
				<c:if test="${type == 'update' }">
					<input class="btnAqua" type="submit" value="수정"/>				
				</c:if>
			</p>			
		</form>
	</div>
</article>

<%@ include file="../../adminInclude/adminFooter.jsp" %>