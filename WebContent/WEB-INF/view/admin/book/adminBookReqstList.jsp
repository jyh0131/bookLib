<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu1.jsp" %>

<style>
	.btnsLeft {
		float: left;
	}
	
	.btnsLeft select {
		font-size: 14px;
	}
	
	.btnsRight {
		float: right;
	}
	
	a.aBtn {
		font-size: 13px;
	}
	
	.listBox {
		margin-top: 20px;
		overflow: auto;
    	max-height: 600px;
    	border-bottom: 1px solid #D9D9D9;
    	border-top: 1px solid #D9D9D9;
	}
	
	.listBox table {
		width: 100%;
		text-align: center;
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
	
	th, td {
		padding: 5px;
		font-size: 14px;
	}
	
	.noData {
		padding: 10px;
		font-size: 18px;
	}

</style>
<script>
	$(function(){
		var res1 = false;
		var chkY = $(".chkY");
		$(".totlaChkY").click(function() {
			if(res1 == false) {		
				$(chkY).prop("checked", true);
				res1 = true;
				return;
			}
			
			if(res1) {
				$(chkY).prop("checked", false);
				res1 = false;
			}
			
		})
		
		var res2 = false;
		var chkN = $(".chkN");
		$(".totlaChkN").click(function() {
			if(res2 == false) {		
				$(chkN).prop("checked", true);
				res2 = true;
				return;
			}
			
			if(res2) {
				$(chkN).prop("checked", false);
				res2 = false;
			}
			
		})
		
		
		$("#whCdtItems").click(function() {
			var cnt = 0;
			$(chkY).each(function(i, obj) {
				if($(obj).prop("checked")){
					cnt++;
				};
			})
			
			if(cnt == 0) {
				alert("입고처리 할 도서를 선택해주세요.");
				return false;
			}
			
			alert("입고처리되었습니다.");
			$("#f1").attr("action", "bookReqstWhCdtUpdtae.do?type=whChtY");
			$("#f1").submit();
		})
		
		$("#cancelItems").click(function() {
			var cnt = 0;
			$(chkN).each(function(i, obj) {
				if($(obj).prop("checked")){
					cnt++;
				};
			})
			
			if(cnt == 0) {
				alert("입고취소 할 도서를 선택해주세요.");
				return false;
			}
			
			alert("입고취소되었습니다.");
			$("#f1").attr("action", "bookReqstWhCdtUpdtae.do?type=whChtN");
			$("#f1").submit();
		})
		
		$("#searchBtn").click(function() {
			$("#f1").submit();
		})
		
		$("#excelBtn").click(function() {
			$("#f1").attr("action", "bookReqstExcelAdd.do");
			$("#f1").submit();
		})
	})
</script>
<article class="contentWrap">
	<h2 class="pageTitle">신청도서 조회</h2>
	
	<div class="listWrap">
		<form action="bookReqstList.do" method="post" id="f1">
			<div class="btnsTop clearfix">
				<div class="btnsLeft">
					<select name="year">
						<option value="">선택</option>
						<c:forEach var="year" items="${yearList }">
							<option value="${year }">${year }</option>
						</c:forEach>
					</select>
					<span>년</span>
					<select name="month">
						<option value="">선택</option>
						<c:forEach var="month" begin="1" end="12">
							<option value="${month}">${month}</option>
						</c:forEach>
					</select>
					<span>월</span>
					<select name="whCdt">
						<option value="-1">입고여부</option>
						<option value="0">미입고</option>
						<option value="1">입고완료</option>
					</select>
					<input type="button" name="search" value="검색" class="btnOrange" id="searchBtn"/>
				</div>
				<div class="btnsRight">
					<input type="button" name="excelBtn" class="aBtn btnOrange" value="조회리스트 엑셀저장" id="excelBtn"/>
					<input type="button" name="whCdtItem" class="aBtn btnPurple whCdtBtn" value="입고처리" id="whCdtItems"/>
					<input type="button" name="whCdtItem" class="aBtn btnPink whCdtBtn" value="입고취소" id="cancelItems"/>
					<button type="button" class="btnLightBlue totlaChkY">입고 모두선택/해제</button>
					<button type="button" class="btnLightBlue totlaChkN">취소 모두선택/해제</button>
				</div>
			</div>
			<div class="listBox">
				<table>
					<tr>
						<th>no</th>
						<th>신청도서명</th>
						<th>저저/역자</th>
						<th>출판사</th>
						<th>신청회원수</th>
						<th>신청일자</th>
						<th>입고여부</th>
						<th>입고선택</th>
						<th>입고취소</th>
					</tr>
					<c:if test="${list == null }">
						<tr>
							<td class="noData" colspan="9">조회되는 신청도서가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${list != null }">
						<c:forEach var="item" items="${list }">
							<tr>
								<td>${item.requestBookNo }</td>
								<td>${item.requestBookName }</td>
								<c:if test="${item.requestBookTrnslr == null }">
									<td>${item.requestBookAuthor }</td>
								</c:if>
								<c:if test="${item.requestBookTrnslr != null }">
									<td>${item.requestBookAuthor } / ${item.requestBookTrnslr }</td>
								</c:if>
								<td>${item.requestBookPls }</td>
								<td>${item.overlapCnt } 명</td>
								<td><fmt:formatDate value="${item.requestDate }" pattern="yyyy-MM-dd"/></td>
								<td>${item.whCdt > 0 ? "입고완료" : "미입고" }</td>
								<c:if test="${item.whCdt == 0}">								
									<td><input type="checkbox" class="chkY" name="chk" value="${item.requestBookName },${item.requestBookPls },${item.requestBookAuthor }" data-name="${item.requestBookName }" data-pls="${item.requestBookPls }" data-auth="${item.requestBookAuthor }"/></td>
									<td>N</td>
								</c:if>
								<c:if test="${item.whCdt == 1}">
									<td>Y</td>
									<td><input type="checkbox" class="chkN" name="chk" value="${item.requestBookName },${item.requestBookPls },${item.requestBookAuthor }" data-name="${item.requestBookName }" data-pls="${item.requestBookPls }" data-auth="${item.requestBookAuthor }"/></td>
								</c:if>
							</tr>
							<%-- 엑셀데이터 input --%>
							<input type="hidden" name="no" value="${item.requestBookNo }"/>
							<input type="hidden" name="bookName" value="${item.requestBookName }"/>
							<input type="hidden" name="auth" value="${item.requestBookAuthor }" />
							<input type="hidden" name="trns" value="${item.requestBookTrnslr }"/>
							<input type="hidden" name="pls" value="${item.requestBookPls }"/>
							<input type="hidden" name="cnt" value="${item.overlapCnt } 명" />
							<input type="hidden" name="date" value="${item.requestDate }"/>
							<input type="hidden" name="whCdt" value="${item.whCdt}"/>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</form>		
	</div>
</article>

<%@ include file="../../adminInclude/adminFooter.jsp" %>