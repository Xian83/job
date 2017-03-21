<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		packages : [ 'corechart', 'line' ]
	});
	google.charts.setOnLoadCallback(drawLineColors);

	function drawLineColors() {
		var data = new google.visualization.DataTable();
		data.addColumn('date', 'Time of Day');
		data.addColumn('number', '기업A');
		data.addColumn('number', '기업B');
		data.addColumn('number', '기업C');

		data.addRows([
			[new Date(2015, 0, 1), 5, 3, 7],  
			  [new Date(2015, 0, 2), 7, 3, 7],  
			  [new Date(2015, 0, 3), 3, 5, 7],
			  [new Date(2015, 0, 4), 1, 7, 7],  
			  [new Date(2015, 0, 5), 3, 8, 7],  
			  [new Date(2015, 0, 6), 4, 3, 7],
			  [new Date(2015, 0, 7), 3, 9, 7],
			  [new Date(2015, 0, 8), 4, 3, 7],
			  [new Date(2015, 0, 9), 2, 3, 7],
			  [new Date(2015, 0, 10), 5, 8, 2],
			  [new Date(2015, 0, 11), 8, 8, 2],
			  [new Date(2015, 0, 12), 6, 8, 2],
			  [new Date(2015, 0, 13), 3, 8, 2],
			  [new Date(2015, 0, 14), 3, 8, 2],
			  [new Date(2015, 0, 15), 5, 8, 2],
			  [new Date(2015, 0, 16), 7, 8, 2],
			  [new Date(2015, 0, 17), 6, 8, 2],
			  [new Date(2015, 0, 18), 6, 8, 2],
			  [new Date(2015, 0, 19), 3, 8, 2],
			  [new Date(2015, 0, 20), 1, 8, 2],
			  [new Date(2015, 0, 21), 2, 8, 2],
			  [new Date(2015, 0, 22), 4, 8, 2],
			  [new Date(2015, 0, 23), 6, 8, 2],
			  [new Date(2015, 0, 24), 5, 8, 2],
			  [new Date(2015, 0, 25), 9, 8, 2],
			  [new Date(2015, 0, 26), 4, 8, 2],
			  [new Date(2015, 0, 27), 9, 8, 2],
			  [new Date(2015, 0, 28), 8, 8, 2],
			  [new Date(2015, 0, 29), 6, 8, 2],
			  [new Date(2015, 0, 30), 4, 8, 2],
			  [new Date(2015, 0, 31), 6, 8, 2],
			  [new Date(2015, 1, 1), 7, 3, 4],
			  [new Date(2015, 1, 2), 9, 1, 5]
        ]);

		var options = {
			hAxis : {
				title : '날짜',
				format: 'MMM dd, yyyy'
			},
			vAxis : {
				title : '조회수',
			 	minValue: 0
			},
		// 			colors : [ '#a52714', '#097138' ]
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);

		// button Event
// 		var button = document.getElementById('change');

//         button.onclick = function () {
// 			//
//           // If the format option matches, change it to the new option,
//           // if not, reset it to the original format.
//           options.hAxis.format === 'M/d/yy' ?
//           options.hAxis.format = 'MMM dd, yyyy' :
//           options.hAxis.format = 'M/d/yy';

//           chart.draw(data, options);
//         };
	}
</script>
</head>
<body>
	<div class="container">
		<h2>스크랩한 기업 목록</h2>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Company Name</th>
						<th>checkbox</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${list }" varStatus="vs">
						<tr>
							<td>${vs.count }</td>
							<td id="chk${vs.count}">${i.CMPN_NM }</td>
							<td><input type="checkbox" class="chkclass" name="chk${vs.count}"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
 	<button id="change">Click to change</button>
	<div id="chart_div" style="width: 900px; height: 500px"></div>
</body>
</html>
<script>
$(function() {
  	$("#change").on("click", function() {
  		// 1개이상 체크하도록 한다.
	    if ( $(".chkclass :checked").size() < 1 ) {
		   alert("1개 이상의 기업을 선택하세요");
		   return;
	    } else {
	    	
	    //param 만들기
	   	var param = "";
	    $(".chkclass :checked").each(function() {
	    	if($(this.prop("cheked"))){
	        	param += "&name="+$(this).val();	    		
	    	}
	        console.log('param : ' + param);
	    });
	           
	    $.ajax({
	        url : '/my/interestAjax',
	        type : 'post',
	        data : param,
	        success : function(data) {
	        	console.log('return string : ' + data);
	    	},
        	error : function() { 
        		console.log('error');
	     	}
    	});
      }
  });
});
</script>