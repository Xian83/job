<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
input[id=aaa] {
	width: 95%;
	padding: 10px 5px;
}
</style>

<h2>비교 처리 페이지</h2>
<hr />

<div class="container-fluid">

<div class="col-md-6" align="center">

<c:forEach var="cm1" items="${list1 }">
	<b>${cm1.CMPN_NM }</b><br/> 
	<img src="${cm1.LOGO }" class="img-circle" alt="Cinque Terre"
						width="200" height="200"><br/>
	${cm1.DIVISION }<br/>
	재무평가 : ${cm1.FINANCE_SCORE }<br/> 
	재직자 평가 : ${cm1.SLAVE_SCORE }<br/> 
</c:forEach>
</div>

<div class="col-md-6" align="center">
<c:forEach var="cm2" items="${list2 }">
	<b>${cm2.CMPN_NM }</b><br/>
	<img src="${cm2.LOGO }" class="img-circle" alt="Cinque Terre"
						width="200" height="200"><br/>
	${cm2.DIVISION }<br/> 
	${cm2.SCALE }<br/>
	재무평가 : ${cm2.FINANCE_SCORE }<br/>
	재직자 평가 : ${cm2.SLAVE_SCORE }<br/> 
</c:forEach>

</div>
</div>