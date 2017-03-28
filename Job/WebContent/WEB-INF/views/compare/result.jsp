<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<hr/>

<div class="container-fluid" align="center" style="width: 80%;">

<div class="col-md-6" align="center">



<div class="compare_fixname">
	<div class="name left" style="font-size: 25px;"><b>${score01.CMPN_NM }</b><br/> </div>
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
			
				${score01.DIVISION }
			
		</div>
		<div class="col-md-2">
			분야
		</div>
		<div class="col-md-4">

				${score02.DIVISION }

		</div>
		<div class="col-md-1"></div>
	
	</div>
</div>
	

</div>




