<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<hr/>


<div class="container-fluid" align="center" style="width: 80%;">

<div class="col-md-6" align="center">



	<div class="compare_fixname">
		<div class="name left"><span class="label label-danger" style="font-size: 25px;"><b>${score01.CMPN_NM }</b></span><br/> </div><hr/>
	</div>
		<img src="${score01.LOGO }" class="img-circle" style="width: 30%;"><br/>

</div>


<div class="col-md-6" align="center">

<div class="compare_fixname">
		<div class="name right"><span class="label label-primary" style="font-size: 25px;"><b>${score02.CMPN_NM }</b></span><br/></div><hr/>
	</div>
		<img src="${score02.LOGO }" class="img-circle" style="width: 30%;"><br/>

</div>

</div>

<hr/>


<div class="container-fluid" align="center">
	<img src="${chartURL }">
</div>



<div class="container-fluid" align="center" style="width: 90%;">
	<table class="table" align="center" style="width: 90%;">
		<tr style="height: 100px; text-align: center;">
			<td>
				<p style="font-size: 16px;"><br/>${score01.DIVISION }</p>
			</td>
			<td><br/><span class="label label-success" style="font-size: 20px; size: 60px;">분야</span></td>
			<td>
				<p style="font-size: 16px;"><br/>${score02.DIVISION }</p>
			</td>
		</tr>
		<tr tr style="height: 100px; text-align: center;">
			<td>
				<p style="font-size: 16px;"><br/>${score01.SCALE }</p>
			</td>
			<td><br/><span class="label label-success" style="font-size: 20px; size: 60px;">규모</span></td>
			<td>
				<p style="font-size: 16px;"><br/>${score02.SCALE }</p>
			</td>
		</tr>
		<tr tr style="height: 100px; text-align: center;">
			<td>
				<p style="font-size: 16px;"><br/>${score01.FINANCE_SCORE }</p>
			</td>
			<td><br/><span class="label label-success" style="font-size: 20px; size: 60px;">재무평가</span></td>
			<td>
				<p style="font-size: 16px;"><br/>${score02.FINANCE_SCORE }</p>
			</td>
		</tr>
		<tr tr style="height: 100px; text-align: center;">
			<td>
				<p style="font-size: 16px;"><br/>${score01.EMPLOYEE_SCORE }</p>
			</td>
			<td><br/><span class="label label-success" style="font-size: 20px; size: 60px;">재직자평가</span></td>
			<td>
				<p style="font-size: 16px;"><br/>${score02.EMPLOYEE_SCORE }</p>
			</td>
		</tr>
		<tr style="height: 100px; text-align: center;">
			<td>
				<p style="font-size: 16px;"><br/>${info01.num01 }</p>
			</td>
			<td><br/><span class="label label-success" style="font-size: 20px; size: 60px;">매출액</span></td>
			<td>
				<p style="font-size: 16px;"><br/>${info02.num01 }</p>
			</td>
		</tr>
		<tr style="height: 100px; text-align: center;">
			<td>
				<p style="font-size: 16px;"><br/>${info01.num02 }</p>
			</td>
			<td><br/><span class="label label-success" style="font-size: 20px; size: 60px;">영업이익</span></td>
			<td>
				<p style="font-size: 16px;"><br/>${info02.num02 }</p>
			</td>
		</tr>
		<tr style="height: 100px; text-align: center;">
			<td>
				<p style="font-size: 16px;"><br/>${info01.num03 }</p>
			</td>
			<td><br/><span class="label label-success" style="font-size: 20px; size: 60px;">당기손익</span></td>
			<td>
				<p style="font-size: 16px;"><br/>${info02.num03 }</p>
			</td>
		</tr>
		<tr style="height: 100px; text-align: center;">
			<td>
				<p style="font-size: 16px;"><br/>${info01.num04 }</p>
			</td>
			<td><br/><span class="label label-success" style="font-size: 20px; size: 60px;">사원수</span></td>
			<td>
				<p style="font-size: 16px;"><br/>${info02.num04 }</p>
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


