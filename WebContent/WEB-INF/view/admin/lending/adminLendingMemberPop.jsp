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
		$("#memberSubmit").click(function() {  
			var ch = document.getElementsByName("chk");
			for(var i=0; i<ch.length;i++){
				if(ch[i].checked){
					var col1 = "";
				   	var col2 = "";
				   	var col3 = "";
				   	var col4 = "";
				   	var col5 = "";
				   	var col6 = "";

					var parentFind = window.opener.location.toString();
					
				   	col1 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(0).text();
					col2 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(1).text();
					col3 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(2).text();
					col4 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(3).text();
					col5 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(4).text();
					col6 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(5).text();

					if(parentFind == "http://localhost:8080/bookLib/admin/lending/Return.do"){
						window.opener.document.getElementById("mber_id").value = col1;	
						window.opener.document.getElementById("mber_name").value = col2;	
						window.opener.document.getElementById("grade").value = col3;	
						window.opener.document.getElementById("overdueCdt").value = col4;	
						window.opener.document.getElementById("odCnt").value = col6;	
					}
					else if(parentFind == "http://localhost:8080/bookLib/admin/lending/Rent.do"){
						window.opener.document.getElementById("mber_id").value = col1;
						window.opener.document.getElementById("mber_name").value = col2;
						window.opener.document.getElementById("grade").value = col3;
						window.opener.document.getElementById("overdueCdt").value = col4;
						window.opener.document.getElementById("lendBookCnt").value = col5;
					}
				}
			}
		})
	})
</script>
</head>
<body>
	<table>
		<tr>
			<th>회원ID</th>
			<th>회원이름</th>
			<th>회원등급</th>
			<th>대여가능여부</th>
			<th>대여가능권수</th>
			<th>연체횟수</th>
			<th>선택</th>
		</tr>
		<c:forEach var="member" items="${memberSel}">			
				<tr class="item">
					<td>${member.mberId}</td>
					<td>${member.mberName }</td>
					<td>${member.grade.gradeName }</td>
					<td>
						<c:if test="${member.lendPsbCdt==0}">
							정상
						</c:if>
						<c:if test="${member.lendPsbCdt==1}">
							연체
						</c:if>						
					</td>
					<td>${member.grade.bookLeCnt - member.lendBookCnt}</td>
					<td>${member.odCnt }</td>
					<td><input type="radio" name="chk"></td>
				</tr>
		</c:forEach>
	</table>
	<div>
		<p>
			<button id="memberSubmit">선택</button>
		</p>
	</div>
</body>
</html>