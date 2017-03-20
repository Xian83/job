<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<table class="table table-bordered">
		<c:forEach var="i" begin="0" end="${size-1 }">
			<tr>
				<td>
					<div class="media">

						<div class="media-body">
							<a href="/company/detail?cmpn_nm=${review[i].CMPN_NM }"><h4>
									<b>${review[i].CMPN_NM }<b />
								</h4></a>
							<h5>${rank[i].STNDD_BIG_GB } | ${rank[i].WKP_ADRS } </h5>
							
							<p>${review[i].EMAIL} : ${ review[i].CONTENTS}</p>
					
				</td>
				</div>
				</td>
			</tr>
		</c:forEach>

	</table>
</div>

<div align="center" class="well">
	<c:if test="${page ne 1 }">
		<a href="/board/list.jsp?page=${page -1 }">이전</a>
	</c:if>
	<c:forEach var="p" begin="1" end="${size }" varStatus="vs">
		<c:choose>
			<c:when test="${p eq page }">
				<b style="color: red;">${p }</b>
			</c:when>
			<c:otherwise>
				<a href="/board/list.jsp?page=${p }">${p }</a>
			</c:otherwise>
		</c:choose>
		<c:if test="${vs.last eq false }">|</c:if>
	</c:forEach>
	<c:if test="${page ne size }">
		<a href="/review/listform?page=${page +1 }">다음</a>
	</c:if>
</div>


