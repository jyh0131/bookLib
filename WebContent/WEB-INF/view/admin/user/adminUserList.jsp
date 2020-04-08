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
		margin-left: 10px;
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
	
	.textLeft {text-align: left;}
	
	.width70 {width: 70px;}
	.width110 {width: 110px;}
	.width150 {width: 150px;}
	.width80 {width: 80px;}
	.width50 {width: 50px;}
	.width60 {width: 60px;}
	.width200 {width: 200px;}
	
	
	.textStyle1 {
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	
	.searchNone {
		font-size: 18px;
		padding: 30px;
	}
	
</style>

<script>

</script>

<article class="contentWrap">
	<div class="wrap">
		<h2 class="pageTitle">회원 조회/수정</h2>
		
		<div class="listWrap">
			<div class="searchBox">
				<form action="list.do" method="post">
					<input class="rdoId" type="radio" name="schType" value="회원ID" checked/> 회원ID
					<input class="rdoName" type="radio" name="schType" value="회원명"/> 회원명
					<input class="rdoBirthday" type="radio" name="schType" value="생년월일"/> 생년월일

					<input type="text" name="schText" placeholder="검색어를 입력하세요."/>
					<input type="submit" value="검색" class="btnOrange"/>
				</form>	
				
				<div id="result">
					<table id="memberList">
						<tr>
							<th class="width70">아이디</th>
							<th class="width70">이름</th>
							<th class="width110">생년월일</th>
							<th class="width150">주소</th>
							<th class="width80">전화번호</th>
							<th class="width50">총대여<br>권수</th>
							<th class="width50">현재대여<br>권수</th>
							<th class="width50">등급</th>
							<th class="width110">가입일</th>
							<th class="width50">탈퇴여부</th>
							<th class="width50">대여가능<br>여부</th>
							<th class="width50">연체횟수</th>
							<th class="width200">관리</th>
						</tr>
						<c:if test="${memberListNull }">
							<tr>
								<td class="searchNone" colspan="15">검색되는 회원이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${memberListNull == null }">
							<c:forEach var="bList" items="${memberList }">
								<tr>
									<td class="id">${memberList.mberId }</td>
									<td class="name textStyle1">${memberList.mberName }</td>
									<td class="birthday textStyle1"><fmt:formatDate value="${memberList.mberBrthdy }" pattern="yyyy-MM-dd"/></td>
									<td class="address textStyle1">${memberList.mberZip } + ${memberList.mberbassAd } ${memberList.detailAd }</td>
									<td class="phone textStyle1">${memberList.mberTel }</td>
									<td class="total">${memberList.totalLeCnt }</td>
									<td class="Price"><fmt:formatNumber value="${memberList.bookPrice }" type="number"/> </td>
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
										<a class="update btnOrange" href="${pageContext.request.contextPath }/admin/book/update.do?code=${bList.bookCode}">수정</a>
										<a class="dsuse btnPurple" href="${pageContext.request.contextPath }/admin/book/dsuseUpdate.do?code=${bList.bookCode }">폐기/취소</a>
										<a class="remove btnLightBlue" href="${pageContext.request.contextPath }/admin/book/remove.do?code=${bList.bookCode }">데이터삭제</a>
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