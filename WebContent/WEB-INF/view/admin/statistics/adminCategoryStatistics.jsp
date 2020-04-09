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
	
	function drawVisualization() {
	  // Some raw data (not necessarily accurate)
	  var data = google.visualization.arrayToDataTable([
	    ['Category', '권수'],
	    ['지식학문',  ${lendCate[0]}],
	    ['철학',  ${lendCate[1]}],
	    ['종교',  ${lendCate[2]}],
	    ['사회과학',  ${lendCate[3]}],
	    ['자연과학',  ${lendCate[4]}],
	    ['기술과학',  ${lendCate[5]}],
	    ['예술',  ${lendCate[6]}],
	    ['언어',  ${lendCate[7]}],
	    ['문학',  ${lendCate[8]}],
	    ['역사',  ${lendCate[9]}]
	  ]);
	
	  var options = {
	    title : '도서 대여 현황',
	    vAxis: {title: '권수'},
	    hAxis: {title: '대분류'},
	    seriesType: 'bars',
	    series: {1: {type: 'line'}}};
	
	  var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	  chart.draw(data, options);
	}
</script>

	<div>
		<h2 class="pageTitle">도서 대여 현황</h2>
		<div id="book_statistics_header">
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