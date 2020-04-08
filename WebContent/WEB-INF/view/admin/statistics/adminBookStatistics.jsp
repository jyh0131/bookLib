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
	    ['Category', '권수'],
	    ['지식학문',  ${countCate[0]}],
	    ['철학',  ${countCate[1]}],
	    ['종교',  ${countCate[2]}]
	    ['사회과학',  ${countCate[3]}]
	    ['자연과학',  ${countCate[4]}]
	    ['기술과학',  ${countCate[5]}]
	    ['예술',  ${countCate[6]}]
	    ['언어',  ${countCate[7]}]
	    ['문학',  ${countCate[8]}]
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