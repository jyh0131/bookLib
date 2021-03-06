<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu1.jsp" %>

<style>
	.searchBox {
		width: 90%;
		min-width: 500px;
		margin: 0 auto;
		margin-bottom: 30px;
	}

	input[value='name']{
		margin-left: 5px;
	}

	input[name='pls'] {
		margin-left: 5px;
		font-size: 16px;
	}
	
	.searchBox a {
		float: right;
	}
	
	.list {
		width: 90%;
		min-width: 500px;
		margin: 0 auto;
		overflow: auto;
    	max-height: 600px;
    	border-bottom: 1px solid #D9D9D9;
    	border-top: 1px solid #D9D9D9;
	}
	
	#plsList {
		width: 100%;
	}
	
	tr:nth-of-type(odd) {
		background-color: #D9D9D9;
	}
	
	tr:first-child {
		background-color: #476fad;
	}
	
	th {
		color: #fff;
	}
	
	th {
		padding: 10px;
	}
	
	td {
		padding: 5px;
	}
	
	td {
		text-align: center;
	}
	
	.noDate {
		font-size: 18px;
		padding: 20px;
	}
</style>
<script>
	$(function(){
		$("form").submit(function() {
			var pls = $("input[name='pls']").val();
			
			if($("input[value='code']").prop("checked") && pls != ""){
				var plsReg = /^[0-9]+$/;
				if(plsReg.test(pls) == false) {
					alert("출판사코드(숫자)를 입력해주세요.")
					return false;
				}
			}
		})
		
		$(".deleteBtn").click(function() {
			var name = $(this).parent().prev().text();
			var res = confirm("출판사["+name+"] 데이터를 삭제하시겠습니까?");
			if(res == false){
				return false;
			}
		})
	})
</script>
<article class="contentWrap">
	<h2 class="pageTitle">출판사 관리</h2>
	
	<div class="listWrap">
		<div class="searchBox clearfix">
			<form action="plsList.do" method="post">
				<input type="radio" name="plsChk" value="code" checked/> 출판사 코드 
				<input type="radio" name="plsChk" value="name"/> 출판사 이름
				<input type="text" name="pls"/>
				<input type="submit" value="검색" class="btnOrange" />
				<a class="addBtn btnPurple" href="${pageContext.request.contextPath }/admin/book/plsAdd.do?type=add">등록</a>
			</form>
		</div>
		<div class="list">
			<table id="plsList">
				<tr>
					<th>출판사코드</th>
					<th>출판사이름</th>
					<th>출판사관리</th>
				</tr>
				<c:if test="${list == null }">
					<tr>
						<td class="noDate" colspan="3">등록된 출판사가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${list != null }">
					<c:forEach var="item" items="${list }">
						<tr>
							<td class="code">${item.plsNo }</td>
							<td class="name">${item.plsName }</td>
							<td class="mgn">
								<a class="updateBtn btnLightBlue" href="${pageContext.request.contextPath }/admin/book/plsAdd.do?type=update&no=${item.plsNo}">수정</a>
								<a class="deleteBtn btnPink" href="${pageContext.request.contextPath }/admin/book/plsDelete.do?no=${item.plsNo}">삭제</a>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
</article>

<%@ include file="../../adminInclude/adminFooter.jsp" %>