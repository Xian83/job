<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#top {
	width: 100%;
	border-top: 5px solid #f4511e;
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
}

div.num_right {
	height: 80px;
	border-right: 2px solid #f4511e;
}

#scrap {
 	margin-left: 3em;
 	padding-top:0.7em;
 	padding-bottom:0.7em;
 	padding-left:1.5em;
 	padding-right:1.5em;
}

</style>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['구분', '조회율'],
          ['남자', ${rate.man }],
          ['여자', ${rate.woman }]
        ]);

        var options = {
          	'title': '해당 기업에 대한 남녀 관심도',
// 			'width' : 900,
// 			'height' : 500,
          	'backgroundColor' : 'transparent',
          	'pieSliceText' : 'label',
          	'legend' : 'none',
//           	'chartArea': {'left': 40}
        };

        var chart_div = document.getElementById('boygirl');
        var chart = new google.visualization.PieChart(chart_div);

     // Wait for the chart to finish drawing before calling the getImageURI() method.
        google.visualization.events.addListener(chart, 'ready', function () {
        	chart_div.innerHTML = '<img src="' + chart.getImageURI() + '">';
          console.log(chart_div.innerHTML);
        });
        
        chart.draw(data, options);
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
				<!-- 				<div align="right" id="top-follow"> -->
				<!-- 					<form action="/company/interest"> -->
				<%-- 						<input type="hidden" name="cmpn_nm" value="${salary.CMPN_NM }"> --%>
				<%-- 						<c:choose> --%>
				<%-- 							<c:when --%>
				<%-- 								test="${sessionScope.auth eq 'no' or sessionScope.auth eq null }"> --%>
				<%-- 							</c:when> --%>
				<%-- 							<c:otherwise> --%>
				<%-- 								<c:choose> --%>
				<%-- 									<c:when test="${scrape eq 0 }"> --%>
				<!-- 										<button class="btn btn-info" style="width: 120px">+follow</button> -->
				<%-- 									</c:when> --%>
				<%-- 									<c:otherwise> --%>
				<!-- 										<button class="btn btn-warning" style="width: 120px;">following</button> -->
				<%-- 									</c:otherwise> --%>
				<%-- 								</c:choose> --%>
				<%-- 							</c:otherwise> --%>
				<%-- 						</c:choose> --%>
				<!-- 					</form> -->
				<!-- 				</div> -->
			</div>
		</div>
	</div>

	<!-- 기본 수치 정보 위치 -->
	<div class="row" id="basic_info">
		<div class="num_left col-md-2">
			<h3>30억</h3>
			<p>매출액</p>
		</div>
		<div class="num_left col-md-2">
			<h3>2011명</h3>
			<p>사원수</p>
		</div>
		<div class="num_left col-md-2">
			<h3>3500만원</h3>
			<p>평균연봉</p>
		</div>
		<div class="num_left col-md-2">
			<h3>2500만원</h3>
			<p>신입연봉</p>
		</div>
		<div class="num_left col-md-2">
			<h3>89.1점</h3>
			<p>재무평가</p>
		</div>
		<div class="num_left num_right col-md-2">
			<h3>80.1점</h3>
			<p>재직자평가</p>
		</div>
	</div>
	<div class="row">
		<h1 style="padding:10px;">방문자 현황</h1>
	</div>
	<!-- 그래프 2개 -->
	<div class="row">
		<div class="col-md-5" align="center">
			<div class="thumbnail">
				<div class="graph01" id="boygirl" align="center"
					style="width: 550px; height: 400px; margin: 0 auto"></div>
				<div class="caption">
					<p>조회수 : ${total.SUM }명</p>
				</div>
			</div>
		</div>
		<div class="col-md-5" align="center">
			<div class="thumbnail">
				<img src="${chartURL}" class="graph01 img-responsive">
				<div class="caption">
					<p>조회수 : ${total.SUM }명</p>
				</div>
			</div>
		</div>
	</div>
</body>