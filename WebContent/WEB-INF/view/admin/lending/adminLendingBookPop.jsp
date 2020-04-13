<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#pop_up_container{
		width: 1150px;
		height: 300px;
		overflow: auto;
		margin: 0 auto;
	}
	table{
		border-collapse: collapse;
		font-size: 15px;
		/* width:1150px;
		height: 250px;
		overflow: auto; */
		
		display:block;
		width:100%;
		margin: 0 auto;
	}
	th{
		border: 1px solid black;
		background-color: #476fad;
		color: #fff;
		padding: 10px;
		font-size: 12px;
	}
	td{
		border: 1px solid black;
		padding: 10px;
		text-overflow: ellipsis;
		overflow: hidden;
	}

	
	#bookSubmit_container p{
		float: right;
	}
	#bookSubmit_container p button{
		margin-right: 20px;
	}
	tr:nth-of-type(odd) {
		background-color: #D9D9D9;
	}
	.btnLightBlue {
		display: inline-block;
		border: none;
		padding: 5px 10px;
		color: #fff;
		font-weight: 700;
		background-color: #3493DD;
		border-radius: 3px;
		cursor: pointer;
	}
	td:first-child{
		width: 95px;
		text-align: center;
	}
	td:nth-child(3){
		width: 100px;
	}
	td:nth-child(4){
		width: 100px;
		text-align: center;
	}
	td:nth-child(6), td:nth-child(7){
		width: 100px;
		text-align: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		$("#bookSubmit").click(function() {
			var ch = document.getElementsByName("chk");
			for(var i=0; i<ch.length;i++){
				if(ch[i].checked){
					/* $("#noResult", opener.document).css("display", "none"); */
					$("#noResult", opener.document).hide();
					var col1 = "";
				   	var col2 = "";
				   	var col3 = "";
				   	var col4 = "";
				   	var col5 = "";
				   	var col6 = "";
				   	var col7 = "";
				   	var newTr = document.createElement("tr");
				   	var newTd1 = document.createElement("td");
				   	var newTd2 = document.createElement("td");
				   	var newTd3 = document.createElement("td");
				   	var newTd4 = document.createElement("td");
				   	var newTd5 = document.createElement("td");
				   	var newTd6 = document.createElement("td");
				   	var newTd7 = document.createElement("td");
					col1 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(0).html();
					col2 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(1).html();
					col3 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(2).text();
					col4 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(3).html();
					col5 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(4).html();
					col6 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(5).html();
					col7 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(6).html();
					newTd1.innerHTML = "<td><input type='text' class='code' name='book_code' value='"+col1+"'></td>"
					newTd2.innerHTML = "<td><input type='text' name='book_name' value='"+col2+"'></td>"
					newTd3.innerHTML = "<td><input type='text' name='book_authrName' value='"+col3+"'></td>"
					newTd4.innerHTML = "<td><input type='text' name='book_pblicteYear' value='"+col4+"'></td>"
					newTd5.innerHTML = "<td><input type='text' name='book_plsName' value='"+col5+"'></td>"
					newTd6.innerHTML = "<td><input type='text' name='book_plsName' value='"+col5+"'></td><td><input type='text' name='book_lend_date' value='"+col6+"'></td>"
					newTd7.innerHTML = "<td><input type='text' name='book_plsName' value='"+col5+"'></td><td><input type='text' name='book_lend_date' value='"+col6+"'></td><td><input type='text' name='book_lend_due_date' value='"+col7+"'></td>"
/* 					newTr.innerHTML = "<tr><td><input type='text' class='code'></td><td><input type='text' name='book_name' value='"+col2+"'></td><td><input type='text' name='book_authrName' value='"+col3+"'></td><td><input type='text' name='book_pblicteYear' value='"+col4+"'></td><td><input type='text' name='book_plsName' value='"+col5+"'></td><td><input type='text' name='book_lend_date' value='"+col6+"'></td><td><input type='text' name='book_lend_due_date' value='"+col7+"'></td><td><input type='checkbox' name='book_code' value='"+col1+"'></td></tr>"; */	
					newTr.innerHTML = "<tr><td>"+col1+"</td><td>"+col2+"</td><td>"+col3+"</td><td>"+col4+"</td><td>"+col5+"<td>"+col6+"<td>"+col7+"</td><td><input type='checkbox' name='book_code' value='"+col1+"'></td></tr>";	
					var parent = window.opener.document.getElementById("book_table").childElementCount;
					var size =  parseInt($("#lendBookCnt", opener.document).val());
					size +1;
					console.log(parent);
					console.log(size)
					if(parent > size){
						alert("대여 권 수 초과");
						return;
					}
					var goodToGo = true;
					$("#book_table tr", opener.document).each(function() {
						var col1Find = $(this).find("td").eq(0).html();
						if(col1 == col1Find){
							goodToGo = false;
							return false;
						}
					})
					if(goodToGo){
						window.opener.document.getElementById("book_table").appendChild(newTr);	
					}
					self.close();
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
		/* $("input [name='lend_date']").html(lendDate); */
		$(".lend_due_date").html(lendDate2);
		/* $("input [name='lend_due_date']").html(lendDate2); */
	})
</script>
</head>
<body>
	<div id="pop_up_container">
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
						<c:if test="${book.trnslrName==null}">
							<td>${book.authrName }</td>
						</c:if>
						<c:if test="${book.trnslrName!=null}">
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
	</div>
	<div id="bookSubmit_container">
		<p>
			<button id="bookSubmit" class="btnLightBlue">선택</button>
		</p>
	</div>
</body>
</html>