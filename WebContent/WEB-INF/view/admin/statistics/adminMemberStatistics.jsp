<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../adminInclude/adminHeader.jsp"%>
<%@ include file="../../adminInclude/adminSideMenu5.jsp"%>

<article class="contentWrap">

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['회원', '인원'],
          	['우수회원',     ${memberCnt[2]}],
          	['일반회원',      ${memberCnt[1]}]
        ]);

        var options = {
          	title: '이용자 현황',
          	pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        	chart.draw(data, options);
      	}
</script>
	<div>
		<div>
			<select>
				<option>년</option>
				<option>2019</option>
				<option>2020</option>
			</select> <select>
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
		<div>
			<div>
				<h3>총 회원 수</h3>
				<h1>${memberCnt[0] }명</h1>
			</div>
			<div>
				<h3>일반 회원 수</h3>
				<h1>${memberCnt[1] }명</h1>
			</div>
			<div>
				<h3>우수 회원 수</h3>
				<h1>${memberCnt[2] }명</h1>
			</div>			
		</div>
		<div id="donutchart" style="width: 900px; height: 500px;"></div>
	</div>
</article>
<%@ include file="../../adminInclude/adminFooter.jsp"%>