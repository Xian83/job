<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 사이드바가 col-2개를 쓰고 있음 -->
<!-- 로고, 회사명 -->
<div class="row" id="top">
	<div class="media">
		<div class="media-left">
			<img src="${score.LOGO }" class="media-object" style="width:82px">
		</div>
		<div class="media-body">
			<p style="font-size:20px"></p>
			<h2 class="media-heading">${score.CMPN_NM }</h2>
		</div>
	</div>
</div>
<!-- 버튼 위치 -->
<div class="row" id="basic_info">
	<div class="col-md-2">매출액</div>
	<div class="col-md-2">사원수</div>
	<div class="col-md-2">평균연봉</div>
	<div class="col-md-2">신입연봉</div>
	<div class="col-md-2">재무평가</div>
	<div class="col-md-2">재직자평가</div>
</div>

<!-- 그래프 2개 -->
<div class="row" id="grqph01">
	<div class="col-md-5">방사형 차트 이미지 주소</div>
	<div class="col-md-5">조회수 원형 차트</div>
</div>