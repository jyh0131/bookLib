<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	table{
		border-collapse: collapse;
	}
	th, td{
		border: 1px solid steelblue;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		/* $("#book_search").click(function() {
			var choiceValue = $("input[name='choiceBookColums']:checked").val();
			var searchText = $("input[name='bookSearch']").val();
			if(choiceValue == "code"){
				
			}
			else if(choiceValue == "name"){
				alert(searchText);
			}
		}) */
		var now = new Date();
		
		var y = now.getFullYear();
		
		var m = now.getMonth()+1;
		var d = now.getDate();
		var d2 = now.getDate()+15;
		var lendDate = y+"-"+m+"-"+d;
		var lendDate2 = y+"-"+m+"-"+d2;
		$(".lend_date").html(lendDate);
		$(".lend_due_date").html(lendDate2);
	})
</script>
</head>
<body>
<!-- 	<p>
		<input type="radio" name="choiceBookColums" value="code" checked="checked">�����ڵ�
		<input type="radio" name="choiceBookColums" value="name">������
		<input type="text" name="bookSearch">
		<input type="button" value="�˻�" onclick="bookSearch">
	</p> -->
	<table>
		<tr>
			<th>�����ڵ�</th>
			<th>������</th>
			<th>����/����</th>
			<th>����⵵</th>
			<th>���ǻ��</th>
			<th>�뿩��</th>
			<th>�ݳ���</th>
			<th>����</th>
		</tr>
		<c:forEach var="book" items="${rentBook}">			
			<%-- <tr><td>${book.lendPsbCdt }</td></tr> --%>
			<c:if test="${book.lendPsbCdt==0 }">
				<tr class="item">
					<td>${book.bookCode}</td>
					<td>${book.bookName }</td>
					<td>
						${book.authrName }
						<%-- ${book.trnslrName==""?"/${book.trnslrName}":""} --%>
						<c:if test="${book.trnslrName!=''}">
						/${book.trnslrName }
						</c:if>
					</td>
					<%-- <td>${book.pblicteYear }</td> --%>
					<td><fmt:formatDate value="${book.pblicteYear}"/></td>
					<!-- <td class="pblicsher_year"></td> -->
					<td>${book.pls.plsName }</td>
					<!-- <td>�뿩��</td> -->
					<td class="lend_date"></td>
					<td class="lend_due_date"></td>
					<td><input type="checkbox" name="chk"></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>