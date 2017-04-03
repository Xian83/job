<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<style>
body {
	font-size: 15px;
}

#floatMenu {
	position: absolute;
	width: 200px;
}
</style>

<div class="container" id="result2">
	<div class="col-md-10">
		<span style="color: #4682B4;"><b>검색 결과 총 ${cnt }개</b></span> <br />
		<table class="table">
			<tbody>
				<c:forEach var="i" items="${review }">
					<tr>
						<td><img src="${i.LOGO }"
							class="media-object img-Rounded Corners" style="width: 90px;">
							<br /></td>
						<td>
							<h5 class="media-heading"
								style="display: inline-block; font-size: 20px">
								<a href="/company?cmpn_nm=${i.CMPN_NM }"><b>${i.CMPN_NM }</b></a>
							</h5> <fmt:formatDate value="${i.WDATE }" pattern="yyyy-MM-dd" /><br />
							<div
								style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/spare.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
								<p
									style="WIDTH: ${i.RATE}%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
								</p>

							</div>

						</td>
						<td>
							<p>
								${i.CONTENTS}
								<c:set var="email" value="${fn:split(i.EMAIL, '@')}"></c:set>
								<br />written by. ${email[0]}
							</p>

						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3" align="center">
						<ul class="pagination">
							<c:if test="${page ne 1 }">
								<li><a href="page=${page -1 }" class="pagelinks">이전</a></li>
							</c:if>
							<c:forEach var="p" begin="${page >= 10 ? page/10+1 : 1 }" end="${size > 10 ? page/10 + 10 : size }"
								varStatus="vs">
								<c:choose>
									<c:when test="${p eq page }">
										<li class="active"><a href="#" class="pagelinks disabled">${p }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="page=${p }" class="pagelinks">${p }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${page ne size }">
								<li><a href="page=${page eq null ? 2 : page+1 }" class="pagelinks">다음</a></li>
							</c:if>
						</ul>

					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="col-md-2">
		<div id="floatMenu">
			<div class="well" id="result"
				style="height: 400px; width: 300px; overflow-y: scroll; margin-top: 0px; background: #F0F8FF; border-style: double;">

			</div>
			<div style="width: 300px">
				<input type="text" class="form-control" id="msg"
					placeholder="메세지를 남겨주세요" />
			</div>
		</div>
	</div>
</div>

<script>
	$(".pagelinks").each( function() {
		$(this).click(function() {
			var page = $(this).attr("href");
			var url = "/review/search?" + page + '&CName=${CName}';

			$.ajax({
				"url" : url,
				"method" : "post"
			}).done(function(rst) {
				$("#result2").html(rst);
			})
			return false;
		});
	});
</script>