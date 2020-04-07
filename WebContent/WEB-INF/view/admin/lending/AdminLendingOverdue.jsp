<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../adminInclude/adminHeader.jsp"%>
<%@ include file="../../adminInclude/adminSideMenu3.jsp"%>
<style>
#overdue_header {
	width: 800px;
	margin: 0 auto;
	overflow: hidden;
}

#overdue_header_left {
	float: left;
}

#overdue_header_right {
	float: right;
}

#overdue_body {
	width: 800px;
	margin: 0 auto;
}

#overdue_body table {
	display: block;
	width: 600px;
	margin: 0 auto;
	text-align: center;
}
</style>
<script>
	$(function() {
		var flag = true;
		$("#allCheck").click(function() {
			/* if (flag%2 == 0) { */
			if (flag) {
				$("table input[type='checkbox']").prop("checked", true);
				/* flag++;
				flag%2; */
				flag = false;
			} else {
				$("table input[type='checkbox']").prop("checked", false);
				/* flag++; */
				flag = true;
			}
		})

	})
</script>
<article class="contentWrap">
	<div>
		<div id="overdue_header">
			<div id="overdue_header_left">
				<h1>연체회원 목록</h1>
			</div>
			<div id="overdue_header_right">
				<button id="allCheck">모두 선택/모두 해제</button>
			</div>
		</div>
		<form action="/bookLib/admin/lending/Overdue.do" method="post">
			<div id="overdue_body">
				<table>
					<tr>
						<th>회원ID</th>
						<th>회원명</th>
						<th>대여일</th>
						<th>반납예정일</th>
						<th>대여도서권수</th>
						<th>선택</th>
					</tr>
					<c:forEach var="item" items="${overdueList}">
						<tr class="items">
							<td>${item.mberId.mberId}</td>
							<td>${item.mberId.mberName }</td>
							<td><fmt:formatDate value="${item.lendDate}" /></td>
							<td><fmt:formatDate value="${item.rturnDueDate}" /></td>
							<td>${item.overdueBookCnt}</td>
							<td><input type="checkbox"  name="chk" value="${item.mberId.mberId}"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div>
				<p>
					<button id="emailSend">이메일 보내기</button>
				</p>
			</div>
		</form>
	</div>
</article>
<%@ include file="../../adminInclude/adminFooter.jsp"%>