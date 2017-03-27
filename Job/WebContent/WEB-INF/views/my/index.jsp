<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
th {
	width: 200px;
	height: 100px;
	text-align: center;
}
</style>
<h1>마이페이지</h1>
<hr />

<div class="col-md-3">
	<!-- 회원정보관리 -->

	<div class="panel panel-default">
		<div class="panel-heading " align="center" style="background: #f4511e">
			프로필
			<div class="btn-group " align="right">
				<a class="btn dropdown-toggle" data-toggle="dropdown"> <i
					class="fa fa-align-justify"></i> <span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li>자주 본 기업</li>
					<li>최근 본 기업</li>
					<li>공채 달력</li>
				</ul>
			</div>
		</div>

		<div class="panel-body" align="center" >
			<form action="/my/update_pic" method="post"
				enctype="multipart/form-data">
				<b>PICTURE</b><br /> <img src="${url}" width="150" height="150" />
				<hr/>
				 <input type="file" name="pic" style="display: inline;"/>
				<input type="hidden" name="email" value="${sessionScope.email}"/>
				<button type="submit" class="btn">사진변경</button>
			</form>
			<hr />	
			<table>
				<tr>
					<th><a href="/my/info">회원정보관리</a></th>
					<th><a href="/my/recommand">추천 기업 정보</a></th>
					<th><a href="/my/scrap">스크랩한 기업 정보</a></th>
				</tr>
			</table>
		</div>

	</div>

</div>
<div class="col=md-8"></div>