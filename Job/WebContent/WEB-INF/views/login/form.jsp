<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h3>로그인</h3>
</div>
<div class="well">
	<form action="/login/result" method="post">
		<p>
			<b>ID</b><br/>
			<input type="text" name="id" class="form-control">
		</p>		
		<p>
			<b>PASS</b><br/>
			<input type="password"  name="pass"  class="form-control">
		</p>
		<p>
			<input type="checkbox" name="keep"/>로그인 유지&nbsp;&nbsp;&nbsp;
			<button type="submit" class="btn">로그인</button>
		</p>
		<p>
			아직 회원이 아니십니까? <a href="/join/step01"><i>회원가입 페이지로 이동</i></a>
		</p>
	</form>
</div>