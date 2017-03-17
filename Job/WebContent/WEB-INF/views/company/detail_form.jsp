<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container-fluid">
	<div class="row content">
		<div class="col-md-8">

			<h4 align="center">${salary[0].CMPN_NM }</h4>
			<div class="row content">
				<div class="col-sm-3 sidenav">
					<img src="${score[0].LOGO }" class="img-circle" alt="Cinque Terre"
						width="200" height="200">
				</div>
				<div class="col-sm-9 sidenav">
					<table class="table table-bordered" align="center">
						<thead>
							<tr>
								<th colspan="2">${score[0].CMPN_NM }</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>산업군 : ${score[0].DIVISION }</td>
								<td>기업구분 : ${score[0].SCALE }</td>
							</tr>
					</table>
					<p>재무점수 : ${score[0].FINANCE_SCORE }</p>
					<br />
					<p>재직자점수 : ${score[0].SLAVE_SCORE }</p>
				</div>

			</div>
		</div>
		<div class="col-md-4">

			<h2>I Love Money</h2>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>평균연봉</th>
						<th>신입평균연봉</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${salary[0].AVG_SALARY }원</td>
						<td>${salary[0].ROOKEY_SALARY }원</td>
					</tr>
			</table>
			사원수 : 999999999명
		</div>
	</div>

	<div class="row content" align="center">
		<p>동종업계 인기 많은 기업</p>
		<c:forEach var="i" begin="0" end="5">
			<div class="col-md-2">
				<a href="/company/detail?cmpn_nm=${same[i].CMPN_NM }"> <img
					src="${same[i].LOGO }" alt="Lights" style="width: 100%">
					<div class="caption">
						<p>${same[i].CMPN_NM }</p>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>

	<div class="row content">
		<h4>리뷰</h4>
		<form role="form">
			<div class="form-group">
				<textarea class="form-control" rows="3" required></textarea>
			</div>
			<input type="text" id="aaa" name="bbb" placeholder="ID"> <input
				type="text" id="aaa" name="bbb" placeholder="contents" width="80">
			<button type="submit" class="btn btn-success">올리기</button>
		</form>
	</div>
</div>
