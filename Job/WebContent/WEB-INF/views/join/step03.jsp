<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<h3>추가정보 입력</h3>
</div>
<br/>
<div class="well">
	<form action="/join/result" method="post">
		<input type="hidden" name="email" value="${data.email }" /> <input
			type="hidden" name="pass" value="${data.pass }" />
		<p>
			<label for="comment">NAME</label><br /> <input type="text"
				name="name" class="form-control" id="t1"
				onkeyup="javascript:enableBtn()" placeholder="이름 입력">
		</p>
		<p>
			<label for="comment">BIRTH</label><br /> <select
				class="form-control" name="birth">
				<c:forEach var="i" begin="1930" end="2020">
					<option value="${i}" ${i eq '1995' ? 'selected' : '' }>${i }</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<label for="comment">관심지역</label><br /> <select class="form-control"
				name="area">
				<c:forEach var="i" items="${area }">
					<option value="${i.LOCATION}">${i.LOCATION }</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<label for="comment">산업군</label><br /> <select class="form-control"
				name="STNDD_BIG_GB">
				<c:forEach var="i" items="${list }">
					<option value="${i.INDUSTRY}">${i.INDUSTRY }</option>
				</c:forEach>
			</select>
		</p>
		<div class="form-group">
			<label>희망연봉</label><br /> <label for="salary_min"
				class="col-sm-2 control-label">최소</label>
			<div class="col-sm-4">
				<select class="form-control" name="salary_min" id="min"> 
					<c:forEach var="i" begin="1500" end="10000" step="500">
						<option value="${i}" ${i eq likeinfos.SALARY_MIN? 'selected' : ' '  }>최소 ${i} 이상</option>			
					</c:forEach>
					</select>
			</div>
			<label for="salary_max" class="col-sm-2 control-label">최대</label>
			<div class="col-sm-4">
				<select class="form-control" name="salary_max" id="max"> 
					<c:forEach var="i2" begin="1500" end="10000" step="500">
						<option value="${i2}" ${i2 le likeinfos.SALARY_MIN ? 'disabled' : '' } 
						 ${i2 eq likeinfos.SALARY_MAX? 'selected' : ' '  }>최대 ${i2} 이하</option>			
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
		<button type="submit" class="btn btn-info btn-block" id="btn" disabled>Sign
			Up</button>
	</form>
</div>
<script>


	//Salary combobox Select
	$("#min").on("change", function() {
		var cu = $(this).val();
		var opt = "";
		for (var i = Number(cu); i <= 10000; i += 500) {
			opt += "<option value='"+i+"'>최대 " + i + "이하</option>";
		}
		var max = $("#max").val();
		if(cu >= max)
			$("#max").html(opt);
	});

	function enableBtn() {
		var t1 = document.getElementById("t1").value;

		if (t1 != "") {
			var num1 = $("#min").val();
			var num2 = $("#max").val();
			if (num1 >= num2)
				$("#btn").prop("disabled", true);
			else
				$("#btn").prop("disabled", false);
		} else {
			$("#btn").prop("disabled", true);
		}
	}

	$('#min').change(enableBtn);
	$('#max').change(enableBtn);
</script>