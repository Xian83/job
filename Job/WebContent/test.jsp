<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="donutchart" style="width: 900px; height: 500px;"></div>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([ [ '기업명', '방문횟수' ],

		[ '메지온', 47 ],

		[ '한국기업평가', 17 ],

		[ '케이티비투자증권', 15 ],

		[ '컴투스', 12 ],

		[ '에이티넘인베스트먼트', 9 ]

		]);
		var options = {
			title : '내가 자주 본 기업 Top 5', // Chart Title
			pieHole : 0.4, // hole size ratio
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchart'));
		chart.draw(data, options);
	}
</script>
