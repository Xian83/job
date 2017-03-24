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
			<div class="row content">
				<div class="col-sm-3 sidenav" align="center">
					<img src="${score[0].LOGO }" class="img-circle" alt="LOGO"
						width="200" height="200">
					<form action="/company/interest">
						<input type="hidden" name="cmpn_nm" value="${salary[0].CMPN_NM }">
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
								<th colspan="2" style="text-align: center;"><h3>${score[0].CMPN_NM }

									</h3></th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td>����� : ${score[0].DIVISION }</td>
								<td>������� : ${score[0].SCALE }</td>
							</tr>
					</table>
					<p>
						�繫���� : ${score[0].FINANCE_SCORE }
						<c:forEach var="i" begin="0" end="${score[0].FINANCE_SCORE/20 }">
							<img
								src="http://cfile24.uf.tistory.com/image/2419AD4652FC36A7345270"
								class="img-circle" alt="Cinque Terre" width="50" height="50">
						</c:forEach>
					</p>
					<br />
					<p>
						���������� : ${score[0].SLAVE_SCORE }
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


			<table class="table table-bordered" style="text-align: center;">
				<thead>
					<tr>
						<th style="text-align: center;">��տ���</th>
						<th style="text-align: center;">������տ���</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${salary[0].AVG_SALARY }��</td>
						<td>${salary[0].ROOKEY_SALARY }��</td>
					</tr>
			</table>
			<div align="center">
				����� : 999999999�� <br />
				<div id="curve_chart" style="width: 500px; height: 150px"
					align="center"></div>
			</div>

		</div>


		<script type="text/javascript">
			google.charts.load('current', {
				'packages' : [ 'corechart' ]
			});
			google.charts.setOnLoadCallback(drawChart);

			function drawChart() {
				var data = google.visualization.arrayToDataTable([
						[ 'Year', '${score[0].CMPN_NM }' ], [ '2013', 1000 ],
						[ '2014', 1170 ], [ '2015', 2000 ] ]);

				var options = {
					title : '����� ������',
					curveType : 'function',
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
	<div class="row content" align="center">
		<p style="font-size: 20; line-height: 1.5; color: blue;">�������� �α�
			�������</p>
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
	<hr />
	<div class="row content">


		<br />
		<div class="panel panel-default">
			<div class="panel-heading">����</div>
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
					<button type="submit" class="btn btn-success disabled">�ø���</button>
				</c:when>
				<c:otherwise>
					<button type="submit" class="btn btn-success">�ø���</button>
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

			<div id="chart_div"></div>



			<script type="text/javascript">
				// �ε� �Ϸ�� �Լ� �����Ͽ� ��Ʈ ����
				google.charts.setOnLoadCallback(drawChart);

				var chart_options = {
					title : '������',
					width : 1000,
					height : 400,
					colors : [ 'red', 'blue', 'green' ], // �׸� ������ �°� �÷� ����
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
							[ '���', 'ȸ���̸�', '�������', '��ü���', ],
							[ '����', 2, 3, 4 ], [ '���Կ���', 6, 4, 3 ] ]);

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
							} ], [ "�����", 100, "#b87333" ],
							[ "��������", 90, "silver" ], [ "������", 75.5, "gold" ],

					]);

					var view = new google.visualization.DataView(data);
					view.setColumns([ 0, 1, {
						calc : "stringify",
						sourceColumn : 1,
						type : "string",
						role : "annotation"
					}, 2 ]);

					var options = {
						title : "ȸ�� ���� , ����(����)",
						width : 600,
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
			<div id="barchart_values" style="width: 900px; height: 300px;"></div>
		</div>
	</div>

	<div class="row content">
		<div class="col-md-6">
			<p style="font-size: 20; line-height: 1.5; color: blue;">������� ���
				����</p>
			<hr />
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
						<td colspan="1" rowspan="8" style="vertical-align: middle;">�������
							�ֻ���</td>
					<tr>
						<c:forEach begin="1" end="7">
							<td>1</td>
							<td colspan="2">�Ｚ����</td>
							<td>89.9</td>
					</tr>
					</c:forEach>
					</tr>
			</table>
		</div>
		<div class="col-md-6">
			<p style="font-size: 20; line-height: 1.5; color: blue;">���⿡ ��������</p>
			<hr />
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
						<td colspan="1" rowspan="8" style="vertical-align: middle;">�������
							���� ����</td>
					<tr>
						<c:forEach begin="1" end="7">
							<td>1</td>
							<td colspan="2">����</td>
							<td>9��9õ��</td>
					</tr>
					</c:forEach>
					</tr>
			</table>
			<hr />
		</div>
	</div>
	<div class="row content">
		<h4>����� ������</h4>
		<hr />
		<div class="col-md-6">
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
					<tr>
						<td colspan="1" rowspan="1" style="vertical-align: middle">${ salary[0].CMPN_NM }</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle">0</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle">1</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle">2</td>
					</tr>
			</table>
		</div>
		<div class="col-md-6" id="pepole" ></div>
				<script type="text/javascript">
				google.charts.load('current', {packages: ['corechart', 'line']});
				google.charts.setOnLoadCallback(drawBackgroundColor);

				function drawBackgroundColor() {
				      var data = new google.visualization.DataTable();
				      data.addColumn('number', 'X');
				      data.addColumn('number', '${score[0].CMPN_NM}');
				      data.addColumn('number', '�������');
				      data.addColumn('number', '���');

				      data.addRows([
				        [0, 0,0,0],   [2013, 10,20,30],  [2014, 23,30,40], [2015, 23,40,60,10] 
				      ]);

				      var options = {
				        hAxis: {
				          title: 'Time'
				        },
				        vAxis: {
				          title: 'Popularity'
				        },
				        backgroundColor: '#f1f8e9',
				        width: 900,
				        height: 200
				     
				      };

				      var chart = new google.visualization.LineChart(document.getElementById('pepole'));
				      chart.draw(data, options);
				    }
				
				</script>
		
</div>





		<div class="row content">
			<p style="font-size: 20; line-height: 1.5; color: blue;">�ٹ�ȯ�� ��
				�����Ļ�</p>
			<hr />
			ȸ����ġ / <br /> ȸ������ /<br /> �系��ȭ /<br />

		</div>

	</div>