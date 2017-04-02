<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
* {
	margin: 0;
	padding: 0;
}

div#com {
	display: inline;
}
</style>
</head>

<h1 align="center">기업 비교</h1>
<br />
<div class="container" align="center">
	<img src="${chartURL }">
</div>
<div class="container-fluid" align="center" style="max-width: 800px;">
	<table class="table" style="width: 90%;">
		<thead style="text-align: center;">
			<tr>
				<th style="text-align: center; font-size: 20px;">${score01.CMPN_NM }<br />
					<img src="${score01.LOGO }"
					style="width: 82px; height: 82px;">
				</th>
				<th style="text-align: center;">vs</th>
				<th style="text-align: center; font-size: 20px;">${score02.CMPN_NM }<br />
					<img src="${score02.LOGO }"
					style="width: 82px; height: 82px;"></th>
			</tr>
		</thead>
		<tr style="text-align: center;">
			<td>
				<p style="font-size: 16px;">
					<br />${score01.DIVISION }</p>
			</td>
			<td><br /> <span class="label label-success"
				style="font-size: 16px;">분야</span></td>
			<td>
				<p style="font-size: 16px;">
					<br />${score02.DIVISION }</p>
			</td>
		</tr>
		<tr style="text-align: center;">
			<td>
				<p style="font-size: 16px;">
					<br />${score01.SCALE }</p>
			</td>
			<td><br /> <span class="label label-success"
				style="font-size: 16px;">규모</span></td>
			<td>
				<p style="font-size: 16px;">
					<br />${score02.SCALE }</p>
			</td>
		</tr>
		<tr style="text-align: center;">
			<td>
				<p style="font-size: 16px;">
					<br />${score01.FINANCE_SCORE }</p>
			</td>
			<td><br /> <span class="label label-success"
				style="font-size: 16px;">재무평가</span></td>
			<td>
				<p style="font-size: 16px;">
					<br />${score02.FINANCE_SCORE }</p>
			</td>
		</tr>
		<tr style="text-align: center;">
			<td>
				<p style="font-size: 16px;">
					<br />${score01.EMPLOYEE_SCORE }</p>
			</td>
			<td><br /> <span class="label label-success"
				style="font-size: 16px;">재직자평가</span></td>
			<td>
				<p style="font-size: 16px;">
					<br />${score02.EMPLOYEE_SCORE }</p>
			</td>
		</tr>
		<tr style="text-align: center;">
			<td>
				<p style="font-size: 16px;">
					<br />${info01.num01 }</p>
			</td>
			<td><br /> <span class="label label-success"
				style="font-size: 16px;">매출액</span></td>
			<td>
				<p style="font-size: 16px;">
					<br />${info02.num01 }</p>
			</td>
		</tr>
		<tr style="text-align: center;">
			<td>
				<p style="font-size: 16px;">
					<br />${info01.num02 }</p>
			</td>
			<td><br /> <span class="label label-success"
				style="font-size: 16px;">영업이익</span></td>
			<td>
				<p style="font-size: 16px;">
					<br />${info02.num02 }</p>
			</td>
		</tr>
		<tr style="text-align: center;">
			<td>
				<p style="font-size: 16px;">
					<br />${info01.num03 }</p>
			</td>
			<td><br /> <span class="label label-success"
				style="font-size: 16px;">당기손익</span></td>
			<td>
				<p style="font-size: 16px;">
					<br />${info02.num03 }</p>
			</td>
		</tr>
		<tr style="text-align: center;">
			<td>
				<p style="font-size: 16px;">
					<br />${info01.num04 }</p>
			</td>
			<td><br /> <span class="label label-success"
				style="font-size: 16px;">사원수</span></td>
			<td>
				<p style="font-size: 16px;">
					<br />${info02.num04 }</p>
			</td>
		</tr>

	</table>
</div>


<%-- <div class="container-fluid" align="center" style="width: 80%;">

<div class="col-md-6" align="center">



<div class="compare_fixname">
	<div class="name left" style="font-size: 25px;"><b>${list1.CMPN_NM }</b><br/> </div>
</div>
	<img src="${score01.LOGO }" class="img-circle" alt="Cinque Terre"
						width="200" height="200"><br/>


</div>


<div class="col-md-6" align="center">

<div class="compare_fixname">
	<div class="name right" style="font-size: 25px;"><b>${score02.CMPN_NM }</b><br/></div>
</div>
	<img src="${score02.LOGO }" class="img-circle" alt="Cinque Terre"
						width="200" height="200"><br/>


</div>

<div class="container-fluid" align="center">
	<img src="${chartURL }">
</div>

<div class="container-fluid" align="center">
	<div class="row" align="center">
		<div class="col-md-1"></div>	
		<div class="col-md-4">
			<c:forEach var="c1" items="${score01 }">
				${c1.DIVISION }
			</c:forEach>
		</div>
		<div class="col-md-2">
			분야
		</div>
		<div class="col-md-4">
			<c:forEach var="c2" items="${score02 }">
				${c2.DIVISION }
			</c:forEach>
		</div>
		<div class="col-md-1"></div>
	
	</div>
</div>
	

</div>
 --%>


