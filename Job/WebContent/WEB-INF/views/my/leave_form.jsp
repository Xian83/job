<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h3>회원탈퇴</h3>
</div>
<div class="well">
	※ 탈퇴를 진행하시겠습니까?
	   비밀번호를 다시 입력바랍니다.
	<form action="/my/leave_result" method="post">
		<p>
			<b>PASS</b><br/>
			<input type="password" class="form-control" name="pass"/>
		</p>
		<p>
			<button type="submit" class="btn">탈퇴요청</button>
		</p>
	</form>
</div>


