<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	position: relative;
}

.affix {
	top: 20px;
}

div.col-sm-9 div {
	height: auto;
	font-size: 20px;
}

/* #section1 {
	color: #fff;

}

#section2 {
	color: #fff;
	background-color: #673ab7;
}

#section3 {
	color: #fff;
	background-color: #ff9800;
}

#section4 {
	color: #fff;
	background-color: #00bcd4;
}

#section5 {
	color: #fff;
	background-color: #009688;
} */
#section1, #section2, #section3, #section4, #section5 {
	padding-top: 50px;
}

@media screen and (max-width: 810px) {
	#section1, #section2, #section3, #section4, #section5 {
		margin-left: 150px;
		margin-top: 300px;
	}
}
</style>


<body data-spy="scroll" data-target="#myScrollspy" data-offset="150">
	<div class="container">
		<div class="row">
			<div class="col-sm-3" id="myScrollspy">
				<ul class="nav nav-pills nav-stacked" data-spy="affix"
					data-offset-top="205">

					<div class="panel-body" align="center">

						<b>PROFILE PHOTO</b><br /> <img src="${picURL}" width="200"
							height="200" />
						<hr />
						<input type="file" id="f" name="pic" style="display: none;" /> <input
							type="hidden" name="email" value="${sessionScope.email}" /> <a
							href="/my/edit"><button type="button" class="btn" id="edit">개인정보
								변경</button></a>


						<hr id="hh" />
					</div>


					<li><a href="#section1"><i class="fa fa-thumbs-o-up"
							style="font-size: 36px"></i><b> 추천 기업 정보</b></a></li>
					<li><a href="#section2"><i class="fa fa-files-o"
							style="font-size: 36px"></i><b> 스크랩한 기업 정보</b></a></li>
					<li><a href="#section3"><i class="fa fa-eye"
							style="font-size: 36px"></i><b> 자주 본 기업 정보</b></a></li>
					<li><a href="#section4"><i class="fa fa-refresh"
							style="font-size: 36px"></i><b> 비교한 기업 정보</b></a></li>
				</ul>
			</div>

			<div class="col-sm-9">
				<div id="section1">
					<hr />
					<h2>추천기업</h2>
					<%-- <div class="row">
						<c:forEach var="i" items="${list_r }">
							<div class="col-md-2">
								<div class="thumbnail">
									<a href="/company/detail?cmpn_nm=${i.CMPN_NM}"> <img
										src="${i.LOGO }" alt="Lights" style="width: 100%">
										<div class="caption">
											<p align="center">
												${i.CMPN_NM }<br /> 평균 ${i.SALARY/10000 }만원
											</p>
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div> --%>
				</div>
				<div id="section2">
					<hr />
					<h2>
						<b>스크랩한 기업 목록</b>
					</h2>
					<h6>
						<span style="color: #4682B4">(최근 스크랩한 10개의 정보를 확인할 수 있습니다)</span>
					</h6>
					</br>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Company Name</th>
									<th>Scrap Date</th>
									<th>Cancel</th>
								</tr>
							</thead>
							<tbody>
							
								<c:forEach var="i" items="${list_s }" varStatus="vs">				
									<tr>
										<td >${vs.count }</td>
										<td>${i.CMPN_NM }</td>
										<td><fmt:formatDate value="${i.SDATE }" pattern="yyyy-MM-dd" /></td>
										<td>
											<a href="/my/company?email=${i.EMAIL }&company=${i.CMPN_NM }"><button type="submit" class="btn" id="deleteScrap">삭제</button></a>
											
										</td>
							
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div id="section3">
					<hr />
					<h2>
						<b>자주 본 기업</b>
					</h2>
					<h6>
						<span style="color: #4682B4">(많이 조회한 기업을 확인할 수 있습니다)</span>
					</h6>
					</br>
					<div id="donutchart" style="width: 900px; height: 500px;"></div>
					<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
	        ['기업명', '방문횟수'],
    	    <c:forEach var="i" items="${list_v }" varStatus="vs">
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
					
				<div id="section4">
					<hr />
					<h2>
						<b>비교한 기업 목록</b>
					</h2>
					<h6>
						<span style="color: #4682B4">(최근 비교한 10개의 목록을 확인하실 수 있습니다)</span>
					</h6>
					</br>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Company Name A</th>
									<th>Company Name B</th>
									<th>Compare</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" begin="0" end="9" items="${list_c }"
									varStatus="vs">
									<tr>
										<td>${vs.count }</td>
										<td>${i.CM1 }</td>
										<td>${i.CM2 }</td>
										<td>
											<form action="/compare/result">
												<button type="submit" class="btn">비교</button>
											</form>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br /> <br />

					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

</body>


<script>
	
	// 스크랩 체크 박스 - 아직 다 안 됐음
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