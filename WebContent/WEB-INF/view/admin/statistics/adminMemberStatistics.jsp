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
		line-height:70px;
		font-size:1.2em;
		width: 250px;
		height: 70px;
		float: left;
	}
	#book_statistics_header_mid {
		line-height:70px;
		font-size:1.2em;
		width: 300px;
		height: 70px;
		float: left;
	}
	#book_statistics_header_right {
		line-height:70px;
		font-size:1.2em;
		width: 400px;
		height: 70px;
		float: left;
	}
	.checkingDate{
		width: 135px;
		height: 35px;
		margin-top: 20px;
	}
	#chart_area{
		width: 1100px;
		overflow: hidden;
	}
	#chart_div{
		float: right;
	}
	#donutchart{
		float: left;
	}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['회원', '인원'],
          	['우수회원', ${memberCnt[2]}],
          	['일반회원', ${memberCnt[1]}]
        ]);

        var options = {
          	title: '이용자 현황',
          	pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        	chart.draw(data, options);
	}
	$(function() {
		$(".checkingDate").on("change", function() {
			var year = document.getElementById("yearStatistics");
			year = year.options[year.selectedIndex].value;
			if(year == "년"){
				alert("해당 년을 선택해주세요");
				return;
			}
			$.ajax({
					url:"${pageContext.request.contextPath}/admin/statistics/MemberStatistics.do",
					type:"post",
					data:{"year":year},
					dataType:"json",
					success:function(res){
						console.log("res : "+res);
						
						if(res == null || res == ""){
							alert("해당 정보가 없습니다.");
							return;
						}
						
					    google.charts.load('current', {'packages':['corechart']});
					    google.charts.setOnLoadCallback(drawVisualization);

					    function drawVisualization() {
					      var year2 = year--;
					      var data = google.visualization.arrayToDataTable([
					        ['Condition', '전체 기간', year+"년", year2+'년'],
					        ['총 회원 수', ${memberCnt[1]+memberCnt[2]}, res.wantDate2[0]+res.wantDate2[1], res.wantDate[0]+res.wantDate[1]],
					        /* [year+"01-01", res[0]+res[1], res[0], res[1]], */
					        ['일반 회원 수',  ${memberCnt[1]}, res.wantDate2[0], res.wantDate[0]],
					        ['우수 회원 수', ${memberCnt[2]}, res.wantDate2[1], res.wantDate[1]]
					      ]);

					      var options = {
					        title : '전체 기간 및 조회 년도와 전년도 회원 수 비교',
					        vAxis: {title: 'Cups'},
					        hAxis: {title: 'Month'},
					        seriesType: 'bars',
					        series: {5: {type: 'line'}}        };

					      var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
					      chart.draw(data, options);
					    }
					}
			})
		})
	})

</script>
	<div>
		<h2 class="pageTitle">이용자 현황</h2>
		<div id="book_statistics_header">
			<div id="book_statistics_header_left">
				<h2>총 회원 수 : ${memberCnt[0] }명</h2>			
			</div>
			<div id="book_statistics_header_mid">
				<h2>일반 회원 수 : ${memberCnt[1] }명</h2>
			</div>
			<div id="book_statistics_header_right">
				<h2>우수 회원 수 : ${memberCnt[2] }명</h2>
			</div>
			<div>
				<select class="checkingDate" name="yearStatistics" id="yearStatistics">
					<option>년</option>
					<option value="2019">2019년</option>
					<option value="2020">2020년</option>
				</select>
			</div>
		</div>
		<div id="chart_area">
			<div id="chart_div" style="width: 550px; height: 500px;"></div>
			<div id="donutchart" style="width: 550px; height: 500px;"></div>
		</div>
	</div>
</article>
<%@ include file="../../adminInclude/adminFooter.jsp"%>