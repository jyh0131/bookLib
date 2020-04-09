<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu2.jsp" %>
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
	
	.width150 {width: 150px;}
	.width40 {width: 40px;}
	.width90 {width: 90px;}
	.width220 {width: 220px;}
	.width110 {width: 110px;}
	.width80 {width: 80px;}
	.width60 {width: 60px;}
	.width30 {width: 30px;}
	.width200{width: 200px;}
	.width50 {width: 50px;}
	
	
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
$(function() {
	$(".wdrCdtRight").click(function() {
		var wdrCdt = $(this).parent().prevAll(".wdrCdt").text().trim();
		if(wdrCdt=="가입"){
			var res = confirm("회원을 탈퇴상태로 변경하시겠습니까?");
			if(res == false){
				return false;
			}else if(res){
				alert("탈퇴여부가 변경되었습니다.");
			}
		}
		if(wdrCdt=="탈퇴"){
			var res = confirm("탈퇴회원입니다. 가입상태로 바꾸시겠습니까?");
			if(res == false){
				return false;
			}else if(res){
				arlet("가입상태로 변경되었습니다.");
			}
		}
	})
	
	
	$(".lendPsbCdtRight").click(function() {
		var lendPsbCdt = $(this).parent().prevAll(".lendPsbCdt").text().trim();
		
		if(lendPsbCdt =="대여가능"){
			var res = confirm("대여권한을 변경하시겠습니까?");
			if(res==false){
				return false;
			}else{
				alert("대여불가능으로 변경되었습니다.");
			}
		}
		if(lendPsbCdt =="대여불가능"){
			var res = confirm("대여권한을 변경하시겠습니까?");
			if(res==false){
				return false;
			}else{
				alert("대여가능으로 변경되었습니다.");
			}
		}
	})
	
	
	
	
})

</script>

<article class="contentWrap">
	<div class="wrap">
		<h2 class="pageTitle">회원 조회/수정</h2>
		
		<div class="listWrap">
			<div class="searchBox">
				<form action="userList.do" method="post">
					<input class="rdoName" type="radio" name="schType" value="회원명" checked/> 회원명
					<input class="rdoId" type="radio" name="schType" value="회원ID" /> 회원ID
					<input class="rdoBirthday" type="radio" name="schType" value="생년월일"/> 생년월일

					<input type="text" name="schText" placeholder="검색어를 입력하세요."/>
					<input type="submit" value="검색" class="btnOrange"/>
				</form>	
				
				<div id="result">
					<table id="memberList">
						<tr>
							<th class="width150">아이디</th>
							<th class="width40">이름</th>
							<th class="width90">생년월일</th>
							<th class="width220">주소</th>
							<th class="width110">전화번호</th>
							<th class="width40">총대여<br>권수</th>
							<th class="width50">현재대여<br>권수</th>
							<th class="width40">등급</th>
							<th class="width80">가입일</th>
							<th class="width50">탈퇴여부</th>
							<th class="width60">대여가능<br>여부</th>
							<th class="width40">연체횟수</th>
							<th class="width200">관리</th>
						</tr>
						<c:if test="${memberListNull}">
							<tr>
								<td class="searchNone" colspan="13">검색되는 회원이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${memberListNull == null }">
							<c:forEach var="memberList" items="${memberList}">
								<tr>
									<c:choose>
										<c:when test="${memberList.odCnt >= 5}">
											<td class="fontSW"><span class="red fontSW">${memberList.mberId }</span></td> 
											<td class="fontSW"> <span class="red fontSW">${memberList.mberName}</span></td> 
										</c:when>
										<c:when test="${memberList.odCnt <= 5}"> 
											<td class="textStyle1"> <span>${memberList.mberId }</span></td>
											<td class="textStyle1"> <span>${memberList.mberName}</span></td>
										</c:when>
									</c:choose> 	
									
									<td class="birthday textStyle1"><fmt:formatDate value="${memberList.mberBrthdy }" pattern="yyyy-MM-dd"/></td>
									<td class="address textStyle1"><span class="textLeft">${memberList.mberZip}${memberList.mberBassAd}${memberList.mberDetailAd}</span></td>
									<td class="phone textStyle1">${memberList.mberTel }</td>
									<td class="total">${memberList.totalLeCnt }</td>
									<td class="lendBookCnt">${memberList.lendBookCnt }</td>
									<td class="grade">
									<c:if test="${memberList.grade.gradeNo ==1}"><span >일반</span></c:if>
									<c:if test="${memberList.grade.gradeNo ==2}"><span class="dftBlue fontSW">우수</span></c:if>
									</td>
									<td class="joinDt"><fmt:formatDate value="${memberList.joinDt}" pattern="yyyy-MM-dd"/></td>
									<td class="wdrCdt">
										<c:if test="${memberList.wdrCdt ==0}"><span>가입</span></c:if>
										<c:if test="${memberList.wdrCdt ==1}"><span class="orange fontSW">탈퇴</span></c:if> 
									</td>
									<td class="lendPsbCdt">
										<c:if test="${memberList.lendPsbCdt ==0}"><span>대여가능</span></c:if>
										<c:if test="${memberList.lendPsbCdt ==1}"><span style="font-size: 14px;"><b>대여불가능</b></span></c:if>
									</td>
									
									
										<c:choose>
											<c:when test="${memberList.odCnt >= 5}">
												<td class="odCnt"> <span class="red fontSW">${memberList.odCnt}</span></td> 
											</c:when>
											<c:when test="${memberList.odCnt <= 5}"> 
												<td class="odCnt"><span>${memberList.odCnt}</span></td> 
											</c:when>
										</c:choose>
									 
									<td class="mgn">
										<%-- <a class="update btnOrange" href="${pageContext.request.contextPath }/admin/book/update.do?code=${bList.bookCode}">수정</a> --%>
										<a class="update btnOrange" href="${pageContext.request.contextPath }/admin/user/userUpdate.do?id=${memberList.mberId}">정보수정</a>
										<a class="wdrCdtRight btnPurple" href="${pageContext.request.contextPath }/admin/user/wdrCdtRight.do?id=${memberList.mberId}">탈퇴여부</a>
										<a class="lendPsbCdtRight btnAqua" href="${pageContext.request.contextPath }/admin/user/lendPsbCdtRight.do?id=${memberList.mberId}">대여권한</a>
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