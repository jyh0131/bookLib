<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu1.jsp" %>

<style>
	.wrap {
		position: relative;
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
	.addBox input[type="date"],
	.addBox select {
		font-size: 18px;
		padding: 5px;
	}
	
	input[type="radio"]:nth-of-type(n+2) {
		margin-left: 30px;
	}
	
	.addBox input[type="file"] {
		font-size: 16px;
		margin-left: 200px;
	}
	
	.resultBtns input {
		font-size: 20px;
	}
	
	.resultBtns {
		font-size: 20px;
		text-align: center;
		margin-top: 15px;
	}
	
	.addBox .fas {
		color: #D9D9D9;
	}
	
	.error {
		font-size: 14px;
		color: red;
		display: none;
	}
	
	#plsSearchBox {
		position: absolute;
	    width: 100%;
	    height: 100%;
	    top: 0;
	    left: 0;
	    background-color: rgba(0,0,0,.9);
	    z-index: 1;
	    display: none;
	}
	
	#plsSearchBox .plsBox {
		position: absolute;
    	top: 50%;
    	left: 50%;
    	transform: translate(-50%, -50%);
    	background-color: #fff;
    	padding: 30px;
    	width: 365px;
	}
	
	#plsSearchBox .plsBox h4 {
		margin-bottom: 20px;
	}
	
	.plsBox .searchBar{
		text-align: center;
	}
	
	#plsSearchBox .plsBox input[name="plsSchName"] {
		font-size: 16px;
		padding: 5px;
		width: 200px;
	}
	
	#plsRes {
		max-height: 200px;
		margin-top: 20px;
	}
	
	.tableView {
		overflow: auto;
   		padding: 1px;
    	border: 1px solid #aaa;
	}
	
	#noPlsData {
		text-align: center;
	}
	
	.plsSchClose {
		position: absolute;
		right: 30px;
		top: 20px;
		cursor: pointer;
		font-size: 22px;
	}
	
	table.tbPls {
		width: 100%;
	}
	
	table.tbPls td,
	table.tbPls th {
		padding: 5px;
	}
	
	.tdNo, .tdBtn {
		text-align: center;
	}
	
	.bookImg {
		display: inline-block;
		min-width: 100px;
	}
	
	.getImg {
		position: absolute;
    	top: 90px;
   		border: 1px solid #ddd;
    	padding: 5px;
	}
	
	.getImg img {
		width: 198px;
		border: 1px solid #ddd;
		display: block;
	}
	
	.w395 {
		width: 395px;
	}
</style>

