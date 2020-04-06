<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu1.jsp" %>

<style>
	.box {
		float: left;
		width: 50%;
		min-width: 300px;
	}
	
	.imgWrap img {
		width: 198px;
		margin: 0 auto;
		display: block;
		margin-bottom: 20px;
	}
	
	.info {
		text-align: center;
		line-height: 30px;
	}
	
	.pick {
		font-size: 20px;
		margin-bottom: 10px;
	}
	
	.detailWrap h3 {
		border-left: 5px solid #3493DD;
		padding-left: 10px;
		margin-bottom: 30px;
	}
	
	.detailWrap textarea {
		width: 95%;
		font-size: 16px;
		height: 400px;
		padding: 10px;
		margin-bottom: 20px;
	}
	
	.btns {
		text-align: right;
	}
	
	.btn {
		font-size: 18px;
		margin: 10px;
	}
</style>

<script>
	$(function(){
		$(".cancel").click(function() {
			var res = confirm("추천도서 등록을 취소하시겠습니까?");
			if(res){
				alert("취소되었습니다");
				location.href = "${pageContext.request.contextPath}/admin/book/recomList.do"
			}
			return false;
		})
		
		$("form").submit(function() {
			var bookCont = $("textarea[name='bookCont']").val();
			if(bookCont == "") {
				alert("추천글을 작성해주세요.");
				return false;
			}
			alert("추천도서가 등록되었습니다.");
		})
	})
</script>

<article class="contentWrap">
	<h2 class="pageTitle">추천도서 추천글 작성</h2>
	
	<div class="wrap clearfix">
		<form action="recomAdd.do" method="post">
			<input type="hidden" name="bookCode" value="${pick.bookCode }"/>
			<div class="pickInfo box">
				<div class="imgWrap">
					<c:if test="${pick.bookImgPath == null }">
						<img src="${pageContext.request.contextPath }/images/book-noImg.png" alt="이미지준비중" />
					</c:if>
					<c:if test="${pick.bookImgPath != null }">
						<img src="${pageContext.request.contextPath }/upload/${pick.bookImgPath}" alt="${pick.bookName }" />
					</c:if>
				</div>
				<div class="info">
					<p class="fontW700">도서명</p>
					<p class="pick">${pick.bookName }</p>
					<p class="fontW700">저자</p>
					<p class="pick">${pick.authrName }</p>
					<c:if test="${pick.trnslrName != null }">
						<p class="fontW700">역자</p>
						<p class="pick">${pick.trnslrName }</p>
					</c:if>
					<p class="fontW700">출판사</p>
					<p class="pick">${pick.pls.plsName }</p>
					<p class="fontW700">카테고리(분류)</p>
					<p class="pick">${pick.lcNo.lclasName } / ${pick.mlNo.mlsfcName }</p>
				</div>
			</div>
			<div class="detailWrap box">
				<h3>추천글 작성</h3>
				<textarea name="bookCont"></textarea>
				<div class="btns">
					<a class="btnLightBlue btn cancel" href="#">취소</a>
					<input class="btnPurple btn add" type="submit" value="등록"/>
				</div>
			</div>
		</form>
	</div>
</article>

<%@ include file="../../adminInclude/adminFooter.jsp" %>