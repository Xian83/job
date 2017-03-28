<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
	height: 250px;
	font-size: 28px;
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
@media screen and (max-width: 810px) {
	#section1, #section2, #section3, #section41, #section42 {
		margin-left: 150px;
	}
}
</style>


<body data-spy="scroll" data-target="#myScrollspy" data-offset="15">
	<div class="container">
		<div class="row">
			<nav class="col-sm-3" id="myScrollspy">
				<ul class="nav nav-pills nav-stacked" data-spy="affix"
					data-offset-top="205">

					<div class="panel-body">
					 <form action="/my/update_pic" method="post"
							enctype="multipart/form-data"> 
							?${url}?
							<b>PICTURE</b><br /> <img src="${url}" width="200" height="200" />
							<hr />
							<input type="file" id="f" name="pic" style="display: none;" /> <input
								type="hidden" name="email" value="${sessionScope.email}" />
							<button type="button" class="btn" id="add">사진 변경</button>
							<span id="fname"></span>
							<button type="submit" class="btn" id="pic" style="display: none;">등록</button>
					</form> 
						<hr id="hh" />
					</div>


					<li><a href="#section1">추천 기업 정보</a></li>
					<li><a href="#section2">스크랩한 기업 정보</a></li>
					<li><a href="#section3">자주 본 기업</a></li>
					<li><a href="#section4">최근 본 기업</a></li>
					<li><a href="#section5">비교한 기업 정보</a></li>
				</ul>

			</nav>

			<div class="col-sm-9">
				<div id="section1">
					<h2>추천기업</h2>
					<hr />
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
					<c:forEach var="i" items="${list_s }" varStatus="vs">
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
	
				<div id="section3">
					
					<h2>자주 방문한 기업</h2>
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
					<div>
						<!-- list -->
						<%-- 		<c:forEach var="i" items="${list }" varStatus="vs"> --%>
						<%-- 			['${i.CMPN_NM }', ${i.CNT }]<c:if test="${!vs.last }">,</c:if>		 --%>
						<%-- 		</c:forEach> --%>
					</div>
				</div>
				<div id="section4">
					<h1>최근 본 기업</h1>
						아직 뷰 안 꾸밈
				</div>
				<div id="section5">
					<h1>비교한 기업</h1>
						종민이가 해줘야 함
						데이터는 넘어옴
				</div>
			</div>
		</div>
	</div>
</body>


	<script>
	
	// 사진 등록 버튼
	$("#add").on("click", function(){ 
		$("#f").trigger("click");    
		console.log($("#f"));
	});
	$("#f").on("change", function(){
		$("#pic").trigger("click");  
	});
	
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
});}
</script>