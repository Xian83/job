<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<h3>STEP 01. 기본정보 입력</h3>
</div>
<div class="well">
	<form action="/join/step03" method="post">
		<p>
			<label for="comment"><b>Email</b>&nbsp; &nbsp; <span id="checkEmail" style="font-size:13;"></span></label><br /> 
			<input type="email"
				id="email" name="email" class="form-control" placeholder="이메일 입력" required>
		</p>
		<p>
			<label for="comment"><b>Password</b></label><br />
			<input type="password" name="pass" id="pw1"
				class="form-control" placeholder="비밀번호 입력" required>
		</p>
		<p>
			<label for="comment"><b>Password Confirm</b>&nbsp; &nbsp; <span id="cmpResult" style="color: red; font-size:13;"></span></label><br />
			<input type="password" name="passcheck" id="pw2" class="form-control"
				placeholder="비밀번호 재입력" required>
		</p>
		<p>
			<button type="submit" class="btn btn-info btn-block" id="btn" disabled>Next</button>
		</p>
	</form>
</div>
<script>
	//버튼 활성화
	var flag1 = false;
	var flag2 = false;
	var cid, result;
	
	function sbtChange() {
		if(flag1 && flag2 ) {
			document.getElementById("btn").disabled = false;
		}else {
			document.getElementById("btn").disabled = true;
		}
	}
	
	document.getElementById("pw1").onkeyup = function(){
		compare();
		sbtChange();
	}
	document.getElementById("pw2").onkeyup = function(){
		compare();
		sbtChange();
	}
	
	document.getElementById("email").onblur = function(){
		chk = this;
		result = document.getElementById("checkEmail");
		if(this.value.length >=4 && (!this.value.includes('@') || this.value.startsWith('@') || this.value.endsWith('@'))){
			result.innerHTML = "이메일 형태로 입력하세요";
			result.style.color = 'red';
			flag1=false;
		} else if(this.value.length <4 && this.value.length >=0) {
			result.innerHTML = "4자 이상 입력";
			result.style.color = 'red';
			flag1=false;
		} else {
			checkEmail();			
		}
		sbtChange();
	};
	
	// ID 체크
	document.getElementById("email").onkeyup = function(){
		chk = this;
		result = document.getElementById("checkEmail");
		if(this.value.length >=4 && (!this.value.includes('@') || this.value.startsWith('@') || this.value.endsWith('@'))){
			result.innerHTML = "이메일 형태로 입력하세요";
			result.style.color = 'red';
			flag1=false;
		} else if(this.value.length <4 && this.value.length >=0) {
			result.innerHTML = "4자 이상 입력";
			result.style.color = 'red';
			flag1=false;
		} else {
			checkEmail();			
		}
		sbtChange();
	};
	
	function checkEmail(){
		var txt = '';
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/join/check_Email?chk=" + chk.value , true);
		xhr.send();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				txt = xhr.responseText;
				console.log("결과 : " + txt);
				if(txt == 'true'){
					result.innerHTML = "사용 할 수 없는 이메일";
					result.style.color = 'red';
					flag1 = false;
				} else if(txt == 'false') {
					result.innerHTML = "사용 가능한 이메일";
					result.style.color = 'green';
					flag1 = true;
				}
			}
		};
	}
	
	// 비밀번호 체크
	function compare(){
		var pw1 = document.getElementById("pw1").value;
		var pw2 = document.getElementById("pw2").value;
		
		if(pw2.length == 0 ){
			document.getElementById("cmpResult").innerHTML = "";
		} else if(pw1 == pw2 && pw2.length > 0){
			document.getElementById("cmpResult").style.color = 'green';
			document.getElementById("cmpResult").innerHTML = " 비밀번호 일치";	
			flag2 = true;
		} else {
			document.getElementById("cmpResult").style.color = 'red';
			document.getElementById("cmpResult").innerHTML = " <i>비밀번호가 일치하지 않습니다.</i>";
			flag2 = false;
		}
		sbtChange();
	}	
	
	$("#checkEmail").on('invalid', function (e) {
		result.innerHTML = "사용 할 수 없는 이메일";
		result.style.color = 'red';
		flag1 = false;
	 });

	
</script>