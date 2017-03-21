<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
	        ['기업명', '방문횟수'],
    	    <c:forEach var="i" items="${list }" varStatus="vs">
				['${i.CMPN_NM }', ${i.CNT }]<c:if test="${!vs.last }">,</c:if>		
			</c:forEach>
        ]);

        var options = {
//           title: '내가 자주 본 기업 Top 5',	// Chart Title
          pieHole: 0.4,					// hole size ratio
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
</head>
<body>
	<h2>자주 방문한 기업</h2>
	<div id="donutchart" style="width: 900px; height: 500px;"></div>
	<div>
		<!-- list -->
<%-- 		<c:forEach var="i" items="${list }" varStatus="vs"> --%>
<%-- 			['${i.CMPN_NM }', ${i.CNT }]<c:if test="${!vs.last }">,</c:if>		 --%>
<%-- 		</c:forEach> --%>
	</div>
</body>
</html>

