<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lobster">
<style>
input[id=aaa] {
	width: 95%;
	padding: 10px 5px;
}

th {
	background: #FEF1E9;
}

.w3-myfont {
	font-family: "Comic Sans MS", cursive, sans-serif;
}
}
</style>
<div class="container-fluid"
	style="background: white-space; margin-left: 100px; margin-right: 100px">
	<%-- <c:set var="check" value="${fn:split(info02.num01, '��||����||��')}"></c:set>${check[0]}  �����,��������,������ ���ڷ� ��ȯ--%>

	<div class="row content">
		<div class="col-md-8">
			<div class="row content">
				<div class="col-sm-3 sidenav" align="center">
					<img src="${score.LOGO }" class="img-circle" alt="LOGO" width="150"
						height="150">
					<form action="/company/interest">
						<input type="hidden" name="cmpn_nm" value="${salary.CMPN_NM }">
						<c:choose>
							<c:when
								test="${sessionScope.auth eq 'no' or sessionScope.auth eq null }">
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${scrape eq 0 }">
										<button class="btn btn-primary ">���ɸ���߰�</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-primary " style="background: red;">���ɸ������</button>
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
								<th colspan="2" style="text-align: center;"><span
									style="font: italic;"><h2>${score.CMPN_NM }</h2></span></th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td>����� : ${score.DIVISION }</td>
								<td>������� : ${score.SCALE }</td>
							</tr>
					</table>


					<c:choose>
						<c:when test="${score.FINANCE_SCORE ==null}">
							<p>�繫���� : ${score.FINANCE_SCORE=0 }��(�ش�ȸ���� ������ �Էµ��� �ʾҽ��ϴ�.)</p>
						</c:when>
						<c:otherwise>
							<p>�繫���� : ${score.FINANCE_SCORE }��</p>
						</c:otherwise>
					</c:choose>
					<div
						style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/spare.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
						<p
							style="WIDTH: ${score.FINANCE_SCORE }%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
						</p>
					</div>


					<br />

					<c:choose>
						<c:when test="${score.EMPLOYEE_SCORE ==null}">
							<p>���������� : ${score.EMPLOYEE_SCORE=0 }��(�ش�ȸ���� ������ �Էµ��� �ʾҽ��ϴ�.)</p>
						</c:when>
						<c:otherwise>
							<p>���������� : ${score.EMPLOYEE_SCORE }��</p>
						</c:otherwise>
					</c:choose>
					<div
						style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/spare.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
						<p
							style="WIDTH: ${score.EMPLOYEE_SCORE }%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
						</p>
					</div>
				</div>
			</div>

		</div>

		<div class="col-md-4">


			<table class="table table-bordered" style="text-align: center;">
				<thead>
					<tr>
						<th style="text-align: center;">��տ���</th>
						<th style="text-align: center;">������տ���</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><fmt:formatNumber value="${salary.AVG_SALARY / 10000 }"
								groupingUsed="true" />����</td>
						<td><fmt:formatNumber value="${salary.ROOKIE_SALARY/ 10000 }"
								groupingUsed="true" />����</td>
					</tr>
			</table>
			<div align="center">
				<b>����� : ${info02.num04} </b><br />
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
						[ 'Year', '${score.CMPN_NM }' ,'��ü���','�����������'],
						[ '2013', ${info01.employee[0]},${info01.employee[3]}, ${info01.employee[6]}],
						[ '2014', ${info01.employee[1]},${info01.employee[4]}, ${info01.employee[7]} ],
						[ '2015', ${info01.employee[2]},${info01.employee[5]}, ${info01.employee[8]} ] 
				]);

				var options = {
					title : '����� ������',
					curveType : 'function',
					width : 400,	
					vAxis : {textPosition : 'none'},
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
	<div class="row content w3-myfont" align="center">
		<h2 style="font-family: monospace; color: #595959">�������� �α� �������</h2>
		<c:forEach var="i" begin="0" end="5">
			<div class="col-md-2" style="border-style: none;">
				<a href="/company/detail?cmpn_nm=${same[i].CMPN_NM }"> <img
					src="${same[i].LOGO }" alt="Lights" style="width: 50%" />
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
				<tr align="center" style="text-align: center;">
					<th colspan="1" rowspan="2"
						style="text-align: center; vertical-align: middle">�Ҽӻ����</th>
					<th colspan="3" style="text-align: center;">�������</th>
				<tr>
					<th colspan="1" style="text-align: center;">2013</th>
					<th colspan="1" style="text-align: center;">2014</th>
					<th colspan="1" style="text-align: center;">2015</th>
				</tr>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="1" rowspan="1"
						style="vertical-align: middle; text-align: center">${score.DIVISION }</td>
					<td colspan="1" rowspan="1"
						style="vertical-align: middle; text-align: center">${info01.scale[0] }</td>
					<td colspan="1" rowspan="1"
						style="vertical-align: middle; text-align: center">${info01.scale[1] }</td>
					<td colspan="1" rowspan="1"
						style="vertical-align: middle; text-align: center">${info01.scale[2] }</td>
				</tr>
		</table>
	</div>

	<div class="row content">
		<br />
		<div class="panel panel-default">
			<div class="panel-heading">����</div>
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
					<button type="submit" class="btn btn-success disabled">�ø���</button>
				</c:when>
				<c:otherwise>
					<button type="submit" class="btn btn-success">�ø���</button>
				</c:otherwise>
			</c:choose>
		</form>
	</div>

	<div class="row content" align="center">
		<h2 style="font-family: monospace; color: #595959">������� ��</h2>
		<hr />
		<div class="col-md-7">
			<script>
				google.charts.load('current', {
					packages : [ 'corechart' ]
				});
			</script>

			<div id="chart_div" align="left"></div>


			<script type="text/javascript">
				// �ε� �Ϸ�� �Լ� �����Ͽ� ��Ʈ ����
				google.charts.setOnLoadCallback(drawChart);

				var chart_options = {
					title : '������',
					width : 600,
					height : 400,
					colors : [ 'blue', 'orange', 'red' ], // �׸� ������ �°� �÷� ����
					bar : {
						groupWidth : '60%'
					}, // �׷��� �ʺ� %
					isStacked : false,
				// �׷��� �ױ�(����), �⺻���� false
					backgroundColor: '#f1f8e9'
					
				};

				function drawChart() {

					// ��Ʈ ������
					var data = new google.visualization.arrayToDataTable([
							[ '����', '${score.CMPN_NM}', '�������', '��ü���', ],
							[ '��տ���', ${salary.AVG_SALARY}, ${industry.AVG}, ${allCompany.AVG} ],
							[ '���Կ���', ${salary.ROOKIE_SALARY}, ${industry.ROOKIE}, ${allCompany.ROOKIE} ]
							
					]);

					var chart = new google.visualization.ColumnChart(document
							.getElementById('chart_div'));
					chart.draw(data, chart_options);
				}
			</script>
		</div>

		<div class="col-md-5">


			<table class="table table-bordered" style="text-align: center;">
				<thead>
					<tr align="center" style="text-align: center;">
						<th colspan="1" style="text-align: center;">����</th>
						<th colspan="1" style="text-align: center;">����</th>
						<th colspan="2" style="text-align: center;">�����</th>
						<th colspan="1" style="text-align: center;">����</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="1" rowspan="9" style="vertical-align: middle;">�������
							�ֻ���</td>
					</tr>
					<c:forEach var="i" items="${info01.rank8}">
						<tr>
							<td>${i.rank }</td>
							<td colspan="2">${i.cmpn }</td>
							<td>${i.score }</td>
						</tr>
					</c:forEach>
			</table>
			<!-- 		<script type="text/javascript">
				google.charts.load("current", {
					packages : [ "corechart" ]
				});
				google.charts.setOnLoadCallback(drawChart);
				function drawChart() {
					var data = google.visualization.arrayToDataTable([
							[ "Element", "Density", {
								role : "style"
							} ], [ "�����", 60, "#b87333" ],
							[ "��������", 30, "silver" ], [ "������", 50, "gold" ],

					]);

					var view = new google.visualization.DataView(data);
					view.setColumns([ 0, 1, {
						calc : "stringify",
						sourceColumn : 1,
						type : "string",
						role : "annotation"
					}, 2 ]);

					var options = {
						title : "${score.CMPN_NM} ����",
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
		<div id="barchart_values" style="width: 500px; height: 300px;"
			align="left"></div>
	</div> -->
		</div>
	</div>
	<div class="row content">
		<div class="col-md-6" align="center"><h2 style="font-family: monospace; color: #595959">���ɵ�</h2>
		
			<b>�� ȸ�縦 Ŭ�� �� Ƚ�� : ${rate.visi}</b>
		<div id="boygirl" style="width: 700px; height: 500px;"></div>
		<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
		function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Pizza');
      data.addColumn('number', 'Populartiy');
      data.addRows([
        ['����', ${rate.man }],
        ['����', ${rate.woman }],

      ]);

      var options = {
        title: '��/�� ����',
        sliceVisibilityThreshold: .2
      };

      var chart = new google.visualization.PieChart(document.getElementById('boygirl'));
      chart.draw(data, options);
    }
		</script>
		</div>
		<div class="col-md-6" align="center">
			<h2 style="font-family: monospace; color: #595959">����</h2>
			<hr />
			<table class="table table-bordered" style="text-align: center;">
				<thead>
					<tr align="center" style="text-align: center;">
						<th colspan="1" style="text-align: center;">����</th>
						<th colspan="1" style="text-align: center;">�����</th>
						<th colspan="1" style="text-align: center;">��������</th>
						<th colspan="1" style="text-align: center;">������</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="1" rowspan="8" style="vertical-align: middle;">���ͺ�</td>
					</tr>

					<td>${info02.num01}</td>
					<td colspan="1">${info02.num02}</td>
					<td>${info02.num03}</td>
			</table>
			<hr />
			<div class="row content" align="center">
				<h2 style="font-family: monospace; color: #595959">����� ������</h2>
				<hr />
				<div class="col-md-12">
					<table class="table table-bordered">

						<thead>
							<tr align="center" style="text-align: center;">
								<th colspan="1" style="text-align: center;">����</th>
								<th colspan="1" style="text-align: center;">2013</th>
								<th colspan="1" style="text-align: center;">2014</th>
								<th colspan="1" style="text-align: center;">2015</th>
							</tr>
						</thead>
						<tbody>
							<tr style="height: 30px">
								<td colspan="1" rowspan="1"
									style="vertical-align: middle; text-align: center">${ salary.CMPN_NM }</td>
								<td colspan="1" rowspan="1"
									style="vertical-align: middle; text-align: center">${info01.employee[0]}</td>
								<td colspan="1" rowspan="1"
									style="vertical-align: middle; text-align: center">${info01.employee[1]}</td>
								<td colspan="1" rowspan="1"
									style="vertical-align: middle; text-align: center">${info01.employee[2]}</td>
							</tr>
							<tr style="height: 30px">
								<td colspan="1" rowspan="1"
									style="vertical-align: middle; text-align: center">��ü���</td>
								<td colspan="1" rowspan="1"
									style="vertical-align: middle; text-align: center">${info01.employee[3]}</td>
								<td colspan="1" rowspan="1"
									style="vertical-align: middle; text-align: center">${info01.employee[4]}</td>
								<td colspan="1" rowspan="1"
									style="vertical-align: middle; text-align: center">${info01.employee[5]}</td>
							</tr>
							<tr style="height: 30px">
								<td colspan="1" rowspan="1"
									style="vertical-align: middle; text-align: center">�������</td>
								<td colspan="1" rowspan="1"
									style="vertical-align: middle; text-align: center">${info01.employee[6]}</td>
								<td colspan="1" rowspan="1"
									style="vertical-align: middle; text-align: center">${info01.employee[7]}</td>
								<td colspan="1" rowspan="1"
									style="vertical-align: middle; text-align: center">${info01.employee[8]}</td>
							</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<hr />
	<div class="row content">

		<h2 style="font-family: monospace; color: #595959">�ٹ� ȯ�� �� �����Ļ�</h2>
		<div class="col-md-6">
			<b>[ȸ����ġ]</b> ${info02.address }<br />

			<div id="map" style="width: 500; height: 500"></div>
		</div>
		<div class="col-md-6" align="center">
			<b>[�ٹ�ȯ��]</b><br /> <br /> <img src="${chartURL}"
				style="border-style:">
		</div>
	</div>
	<div class="row content">
		<b>[ȸ������]</b><br /> ${info02.system }<br /> <b>[�系��ȭ]</b><br />
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
<!-- �� ������ �׽�Ʈ�� ���� -->
<hr />
