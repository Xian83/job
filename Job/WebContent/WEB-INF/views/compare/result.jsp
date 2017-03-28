<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<hr/>

<div class="container-fluid" align="center" style="width: 80%;">

<div class="col-md-6" align="center">


<c:forEach var="cm1" items="${list1 }">
<div class="compare_fixname">
	<div class="name left" style="font-size: 25px;"><b>${cm1.CMPN_NM }</b><br/> </div>
</div>
	<img src="${cm1.LOGO }" class="img-circle" alt="Cinque Terre"
						width="200" height="200"><br/>
	<%-- ${cm1.DIVISION }<br/>
	${cm1.SCALE }<br/>
	재무평가 : ${cm1.FINANCE_SCORE }<br/> 
	재직자 평가 : ${cm1.SLAVE_SCORE }<br/>  --%>
</c:forEach>
</div>


<div class="col-md-6" align="center">
<c:forEach var="cm2" items="${list2 }">
<div class="compare_fixname">
	<div class="name right" style="font-size: 25px;"><b>${cm2.CMPN_NM }</b><br/></div>
</div>
	<img src="${cm2.LOGO }" class="img-circle" alt="Cinque Terre"
						width="200" height="200"><br/>
	<%-- ${cm2.DIVISION }<br/>
	${cm2.SCALE }<br/>
	재무평가 : ${cm2.FINANCE_SCORE }<br/>
	재직자 평가 : ${cm2.SLAVE_SCORE }<br/> --%>
	
</c:forEach>

</div>

<div class="container-fluid" align="center">
	<div class="row" align="center">
		<div class="col-md-1"></div>	
		<div class="col-md-4">
			<c:forEach var="cm1_1" items="${list1 }">
				${cm1_1.DIVISION }
			</c:forEach>
		</div>
		<div class="col-md-2">
			분야
		</div>
		<div class="col-md-4">
			<c:forEach var="cm2_2" items="${list2 }">
				${cm2_2.DIVISION }
			</c:forEach>
		</div>
		<div class="col-md-1"></div>
	
	</div>
</div>
	

</div>


${score01 }<br/>
${score02 }



