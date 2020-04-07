<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu1.jsp" %>

<style>
	.box {
		float: left;
		width: 44%;
		/* min-width: 430px; */
		margin-left: 50px;
	}
	
	.box label {
		font-size: 24px;
		font-weight: 700;
		display: inline-block;
		padding-right: 10px;
		padding-left: 10px;
		border-left: 5px solid #3493DD;
		margin-bottom: 5px;
	}
	
	.mlTotal, .addBtn {
		font-size: 14px;
		/* padding: 5px; */
	}
	
	.info {
		font-size: 12px;
		margin-left: 15px;
		font-weight: 400;
	}
	
	.searchBox {
		margin-bottom: 30px;
		height: 50px;
	}
	
	/* .searchBox input, 
	.searchBox select {
		font-size: 12px;
	} */
	
	input[value='추가'] {
		font-size: 14px;
	}
	
	.searchBox input {
		padding-left: 5px;
	}
	
	.searchBox input[type='text'] {
		width: 100px;
	}

	.searchBox .right {
		float: right;
	}
	
	.list {
		overflow: auto;
    	max-height: 580px;
    	border-bottom: 1px solid #D9D9D9;
    	border-top: 1px solid #D9D9D9; 
	}
	
	table {
		width: 100%;
	}
	
	th, td {
		border: none;
		padding:20px;
		padding-left: 50px;
	}
	
	tr {
		border-bottom: 1px solid #D9D9D9;
    	border-top: 1px solid #D9D9D9;
	}
	
	.list a:hover {
		text-decoration: underline;
	}
	
	.addBox {
		position: absolute;
	    width: 100%;
	    height: 100%;
	    top: 0;
	    left: 0;
	    background-color: rgba(0,0,0,.5);
	    z-index: 1;
	    display: none; 
	}
	
	.addBox .item {
		position: absolute;
    	top: 50%;
    	left: 50%;
    	transform: translate(-50%, -50%);
    	background-color: #fff;
    	padding: 30px;
    	width: 380px;
	}
	
	.addBox .item h4 {
		margin-bottom: 20px;
	}
	
	.item p{
		text-align: center;
		margin-top: 20px;
	} 
	
	.addBox .item input[type='text'] {
		font-size: 16px;
		padding: 5px;
		width: 200px;
	}
	
	.addBox select {
		font-size: 16px;
		padding: 5px;
		width: 215px;
	}
	
	.boxClose {
		position: absolute;
		right: 30px;
		top: 20px;
		cursor: pointer;
		font-size: 22px;
	}
	
</style>
<script>
	// 숫자패드
	function numberPad(n, width) {
	    n = n + '';
	    return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}

	$(function(){
		$("form").submit(function() {
			return false;
		})
		
		$(".lcTitle").click(function() {
			var lcNoIdx = $(this).text().substring(1, 3);
			if(lcNoIdx != "") {
				$.ajax({
					url:"${pageContext.request.contextPath}/admin/book/bookCatList.do",
					type: "get",
					data:{"lcNo": lcNoIdx},
					dataType: "json", 
					success: function(res){
						console.log(res);

						var tableId = $("#mlTable")
						tableId.empty();
						
						if(res != null) {
							$(res).each(function(i, obj){
								var lcNo = obj.lclasNo.lclasNo;
								var mlNo = obj.mlsfcNo;
								var mlName = obj.mlsfcName;
								
								var $a1 = $("<a>").addClass("mlUpdate").attr("href", "#").text("수정");								
								var $a2 = $("<a>").addClass("mlDelete").attr("href", "#").text("삭제");								
								var $td1 = $("<td>").addClass("mlTitle").text("["+numberPad(lcNo,2)+numberPad(mlNo, 2)+"] "+mlName);
								var $td2 = $("<td>").addClass("mlMgn").append($a1).append(" | ").append($a2)
								var $tr = $("<tr>").append($td1).append($td2);
								tableId.append($tr);
							})
						} else {
							tableId.append("<tr>").append("<td>").text("선택된 대분류에 해당되는 중분류가 없습니다.");
						}
					}
				})
			}
		})
		
		$("#lcNo").on("change", function(){
			var lcNoIdx = $("#lcNo").val();
			if(lcNoIdx != ""){				
				$.ajax({
					url:"${pageContext.request.contextPath}/admin/book/bookCatList.do",
					type:"get",
					data:{"lcMlLast":lcNoIdx},
					dataType: "json",
					success: function(res){
						console.log(res);
						
						$("input[name='mlNo']").attr("value", "");
						if(res != null) {
							$("input[name='mlNo']").attr("value", res);
						}
					}
				})
			} 
		}) 
		
		$("#lcAddBtn").click(function() {
			$("#lcAdd").show();
		})
		
		$(".closeEve").click(function() {
			clearFt();
		})
		
		$("#mlAddBtn").click(function() {
			$("#mlAdd").show();
		})
		
		function clearFt(){
			$(".addBox").hide();
			$(".addBox .nameInput").val("");
			$(".itemMlNo").val("");
		}
		
	})
