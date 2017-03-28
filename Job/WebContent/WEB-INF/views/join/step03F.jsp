<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<h3>추가정보 입력</h3>
</div>
<div class="well">
	<form action="/join/result02" method="post">
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
		<div class="form-group">
			<label>희망연봉</label><br /> <label for="salary_min"
				class="col-sm-2 control-label">최소</label>
			<div class="col-sm-4">
				<select name="salary_min" class="form-control" id="min">
					<c:forEach var="i" begin="2000" end="100000" step="100">
						<option value="${i*10000}">${i }만원</option>
					</c:forEach>
				</select>
			</div>
			<label for="salary_max" class="col-sm-2 control-label">최대</label>
			<div class="col-sm-4">
				<select name="salary_max" class="form-control" id="max">
					<c:forEach var="i" begin="2000" end="100000" step="100">
						<option value="${i*10000}" ${i eq 3500 ? 'selected' : '' }>${i }만원</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<br />
		
		<div>
			<label for="comment">GENDER</label><br />
			&nbsp; <input type="radio"	name="gender" value="male" checked>남&nbsp; &nbsp; <input type="radio"
				name="gender" value="female">여
		</div>
		<br/>
		<button type="submit" class="btn btn-info btn-block" id="btn">입력</button>
	</form>
</div>
<script>
	function enableBtn() {
		var num1 = $("#min").val();
		var num2 = $("#max").val();
		if (num1 >= num2)
			$("#btn").prop("disabled", true);
		else
			$("#btn").prop("disabled", false);
	}

	$('#min').change(enableBtn);
	$('#max').change(enableBtn);

</script>
