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
<div class="container-fluid" style="background: #F0FFF0; margin-left: 100px ; margin-right: 100px">
	<div class="row content" >
		<div class="col-md-8">
			<div class="row content">
				<div class="col-sm-3 sidenav" align="center">
					<img src="${score.LOGO }" class="img-circle" alt="LOGO"
						width="200" height="200">
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
								<th colspan="2" style="text-align: center;"><h3>${score.CMPN_NM }

									</h3></th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td>����� : ${score.DIVISION }</td>
								<td>������� : ${score.SCALE }</td>
							</tr>
					</table>
					<p>
						�繫���� : ${score.FINANCE_SCORE }
						<c:forEach var="i" begin="0" end="${score.FINANCE_SCORE/20 }">
							<img
								src="http://cfile24.uf.tistory.com/image/2419AD4652FC36A7345270"
								class="img-circle" alt="Cinque Terre" width="50" height="50">
						</c:forEach>
					</p>
					<br />
					<p>
						���������� : ${score.SLAVE_SCORE }
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
						<th style="text-align: center;">��տ���</th>
						<th style="text-align: center;">������տ���</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${salary.AVG_SALARY }��</td>
						<td>${salary.ROOKIE_SALARY }��</td>
					</tr>
			</table>
			<div align="center">
				����� : ${info02.num04} <br />
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
						[ 'Year', '${score[0].CMPN_NM }' ],
						[ '2013', 1000 ],
						[ '2014', 1170 ],
						[ '2015', 2000 ] 
				]);

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
	<div class="row content" align="center" >
		<p style="font-size: 20; line-height: 1.5; color: blue;">�������� �α�
			�������</p>
		<c:forEach var="i" begin="0" end="5">
			<div class="col-md-2" style="border-style: solid;">
				<a href="/company/detail?cmpn_nm=${same[i].CMPN_NM }"> 
				<img src="${same[i].LOGO }" alt="Lights" style="width: 100%"/>
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
						<th colspan="1" rowspan="2" style="text-align: center; vertical-align: middle">�Ҽӻ����</th>
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
			<div class="panel-heading">����</div>
			<c:forEach var="review" items="${review }">
				<div class="panel-body">${review.EMAIL }:${review.CONTENTS }</div>
			</c:forEach>
		</div>
		<form role="form" action="/review/push">
			<input type="hidden" name="cmpn_nm" value="${score.CMPN_NM }">
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
							[ '����', 'ȸ���̸�', '�������', '��ü���', ],
							[ '��տ���', ${salary.AVG_SALARY}, ${industry.AVG}, ${allCompany.AVG} ],
							[ '���Կ���', ${salary.ROOKIE_SALARY}, ${industry.ROOKIE}, ${allCompany.ROOKIE} ]
							
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
						<td colspan="1" rowspan="9" style="vertical-align: middle;">�������
							�ֻ���
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
					</tr>
					<c:forEach begin="1" end="7">
					<tr>
							<td>1</td>
							<td colspan="2">����</td>
							<td>9��9õ��</td>
					</tr>
					</c:forEach>
			</table>
			<hr />
		</div>
	</div>
	<div class="row content">
		<p style="font-size: 20; line-height: 1.5; color: blue;">����� ������
				</p>
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
					<tr style="height: 30px">
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${ salary[0].CMPN_NM }</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[0]}</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[1]}</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[2]}</td>
					</tr>
							<tr style="height: 30px">
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">���</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[3]}</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[4]}</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[5]}</td>
					</tr>
							<tr style="height: 30px">
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">�������</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[6]}</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[7]}</td>
						<td colspan="1" rowspan="1" style="vertical-align: middle; text-align: center">${info01.employee[8]}</td>
					</tr>
			</table>
		</div>
		<div class="col-md-6" id="pepole" style="height: 200"></div>
			
		
</div>

		<div class="row content">
			<p style="font-size: 20; line-height: 1.5; color: blue;">�ٹ�ȯ�� ��
				�����Ļ�</p>
			<hr />
			<b>[ȸ����ġ]</b>  ${info02.address }<br /> 
			<b>[ȸ������]</b><br/>
			${info02.system }<br /> 
			<b>[�系��ȭ]</b><br/>
			${info02.culture }<br />
		</div>

</div>

<!-- �� ������ �׽�Ʈ�� ���� -->
<hr/>
<div>
	<!-- �����, ��������, �������� ���� ǥ�Ⱑ �پ ����-->
	<!-- ��Ʈ ǥ���Ϸ��� �����۾� �ʿ� --> 
	����� : ${info02.num01} / �������� : ${info02.num02 } / ������ : ${info02.num03 }
</div>