<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
input[id=aaa] {
	width: 95%;
	padding: 10px 5px;
}
th{
	background: #FEF1E9;
}

</style>
<div class="container-fluid" style="background: white-space; margin-left: 100px ; margin-right: 100px">
	<div class="row content" >
		<div class="col-md-8">
			<div class="row content">
				<div class="col-sm-3 sidenav" align="center">
					<img src="${score.LOGO }" class="img-circle" alt="LOGO"
						width="150" height="150">
					<form action="/company/interest">
						<input type="hidden" name="cmpn_nm" value="${salary.CMPN_NM }">
						<c:choose>
							<c:when
								test="${sessionScope.auth eq 'no' or sessionScope.auth eq null }">
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${scrape eq 0 }">
										<button class="btn btn-primary ">관심목록추가</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-primary " style="background: red;">관심목록해제</button>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>

					</form>
				</div>
				<div class="col-sm-9 sidenav">
					<table class="table table-bordered" align="center"
						style="text-align: center;">
						<thead>
							<tr>
								<th colspan="2" style="text-align: center;"><h3>${score.CMPN_NM }

									</h3></th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td>산업군 : ${score.DIVISION }</td>
								<td>기업구분 : ${score.SCALE }</td>
							</tr>
					</table>
					<p>
						재무점수 : ${score.FINANCE_SCORE }
						<c:forEach var="i" begin="0" end="${score.FINANCE_SCORE/20 }">
							<img
								src="http://cfile24.uf.tistory.com/image/2419AD4652FC36A7345270"
								class="img-circle" alt="Cinque Terre" width="50" height="50">
						</c:forEach>
					</p>
					<br />
					<p>
						재직자점수 : ${score.SLAVE_SCORE }
						<c:forEach var="i" begin="0" end="${score.SLAVE_SCORE/20}">
							<img
								src="http://cfile24.uf.tistory.com/image/2419AD4652FC36A7345270"
								class="img-circle" alt="Cinque Terre" width="50" height="50">
						</c:forEach>
					</p>
				</div>

			</div>
		</div>
		<div class="col-md-4">


			<table class="table table-bordered" style="text-align: center;">
				<thead>
					<tr>
						<th style="text-align: center;">평균연봉</th>
						<th style="text-align: center;">신입평균연봉</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><fmt:formatNumber value="${salary.AVG_SALARY }" groupingUsed="true"/>원</td>
						<td><fmt:formatNumber value="${salary.ROOKIE_SALARY }" groupingUsed="true"/>원</td>
					</tr>
			</table>
			<div align="center">
				<b>사원수 : ${info02.num04} </b><br />
				<div id="curve_chart" style="width: 500px; height: 150px"
					align="left"></div>
			</div>

		</div>


		<script type="text/javascript">
			google.charts.load('current', {
				'packages' : [ 'corechart' ]
			});
			google.charts.setOnLoadCallback(drawChart);

			function drawChart() {
				var data = google.visualization.arrayToDataTable([
						[ 'Year', '${score.CMPN_NM }' ],
						[ '2013', 1000 ],
						[ '2014', 1170 ],
						[ '2015', 2000 ] 
				]);

				var options = {
					title : '사원수 증가율',
					curveType : 'function',
					width : 400,				
					legend : {
						position : 'bottom'
					}
				};

				var chart = new google.visualization.LineChart(document
						.getElementById('curve_chart'));

				chart.draw(data, options);
			}
		</script>

	</div>
	<hr />
	<div class="row content" align="center" >
		<p style="font-size: 20; line-height: 1.5; color: blue;">동종업계 인기
			많은기업</p>
		<c:forEach var="i" begin="0" end="5">
			<div class="col-md-2" style="border-style: solid;">
				<a href="/company/detail?cmpn_nm=${same[i].CMPN_NM }"> 
				<img src="${same[i].LOGO }" alt="Lights" style="width: 50%"/>
					<div class="caption">
						<p>${same[i].CMPN_NM }</p>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>
	<hr />
	<div class="row content" align="center">
	<table class="table table-bordered">
				
				<thead>
					<tr align="center" style="text-align: center; ">
						<th colspan="1" rowspan="2" style="text-align: center; vertical-align: middle">소속산업명</th>
						<th colspan="3" style="text-align: center;">산업순위</th>
						<tr>
						<th colspan="1" style="text-align: center;">2013</th>
						<th colspan="1" style="text-align: center;">2014</th>
						<th colspan="1" style="text-align: center;">2015</th>
						</tr>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${score.DIVISION }</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.scale[0] }</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.scale[1] }</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.scale[2] }</td>
					</tr>
			</table>
	</div>
	
	<div class="row content">
		<br />
		<div class="panel panel-default">
			<div class="panel-heading">리뷰</div>
			<c:forEach var="review" items="${review }">
				<div class="panel-body">${review.EMAIL }:${review.CONTENTS }</div>
			</c:forEach>
		</div>
		<form role="form" action="/review/push">
			<input type="hidden" name="cmpn_nm" value="${score.CMPN_NM }">
			<input type="text" id="aaa" name="content" placeholder="contents" style="width: 93%">
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

	<div class="row content" align="center">
		<div class="col-md-6">
			<script>
				google.charts.load('current', {
					packages : [ 'corechart' ]
				});
			</script>

			<div id="chart_div" align="left"></div>


			<script type="text/javascript">
				// 로딩 완료시 함수 실행하여 차트 생성
				google.charts.setOnLoadCallback(drawChart);

				var chart_options = {
					title : '연봉비교',
					width : 600,
					height : 400,
					colors : [ 'red', 'blue', 'green' ], // 항목 갯수에 맞게 컬러 설정
					bar : {
						groupWidth : '60%'
					}, // 그래프 너비 %
					isStacked : false,
				// 그래프 쌓기(스택), 기본값은 false
					backgroundColor: '#f1f8e9'
					
				};

				function drawChart() {

					// 차트 데이터
					var data = new google.visualization.arrayToDataTable([
							[ '구분', '회사이름', '업계평균', '전체평균', ],
							[ '평균연봉', ${salary.AVG_SALARY}, ${industry.AVG}, ${allCompany.AVG} ],
							[ '신입연봉', ${salary.ROOKIE_SALARY}, ${industry.ROOKIE}, ${allCompany.ROOKIE} ]
							
					]);

					var chart = new google.visualization.ColumnChart(document
							.getElementById('chart_div'));
					chart.draw(data, chart_options);
				}
			</script>
		</div>
		
		<div class="col-md-6">
			<script type="text/javascript">
				google.charts.load("current", {
					packages : [ "corechart" ]
				});
				google.charts.setOnLoadCallback(drawChart);
				function drawChart() {
					var data = google.visualization.arrayToDataTable([
							[ "Element", "Density", {
								role : "style"
							} ], [ "매출액", 100, "#b87333" ],
							[ "영업이익", 90, "silver" ], [ "당기손익", 75.5, "gold" ],

					]);

					var view = new google.visualization.DataView(data);
					view.setColumns([ 0, 1, {
						calc : "stringify",
						sourceColumn : 1,
						type : "string",
						role : "annotation"
					}, 2 ]);

					var options = {
						title : "회사 ㅇㅇ , 단위(만원)",
						width : 500,
						height : 400,
						bar : {
							groupWidth : "70%"
						},
						legend : {
							position : "none"
						},
						backgroundColor: '#f1f8e9'
					};
					var chart = new google.visualization.BarChart(document
							.getElementById("barchart_values"));
					chart.draw(view, options);
				}
			</script>
			<div id="barchart_values" style="width: 500px; height: 300px;" align="left"></div>
		</div>
	</div>

	<div class="row content">
		<div class="col-md-6">
			<p style="font-size: 20; line-height: 1.5; color: blue;">동종산업 기업
				순위</p>
			<hr />
			<table class="table table-bordered" style="text-align: center;">
				<thead>
					<tr align="center" style="text-align: center;">
						<th colspan="1" style="text-align: center;">구분</th>
						<th colspan="1" style="text-align: center;">순위</th>
						<th colspan="2" style="text-align: center;">기업명</th>
						<th colspan="1" style="text-align: center;">점수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="1" rowspan="9" style="vertical-align: middle;">동종산업
							최상위
						</td>
					</tr>
					<c:forEach var="i" items="${info01.rank8}">
					<tr>
							<td>${i.rank }</td>
							<td colspan="2">${i.cmpn }</td>
							<td>${i.score }</td>
					</tr>
					</c:forEach>
			</table>
		</div>
		<div class="col-md-6" align="center">
			<p style="font-size: 20; line-height: 1.5; color: blue;">수익</p>
			<hr />
			<table class="table table-bordered" style="text-align: center;">
				<thead>
					<tr align="center" style="text-align: center;">
						<th colspan="1" style="text-align: center;">구분</th>
						<th colspan="1" style="text-align: center;">매출액</th>
						<th colspan="1" style="text-align: center;">영업이익</th>
						<th colspan="1" style="text-align: center;">당기손익</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="1" rowspan="8" style="vertical-align: middle;">수익비교</td>
					</tr>
					
							<td>${info02.num01}</td>
							<td colspan="1">${info02.num02}</td>
							<td>${info02.num03}</td>
				
			</table>
			<hr />
			<div class="row content" align="center">
		<p style="font-size: 20; line-height: 1.5; color: blue;">사원수 증가율
				</p>
		<hr />
		<div class="col-md-12">
			<table class="table table-bordered">
				
				<thead>
					<tr align="center" style="text-align: center;">
						<th colspan="1" style="text-align: center;">구분</th>
						<th colspan="1" style="text-align: center;">2013</th>
						<th colspan="1" style="text-align: center;">2014</th>
						<th colspan="1" style="text-align: center;">2015</th>
					</tr>
				</thead>
				<tbody>
					<tr style="height: 30px">
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${ salary.CMPN_NM }</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[0]}</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[1]}</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[2]}</td>
					</tr>
							<tr style="height: 30px">
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">평균</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[3]}</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[4]}</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[5]}</td>
					</tr>
							<tr style="height: 30px">
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">업계평균</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[6]}</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[7]}</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[8]}</td>
					</tr>
			</table>
		</div>
		</div>
	</div>
	</div>
		
<hr/>
		<div class="row content">
			<p style="font-size: 20; line-height: 1.5; color: blue;">근무환경 및
				복리후생</p>
		
			<b>[회사위치]</b>  ${info02.address }<br />
			<div id="map" style="width: 500; height: 500"></div>
			<b>[회사제도]</b><br/>
			${info02.system }<br /> 
			<b>[사내문화]</b><br/>
			${info02.culture }<br />
		</div>

</div>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdpNCYLer2YLqWD5YoIBaBqmD8SJm8b9k&callback=initMap"
	async defer></script>
<script>
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
<!-- 상세 데이터 테스트용 영역 -->
<hr/>
<div>
	<!-- 매출액, 영업이익, 당기손익은 단위 표기가 붙어서 찍힘-->
	<!-- 차트 표기하려면 수정작업 필요 --> 
	매출액 : ${info02.num01} / 영업이익 : ${info02.num02 } / 당기손익 : ${info02.num03 }
</div>