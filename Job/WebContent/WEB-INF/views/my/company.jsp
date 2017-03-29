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
/* .carousel-inner>.item>.container, .carousel-inner>.item>a>img {
   width: 70%;
   margin: auto;
}

.thumbnail {
   margin-bottom: 0;
}
 */
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
					<h2>
						<b>추천기업</b>
					</h2>
					<h6>
						<span style="color: #4682B4">(관심 조건을 바꾸시려면 개인정보에서 변경해 주세요)</span>
					</h6>
					<h5>
						<span style="color: #6A5ACD"> <b>[추천 기업
								조건]&nbsp;&nbsp;&nbsp;지역 : ${data.AREA} | 산업 :
								${data.STNDD_BIG_GB} | 연봉 : ${data.SALARY_MIN}만원 ~
								${data.SALARY_MIN}만원 </b>
						</span>
					</h5>
					<br />
					<div id="img_list"
						style="width: 720px; height: 300px; overflow: hidden;">
						<table class="" width="1550" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td><c:forEach var="i" items="${list_r }">
										<a href="/company/detail?cmpn_nm=${i.CMPN_NM}"><button
												class="btn btn-default" type="submit"
												style="background: white;">
												<div class="thumbnail href1"
													style="width: 150px; height: 150px; border: none; font-size: 12px">
													<p>
														<img src="${i.LOGO }" style="width: 60%"><br /> <br />
													</p>
													<p>${i.CMPN_NM }</p>
													<br />
													<p>
														<fmt:formatNumber value="${i.AVG_SALARY/10000}"
															groupingUsed="true" />
														만원
													</p>

												</div>
											</button></a>
									</c:forEach></td>
							</tr>
						</table>
					</div>
					<div align="center">
						<input type="button" name="" value="<" onclick="scroll_left()">
						<input type="button" name="" value=">" onclick="scroll_right()">
					</div>

					<%-- 
						// 시작페이지 기능 해보려다 중단
					<div id="myCarousel" class="carousel slide" style="width: 100%;">
						<!-- Indicators -->
						<ol class="carousel-indicators" style="display: none;">
							<c:forEach var="i" begin="1" end="${list_r.size() -1 }">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="i"></li>
							</c:forEach>
						</ol>

						<!-- Wrapper for slides -->
					<!-- <div class="carousel-inner" role="listbox" >
							<div class="item active">
							<div class="col-md-1">
							<div class="container" align="center">
							   <div class="row" align="center"> -->
							     <div class="carousel-inner" role="listbox" align="center">
				
               <div class="item active"> 
                  <div class="container" align="center">
                     <div class="row" align="center">
                      	
                        <div class="col-md-3">
									<a href="/company/detail?cmpn_nm=${list_r[0].CMPN_NM}"><button
											class="btn btn-default" type="submit"
											style="background: white;">
											<div class="thumbnail href1"
												style="width: 150px; height: 150px; border: none; font-size: 12px">
												<p>
													<img src="${list_r[0].LOGO }" style="width: 60%"><br /> <br />
												</p>
												<p>${list_r[0].CMPN_NM }</p>
												<br />
												<p>
													<fmt:formatNumber value="${list_r[0].AVG_SALARY/10000}"
														groupingUsed="true" />
													만원
												</p>
												<br />
											</div>
										</button></a>
										</div>
				<!-- ------------------------ -->
								<br /> <br />
							
					<div class="carousel-inner" role="listbox" >
							<div class="item active">
							<div class="col-md-1">
							<div class="container" align="center">
							   <div class="row" align="center">
								<c:forEach var="i" items="${list_r }">
									<a href="/company/detail?cmpn_nm=${i.CMPN_NM}"><button
											class="btn btn-default" type="submit"
											style="background: white;">
											<div class="thumbnail href1"
												style="width: 150px; height: 150px; border: none; font-size: 12px">
												<p>
													<img src="${i.LOGO }" style="width: 60%"><br /> <br />
												</p>
												<p>${i.CMPN_NM }</p>
												<br />
												<p>
													<fmt:formatNumber value="${i.AVG_SALARY/10000}"
														groupingUsed="true" />
													만원
												</p>
												<br />
											</div>
										</button></a>
								</c:forEach>
					
					
							</div></div>
					 </div>  
					 
							
							    <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button"
               data-slide="prev" style="background: white;"> <span
               class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color: red;"></span>
               <span class="sr-only">Previous</span>
            </a> <a class="right carousel-control" href="#myCarousel" role="button"
               data-slide="next" style="background: white;"> <span
               class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color: red;"></span>
               <span class="sr-only">Next</span>
            </a>
							
							</div> --%>


					<div id="section2">
						<hr />
						<h2>
							<b>스크랩한 기업 목록</b>
						</h2>
						<h6>
							<span style="color: #4682B4">(최근 스크랩한 기업 목록을 확인할 수 있습니다)</span>
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
											<td>${vs.count }</td>
											<td><a href="/company/detail?cmpn_nm=${i.CMPN_NM }">${i.CMPN_NM }</a></td>
											<td><fmt:formatDate value="${i.SDATE }"
													pattern="yyyy-MM-dd" /></td>
											<td><a
												href="/my/company?email=${i.EMAIL }&company=${i.CMPN_NM }"><button
														type="submit" class="btn" id="deleteScrap">삭제</button></a></td>

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
								<span style="color: #4682B4">(최근 비교한 10개의 목록을 확인하실 수
									있습니다)</span>
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
												<td><a href="/company/detail?cmpn_nm=${i.CM1 }">${i.CM1 }</a></td>
												<td><a href="/company/detail?cmpn_nm=${i.CM2 }">${i.CM2 }</a></td>
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

// 추천기업 목록 - <>버튼 누르면 추천 기업 버튼 하나씩 움직이는 기능
var amt = 30;   // 움직임 값 (클수록 빠름)
var gap = 180;  // 이미지와 사이 공간의 합

var cnt = 0;
var init_amt = amt;

function scroll_right(){
    document.getElementById('img_list').scrollLeft += amt;
    if(cnt >= gap){
        cnt = 0;
        var adj = document.getElementById('img_list').scrollLeft % gap;
        document.getElementById('img_list').scrollLeft -= adj;
        amt = init_amt;
    }
    else{
        amt = Math.ceil(amt / 1.2);
        setTimeout(scroll_right, 10);
    }
    cnt = cnt + amt;
}

function scroll_left(){
    document.getElementById('img_list').scrollLeft -= amt;
    if(cnt >= gap){
        cnt = 0;
        var adj = document.getElementById('img_list').scrollLeft % gap;
        if(adj > 0) adj = gap - adj
        document.getElementById('img_list').scrollLeft += adj;
        amt = init_amt;
    }
    else{
        amt = Math.ceil(amt / 1.2);
        setTimeout(scroll_left, 10);
    }
    cnt = cnt + amt;
}

	// 스크랩한 기업 삭제할 때 alert 뜸
  	$("#deleteScrap").on("click", function() {
  		window.alert("스크랩 기업이 삭제되었습니다");
    });

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
  

</script>