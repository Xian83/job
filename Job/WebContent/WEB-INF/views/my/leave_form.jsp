<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<h3>회원탈퇴</h3>
</div>
<div class="well">
	※ 탈퇴를 진행하시겠습니까? <br /> 비밀번호를 다시 입력바랍니다. 비밀번호 3회 오류시, 자동 로그아웃 됩니다
<!-- 	<form action="/my/leave_result" method="post"> -->
		<p>
			<b>PASS</b><br /> <input type="password" class="form-control"
				id="pw" name="pass" />
		</p>
		<p>
			<button type="button" id ="leave" class="btn">탈퇴요청</button>
		</p>
		<div id="result" style="color:red"></div>
<!-- 	</form> -->
</div>

<script>
	var cnt = ${sessionScope.leave_try};
	
	// 탈퇴요청 처리
	$("#leave").on("click", function() {

		$.ajax({
			"url" : "/my/leave_result",
			"method" : "post",
			"data" : {
				"pass" : $("#pw").val(),
				"email" : '${sessionScope.email}'
			}
		}).done(function(rst) {
			if(rst){
				location.replace('/login/logout');
			} else {
				$("#result").html("비밀번호 " + cnt + "회 입력 오류");
				cnt++;
				if(cnt == 4)
					location.replace('/login/logout');
			}
		})
	});
</script>
