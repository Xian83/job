<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	font-size: 15px;
}
#floatMenu {
	position: absolute;
	width: 200px;
	
}
</style> 	
	
	
	<div class="container" id="">
		<div class="col-md-10">

			<h2>
				<b>REVIEW</b>
			</h2>
			<h5>
				<span style="color: #4682B4">(상세 기업 페이지에 남겨진 리뷰를 확인하실 수 있습니다)</span>
			</h5>
			<br/>
			
			<div class="inp">
				총 ${cnt }개의 검색 결과
				<input name="CName" type="text" id="search"
					placeholder="기업명을 입력해 주세요"
					style="ime-mode: active; align : right; width: 400; height: 37" />

				 <button type="button" id ="sc" class="btn">검색</button> 
		
			</div>
			<table class="table">
				<thead>
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>

				<tbody>

					<c:forEach var="i" begin="0" end="${size }">
						<tr>
							<td><img src="${LOGO[i] }"
								class="media-object img-Rounded Corners" style="width: 90px;">
								<br /> 
							</td>
							<td>
								<h5 class="media-heading" style="display: inline-block; font-size: 20px">
									<a href="/company/detail?cmpn_nm=${review[i].CMPN_NM }"><b>${review[i].CMPN_NM }</b></a> 
								</h5>
								<fmt:formatDate value="${review[i].WDATE }" pattern="yyyy-MM-dd"/><br />
							<div style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/spare.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
								<p 
									style="WIDTH: 100%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
								</p>

							</div>
						
							</td>
							<td>
								<p>	
									${ review[i].CONTENTS}
									<c:set var="email" value="${fn:split(review[i].EMAIL, '@')}"></c:set><br/>
										by. ${email[0]} 
								</p>
							
							</td>
							<td><a href="/company/detail?cmpn_nm=${review[i].CMPN_NM }"><b style="font-size: small;">몇개의 리뷰<br/> 더 보기</b></a>  </td>
						</tr>
					</c:forEach>
			</tbody>
			</table>


			<!-- 페이징 처리 -->
			<div class="container" align="center">
				<ul class="pagination">
				<c:if test="${page ne 1 }">
					<a href="/review/list_form?page=${page -1 }" class="pagelinks">이전</a>
				</c:if>
				<c:forEach var="p" begin="1" end="${size }" varStatus="vs">
					<c:choose>
						<c:when test="${p eq page }">
							<b style="color: red;">${p }</b>
						</c:when>
						<c:otherwise>
							<a href="/review/list_form?page=${p }" class="pagelinks">${p }</a>
						</c:otherwise>
					</c:choose>
					<c:if test="${vs.last eq false }">|</c:if>
				</c:forEach>
				<c:if test="${page ne size }">
					<a href="/review/list_form?page=${page +1 }" class="pagelinks">다음</a>
				</c:if>
				</ul>
			</div>
			<br />
		</div>

	
		<div class="col-md-2" >
			<div id="floatMenu" >
		<h2>
				<b>CHAT</b>
			</h2>
			<h5>
				<span style="color: #4682B4">(자유롭게 의견을 공유하세요)</span>
			</h5>
			<br/>
			<br/> 
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
