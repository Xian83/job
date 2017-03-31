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
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdpNCYLer2YLqWD5YoIBaBqmD8SJm8b9k&callback=initMap"
	async defer></script>
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
        
      	//-----------------------------------------------------------------------------
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

        //-----------------------------------------------------------------------------
        //업계 연봉 비교
		var data3 = new google.visualization.arrayToDataTable([
				[ '구분', '${score.CMPN_NM}', '업계평균', '전체평균', ],
				[ '평균연봉', ${salary.AVG_SALARY}, ${industry.AVG}, ${allCompany.AVG} ],
				[ '신입연봉', ${salary.ROOKIE_SALARY}, ${industry.ROOKIE}, ${allCompany.ROOKIE} ]
				
		]);
		var chart_options3 = {
				title : '연봉비교',
				width : 500,
				height : 350,
				colors : [ 'blue', 'orange', 'red' ], // 항목 갯수에 맞게 컬러 설정
				bar : {
					groupWidth : '60%'
				}, // 그래프 너비 %
				isStacked : false,
				// 그래프 쌓기(스택), 기본값은 false
				backgroundColor: '#f1f8e9'
		};
		
		var chart3 = new google.visualization.ColumnChart(document.getElementById('salary_chart'));
		chart3.draw(data3, chart_options3);
		
    }
      
    //------------------------------------------------------------------------------
	// Google Map API
	function initMap() {
		// Create a map object and specify the DOM element for display.
		var map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : ${json.results[0].geometry.location.lat},
				lng : ${json.results[0].geometry.location.lng}
			},
			scrollwheel : true,
			zoom : 15
		});
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

	<!-- 방문자 현황 : 방문자 구성비 + 최근 1주일 방문횟수 변화 -->
	<div class="row">
		<h1 style="padding: 10px;">
			방문자 현황 <small> ${total.SUM }명</small>
		</h1>
	</div>
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
	<hr />

	<!-- 업계 동향 : 그래프 + 순위 -->
	<div class="row">
		<h1 style="padding: 10px;">
			동종 업계 <small> ${score.DIVISION } </small>
		</h1>
	</div>
	<div class="row">
		<div class="col-md-6" align="center">
			<h4>[ 평균연봉 비교 ]</h4>
			<div id="salary_chart" align="center"></div>
		</div>
		<div class="col-md-6" align="center">
			<h4>[ 동종업계 최상위 기업 ]</h4>
			<div>
				<table class="table table-hover" style="text-align: center;">
					<thead>
						<tr align="center" style="text-align: center;">
							<th colspan="1" style="text-align: center;">순위</th>
							<th colspan="2" style="text-align: center;">기업명</th>
							<th colspan="1" style="text-align: center;">점수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${info01.rank8}">
							<tr>
								<td>${i.rank }</td>
								<td colspan="2">${i.cmpn }</td>
								<td>${i.score }</td>
							</tr>
						</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<div class="row" align="center">
		<c:forEach var="i" begin="0" end="5">
			<div class="col-md-2" style="border-style: none;">
				<a href="/company/detail?cmpn_nm=${same[i].CMPN_NM }"> <img
					src="${same[i].LOGO }" alt="Lights" style="width: 82" height="82" /><br />
					${same[i].CMPN_NM }
				</a>
			</div>
		</c:forEach>
	</div>
	<hr />

	<!-- 사용자 리뷰 게시판 -->
	<div class="row">
		<div class="col-md-4">
			<h1>기업 리뷰</h1>
		</div>
		<div class="col-md-3">
			<h6>재무평가 ${score.FINANCE_SCORE }점</h6>
			<div
				style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/spare.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
				<p
					style="WIDTH: ${score.FINANCE_SCORE }%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
				</p>
			</div>
		</div>
		<div class="col-md-5">
			<h6>재직자평가 ${score.FINANCE_SCORE }점</h6>
			<div
				style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/spare.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
				<p
					style="WIDTH: ${score.EMPLOYEE_SCORE }%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
				</p>
			</div>
		</div>
	</div>
	<br/>
	<div class="row">
		<div class="col-md-4" align="center" style="width: 500">
			<img src="${chartURL}">
		</div>
		<div class="col-md-8">
			<div class="panel panel-default">
				<div class="panel-heading">리뷰</div>
				<c:forEach var="review" items="${review }">
					<div class="panel-body">${review.EMAIL }:${review.CONTENTS }</div>
				</c:forEach>
			</div>
			<form role="form" action="/review/push">
				<input type="hidden" name="cmpn_nm" value="${score.CMPN_NM }">
				<input type="text" id="aaa" name="content" placeholder="contents"
					style="width: 93%">
				<c:choose>
					<c:when
						test="${sessionScope.auth eq 'no' or sessionScope.auth eq null }">
						<button type="submit" class="btn btn-success disabled">올리기</button>
					</c:when>
					<c:otherwise>
						<button type="submit" class="btn btn-success">올리기</button>
					</c:otherwise>
				</c:choose>
			</form>
		</div>
	</div>
	<hr/>
	
	<!-- 근무환경 및 복리후생 -->
	<h1>근무환경 및 복리후생</h1>
	<div class="row">
		<div class="col-md-6" align="center">
			<p>
				<b>[회사위치]</b> ${info02.address }
			</p>
			<div id="map" style="width: 500; height: 500"></div>
		</div>
		<div class="col-md-6" align="center">
			<b>[회사제도]</b><br /> 
			${info02.system }<br /> 
			<b>[사내문화]</b><br />
			${info02.culture }<br />
		</div>
	</div>
</body>