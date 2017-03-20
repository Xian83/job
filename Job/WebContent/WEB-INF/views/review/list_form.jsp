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


