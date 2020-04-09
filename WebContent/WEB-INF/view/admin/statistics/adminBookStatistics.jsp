<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../adminInclude/adminHeader.jsp"%>
<%@ include file="../../adminInclude/adminSideMenu5.jsp"%>

<article class="contentWrap">
<style>
	#chart_div{
		width: 1200px;
		height: 500px;
	}
	#book_statistics_header{
		overflow: hidden;
	}
	#book_statistics_header_left {
		line-height:80px;
		font-size:1.4em;
		width: 400px;
		height: 80px;
		float: left;
	}
	#book_statistics_header_right {
		line-height:80px;
		font-size:1.4em;
		width: 400px;
		height: 80px;
		float: left;
	}
	.checkingDate{
		width: 135px;
		height: 35px;
		margin-top: 20px;
	}
</style>
<script type="text/javascript" src="http://www.gstatic.com/charts/loader.js"></script>
<script>
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	
	function drawVisualization(res) {
	  // Some raw data (not necessarily accurate)
	  if(typeof res == "undefined"){
		  var data = google.visualization.arrayToDataTable([
			    ['Category', '권수'],
			    ['지식학문',  ${countCate[0]}],
			    ['철학',  ${countCate[1]}],
			    ['종교',  ${countCate[2]}],
			    ['사회과학',  ${countCate[3]}],
			    ['자연과학',  ${countCate[4]}],
			    ['기술과학',  ${countCate[5]}],
			    ['예술',  ${countCate[6]}],
			    ['언어',  ${countCate[7]}],
			    ['문학',  ${countCate[8]}],
			    ['역사',  ${countCate[9]}]
			  ]);
	  }
	  else{
		  var data = google.visualization.arrayToDataTable([
	  
		    ['Category', '권수'],
		    ['지식학문',  res[0]],
		    ['철학',  res[1]],
		    ['종교',  res[2]],
		    ['사회과학',  res[3]],
		    ['자연과학',  res[4]],
		    ['기술과학',  res[5]],
		    ['예술',  res[6]],
		    ['언어',  res[7]],
		    ['문학',  res[8]],
		    ['역사',  res[9]]
		]);
	  }
	  var options = {
	    title : '도서 보유 현황',
	    vAxis: {title: '권수'},
	    hAxis: {title: '대분류'},
	    seriesType: 'bars',
	    series: {1: {type: 'line'}}};
	
	  var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	  chart.draw(data, options);
	}
	$(function() {
		$(".checkingDate").on("change", function() {
			/* var year = $("select [name='yearStatistics']").val(); */
			var year = document.getElementById("yearStatistics");
			year = year.options[year.selectedIndex].value;
			var month = document.getElementById("monthStatistics");
			month = month.options[month.selectedIndex].value;
			if(year == "년"){
				alert("해당 년을 선택해주세요");
				return;
			}
			if(month == "월"){
				alert("해당 달을 선택해주세요");
				return;
			}
			$.ajax({
					url:"${pageContext.request.contextPath}/admin/statistics/BookStatistics.do",
					type:"post",
					data:{"year":year, "month":month},
					dataType:"json",
					success:function(res){
						console.log("res : "+res);
						if(res == null || res == ""){
							alert("해당 정보가 없습니다.");
							return;
						}
						drawVisualization(res);
					}
			})
		})
	})
</script>
	<div>
		<h2 class="pageTitle">도서 보유 현황</h2>
		<div id="book_statistics_header">
			<div id="book_statistics_header_left">
				<h2>총 보유권수 : ${totalBooks} 권</h2>			
			</div>
			<div id="book_statistics_header_right">
				<h2>총 폐기도서 : ${disposal } 권</h2>
			</div>
			<div>
				<select class="checkingDate" name="yearStatistics" id="yearStatistics">
					<option>년</option>
					<option value="2019">2019년</option>
					<option value="2020">2020년</option>
				</select>
				<select class="checkingDate" name="monthStatistics" id="monthStatistics">
					<option>월</option>
					<option value="01">1월</option>
					<option value="02">2월</option>
					<option value="03">3월</option>
					<option value="04">4월</option>
					<option value="05">5월</option>
					<option value="06">6월</option>
					<option value="07">7월</option>
					<option value="08">8월</option>
					<option value="09">9월</option>
					<option value="10">10월</option>
					<option value="11">11월</option>
					<option value="12">12월</option>
				</select>
			</div>
		</div>
		<div id="chart_div"></div>	
	</div>
</article>
<%@ include file="../../adminInclude/adminFooter.jsp"%>