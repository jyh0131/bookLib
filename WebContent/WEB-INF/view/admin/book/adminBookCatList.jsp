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
	
	input[value='추가'], .closeEve, .updateBtn {
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
			if($("#lcAdd").is(":visible")){
				if($("input[name='lcName']").val() == ""){
					alert("이름을 작성해주세요.");
					return false;
				}
			};
			
			if($("#mlAdd").is(":visible")){
				if($("#lcNo").val() == ""){
					alert("대분류를 선택해주세요.")
					return false;
				}
				
				if($("input[name='mlName']").val() == ""){
					alert("이름을 작성해주세요.");
					return false;
				}
			};
			
			alert("등록되었습니다.");
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
								var lcName = obj.lclasNo.lclasName
								var mlNo = obj.mlsfcNo;
								var mlName = obj.mlsfcName;
								
								console.log(lcName);
								
								/* 
							 	<a class="mlDelete" 
							 	href="${pageContext.request.contextPath}/admin/book/bookCatDelete.do?type=ml&mlNo=${ml.mlsfcNo }&mlName=${ml.mlsfcName}&lcNo=${ml.lclasNo.lclasNo }">
							 	삭제</a>
							  */
							  
								var $a1 = $("<a>").addClass("mlUpdate").attr("href", "#").attr("data-mlLcNo", lcNo)
											.attr("data-mlLcName", lcName).attr("data-mlNo", mlNo).attr("data-mlName", mlName).text("수정");								
								var $a2 = $("<a>").addClass("mlDelete")
											.attr("href", "${pageContext.request.contextPath}/admin/book/bookCatDelete.do?type=ml&mlNo="+mlNo+"&mlName="+mlName+"&lcNo="+lcNo)
											.text("삭제");								
								var $td1 = $("<td>").addClass("mlTitle").text("["+numberPad(lcNo,2)+numberPad(mlNo, 2)+"] "+mlName);
								var $td2 = $("<td>").addClass("mlMgn").append($a1).append(" | ").append($a2)
								var $tr = $("<tr>").append($td1).append($td2);
								tableId.append($tr);
								
								$(".mlUpdate").click(function(){
									var lcNo = $(this).attr("data-mlLcNo");
									var lcName = $(this).attr("data-mlLcName");
									var mlNo = $(this).attr("data-mlNo");
									var mlName = $(this).attr("data-mlName");
									
									var lc = "["+numberPad(lcNo, 2)+"] "+lcName;
									
									$(".mlLcNoUp").show().val(lc);
									$("#lcNo").hide();
									
									$("#mlAdd h4").text("중분류 수정");
									$(".sbmAddBtn").hide();
									$(".updateBtn").show();
									$(".itemMlNo").val(mlNo);
									$(".nameInput").val(mlName);
									$("#mlAdd").show();
									$("#mlAdd #mlUpdateBtn").attr("data-mlLcNoUp", lcNo);
								})
								
								$(".mlDelete").click(function() {
									var res = confirm("해당 중분류를 삭제하시겠습니까?");
									if(res == false) {
										return false;
									}
								})
							})
						} else {
							var $tdNodata = $("<td>").text("선택된 대분류에 해당되는 중분류가 없습니다.");
							var $trNodata = $("<tr>").append($tdNodata);
							//tableId.append("<tr>").append("<td>").text("선택된 대분류에 해당되는 중분류가 없습니다.").addClass("noData");
							tableId.append($trNodata);
						}
					}
				})
			}
		})
		
		$("#lcAddBtn").click(function() {
			$(".sbmAddBtn").show();
			$(".updateBtn").hide();
			$("#lcAdd").show();
		})
		
		$("#mlAddBtn").click(function() {
			$(".mlLcNoUp").hide();
			$("#lcNo").show();
			$(".sbmAddBtn").show();
			$(".updateBtn").hide();
			$("#mlAdd").show();
		})
		
		$('.lcUpdate').click(function(){
			var lcNo = $(this).attr("data-lcNo");
			var lcName = $(this).attr("data-lcName");
			
			$("#lcAdd h4").text("대분류 수정");
			$(".sbmAddBtn").hide();
			$(".updateBtn").show();
			$("input[name='lcNo']").val(lcNo);
			$("input[name='lcName']").val(lcName);
			$("#lcAdd").show();
		})
		
		$(".mlUpdate").click(function(){
			var lcNo = $(this).attr("data-mlLcNo");
			var lcName = $(this).attr("data-mlLcName");
			var mlNo = $(this).attr("data-mlNo");
			var mlName = $(this).attr("data-mlName");
			
			var lc = "["+numberPad(lcNo, 2)+"] "+lcName;
			
			$(".mlLcNoUp").show().val(lc);
			$("#lcNo").hide();
			
			$("#mlAdd h4").text("중분류 수정");
			$(".sbmAddBtn").hide();
			$(".updateBtn").show();
			$(".itemMlNo").val(mlNo);
			$(".nameInput").val(mlName);
			$("#mlAdd").show();
			$("#mlAdd #mlUpdateBtn").attr("data-mlLcNoUp", lcNo);
		})
		
		$(".closeEve").click(function() {
			clearFt();
		})
	
		function clearFt(){
			$(".addBox").hide();
			$(".addBox .nameInput").val("");
			$(".itemMlNo").val("");
			$("#lcNo option[value='']").prop("selected", true);
		}
		
		$("#lcNo").on("change", function(){
			var lcNoIdx = $("#lcNo").val();
			
			if(lcNoIdx != ""){			
				$.ajax({
					url:"${pageContext.request.contextPath}/admin/book/bookCatList.do",
					type:"get",
					data:{"lcMlLast":lcNoIdx},
					dataType: "json",
					success: function(res){	
						$("input[name='mlNo']").val(res);
					}
				})
			} 
		}) 
		
		$("#lcUpdateBtn").click(function() {
			if($("input[name='lcName']").val() == "") {
				alert("이름을 작성해주세요.");
				return false;
			}
			
			var lcNo = $("input[name='lcNo']").val();
			var lcName = $("input[name='lcName']").val();
			
			location.href = "${pageContext.request.contextPath }/admin/book/bookCatUpdate.do?type=lc&lcNo="+lcNo+"&lcName="+lcName;
			alert("수정되었습니다.");
		})
		
		$("#mlUpdateBtn").click(function() {
			if($("input[name='mlName']").val() == "") {
				alert("이름을 작성해주세요.");
				return false;
			}
			var lcNo = $(this).attr("data-mlLcNoUp");
			var mlNo = $("input[name='mlNo']").val();
			var mlName = $("input[name='mlName']").val();
			
			console.log("lcNo : " + lcNo);
			console.log("mlNo : " + mlNo);
			console.log("mlName : " + mlName);
			
			location.href = "${pageContext.request.contextPath }/admin/book/bookCatUpdate.do?type=ml&lcNo="+lcNo+"&mlNo="+mlNo+"&mlName="+mlName;
			alert("수정되었습니다.");
		})
		
		$(".mlDelete").click(function() {
			var res = confirm("해당 중분류를 삭제하시겠습니까?");
			if(res == false) {
				return false;
			}
		})
		
		$(".lcDelete").click(function() {
			var aHref = $(this).attr('href');
			$.ajax({
				url:aHref,
				type:"get",
				dataType: "json",
				success: function(res){	
					console.log(res);
					if(res > 0) {
						alert("해당 대분류의 중분류가 존재합니다. \n중분류부터 삭제 후 삭제해주세요.");
						return false;
					}
				}
			}) 
			
			var cf = confirm("해당 대분류를 삭제하시겠습니까?");
			if(cf == false) {
				return false;
			} 
			location.href = "${pageContext.request.contextPath}/admin/book/bookCatList.do";
			return false;
		})
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
						<td class="lcMgn">
							<a class="lcUpdate" href="#" data-lcNo="${lc.lclasNo }" data-lcName=" ${lc.lclasName }">수정</a>
							 | 
							<a class="lcDelete" href="${pageContext.request.contextPath}/admin/book/bookCatDelete.do?type=lc&lcNo=${lc.lclasNo }">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="box">
		<div class="searchBox clearfix">
			<form class="search" action="bookCatList.do" method="get">
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
						<td class="mlMgn">
							<a class="mlUpdate" href="#" data-mlLcNo="${ml.lclasNo.lclasNo }" data-mlLcName="${ml.lclasNo.lclasName }" data-mlNo="${ml.mlsfcNo }" data-mlName="${ml.mlsfcName}">수정</a>
							 | 
						 	<a class="mlDelete" href="${pageContext.request.contextPath}/admin/book/bookCatDelete.do?type=ml&mlNo=${ml.mlsfcNo }&mlName=${ml.mlsfcName}&lcNo=${ml.lclasNo.lclasNo }">삭제</a>
						 </td>
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
		<form action="bookCatAdd.do?type=lc" method="post">
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
				<input type="submit" value="추가" class="btnOrange addBtn sbmAddBtn"/>
				<a id="lcUpdateBtn" class="btnOrange updateBtn" href="#" >수정</a>
			</p>
		</form>
	</div>
</div>

<div id="mlAdd" class="addBox">
	<div class="item">
		<h4>중분류 등록</h4>
		<div class="boxClose closeEve"><i class="fas fa-times"></i></div>
		<form action="bookCatAdd.do?type=ml" method="post">
			<p class="mlLcNoP">
				<label>대분류 선택</label>
				<select id="lcNo" name="mlLcNo">
					<option value="">대분류 선택</option>
					<c:forEach var="lcItem" items="${lcList }">
						<option value="${lcItem.lclasNo }">[<fmt:formatNumber value="${lcItem.lclasNo }" pattern="00"/>] ${lcItem.lclasName }</option>
					</c:forEach>
				</select>
				<input class="mlLcNoUp" type="text" name="mlLcNoUp" readonly/>
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
				<a href="#" class="closeEve btnPink">취소</a>
				<input type="submit" value="추가" class="btnOrange addBtn sbmAddBtn"/>
				<a id="mlUpdateBtn" class="btnOrange updateBtn" data-mlLcNoUp="" href="#" >수정</a>
			</p>
		</form>
	</div>
</div>

<%@ include file="../../adminInclude/adminFooter.jsp" %>