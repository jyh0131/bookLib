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
		width: 650px;
		height: 300px;
		overflow: auto;
		margin: 0 auto;
	}
	table{
		border-collapse: collapse;
		font-size: 17px;
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
	}
	#memberSubmit_container{
		width: 629px;
		margin: 0 auto;
	}
	tr:nth-of-type(odd) {
		background-color: #D9D9D9;
	}
	td:nth-child(3), td:nth-child(4), td:nth-child(5), td:nth-child(6){
		text-align: center;
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
	#memberSubmit_container p{
		float: right;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		Date.prototype.yyyymmdd = function() {
			var yyyy = this.getFullYear().toString();
			var mm = (this.getMonth() + 1).toString();
		    var dd = this.getDate().toString();
			return  yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
		}
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
					$("#hide_lending_mber", opener.document).css("display", "inline-block");
					if(parentFind.indexOf("http://localhost:8080/bookLib/admin/lending/Return.do")){
						/* window.opener.document.getElementById("hide_lending_mber").css("display", "block"); */
						

						window.opener.document.getElementById("mber_id").value = col1;	
						window.opener.document.getElementById("member_id").value = col1;	
						window.opener.document.getElementById("mber_name").value = col2;	
						window.opener.document.getElementById("grade").value = col3;	
						window.opener.document.getElementById("overdueCdt").value = col4;	
						window.opener.document.getElementById("lendBookCnt").value = col5;
						self.close();				
					}
					else if(parentFind.indexOf("http://localhost:8080/bookLib/admin/lending/Rent.do")){
						$("#noResult", opener.document).hide();
						window.opener.document.getElementById("mber_id").value = col1;
						window.opener.document.getElementById("member_id").value = col1;
						window.opener.document.getElementById("mber_name").value = col2;
						window.opener.document.getElementById("grade").value = col3;
						window.opener.document.getElementById("overdueCdt").value = col4;
						console.log("col6 : "+col6);				
						window.opener.document.getElementById("odCnt").value = col6;	
  						$.ajax({
							url:"${pageContext.request.contextPath}/admin/lending/Return2.do",
							type:"get",
							data:{"mber_id":col1},
							dataType:"json",
							success:function(res){
								$(res).each(function(i, obj){			
									var newTr = document.createElement("tr");
									var pblicteYear = new Date(obj.bookCd.pblicteYear);
									var lendDate = new Date(obj.lendDate);
									var rturnDueDate = new Date(obj.rturnDueDate);
									var sb = obj.bookCd.trnslrName;
									if(sb == null){
										newTr.innerHTML = "<tr><td>"+obj.bookCd.bookCode+"</td><td>"+obj.bookCd.bookName+"</td><td>"+obj.bookCd.authrName+"</td><td>"+pblicteYear.yyyymmdd()+"</td><td>"+obj.bookCd.pls.plsName+"</td><td>"+lendDate.yyyymmdd()+"</td><td>"+rturnDueDate.yyyymmdd()+"</td><td><input type='checkbox' name='book_code2' value='"+obj.bookCd.bookCode+"'></td></tr>";
									}
									else{
										newTr.innerHTML = "<tr><td>"+obj.bookCd.bookCode+"</td><td>"+obj.bookCd.bookName+"</td><td>"+obj.bookCd.authrName+"/"+obj.bookCd.trnslrName+"</td><td>"+pblicteYear.yyyymmdd()+"</td><td>"+obj.bookCd.pls.plsName+"</td><td>"+lendDate.yyyymmdd()+"</td><td>"+rturnDueDate.yyyymmdd()+"</td><td><input type='checkbox' name='book_code2' value='"+obj.bookCd.bookCode+"'></td></tr>";		
									}
									$("#noResult", opener.document).css("display", "none");
									window.opener.document.getElementById("book_table").appendChild(newTr);		
									self.close();
								})
							}
						})
					}
					/* window.opener.document.getElementById("hide_lending_mber").css("display", "block"); */
					$()
				}
			}
		})
	})
</script>
</head>
<body>
	<div id="pop_up_container">
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
	</div>
	<div id="memberSubmit_container">
		<p>
			<button id="memberSubmit" class="btnLightBlue">선택</button>
		</p>
	</div>
</body>
</html>