</script>
<article class="contentWrap clearfix">
	<h2 class="pageTitle">카테고리(분류) 관리</h2>
	
	<div class="box">
		<div class="searchBox clearfix">
			<form action="bookCatList.do" method="get">
				<label>대분류</label>
				<div class="right">
					<!-- <select name="catList" id="catSelect">
						<option value="notype">전체</option>
						<option value="lcNo">대분류 코드</option>
						<option value="lcName">대분류 이름</option>
					</select>
					<input type="text" name="lcSearch"/>
					<input type="submit" value="검색" class="btnOrange" /> -->
					<a id="lcAddBtn" class="btnOrange addBtn" href="#">추가</a>
				</div>
				<p><span class="info">대분류 이름 클릭 시 해당 중분류가 나타납니다.</span></p>
			</form>
		</div>
		<div class="list">
			<table>
				<c:forEach var="lc" items="${lcList}">
					<tr>
						<td class="lc"><a class="lcTitle" href="#">[<fmt:formatNumber value="${lc.lclasNo }" pattern="00"/>] ${lc.lclasName }</a></td>
						<td class="lcMgn"><a class="lcUpdate" href="#">수정</a> | <a class="lcDelete" href="#">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="box">
		<div class="searchBox clearfix">
			<form action="bookCatList.do" method="get">
				<label>중분류</label>
				<div class="right">
					<!-- <select name="catList" id="catSelect">
						<option value="notype">전체</option>
						<option value="lcNo">중분류 코드</option>
						<option value="lcName">중분류 이름</option>
					</select>
					<input type="text" name="mlSearch"/>
					<input type="submit" value="검색" class="btnOrange" /> -->
					<a class="mlTotal btnAqua" href="${pageContext.request.contextPath}/admin/book/bookCatList.do">전체보기</a>
					<a id="mlAddBtn" class="btnOrange addBtn" href="#">추가</a>
				</div>
			</form>
		</div>
		<div class="list">
			<table id="mlTable">
				<c:forEach var="ml" items="${mlList}">
					<tr>
						<td class="mlTitle">[<fmt:formatNumber value="${ml.lclasNo.lclasNo }" pattern="00"/><fmt:formatNumber value="${ml.mlsfcNo }" pattern="00"/>] ${ml.mlsfcName}</td>
						<td class="mlMgn"><a class="mlUpdate" href="#">수정</a> | <a class="mlDelete" href="#">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</article>

<div id="lcAdd" class="addBox">
	<div class="item">
		<h4>대분류 등록</h4>
		<div class="boxClose closeEve"><i class="fas fa-times"></i></div>
		<form action="bookCatList.do" method="post">
			<p>
				<label>대분류 코드</label>
				<input type="text" name="lcNo" value="${lcLastNo+1 }" readonly/>
			</p>
			<p>
				<label>대분류 이름</label>
				<input class="nameInput" type="text" name="lcName" placeholder="대분류이름을 작성해주세요."/>
			</p>
			<p>
				<input type="reset" value="취소" class="closeEve btnPink"/>
				<input type="submit" value="추가" class="btnOrange" id="plsbtn"/>
			</p>
		</form>
	</div>
</div>

<div id="mlAdd" class="addBox">
	<div class="item">
		<h4>중분류 등록</h4>
		<div class="boxClose closeEve"><i class="fas fa-times"></i></div>
		<form action="bookCatList.do" method="post">
			<p>
				<label>대분류 선택</label>
				<select id="lcNo" name="lcNo">
					<option value="">대분류 선택</option>
					<c:forEach var="lcItem" items="${lcList }">
						<option value="${lcItem.lclasNo }">[<fmt:formatNumber value="${lcItem.lclasNo }" pattern="00"/>] ${lcItem.lclasName }</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>중분류 코드</label>
				<input class="itemMlNo" type="text" name="mlNo" readonly/>
			</p>
			<p>
				<label>중분류 이름</label>
				<input class="nameInput" type="text" name="mlName" placeholder="대분류이름을 작성해주세요."/>
			</p>
			<p>
				<input type="reset" value="취소" class="closeEve btnPink"/>
				<input type="submit" value="추가" class="btnOrange" id="plsbtn"/>
			</p>
		</form>
	</div>
</div>

<%@ include file="../../adminInclude/adminFooter.jsp" %>