<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<h2>비교한 기업 목록</h2>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>Company Name A</th>
					<th>Company Name B</th>					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${list_c }" varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td>${i.CM1 }</td>
						<td>${i.CM2 }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>