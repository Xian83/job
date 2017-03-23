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

			<h2>I Love Money</h2>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>��տ���</th>
						<th>������տ���</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${salary[0].AVG_SALARY }��</td>
						<td>${salary[0].ROOKEY_SALARY }��</td>
					</tr>
			</table>
			<div class="col-md-8">����� : 999999999��</div>
			<div class="col-md-4">
				<form action="/company/interest">
					<input type="hidden" name="cmpn_nm" value="${salary[0].CMPN_NM }">
					<c:choose>
						<c:when
							test="${sessionScope.auth eq 'no' or sessionScope.auth eq null }">
							<button class="btn btn-primary disabled">���ɸ���߰�</button>
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
		</div>
	</div>

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
			<script type="text/javascript"
				src="https://www.gstatic.com/charts/loader.js"></script>
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
					isStacked : false
				// �׷��� �ױ�(����), �⺻���� false
				};

				function drawChart() {

					// ��Ʈ ������
					var data = new google.visualization.arrayToDataTable([
							[ '���', 'ȸ���̸�', '�������', '��ü���', ],
							[ '����', 2, 3, 4 ], [ '���Կ���', 6, 4, 3 ],
							[ '����', 5, 4, 3 ] ]);

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
			<table class="table table-bordered" align="center">
				<thead>
					<tr align="center">
						<th colspan="1">����</th>
						<th colspan="1">����</th>
						<th colspan="2">�����</th>
						<th colspan="1">����</th>
					</tr>
				</thead>
				<tbody>		
				<tr>
						<td colspan="1" rowspan="8" align="center">������� �ֻ���</td>	
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
	</div>

	<div class="row content">
		<p style="font-size: 20; line-height: 1.5; color: blue;">�ٹ�ȯ�� ��
			�����Ļ�</p>
		<hr />
		ȸ����ġ / <br /> ȸ������ /<br /> �系��ȭ /<br />

	</div>

</div>
