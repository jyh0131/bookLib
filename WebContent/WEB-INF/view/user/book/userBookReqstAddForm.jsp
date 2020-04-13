<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../userInclude/userHeader.jsp" %>
<%@ include file="../../userInclude/userSideMenu2.jsp" %>
<style>
	.wrap {
		padding: 30px;
	}
	
	.formWrap {
		width: 250px;
		margin: 0 auto;
		margin-top: 50px;
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
		padding-left: 20px;
	}
	
	.formWrap p.btns input {
		padding: 10px 20px;
	}
</style>
<script>
	$(function(){
		$(".cancel").click(function(){
			alert("희망도서신청을 취소합니다.");
			location.href = "${pageContext.request.contextPath}/user/home.do";
		})
		
		$("#addBtn").click(function() {
			$(".error").css("visibility", "hidden");
			
			var bookName = $("input[name='bookName']");
			var authr = $("input[name='authr']");
			var pls = $("input[name='pls']");
			
			if(bookName.val() == "") {
				$(".bookName").css("visibility", "visible");
				bookName.next().css("color", "red");
				return false;
			}
			
			if(authr.val() == "") {
				$(".authr").css("visibility", "visible");
				authr.next().css("color", "red");
				return false;
			}
			
			if(pls.val() == "") {
				$(".pls").css("visibility", "visible");
				pls.next().css("color", "red");
				return false;
			}
			
			$.ajax({
				url:"${pageContext.request.contextPath}/user/book/requestOverlap.do",
				type:"post",
				data:{bookName:$("input[name='bookName']").val(), authr :$("input[name='authr']").val(), 
					trnslr :$("input[name='trnslr']").val(), pls :$("input[name='pls']").val()},
				datatype: "json", 
				success:function(res){
					console.log(res);
					if(res.result == "bookHave") {
						alert("중복된 도서");
						/* location.href = "${pageContext.request.contextPath}/user/book/requestAdd.do"; */
						return false;
					} else {
						$("#f1").submit();
					}
				}
			})
			
		})
	})
</script>
<div class="articleBg">
	<article class="contentWrap">
		<div class="wrap">
			<h3 class="pageTitle">희망도서신청</h3>
			<div class="formWrap">
				<form action="requestAdd.do" method="post" id="f1">
					<p>신청도서명</p>
					<p>
						<input type="text" name="bookName"/> 
						<i class="fas fa-feather-alt"></i>
					</p>
					<span class="error bookName">도서명을 작성해주세요.</span>
					
					<p>저자</p>
					<p>
						<input type="text" name="authr"/>	
						<i class="fas fa-feather-alt"></i>					
					</p>
					<span class="error authr">저자를 작성해주세요.</span>
					
					<p>역자</p>
					<p class="noError">
						<input type="text" name="trnslr"/>
					</p>
					
					<p>출판사</p>
					<p>
						<input type="text" name="pls"/>
						<i class="fas fa-feather-alt"></i>
					</p>
					<span class="error pls">출판사를 작성해주세요.</span>
					
					<p class="btns">
						<input type="button" value="취소" class="btnPink cancel"/>
						<input type="button" value="신청" class="btnBlue" id="addBtn"/>
					</p>
				</form>
			</div>
		</div>
	</article>
</div>
	
<%@ include file="../../userInclude/userFooter.jsp" %>