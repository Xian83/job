<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
.navbar-nav>li {
	margin-left: 30;
	font-size: 12;
}

.well {
	width: 1100;
	border: 2px solid #f45757;
	background-color: #ffffff;
}

body {
	color: #202b69;
}

.btn-group-sm>.btn, .btn-sm {
	border-radius: 20px;
	background-color: rgba(249, 208, 208, 0.99);
	bold: 3px;
	margin-bottom: 6px;
}

.btn-default {
	color: #607D8B;
	border: 2px;
}

.table-bordered {
	border-top: 10px;
}

a.disabled {
	pointer-events: none;
	cursor: default;
}

b {
	padding: 2%;
}
</style>
<div id="paging">
	<div class="container">
		<div align="left">
			<b>검색결과 ${cnt}개</b>
			<br/>
		</div>
		<table class="table table-bordered" style="width: 97%">
			<c:forEach var="i" begin="0" end="${list.size()-1}" varStatus="vs">
				<c:if test="${vs.count %2 == 1 }">
					<tr>
				</c:if>
				<td>
					<div class="media">
						<div class="media-left media-middle">
							<a href="/company?cmpn_nm=${list[i].CMPN_NM }"> <img
								src="${list[i].LOGO }" class="media-object" style="width: 82px">
							</a>
						</div>
						<div class="media-body">
							<a href="/company?cmpn_nm=${list[i].CMPN_NM }"><h4>
									<b>${list[i].CMPN_NM }</b>
								</h4></a>
							<h5>${list[i].DIVISION }|${list[i].SCALE }</h5>
							<button type="button" class="btn btn-default">재무평가
								${list[i].FINANCE_SCORE }점</button>
							<button type="button" class="btn btn-default">재직자 평판
								${list[i].EMPLOYEE_SCORE }점</button>
						</div>
					</div>
				</td>
			</c:forEach>
		</table>
	</div>
	<!-- 페이지 뷰 -->
	<div class="container" align="center">
		<ul class="pagination">
			<c:if test="${page ne 1 }">
				<li><a href="page=${p-1 }" class="pagelinks">이전</a></li>
			</c:if>
			<c:forEach var="p" begin="1" end="${size > 10 ? 10 : size }"
				varStatus="vs">
				<c:choose>
					<c:when test="${p eq page }">
						<li class="active"><a href="page=${p}"
							class="pagelinks disabled">${p }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="page=${p}" class="pagelinks">${p }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page ne size }">
				<li><a href="page=${p+1 }" class="pagelinks">다음</a></li>
				<br />
			</c:if>
		</ul>
	</div>
</div>
<script>
	$(".pagelinks")
			.each(
					function() {

						$(this)
								.click(
										function() {
											$("#paging")
													.html(
															'<p class="loading"><img src="https://www.creditmutuel.fr/cmne/fr/banques/webservices/nswr/images/loading.gif" alt=""></p>');
											var page = $(this).attr("href");
											var url = "/search/detail?" + page
													+ '${key}';

											console.log(url);

											jQuery.ajaxSettings.traditional = true;

											$.ajax({
												"url" : url,
												"method" : "post"
											}).done(function(rst) {
												$("#paging").html(rst);
											})
											return false;
										});
					});
</script>