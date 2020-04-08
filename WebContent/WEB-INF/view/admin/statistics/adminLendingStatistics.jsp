<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../adminInclude/adminHeader.jsp"%>
<%@ include file="../../adminInclude/adminSideMenu3.jsp"%>

<article class="contentWrap">
<style>
	#chart_div{
		width: 900px;
		height: 500px;
	}
</style>
<script type="text/javascript" src="http://www.gstatic.com/charts/loader.js"></script>
<script>
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	
	function drawVisualization() {
	  // Some raw data (not necessarily accurate)
	  var data = google.visualization.arrayToDataTable([
	    ['Condition', '권수'],
	    ['대여 가능 도서',  ${lendable}],
	    ['대여 중 도서',  ${duringLend}],
	    ['전체 도서',  ${totalBooks}]
	  ]);
	
	  var options = {
	    title : '대여 반납 통계',
	    vAxis: {title: '권수'},
	    hAxis: {title: '상태'},
	    seriesType: 'bars',
	    series: {1: {type: 'line'}}};
	
	  var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	  chart.draw(data, options);
	}
</script>
	<div>
		<h1>대여/반납 통계</h1>
	</div>
	<div>
		<div>
			<select>
				<option>년</option>
				<option>2019</option>
				<option>2020</option>
			</select>
			<select>
				<option>월</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
				<option>6</option>
				<option>7</option>
				<option>8</option>
				<option>9</option>
				<option>10</option>
				<option>11</option>
				<option>12</option>
			</select>
		</div>
		<div id="chart_div"></div>	
	</div>
</article>
<%@ include file="../../adminInclude/adminFooter.jsp"%>