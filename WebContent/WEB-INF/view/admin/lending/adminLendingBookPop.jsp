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
		$("#bookSubmit").click(function() {
			var ch = document.getElementsByName("chk");
			for(var i=0; i<ch.length;i++){
				if(ch[i].checked){
					var col1 = "";
				   	var col2 = "";
				   	var col3 = "";
				   	var col4 = "";
				   	var col5 = "";
				   	var col6 = "";
				   	var col7 = "";
				   	var newTr = document.createElement("tr");
					col1 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(0).html();
					col2 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(1).html();
					col3 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(2).text();
					col4 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(3).html();
					col5 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(4).html();
					col6 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(5).html();
					col7 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(6).html();
					newTr.innerHTML = "<tr><td class='code'>"+col1+"</td><td>"+col2+"</td><td>"+col3+"</td><td>"+col4+"</td><td>"+col5+"</td><td>"+col6+"</td><td>"+col7+"</td><td><input type='checkbox' name='chk2'></td></tr>";	
					var parent = window.opener.document.getElementById("book_table").childElementCount;
					var size =  parseInt($("#lendBookCnt", opener.document).val());
					size +1;
					console.log(parent);
					console.log(size)
					if(parent > size){
						alert("대여 권 수 초과");
						return;
					}
					/* var st = window.opener.document.getElementById("book_table").getAttribute(col1); */
					var st = $(".code", opener.document).find(col1);
					console.log(st.val());
				
					if($(".code", opener.document).find(col1) == null){
						window.opener.document.getElementById("book_table").appendChild(newTr);
					}
					/* self.close(); */
				}
			}
		})		
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
	<table>
		<tr>
			<th>도서코드</th>
			<th>도서명</th>
			<th>저자/역자</th>
			<th>발행년도</th>
			<th>출판사명</th>
			<th>대여일</th>
			<th>반납일</th>
			<th>선택</th>
		</tr>
		<c:forEach var="book" items="${rentBook}">			
			<c:if test="${book.lendPsbCdt==0 }">
				<tr class="item">
					<td class="book_code">${book.bookCode}</td>
					<td>${book.bookName }</td>
					<c:if test="${book.trnslrName==''}">
						<td>${book.authrName }</td>
					</c:if>
					<c:if test="${book.trnslrName!=''}">
						<td>${book.authrName }/${book.trnslrName }</td>
					</c:if>
					<td><fmt:formatDate value="${book.pblicteYear}"/></td>
					<td>${book.pls.plsName }</td>
					<td class="lend_date"></td>
					<td class="lend_due_date"></td>
					<td><input type="checkbox" name="chk"></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<div>
		<p>
			<button id="bookSubmit">선택</button>
		</p>
	</div>
</body>
</html>