<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#top {
	width: 100%;
	/* 	border-top: 5px solid #f4511e; */
	border-bottom: 2px solid #f4511e;
}

#basic_info {
	width: 100%;
	color: white;
	background: #f4511e;
}

#top-follow {
	margin-right: 1em;
}

h2.media-heading {
	/* 	color: white; */
	
}

div.num_left {
	height: 80px;
	border-left: 2px solid #f4511e;
	margin-bottom: 1em;
}

div.num_right {
	height: 80px;
	border-right: 2px solid #f4511e;
	margin-bottom: 1em;
}

#scrap {
	margin-left: 10em;
	padding-top: 0.7em;
	padding-bottom: 0.7em;
	padding-left: 1.5em;
	padding-right: 1.5em;
}
</style>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
   google.charts.load('current', {'packages':['corechart']});
   google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
		// 남녀 방문자 비율
        var data = google.visualization.arrayToDataTable([
          ['구분', '조회율'],
          ['남자', ${rate.man }],
          ['여자', ${rate.woman }]
        ]);

        var options = {
//          'title': '해당 기업에 대한 남녀 관심도',
          	'backgroundColor' : 'transparent',
          	'pieSliceText' : 'label',
          	'legend' : 'none',
        };
        
        var chart_div = document.getElementById('boygirl');
        var chart = new google.visualization.PieChart(chart_div);
        
        chart.draw(data, options);
        
        // 방문자수
        var data2 = new google.visualization.DataTable();
        data2.addColumn('date', 'Time of Day');
        data2.addColumn('number', '조회수');
        data2.addRows([
        	[new Date(2017, 3, 28), ${vList[0]} ],
        	[new Date(2017, 3, 29), ${vList[1]} ],
        	[new Date(2017, 3, 30), ${vList[2]} ],
        	[new Date(2017, 3, 31), ${vList[3]} ],
        	[new Date(2017, 4, 1), ${vList[4]}	],
        	[new Date(2017, 4, 2), ${vList[5]}	],
        	[new Date(2017, 4, 3), ${vList[6]}	]
        ]);

        var options2 = {
          hAxis: {
          	title : '날짜',
  	    	format: 'MMM dd, yyyy'
          },
          vAxis: {
            title: ''
          }
        };

        var chart2 = new google.visualization.LineChart(document.getElementById('visit_chart'));

        chart2.draw(data2, options2);
        
    }
    </script>
</head>
<body>

	<!-- 로고, 회사명 -->
	<div class="row" id="top">
		<div class="media">
			<div class="media-left media-middle">
				<img src="${score.LOGO }" class="media-object" style="width: 82px">
			</div>
			<div class="media-body media-middle">
				<h2 class="media-heading" style="font-color: white;">${score.CMPN_NM }
					<button class="btn btn-info" id="scrap">스크랩</button>
				</h2>
				<p style="font-color: grey">${score.DIVISION }|${score.SCALE }</p>
			</div>
		</div>
	</div>

	<!-- 기본 수치 정보 위치 -->
	<div class="row" id="basic_info">
		<div class="num_left col-md-2">
			<h3>${info02.num01}</h3>
			<p>매출액</p>
		</div>
		<div class="num_left col-md-2">
			<h3>${info02.num04}</h3>
			<p>사원수</p>
		</div>
		<div class="num_left col-md-2">
			<h3>
				<fmt:formatNumber value="${salary.AVG_SALARY / 10000 }"
					groupingUsed="true" />
				만원
			</h3>
			<p>평균연봉</p>
		</div>
		<div class="num_left col-md-2">
			<h3>
				<fmt:formatNumber value="${salary.ROOKIE_SALARY/ 10000 }"
					groupingUsed="true" />
				만원
			</h3>
			<p>신입연봉</p>
		</div>
		<div class="num_left col-md-2">
			<h3>${score.FINANCE_SCORE }점</h3>
			<div
				style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/spare.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
				<p
					style="WIDTH: ${score.FINANCE_SCORE }%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
				</p>
			</div>
			<br />
			<p>재무평가</p>
		</div>
		<div class="num_left num_right col-md-2">
			<h3>${score.EMPLOYEE_SCORE }점</h3>
			<div
				style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/spare.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
				<p
					style="WIDTH: ${score.EMPLOYEE_SCORE }%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
				</p>
			</div>
			<br />
			<p>재직자평가</p>
		</div>
	</div>
	<div class="row">
		<h1 style="padding: 10px;">
			방문자 현황 <small> ${total.SUM }명</small>
		</h1>
	</div>
	<!-- 그래프 2개 -->
	<div class="row">
		<div class="col-md-4" align="center">
			<div class="graph01" id="boygirl" align="center"
				style="height: 300px; margin: 0 auto"></div>
				<h4>[방문자 구성비]</h4>
		</div>
		<div class="col-md-8" align="center">
			<div id="visit_chart" style="width: 100%; height: 300px"></div>
			<h4>[최근 1주일 간 방문횟수]</h4>
		</div>
	</div>
	<hr/>
</body>