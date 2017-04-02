<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<style>
body {
	position: relative;
}

th {
	font-size: 80%;
}

.affix {
	top: 20px;
}

div.col-sm-9 div {
	height: auto;
	font-size: 20px;
}

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
							height="200" class="media-object img-Rounded Corners" />
						<hr />
						<input type="file" id="f" name="pic" style="display: none;" /> <input
							type="hidden" name="email" value="${sessionScope.email}" /> <a
							href="/my/edit"><button type="button" class="btn" id="edit">개인정보
								변경</button></a>
						<hr id="hh" />
					</div>
					<li><a href="#section1"><i class="fa fa-thumbs-o-up"
							style="font-size: 36px"></i><b> 추천 기업 정보</b></a></li>
					<li><a href="#section2"><i class="fa fa-refresh"
							style="font-size: 36px"></i><b> 비교한 기업 정보</b></a></li>
					<li><a href="#section3"><i class="fa fa-eye"
							style="font-size: 36px"></i><b> 자주 본 기업 정보</b></a></li>
					<li><a href="#section4"><i class="fa fa-files-o"
							style="font-size: 36px"></i><b> 스크랩한 기업 정보</b></a></li>
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
						<br /> <span style="color: #6A5ACD; font-size: 15px"> <b>[추천 기업
								조건]&nbsp;&nbsp;&nbsp;지역 : ${data.AREA} | 산업 :
								${data.STNDD_BIG_GB} | 연봉 : ${data.SALARY_MIN}만원 ~
								${data.SALARY_MIN}만원<br /> <br /> 총 추천기업은 ${list_r.size()}개
								입니다
						</b>
						</span>
					</h5>
					<br />
					
					<div id="img_list"
						style="width: 850px; height: 210px; overflow: hidden;">
						<table class="" style="width: 2500" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td><c:forEach var="i" items="${list_r }">
										<a href="/company?cmpn_nm=${i.CMPN_NM}"><button
												class="btn btn-default" type="submit"
												style="background: white;">
												<div class="thumbnail href1"
													style="width: 139px; height: 150px; border: none; font-size: 12px">
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

					<div id="section2">
						<hr />
						<h2>
							<b>비교한 기업 목록</b>
						</h2>
						<h6>
							<span style="color: #4682B4">(최근 비교한 10개의 목록을 확인하실 수있습니다
								&nbsp;<b>자세한 비교를 원하시면 기업명을 클릭해 주세요</b>)
							</span>

						</h6>
						<br />
						<div class="row content">
							<div class="col-md-7">
								<div class="table-responsive" id="compare">
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
													<td><a href="/company?cmpn_nm=${i.CM1 }">${i.CM1 }</a></td>
													<td><a href="/company?cmpn_nm=${i.CM2 }">${i.CM2 }</a></td>
													<td>
														<button type="button" class="btn" id="compareView"
															name="${i.CM1 }#${i.CM2 }">간단 비교</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="col-md-5">
								<div class="responsive" id="compareResult">
									<div class="container-fluid" align="center" style="width: 80%;">
										<br /> <br />

										<div class="col-md-6" align="center">

											<div class="compare_fixname">
												<div class="name left">
													<span class="label label-danger" style="font-size: 15px;"><b>${score01.CMPN_NM }</b></span><br />
												</div>
											</div>
											<br /> <img src="${score01.LOGO }" class="img-circle"
												style="width: 70%;"><br />

										</div>


										<div class="col-md-6" align="center">

											<div class="compare_fixname">
												<div class="name right">
													<span class="label label-primary" style="font-size: 15px;"><b>${score02.CMPN_NM }</b></span><br />
												</div>
											</div>
											<br /> <img src="${score02.LOGO }" class="img-circle"
												style="width: 70%;"><br />

										</div>

									</div>

									<hr />
									<div class="container-fluid" align="center">
										<img src="${chartURL }">
									</div>
								</div>

							</div>

						</div>
					</div>
					<div id="section3">
						<hr />
						<h2>
							<b>자주 본 기업</b>
						</h2>
						<h6>
							<span style="color: #4682B4">(조회수 높은 기업을 확인할 수 있습니다)</span>
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
								<b>스크랩한 기업 목록</b>
							</h2>
							<h6>
								<span style="color: #4682B4">(최근 스크랩한 기업을 확인할 수 있습니다)</span>
							</h6>
							</br>
							<div class="row content">
								<div class="table-responsive col-md-7 "
									style="height: 500px; overflow: auto;" id="scrap">
									<table class="table ">
										<thead>
											<tr>
												<th>#</th>
												<th>Company Name</th>
												<th>check</th>
												<th>Scrap Date</th>
												<th>Cancel</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach var="i" items="${list_s }" varStatus="vs">
												<tr>
													<td>${vs.count }</td>
													<td><a href="/company?cmpn_nm=${i.CMPN_NM }">${i.CMPN_NM }</a></td>
													<td><input type="checkbox" name="inqurity" class="chk"
														value="${i.CMPN_NM }"></td>
													<td><fmt:formatDate value="${i.SDATE }"
															pattern="yyyy-MM-dd" /></td>
													<td>
														<button type="button" class="btn" id="deleteScrap"
															name="${i.CMPN_NM }">삭제</button>
													</td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="col-md-5">
									<div id="visit_chart" style="width: 100%; height: 400px"></div>


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	google.charts.load('current', {packages: ['corechart', 'line']});
	// 추천기업 목록 - <>버튼 누르면 추천 기업 버튼 하나씩 움직이는 기능
	var amt = 30;   // 움직임 값 (클수록 빠름)
	var gap = 170;  // 이미지와 사이 공간의 합
	
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
	// scrap button
	$("#scrap td button").each(function() {
		$(this).click(function() {
			var CMPN_NM = $(this).attr("name");
			
			console.log(CMPN_NM);
			console.log('${sessionScope.email}');
			
			$.ajax({
				"url" : "/my/deleteScrap",
				"method" : "post",
				"data" : {
					"email" : '${sessionScope.email}',
					"CMPN_NM" : CMPN_NM
				}
			}).done(function(rst) {
				location.reload();
				window.alert("스크랩 기업이 삭제되었습니다");
			})
			return false;
		});
	});
	
	
	// compare button
	$("#compare td button").each(function() {
		$(this).click(function() {
			var CMPN_NM = $(this).attr("name");
			var strArray = CMPN_NM.split('#');
			console.log(strArray[0] + strArray[1]);

			$.ajax({
				"url" : "/my/compare",
				"method" : "post",
				"data" : {
					"cm1" : strArray[0],
					"cm2" : strArray[1]
				}
			}).done(function(img) {
				/* $("#compareResult").html("<img src=\"" + img +"\">"); */
				$("#compareResult").html(img);
			})
			return false;
		});
	});
	
	$(".chk").on("change", function() {
		if ($("input:checkbox[name='inqurity']:checked").length>=4) {
			window.alert("최대3개까지만 선택가능합니다.");
			$(this).prop("checked", false);
		} else {
			var checkname = [];
			$("input:checkbox[name='inqurity']:checked").each(function(){
				checkname.push($(this).val());	
			});
		
		//window.alert(checkname);
			
			$.ajax({
				"url" : "/my/visitgraph",
				"method" : "get",
				"data" : {
					"cm" : checkname
				}
			}).done(function(rst){
				google.charts.setOnLoadCallback(drawBasic);
				
					function drawBasic() {
						//window.alert(JSON.stringify(rst));
						var data = new google.visualization.DataTable();
						data.addColumn('number', 'X');
						for(var i = 0 ; i<rst.length ; i++){
							data.addColumn('number', rst[i].cmpn);
						}
						var datas=[];
						for(var i=0; i<7;i++) {
							var tmp =[];
							tmp.push(i);
							for(var j =0; j<rst.length; j++){
								tmp.push(rst[j].data[i].NUM);
							}
							datas.push(tmp);
						}
						data.addRows(datas);
						var options = {
							hAxis : {
								title: '조회수 비교'
							},
							vAxis: {
								title: ''
							}
						};
						
						var chart = new google.visualization.LineChart(document.getElementById('visit_chart'));
	
						chart.draw(data, options);
					
				}
			});
		}
		
	});
	

</script>