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
		$("#bookSubmit").click(function() {
			/* var ch = $("input[name='chk']").length; */
			/* var list = []; */  
			var ch = document.getElementsByName("chk");
			/* alert(checkSize); */
			for(var i=0; i<ch.length;i++){
				if(ch[i].checked){
					/* var parents = ch[i].v */
					/* alert(i); */
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
					console.log(col1);
					console.log(col2);
					console.log(col3);
					console.log(col4);
					console.log(col5);
					console.log(col6);
					console.log(col7);
					/* alert(col1);
					alert(col2);
					alert(col3);
					alert(col4);
					alert(col5);
					alert(col6);
					alert(col7); */
					/* col8 = $("input[name='chk']").parent().parent().eq(i).children("td").eq(7).val(); */
					/* newTr.innerHtml = "<tr><td>"+col1+"</td><td>"+col2+"</td><td>"+col3+"</td><td>"+col4+"</td><td>"+col5+"</td><td>"+col6+"</td><td>"+col7+"</td><td><input type='checkbox' name='chk2'></td></tr>"; */
					newTr.innerHtml = "ぞぞぞぞぞぞぞぞぞぞぞぞぞぞぞ";
					alert(newTr);
					/* newTr.valueOf() */
					console.log(newTr);
					
					 /* alert(s); */
					/* list.push(s); */
					/* window.opener.document.getElementById("test").value = "hellow"; */
					window.opener.document.getElementById("book_table").appendChild(newTr);
					/* window.opener.document.getElementById("book_table").append(newTr); */
					/* $(opener.document).find("#book_table").append(newTr); */
				}
			}
			/* function toWrite(){
				   // 唖 鎮軍 汽戚斗 (鎮軍 姐呪幻鏑)
				   var col1 = "";
				   var col2 = "";
				   var col3 = "";
				   var col4 = "";
				   var col5 = "";
				   var col6 = "";
				   var col7 = "";
				   var col8 = "";
				      .
				      .
				      .
				  
				   // 採乞 但拭 蓄亜拝 凶 承 痕呪
				   var newTr = document.createElement("tr");


				   for('tr' 姐呪幻鏑){
				       if(check-box亜 端滴 鞠嬢赤陥檎){
				           col1 = '湛腰属 td税 value 葵';
				           col1 = '砧腰属 td税 value 葵';
				           col1 = '室腰属 td税 value 葵';
				         
				           // 採乞但 砺戚鷺拭 隔嬢匝 坪球
				           newTr.innerHtml = "<tr><td>"+col1+"</td><td>"+col2+"</td><td>"+col3+"</td></tr>";
				           // 採乞但 砺戚鷺拭 背雁 坪球 隔奄
				           window.opener.'採乞但税 <table>'.appendChild(newTr);           
				       }
				   }
				}
 */			/* window.opener. */
/* 			$.ajax({
				url:"${pageContext.request.contextPath}/admin/lending/book.do",
				type:"post",
				data:{"chk":list},
				dataType:"json",
				success:function(res){
					console.log(res);	
					
				}
			}) */
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
<!-- 	<p>
		<input type="radio" name="choiceBookColums" value="code" checked="checked">亀辞坪球
		<input type="radio" name="choiceBookColums" value="name">亀辞誤
		<input type="text" name="bookSearch">
		<input type="button" value="伊事" onclick="bookSearch">
	</p> -->
	<table>
		<tr>
			<th>亀辞坪球</th>
			<th>亀辞誤</th>
			<th>煽切/蝕切</th>
			<th>降楳鰍亀</th>
			<th>窒毒紫誤</th>
			<th>企食析</th>
			<th>鋼崖析</th>
			<th>識澱</th>
		</tr>
		<c:forEach var="book" items="${rentBook}">			
			<%-- <tr><td>${book.lendPsbCdt }</td></tr> --%>
			<c:if test="${book.lendPsbCdt==0 }">
				<tr class="item">
					<td class="book_code">${book.bookCode}</td>
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
					<!-- <td>企食析</td> -->
					<td class="lend_date"></td>
					<td class="lend_due_date"></td>
					<td><input type="checkbox" name="chk"></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<div>
		<p>
			<button id="bookSubmit">識澱</button>
		</p>
	</div>
</body>
</html>