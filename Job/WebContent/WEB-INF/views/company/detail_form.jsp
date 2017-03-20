<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
input[id=aaa] {
    width: 95%;
    padding: 10px 5px;
}
</style>
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
								<th colspan="2">${salary[0].CMPN_NM }</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>����� : ${score[0].DIVISION }</td>
								<td>������� : ${score[0].SCALE }</td>
							</tr>
					</table>
					<p>�繫���� : ${score[0].FINANCE_SCORE } <c:forEach var="i" begin="0" end="${score[0].FINANCE_SCORE/20 }">
						<img src="http://cfile24.uf.tistory.com/image/2419AD4652FC36A7345270" class="img-circle" alt="Cinque Terre"
							width="50" height="50">
					 </c:forEach></p>
					<br />
					<p>���������� : ${score[0].SLAVE_SCORE } <c:forEach var="i" begin="0" end="${score[0].SLAVE_SCORE/20}">
						<img src="http://cfile24.uf.tistory.com/image/2419AD4652FC36A7345270" class="img-circle" alt="Cinque Terre"
							width="50" height="50">
					 </c:forEach></p>
				</div>

			</div>
		</div>
		<div class="col-md-4">

			<h2>I Love Money</h2>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>��տ���</th>
						<th>������տ���</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${salary[0].AVG_SALARY }��</td>
						<td>${salary[0].ROOKEY_SALARY }��</td>
					</tr>
			</table>
			<div class="col-md-8">����� : 999999999��</div>
			<div class="col-md-4">
				<form action="">
					<button>���ɸ���߰�</button>
				</form>
			</div>
		</div>
	</div>

	<div class="row content" align="center">
		<p>�������� �α� ���� ���</p>
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
		
		
			<br/>
			<div class="panel panel-default">
				<div class="panel-heading">����</div>
				<c:forEach var="review" items="${review }">
				<div class="panel-body">${review.EMAIL } : ${review.CONTENTS }</div>
				</c:forEach>
			</div>
			<form role="form" action="/review/push">
			<input type="hidden" name="cmpn_nm" value="${salary[0].CMPN_NM }">
			<input type="text" id="aaa" name="content" placeholder="contents"
				>
			<button type="submit" class="btn btn-success">�ø���</button>
		</form>
	</div>
</div>
