<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<h3>추가정보 입력</h3>
</div>
<div class="well">
	<form action="/join/result" method="post">
		<input type="hidden" name="email" value="${sessionScope.email }" />
		<p>
			<label for="comment">관심지역</label><br /> <select class="form-control"
				name="area">
				<c:forEach var="i" items="${location }">
					<option value="${i.LOCATION}">${i.LOCATION }</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<label for="comment">산업군</label><br /> <select class="form-control"
				name="STNDD_BIG_GB">
				<c:forEach var="i" items="${industry }">
					<option value="${i.INDUSTRY}">${i.INDUSTRY }</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<label for="comment">희망연봉</label><br /> 최소 <select name="salary_min">
				<c:forEach var="i" begin="2000" end="100000" step="100">
					<option value="${i*10000}">${i }만원</option>
				</c:forEach>
			</select> ~ 최대 <select class="form" name="salary_max">
				<c:forEach var="i" begin="2000" end="100000" step="100">
					<option value="${i*10000}">${i }만원</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<label for="comment">GENDER</label><br /> <input type="radio"
				name="gender" value="male" checked>남 <input type="radio"
				name="gender" value="female">여
		</p>
		<p>
			<button type="submit" class="btn btn-info btn-block" id="btn">입력</button>
		</p>
	</form>
</div>