<script>
	function imageURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	
	        reader.onload = function(e) {
	            $('.loadImg').attr('src', e.target.result);
	        }
	
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	$(function(){
		
		var getPlsNo = ${item.pls.plsNo};
		var getPls = $("#pls").find("option[value='"+getPlsNo+"']");
		getPls.prop("selected", true);
		
		var getLendPsbCdt = ${item.lendPsbCdt};
		if(getLendPsbCdt == 0) {
			$("#lend1").prop("checked", true);
			$("#lend3").attr("onclick", "return false");
		} else if (getLendPsbCdt == 1) {
			$("#lend3").prop("checked", true);
			$("input[name='lendPsbCdt']").attr("onclick", "return false");
		} else if (getLendPsbCdt == 2) {
			$("#lend2").prop("checked", true);
			$("#lend3").attr("onclick", "return false");
		}
		
		
		// 정규표현식 및 입력 확인
		$("form").submit(function(){
			$(".error").hide();
			$(".fas").css("color", "#D9D9D9");
			
			function errors(name) {
				$(name).nextAll(".error").show();
				$(name).nextAll(".fas").css("color", "#E8396F");
			}
			
			var bookName = $("input[name='bookName']");			
			if(bookName.val() == "") {
				errors(bookName);
				return false;
			}
			
			var authrName = $("input[name='authrName']");
			if(authrName.val() == "") {
				errors(authrName);
				return false;
			}
			
			var bookPriceReg = /^[0-9]+$/;
			var bookPrice = $("input[name='bookPrice']");
			if(bookPrice.val() == "" || bookPriceReg.test(bookPrice.val()) == false){
				errors(bookPrice);
				return false;
			}
			
			var pls = $("select[name='pls']");
			if(pls.val() == "") {
				errors(pls);
				return false;
			}
			
			var plsDate = $("input[name='pblicteYear']");
			if(plsDate.val() == ""){
				errors(plsDate);
				return false;
			}
			
			var lend1 = $("#lend1");
			var lend2 = $("#lend2");
			var lend3 = $("#lend3");
			if(lend1.prop("checked") == false && lend2.prop("checked") == false && lend3.prop("checked") == false) {
				errors(lend3);
				return false;
			} 
			
			alert("도서["+bookName.val()+"] 수정 되었습니다");
		})
		
		$(".plsSearch").click(function() {
			$("#plsSearchBox").show();
		})
		
		$("#plsbtn").click(function() {
			var plsSchName = $("input[name='plsSchName']").val();
			if(plsSchName == ""){
				alert("출판사 이름을 작성해주세요.");
				return false;
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/book/add.do",
				type:"get",
				data:{"plsSchName":plsSchName},
				dataType: "json",
				success: function(res){
					console.log(res);
					if(res == null) {
						$("#plsRes").empty();
						$("#plsRes").append("<p id='noPlsData'>검색되는 출판사가 없습니다.<br> 출판사를 등록해주세요.</p>");
						return false;
					}
					$("#plsRes").empty();
					$("#plsRes").addClass("tableView");
					var $thNo = $("<th>").text("출판사코드");
					var $thName = $("<th>").text("출판사 이름");
					var $thBtn = $("<th>").text("선택");
					var $tr1 = $("<tr>").append($thNo).append($thName).append($thBtn);
					var $table = $("<table>").addClass("tbPls").append($tr1);
		
 					$("#plsRes").append($table);
					
					$(res).each(function(i, obj){
						
						var plsSchNo = obj.plsNo;
						var plsSchName = obj.plsName;
						console.log(plsSchNo);
						console.log(plsSchName);
						
						var $button = $("<button>").addClass("plsBtnRes").attr("type", "button").text("선택");
						
						var $tdNo = $("<td>").addClass("tdNo").text(plsSchNo);
						var $tdName = $("<td>").text(plsSchName);
						var $tdBtn = $("<td>").addClass("tdBtn").append($button);
						var $tr = $("<tr>").append($tdNo).append($tdName).append($tdBtn);
						$table.append($tr); 
					})
				}
			}) 
			return false;
		})
		
		$(document).on("click", ".plsBtnRes", function(){
				var target = $(this).parent().prev().prev().text();
				var option = $("#pls").find("option[value='"+target+"']");
				option.prop("selected", true);
				clearFt();
		})
		
		$(".plsSchClose").click(function() {
			clearFt();
		})
		
		function clearFt(){
			$("#plsSearchBox").hide();
			$("input[name='plsSchName']").val("");
			$("#plsRes").empty();
			$("#plsRes").removeClass("tableView");
		}
		
		$(".loadImgBtn").change(function() {
			var changeImg = $(".loadImgBtn").val().split("\\");
			var imgName = changeImg[changeImg.length-1];
			var imgSrc = $(".loadImgBtn").val();
			
			console.log(imgSrc);
		})
		
		$("#cancel").click(function() {
			var res = confirm("도서 정보 수정을 취소하시겠습니까?");
			if(res) {
				location.href = "${pageContext.request.contextPath}/admin/book/list.do";
				return false;
			}
			
			return false;
		})
		
	})
</script>

