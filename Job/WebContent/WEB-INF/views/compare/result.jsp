<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>비교 페이지</h2>
<!-- 처음뿌려지는 쿠키리스트가 가장 먼저본 기업 -->

<hr />

	<a href="/compare/result?cm1=${clist[0] }&cm2=${clist[1] }"><button type="submit">비교</button></a>

<input type="text" width="600" id="comparelist">

<hr />

<c:forEach items="${clist }" var="obj" begin="0" end="9">
	<button id="bt"></button>
	<input type="checkbox" name="clistcheck" id="check"> ${obj }<br/>
			
</c:forEach>

<script>
	$("#bt").on("click", function() {
		$("#check").prop("checked", true);
		$("#comparelist").html("asdf");

	});

</script>


<div>

<c:forEach var="cm1" items="${list1 }">
	${cm1.CMPN_NM }
</c:forEach>
<hr/>
<c:forEach var="cm2" items="${list2 }">
	${cm2.CMPN_NM }
</c:forEach>

</div>