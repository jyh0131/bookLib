<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu1.jsp" %>

<style>	
	input[name='schType']:nth-of-type(2) {
		margin-left: 15px;
	}
	
	#lcNo {
		margin-left: 15px;
		margin-right: 10px;
		font-size: 16px;
	}
	
	input[name='schText'] {
		font-size: 16px;
		padding: 0 5px;
	}
	
	div#result {
		margin-top: 30px;
		overflow: auto;
    	max-height: 600px;
    	border-bottom: 1px solid #D9D9D9;
    	border-top: 1px solid #D9D9D9;

	}
	
	table#bookList {
		width: 100%;
		text-align: center; 
		table-layout: fixed;
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
		font-size: 12px;
	}
	
	.mgn a{
		font-size: 12px;
		display: inline-block;
	}
	
	.textLeft {text-align: left;}
	.width40 {width: 40px;}
	.width50 {width: 50px;}
	.width70 {width: 70px;}
	.width80 {width: 80px;}
	.width90 {width: 90px;}
	.width100 {width: 100px;}
	.width110 {width: 110px;}
	.width150 {width: 150px;}
	.width200 {width: 200px;}
	.width250 {width: 250px;}
	.width300 {width: 300px;}
	.textStyle1 {
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	
	.searchNone {
		font-size: 18px;
		padding: 30px;
	}
	
	.smallTitle {
		font-size: 16px;
		font-weight: 400;
		padding-left: 20px;
	}
	
</style>

<script>
	$(function(){
		$("form").submit(function() {
			var radioCdt1 = $(".rdoCode").prop("checked");
			var radioCdt2 = $(".rdoName").prop("checked");
			
			if(radioCdt1 == false && radioCdt2 == false) {
				alert("도서코드 / 도서명 중 선택해주세요.");
				return false;
			}  
		}) 
		
	})
</script>

<article class="contentWrap">
	<h2 class="pageTitle">추천도서 선택 <span class="smallTitle">추천도서로 등록할 도서를 찾아 선택을 클릭해주세요.</span></h2>
	
	<div class="listWrap">
			<div class="searchBox">
				<form action="list.do?page=recom" method="post">
					<input class="rdoCode" type="radio" name="schType" value="도서코드" checked/> 도서코드
					<input class="rdoName" type="radio" name="schType" value="도서명"/> 도서명
					<select name="lcNo" id="lcNo">
						<option value="">대분류</option>
						<c:forEach var="list" items="${lcList }">
							<option value="${list.lclasNo }">${list.lclasName }</option>
						</c:forEach>
					</select>
					<input type="text" name="schText" placeholder="검색어를 입력하세요."/>
					<input type="submit" value="검색" class="btnOrange"/>
				</form>	
				
				<div id="result">
					<table id="bookList">
						<tr>
							<th class="width70">도서코드</th>
							<th class="width200">도서명</th>
							<th class="width90">저자</th>
							<th class="width90">역자</th>
							<th class="width70">출판사</th>
							<th class="width70">발행일</th>
							<th class="width70">도서가격</th>
							<th class="width40">보유<br>권수</th>
							<th class="width50">대여가능<br>여부</th>
							<th class="width40">총대여<br>횟수</th>
							<th class="width40">도서<br>이미지</th>
							<th class="width110">분류</th>
							<th class="width70">등록일자</th>
							<th class="width40">폐기<br>여부</th>
							<th class="width90">관리</th>
						</tr>
						<c:if test="${bookListNull }">
							<tr>
								<td class="searchNone" colspan="15">검색되는 도서가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${bookListNull == null }">
							<c:forEach var="bList" items="${bookList }">
								<tr>
									<td class="code">${bList.bookCode }</td>
									<td class="name textStyle1">${bList.bookName }</td>
									<td class="authrName textStyle1">${bList.authrName }</td>
									<td class="trnslrName textStyle1">${bList.trnslrName }</td>
									<td class="plsName textStyle1">${bList.pls.plsName }</td>
									<td class="pblicYear"><fmt:formatDate value="${bList.pblicteYear }" pattern="yyyy-MM-dd"/></td>
									<td class="Price"><fmt:formatNumber value="${bList.bookPrice }" type="number"/> </td>
									<td class="cnt">${bList.bookCnt }</td>
									<td class="lendCdt">
										<c:if test="${bList.lendPsbCdt == 0 }"><span class="fontW700">대여가능</span></c:if>
										<c:if test="${bList.lendPsbCdt == 1 }"><span class="dftBlue fontW700">대여중</span></c:if>
										<c:if test="${bList.lendPsbCdt == 2 }"><span class="pink fontW700">대여<br>불가능</span></c:if>
									</td>
									<td class="totalLeCnt">${bList.totalLeCnt }</td>
									<td class="imgPath">
										<c:if test="${bList.bookImgPath != null }">
											<span class="fontW700 orange">있음</span>
										</c:if>
										<c:if test="${bList.bookImgPath == null }">
											없음
										</c:if> 
									</td>
									<td class="lc">${bList.lcNo.lclasName } / ${bList.mlNo.mlsfcName }</td>
									<td class="registDate"><fmt:formatDate value="${bList.registDate }" pattern="yyyy-MM-dd"/></td>
									<td class="dsuseCdt">
										<c:if test="${bList.dsuseCdt == 0 }"><span class="fontW700 dftBlue">N</span></c:if>
										<c:if test="${bList.dsuseCdt == 1 }"><span class="fontW700 pink">Y</span></c:if>
									</td>
									<td class="mgn">
										<a class="update btnOrange" href="${pageContext.request.contextPath }/admin/book/recomAdd.do?code=${bList.bookCode}">선택</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	
</article>

<%@ include file="../../adminInclude/adminFooter.jsp" %>