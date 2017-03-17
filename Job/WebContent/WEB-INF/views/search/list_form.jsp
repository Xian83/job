<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<div class="container">
	<table class="table table-bordered">
		<div class="media">
 			 <div class="media-left media-middle">
  				<c:forEach var="obj" items="${list2 }" varStatus="vs">
   					 <img src="${obj.LOGO }"  class="media-object" width="100" height="70">
  			</div>
 		 <div class="media-body">
   			 <h4 class="media-heading">
   			 	<a href="/company/detail?cmpn_nm=${obj.CMPN_NM }"></h4><b>${obj.CMPN_NM }<b/></h4></a>
				<h5>${obj.DIVISION }|${obj.SCALE }</h5>
				<button type="button" class="btn btn-default">재무평가
					${obj.FINANCE_SCORE }점</button>
				<button type="button" class="btn btn-default">재직자 평판
					${obj.FINANCE_SCORE }점</button>
				<button type="button" class="btn btn-default">기업비교</button></td>
			<c:if test="${vs.count %2 == 0 }">
				</tr>
			</c:if>
		</c:forEach>
	</table>
  </div>



<!-- 페이지 뷰 -->
<div align="center">
	<c:if test="${page ne 1 }">
		<a href="/search/company?page=${page -1 }">이전</a>
	</c:if>
	<c:forEach var="p" begin="1" end="${size }" varStatus="vs">
		<c:choose>
			<c:when test="${p eq page }">
				<b style="color: red;">${p }</b>
			</c:when>
			<c:otherwise>
				<a href="/search/company?page=${p }">${p }</a>
			</c:otherwise>
		</c:choose>
		<c:if test="${vs.last eq false }">|</c:if>
	</c:forEach>
	<c:if test="${page ne size }">
		<a href="/search/company?page=${page +1 }">다음</a>
		<br />
	</c:if>
	<br />
</div>

