<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<h3>추가정보 입력</h3>
</div>
<div class="well">
	<form action="/join/result" method="post">	
		<input type="hidden" name="email" value="${data.email }" />
		<input type="hidden" name="pass" value="${data.pass }" />
		<p>
			<label for="comment">NAME</label><br/>
			<input type="text" name="name" class="form-control" id="t1" 
			onkeyup="javascript:enableBtn()" placeholder="이름 입력">
		</p>
		<p>
			<label for="comment">BIRTH</label><br/>
			<select class="form-control" name="birth">
				<c:forEach var="i" begin="1930" end="2020">
					<option value="${i}">${i }</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<label for="comment">관심지역</label><br/>
			<select class="form-control" name="area">
				<c:forEach var="i" items="${area }">
					<option value="${i}">${i }</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<label for="comment">산업군</label><br/>
			<select class="form-control" name="STNDD_BIG_GB">
				<c:forEach var="i" items="${list }">
					<option value="${i}">${i }</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<label for="comment">희망연봉</label><br/>
			최소
			<select name="salary_min">
				<c:forEach var="i" begin="2000" end="100000" step="100">
					<option value="${i*10000}"> ${i }만원</option>
				</c:forEach>
			</select>
			~ 최대
			<select class="form" name="salary_max">
				<c:forEach var="i" begin="2000" end="100000" step="100">
					<option value="${i*10000}"> ${i }만원</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<label for="comment">GENDER</label><br/>
			<input type="radio" name="gender" value="male" checked>남
			<input type="radio" name="gender" value="female">여
		</p>
<!-- 		<div class="btn-group btn-group-justified"> -->
<!-- 			 <div class="btn-group"> -->
<!-- 				<button type="button" class="btn btn-primary" name="chk_info" value="male">남</button> -->
<!-- 			</div> -->
<!-- 			 <div class="btn-group"> -->
<!-- 			<button type="button" class="btn btn-primary" name="chk_info" value="female">여</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<p>
			<button type="submit" class="btn btn-info btn-block" id="btn" disabled>Sign Up</button>
		</p>
	</form>
</div>
<script>
	function enableBtn(){
		var t1 = document.getElementById("t1").value;
		
		if(t1 != ""){
			document.getElementById("btn").disabled = false;
		} else {
			document.getElementById("btn").disabled = true;
		}
	}
</script>