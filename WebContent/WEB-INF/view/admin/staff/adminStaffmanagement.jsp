<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu4.jsp" %>
<style>
	/* .wrap {
		padding: 50px;
	} */
	
	input[name='schType'] {
		margin-left: 25px;
	}
	
	input[name='schText'] {
	    font-size: 16px;
  	  	padding: 1px 5px;
    	margin-left: 30px;
    	margin-right: 10px;
    	width: 240px;
	}
	
	div#result {
		margin-top: 30px;
		overflow: auto;
    	max-height: 600px;
    	border-bottom: 1px solid #D9D9D9;
    	border-top: 1px solid #D9D9D9;

	}
	
	table#memberList {
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
	
	.textLeft {text-align: left;
				float:left;}
	
	.width180 {width: 180px;}
	.width90 {width: 90px;}
	.width160 {width: 160px;}
	.width250 {width: 250px;}
	.width100 {width: 100px;}
	.width70 {width: 70px;}
	.width200{width: 200px;}
	
	
	.textStyle1 {
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
		font-size: 13px;
	}
	
	.searchNone {
		font-size: 18px;
		padding: 30px;
	}
	span{
		font-size: 13px;
	}
	
	.fontSW{
		font-size: 15px;
   	 	font-weight: 700;
	}
</style>

<script>


</script>

<article class="contentWrap">
	<div class="wrap">
		<h2 class="pageTitle">직원 조회/수정</h2>
		
		<div class="listWrap">
			<div class="searchBox">
				<form action="management.do" method="post">
					<input class="rdoName" type="radio" name="schType" value="사서이름" checked/> 사서이름
					<input class="rdoId" type="radio" name="schType" value="사서ID" /> 사서ID

					<input type="text" name="schText" placeholder="검색어를 입력하세요."/>
					<input type="submit" value="검색" class="btnOrange"/>
				</form>	
				
				<div id="result">
					<table id="libList">
						<tr>
							<th class="width180">사서ID</th>
							<th class="width90">이름</th>
							<th class="width160">생년월일</th>
							<th class="width250">주소</th>
							<th class="width160">전화번호</th>
							<th class="width70">직책</th>
							<th class="width160">입사일</th>
							<th class="width70">근무여부</th>
							<th class="width200">관리</th>
						</tr>
						<c:if test="${libListNull}">
							<tr>
								<td class="searchNone" colspan="13">검색되는 사서가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${libListNull == null }">
							<c:forEach var="libList" items="${libList}">
								<tr>
									<td class="textStyle1"> <span>${libList.lbId }</span></td>
									<td class="textStyle1"> <span>${libList.lbName}</span></td>
									<td class="birthday textStyle1"><fmt:formatDate value="${libList.lbBirthDay }" pattern="yyyy-MM-dd"/></td>
									<td class="address textStyle1"><span class="textLeft">${libList.lbZip}${libList.lbBassAd}${libList.lbDetailAd}</span></td>
									<td class="phone textStyle1">${libList.lbTel }</td>
									<td class="title">
									<c:if test="${libList.title.titleNo ==0}"><span class="dftBlue fontSW">총관리자</span></c:if>
									<c:if test="${libList.title.titleNo ==1}"><span >사서</span></c:if>
									</td>
									<td class="joinDt"><fmt:formatDate value="${libList.joinDate}" pattern="yyyy-MM-dd"/></td>
									<td class="wdrCdt">
										<c:if test="${libList.workCdt ==1}"><span>재직</span></c:if>
										<c:if test="${libList.workCdt ==0}"><span class="orange fontSW">퇴사</span></c:if> 
									</td>
									 
									<td class="mgn">
										<%-- <a class="update btnOrange" href="${pageContext.request.contextPath }/admin/book/update.do?code=${bList.bookCode}">수정</a> --%>
										<a class="update btnOrange" href="${pageContext.request.contextPath }/admin/staff/staffAdd.do?id=${libList.lbId }">등록</a>
										<a class="wdrCdtRight btnPurple" href="${pageContext.request.contextPath }/admin/staff/staffUpdate.do?id=${libList.lbId }">수정</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
</article>	
<%@ include file="../../adminInclude/adminFooter.jsp" %>