<article class="contentWrap">
	<div class="wrap">
		<h2 class="pageTitle">도서 수정</h2>
		
		<div class="addBox">
			<form action="update.do" method="post" enctype="multipart/form-data">
				<p>
					<label>도서코드</label>
					<input class="w395" type="text" name="bookCode" readonly value="${item.bookCode }"/>
				</p>
				<p>
					<label>도서명 </label>
					<input class="w395" type="text" name="bookName" value="${item.bookName }"/>
					<i class="fas fa-feather-alt"></i>
					<span class="error">도서명을 입력하세요.</span>
				</p>
				<p>
					<label>저 자</label>
					<input class="w395" type="text" name="authrName" value="${item.authrName }"/>
					<i class="fas fa-feather-alt"></i>
					<span class="error">저자명을 입력하세요.</span>
				</p>
				<p>
					<label>역 자</label>
					<input class="w395" type="text" name="trnslrName" value="${item.trnslrName }"/>
				</p>
				<p>
					<label>도서가격</label>
					<input class="w395" type="text" name="bookPrice" value="${item.bookPrice }"/>
					<i class="fas fa-feather-alt"></i>
					<span class="error">도서가격(숫자)를 입력하세요.</span>
				</p>
				<p>
					<label>카테고리(분류)</label>
					<input type="text" name="lcName" value="${item.lcNo.lclasName }" readonly/>
					<input type="text" name="mlName" value="${item.mlNo.mlsfcName }" readonly/>
				</p>
				<p>
					<label>출판사</label>
					<select name="pls" id="pls">
						<option value="">출판사 선택</option>
						<c:forEach var="list" items="${plsList }">
							<option value="${list.plsNo }">${list.plsName }</option>
						</c:forEach>
					</select>
					<button class="btnOrange plsSearch" type="button">검색</button>
					<i class="fas fa-feather-alt"></i>
					<span class="error">출판사를 선택해주세요.</span>
				</p>
				<p>
					<label>출간일</label>
				<input type="date" name="pblicteYear" value='<fmt:formatDate value="${item.pblicteYear }" pattern="yyyy-MM-dd"/>'/>
					<i class="fas fa-feather-alt"></i>
					<span class="error">출간일을 선택해주세요.</span>
				</p>
				<p>
					<label>도서 이미지</label>
					<span class="bookImg">
						<c:if test="${item.bookImgPath != null }">
							등록된 이미지 있음 [이미지명 : ${item.bookImgPath }]
						</c:if>
						<c:if test="${item.bookImgPath == null}">
							등록된 이미지 없음
						</c:if>
					</span><br><br>
					<input type="file" name="bookImgPath" class="loadImgBtn" onchange="imageURL(this);"/>
				</p>
				<p>
					<label>대여가능여부</label>
					<input type="radio" name="lendPsbCdt" id="lend1" value="0"/> 대여 가능
					<input type="radio" name="lendPsbCdt" id="lend3" value="1"/> 대여중
					<input type="radio" name="lendPsbCdt" id="lend2" value="2"/> 대여 불가능
					<i class="fas fa-feather-alt"></i>
					<span class="error">대여가능여부를 선택해주세요.</span>
				</p>
				<div class="resultBtns">
					<a href="#" class="btnOrange" id="cancel">취소</a>
					<input type="submit" value="도서 수정" class="btnPurple"/>
				</div>
			</form>
		</div>
		<div class="getImg">
			<c:if test="${item.bookImgPath == null }">
				<img class="loadImg" src="${pageContext.request.contextPath }/images/book-noImg.png" alt="book-noImg" />
			</c:if>
			<c:if test="${item.bookImgPath != null }">
				<img class="loadImg" src="${pageContext.request.contextPath }/upload/${item.bookImgPath}" alt="${item.bookName }" />
			</c:if>
		</div>
	</div>

</article>

<div id="plsSearchBox">
	<div class="plsBox">
		<h4>출판사 검색</h4>
		<div class="plsSchClose"><i class="fas fa-times"></i></div>
		<form action="update.do" method="get">
			<p class="searchBar">
				<input type="text" name="plsSchName" placeholder="출판사 이름으로 검색하세요."/>
				<input type="submit" value="검색" class="btnOrange" id="plsbtn"/>
			</p>
		</form>
		<div id="plsRes"></div>	
	</div>
</div>

<%@ include file="../../adminInclude/adminFooter.jsp" %>