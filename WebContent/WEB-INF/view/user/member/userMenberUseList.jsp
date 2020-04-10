<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../userInclude/userHeader.jsp" %>
<%@ include file="../../userInclude/userSideMenu3.jsp" %>
<style>
	.wrap {
		padding: 30px;
	}
	
	.wrap h3 {
		margin-bottom: 10px;
	}
	
	.infoWrap {
		overflow: hidden;
	}
	
	.memInfo {
		float: left;
		text-align: center;
	}
	
	.memInfo img {
		width: 160px;
		height: 230px; 
	}
	
	.lendInfo {
		overflow: hidden;
		padding-top: 40px;
		padding-left: 20px;
	}
	
	.lendInfo .lendBox {
		float: left;
	    width: 30%;
	    padding: 20px 0;
	    margin: 0 9px;
	    text-align: center;
	    border: 1px solid #aaa;
	    border-radius: 10px;
	}
	
	.lendTit {
		font-size: 18px;
	}
	
	.cnts {
		font-size: 20px;
	}
	
	.cnt {
		font-size: 70px;
		font-weight: 700;
		padding: 5px;
	}
	
	.box {
		text-align: right;
		margin-bottom: 5px;
	}
	
	select {
		font-size: 16px;
	}
	
	table {
		width: 100%;
		font-size: 12px;
		/* text-align: center; */
		table-layout: fixed;
	    word-break: break-all;
	    height: auto;
	}
	
	.list {border-top: 3px solid #476FAD;}
	
	tr{border-bottom: 1px solid #D9D9D9;}
	
	th, td {padding: 15px 5px;}
	
	.center {text-align: center;}
	
	.w150 {width: 150px;}
	.w50 {width: 50px;}
	.w25 {width: 25px;}
</style>
<script>
	$(function(){		
		$("#searchBtn").click(function() {
			$("#f1").submit();
		})
		
		$("#rturnPsmBtn").click(function() {
			var cnt = 0;
			$(".chk").each(function(i, obj) {
				if($(obj).prop("checked")){
					cnt++;
				}
			})
			
			if(cnt == 0) {
				alert("도서를 선택해주세요.");
				return false;
			}
			
			alert("반납연기가 신청되었습니다.");
			$("#f1").attr("action", "rturnPsmCdtUpdate.do");
			$("#f1").submit();
		})
		
		var chks = false;
		$(".check").click(function() {
			if(chks == false) {
				$(".chk").prop("checked", true);
				chks = true;
				return;
			}
			if(chks) {
				$(".chk").prop("checked", false);
				chks = false;
				return;
			}
			return false;
		})
	})

</script>
<div class="articleBg">
	<article class="contentWrap">
		<div class="wrap">
			<h3 class="pageTitle">이용현황</h3>
			<div class="infoWrap">
				<div class="memInfo">				
					<c:if test="${memInfo.memberImgPath == null }">
						<img src="${pageContext.request.contextPath }/images/no-image.png" alt="회원이미지" />
					</c:if>
					<c:if test="${memInfo.memberImgPath != null }">
						<img src="${pageContext.request.contextPath }/upload/${memInfo.memberImgPath}" alt="회원이미지" />
					</c:if>
					<p>${memInfo.mberName } / ${memInfo.grade }</p>
					<p>[${memInfo.mberId }]</p>
				</div>
				<div class="lendInfo">
					<div class="lendBox">
						<p class="lendTit">총 대여권수</p>
						<p class="cnts"><span class="cnt">${memInfo.totalLeCnt }</span>권</p>
					</div>
					<div class="lendBox">
						<p class="lendTit">대여 중 도서수</p>
						<p class="cnts"><span class="cnt">${memInfo.lendBookCnt }</span>권</p>
					</div>
					<div class="lendBox">
						<p class="lendTit">대여가능 권수</p>
						<p class="cnts"><span class="cnt">${memInfo.grade.bookLeCnt - memInfo.lendBookCnt}</span>권</p>
					</div>
				</div>
			</div>
			<div class="lendList">
				<form action="uesList.do" method="post" id="f1">
					<div class="box">
						<select name="selCdt">
							<option value="total">전체</option>
							<option value="lendCdt">대여중 도서</option>
						</select>
						<input class="btnOrange" type="button" value="검색" id="searchBtn"/>
						<input class="btnAqua" type="button" value="반납연기신청" id="rturnPsmBtn"/>
						<button type="button" class="check btnPurple">모두선택</button>
					</div>
					<div class="list">
						<table>
							<tr>
								<th class="w150">도서명</th>
								<th>저자/역자</th>
								<th>출판사</th>
								<th>대여일</th>
								<th class="w50">연체여부</th>
								<th>반납연기여부</th>
								<th>반납예정일</th>
								<th>반납일</th>
								<th class="w25">선택</th>
							</tr>
							<c:if test="${lendList == null }">
								<tr>
									<td colspan="9" class="noData">조회되는 대여도서가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${lendList != null }">
								<c:forEach var="item" items="${lendList }">
									<tr>
										<td>${item.bookCd.bookName }</td>
										
										<c:if test="${item.bookCd.trnslrName == null }">
											<td>${item.bookCd.authrName}</td>
										</c:if>
										<c:if test="${item.bookCd.trnslrName != null }">
											<td>${item.bookCd.authrName} / ${item.bookCd.trnslrName }</td>
										</c:if>
										
										<td>${item.bookCd.pls.plsName }</td>
										<td class="center"><fmt:formatDate value="${item.lendDate }" pattern="yyyy-MM-dd"/></td>
										
										<c:if test="${item.overdueCdt == 0 }">
											<td class="center">-</td>
										</c:if>
										<c:if test="${item.overdueCdt == 1 }">
											<td class="center">연체</td>
										</c:if>
										
										<c:if test="${item.rturnPsmCdt == 0 }">
											<td class="center">-</td>
										</c:if>
										<c:if test="${item.rturnPsmCdt == 1 }">
											<td class="center">반납연기</td>
										</c:if>
										
										<td class="center"><fmt:formatDate value="${item.rturnDueDate }" pattern="yyyy-MM-dd"/></td>
										<td class="center"><fmt:formatDate value="${item.rturnDate }" pattern="yyyy-MM-dd"/></td>
										
										<fmt:formatDate var="dDay" value="${item.rturnDueDate }" pattern="yyyy-MM-dd"/>
										<fmt:formatDate var="now" value="${today }" pattern="yyyy-MM-dd"/>
										<c:if test="${item.rturnDate == null && item.rturnPsmCdt == 0 && dDay > now}">
											<td class="center"><input type="checkbox" name="chk" class="chk" value="${item.lendRturnNo }"/></td>
										</c:if>
										<c:if test="${item.rturnDate != null || item.rturnPsmCdt == 1 || dDay < now}">
											<td class="center">-</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
				</form>
			</div>
		</div>
	</article>
</div>
	
<%@ include file="../../userInclude/userFooter.jsp" %>