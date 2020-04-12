<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../adminInclude/adminHeader.jsp"%>
<%@ include file="../../adminInclude/adminSideMenu5.jsp"%>
<style>
	.pageTitle{
		width: 1250px;
	}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
				['Condition', '권수'],
		    	['대여 가능 도서',  ${lendable}],
		    	['대여 중 도서',  ${duringLend} - ${OverdueBooks}],
		    	 ['연체 도서',  ${OverdueBooks}],
		    	 ['대여불가 도서', ${NoLendingBooks}]
        	]);

			var options = {
                title: '',
                legend: 'label',
                pieSliceText: 'none',
                slices: {  1: {offset: 0.1},
                		   2: {offset: 0.3}
                },
			};

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
		chart.draw(data, options);
	}
</script>
<article class="contentWrap">
	<div>
		<h2 class="pageTitle">대여/반납 현황</h2>
	</div>
	<div id="piechart" style="width: 1900px; height: 700px;"></div>	
	
</article>
<%@ include file="../../adminInclude/adminFooter.jsp"%>