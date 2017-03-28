<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<hr/>


<div class="container-fluid" align="center" style="width: 80%;">

<div class="col-md-6" align="center">



	<div class="compare_fixname">
		<div class="name left" style="font-size: 25px;"><b>${score01.CMPN_NM }</b><br/> </div><hr/>
	</div>
		<img src="${score01.LOGO }" class="img-circle" style="width: 40%;"><br/>

</div>


<div class="col-md-6" align="center">

<div class="compare_fixname">
		<div class="name right" style="font-size: 25px;"><b>${score02.CMPN_NM }</b><br/></div><hr/>
	</div>
		<img src="${score02.LOGO }" class="img-circle" style="width: 40%;"><br/>

</div>

</div>

<hr/>


<div class="container-fluid" align="center">
	<img src="${chartURL }">
</div>



<div class="container-fluid" align="center">
	<table class="table" align="center" style="width: 100%;">
		<tr style="height: 100px; text-align: center;">
			<td>
				<p style="font-size: 20px;">${score01.DIVISION }</p>
			</td>
			<td><p style="font-size: 20px;">분야</p></td>
			<td>
				<p style="font-size: 20px;">${score02.DIVISION }</p>
			</td>
		</tr>
		<tr tr style="height: 100px; text-align: center;">
			<td>
				<p style="font-size: 20px;">${score01.SCALE }</p>
			</td>
			<td><p style="font-size: 20px;">규모</p></td>
			<td>
				<p style="font-size: 20px;">${score02.SCALE }</p>
			</td>
		</tr>
		<tr tr style="height: 100px; text-align: center;">
			<td>
				<p style="font-size: 20px;">${score01.FINANCE_SCORE }</p>
			</td>
			<td><p style="font-size: 20px;">재무평가</p></td>
			<td>
				<p style="font-size: 20px;">${score02.FINANCE_SCORE }</p>
			</td>
		</tr>
		<tr tr style="height: 100px; text-align: center;">
			<td>
				<p style="font-size: 20px;">${score01.EMPLOYEE_SCORE }</p>
			</td>
			<td><p style="font-size: 20px;">재직자평가</p></td>
			<td>
				<p style="font-size: 20px;">${score02.EMPLOYEE_SCORE }</p>
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


