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
	
	function drawVisualization() {
	  // Some raw data (not necessarily accurate)
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
			alert("확인");
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
				<select class="checkingDate" name="yearStatistics">
					<option>년</option>
					<option value="2019">2019년</option>
					<option value="2019">2020년</option>
				</select>
				<select class="checkingDate" name="monthStatistics">
					<option>월</option>
					<option value="1">1월</option>
					<option value="2">2월</option>
					<option value="3">3월</option>
					<option value="4">4월</option>
					<option value="5">5월</option>
					<option value="6">6월</option>
					<option value="7">7월</option>
					<option value="8">8월</option>
					<option value="9">9월</option>
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