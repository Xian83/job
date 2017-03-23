<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
input[id=aaa] {
	width: 95%;
	padding: 10px 5px;
}
</style>
<div class="container-fluid">
	<div class="row content">
		<div class="col-md-8">

			<h4 align="center">${salary[0].CMPN_NM }</h4>
			<div class="row content">
				<div class="col-sm-3 sidenav">
					<img src="${score[0].LOGO }" class="img-circle" alt="Cinque Terre"
						width="200" height="200">
				</div>
				<div class="col-sm-9 sidenav">
					<table class="table table-bordered" align="center">
						<thead>
							<tr>
								<th colspan="2">${salary[0].CMPN_NM }</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>산업군 : ${score[0].DIVISION }</td>
								<td>기업구분 : ${score[0].SCALE }</td>
							</tr>
					</table>
					<p>
						재무점수 : ${score[0].FINANCE_SCORE }
						<c:forEach var="i" begin="0" end="${score[0].FINANCE_SCORE/20 }">
							<img
								src="http://cfile24.uf.tistory.com/image/2419AD4652FC36A7345270"
								class="img-circle" alt="Cinque Terre" width="50" height="50">
						</c:forEach>
					</p>
					<br />
					<p>
						재직자점수 : ${score[0].SLAVE_SCORE }
						<c:forEach var="i" begin="0" end="${score[0].SLAVE_SCORE/20}">
							<img
								src="http://cfile24.uf.tistory.com/image/2419AD4652FC36A7345270"
								class="img-circle" alt="Cinque Terre" width="50" height="50">
						</c:forEach>
					</p>
				</div>

			</div>
		</div>
		<div class="col-md-4">

			<h2>I Love Money</h2>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>평균연봉</th>
						<th>신입평균연봉</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${salary[0].AVG_SALARY }원</td>
						<td>${salary[0].ROOKEY_SALARY }원</td>
					</tr>
			</table>
			<div class="col-md-8">사원수 : 999999999명</div>
			<div class="col-md-4">
				<form action="/company/interest">
					<input type="hidden" name="cmpn_nm" value="${salary[0].CMPN_NM }">
					<c:choose>
						<c:when
							test="${sessionScope.auth eq 'no' or sessionScope.auth eq null }">
							<button class="btn btn-primary disabled">관심목록추가</button>
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
		</div>
	</div>

	<div class="row content" align="center">
		<p style="font-size: 20; line-height: 1.5; color: blue;">동종업계 인기
			많은기업</p>
		<c:forEach var="i" begin="0" end="5">
			<div class="col-md-2">
				<a href="/company/detail?cmpn_nm=${same[i].CMPN_NM }"> <img
					src="${same[i].LOGO }" alt="Lights" style="width: 100%">
					<div class="caption">
						<p>${same[i].CMPN_NM }</p>
					</div>
				</a>
			</div>
		</c:forEach>
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
			<input type="hidden" name="cmpn_nm" value="${salary[0].CMPN_NM }">
			<input type="text" id="aaa" name="content" placeholder="contents">
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
			<script type="text/javascript"
				src="https://www.gstatic.com/charts/loader.js"></script>
			<script>
				google.charts.load('current', {
					packages : [ 'corechart' ]
				});
			</script>

			<div id="chart_div"></div>



			<script type="text/javascript">
				// 로딩 완료시 함수 실행하여 차트 생성
				google.charts.setOnLoadCallback(drawChart);

				var chart_options = {
					title : '연봉비교',
					width : 1000,
					height : 400,
					colors : [ 'red', 'blue', 'green' ], // 항목 갯수에 맞게 컬러 설정
					bar : {
						groupWidth : '60%'
					}, // 그래프 너비 %
					isStacked : false
				// 그래프 쌓기(스택), 기본값은 false
				};

				function drawChart() {

					// 차트 데이터
					var data = new google.visualization.arrayToDataTable([
							[ '년대', '회사이름', '업계평균', '전체평균', ],
							[ '연봉', 2, 3, 4 ], [ '신입연봉', 6, 4, 3 ],
							[ '매출', 5, 4, 3 ] ]);

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
						width : 600,
						height : 400,
						bar : {
							groupWidth : "70%"
						},
						legend : {
							position : "none"
						},
					};
					var chart = new google.visualization.BarChart(document
							.getElementById("barchart_values"));
					chart.draw(view, options);
				}
			</script>
			<div id="barchart_values" style="width: 900px; height: 300px;"></div>
		</div>
	</div>

	<div class="row content">
		<div class="col-md-6">
			<p style="font-size: 20; line-height: 1.5; color: blue;">동종산업 기업
				순위</p>
			<hr />
			<table class="table table-bordered" align="center">
				<thead>
					<tr align="center">
						<th colspan="1">구분</th>
						<th colspan="1">순위</th>
						<th colspan="2">기업명</th>
						<th colspan="1">점수</th>
					</tr>
				</thead>
				<tbody>		
				<tr>
						<td colspan="1" rowspan="8" align="center">동종산업 최상위</td>	
						<tr>		
						<c:forEach begin="1" end="7">
							<td>1</td>
							<td colspan="2">삼성전자</td>
							<td>89.9</td>
						</tr>
						</c:forEach>
					</tr>
			</table>
		</div>
	</div>

	<div class="row content">
		<p style="font-size: 20; line-height: 1.5; color: blue;">근무환경 및
			복리후생</p>
		<hr />
		회사위치 / <br /> 회사제도 /<br /> 사내문화 /<br />

	</div>

</div>
