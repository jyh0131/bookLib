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
	table{
		display: block;
		width: 629px;
		margin: 10px auto;
		border-collapse: collapse;
		text-align: center;
	}
	th, td{
		border: 1px solid steelblue;
	}
	#memberSubmit_container{
		width: 629px;
		margin: 0 auto;
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
					
					console.log(col1);
					console.log(col2);
					console.log(col3);
					console.log(col4);
					console.log(col5);
					console.log(col6);
					console.log("parentFind : "+parentFind);
					
					if(parentFind.indexOf("http://localhost:8080/bookLib/admin/lending/Return.do")){
						window.opener.document.getElementById("mber_id").value = col1;	
						window.opener.document.getElementById("member_id").value = col1;	
						window.opener.document.getElementById("mber_name").value = col2;	
						window.opener.document.getElementById("grade").value = col3;	
						window.opener.document.getElementById("overdueCdt").value = col4;	
						window.opener.document.getElementById("lendBookCnt").value = col5;
						
 						$.ajax({
							url:"${pageContext.request.contextPath}/admin/lending/return.do",
							type:"post",
							data:{"mber_id":col1},
							dataType:"json",
							success:function(res){
								console.log(res);
								$(res).each(function(i, obj){
									var $tr = $("<tr>");
									var $td1 = $("<td>").html("<input type='text' value='"+res[i].bookCd.bookCode+"'>");
									var $td2 = $("<td>").html("<input type='text' value='"+res[i].bookCd.bookName+"'>");
									var $td3 = $("<td>");
									var sb = res[i].bookCd.trnslrName;
									if(sb == null){
										$td3.html("<input type='text' value='"+res[i].bookCd.authrName+"'>");
									}
									else{
										$td3.html("<input type='text' value='"+res[i].bookCd.authrName+"/"+res[i].bookCd.trnslrName+"'>");
									}
									var $td4 = $("<td>").html("<input type='text' name='pblicteYear' value='"+res[i].bookCd.pblicteYear+"'>");
									var $td5 = $("<td>").html("<input type='text' value='"+res[i].bookCd.pls.plsName+"'>");
									var $td6 = $("<td>").html("<input type='text' value='"+res[i].lendDate+"'>");
									var $td7 = $("<td>").html("<input type='text' value='"+res[i].rturnDueDate+"'>");
									var $td8 = $("<td>").html("<input type='checkbox' name='chk3'>");
									$tr.append($td1);
									$tr.append($td2);
									$tr.append($td3);
									$tr.append($td4);
									$tr.append($td5);
									$tr.append($td6);
									$tr.append($td7);
									$tr.append($td8);
									window.opener.document.getElementById("book_table").appendChild($tr);
								})
							}
						}) 
						self.close();
					}
					else if(parentFind.indexOf("http://localhost:8080/bookLib/admin/lending/Rent.do")){
						window.opener.document.getElementById("mber_id").value = col1;
						window.opener.document.getElementById("mber_name").value = col2;
						window.opener.document.getElementById("grade").value = col3;
						window.opener.document.getElementById("overdueCdt").value = col4;
						window.opener.document.getElementById("odCnt").value = col6;
						self.close();
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
						<c:if test="${member.lendPsbCdt==0}">
							<td>정상</td>
						</c:if>
						<c:if test="${member.lendPsbCdt==1}">
							<td>연체</td>
						</c:if>						
					<td>${member.grade.bookLeCnt - member.lendBookCnt}</td>
					<td>${member.odCnt }</td>
					<td><input type="radio" name="chk"></td>
				</tr>
		</c:forEach>
	</table>
	<div id="memberSubmit_container">
		<p>
			<button id="memberSubmit">선택</button>
		</p>
	</div>
</body>
</html>