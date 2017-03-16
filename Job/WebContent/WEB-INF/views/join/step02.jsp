<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<h3>STEP 01. 기본정보 입력</h3>
</div>
<div class="well">
	<form action="/join/step02.jsp" method="post">
		<p>
			<b>ID</b> <span id="checkId"></span><br /> <input type="text"
				name="id" id="id" class="form-control" placeholder="아이디 입력">
		</p>
		<p>
			<b>PASS</b><br /> <input type="password" name="pw" id="pw1"
				class="form-control" placeholder="비밀번호 입력">
		</p>
		<p>
			<b>PASS CONFIRM</b><span id="cmpResult" style="color: red"></span><br />
			<input type="password" name="pwcheck" id="pw2" class="form-control"
				placeholder="비밀번호 재입력">
		</p>
		<p>
			<button type="submit" class="btn" id="btn" disabled>다음 단계로</button>
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
	
	// ID 체크
	document.getElementById("id").onblur = function(){
		cid = this;
		result = document.getElementById("checkId");		
		if(this.value.length <4 && this.value.length >0) {
			result.innerHTML = "4자 이상 입력";
			result.style.color = 'red';
			flag1=false;
		} else {
			checkID();			
		}
		sbtChange();
	};
	
	function checkID(){
		var txt = '';
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/join/check_Id.jsp?cid=" + cid.value , true);
		xhr.send();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				txt = xhr.responseText;
				console.log("결과 : " + txt);
				if(txt == 'true'){
					result.innerHTML = "중복된 아이디";
					result.style.color = 'red';
					flag1 = false;
				} else if(txt == 'false') {
					result.innerHTML = "사용 가능한 아이디";
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
	
</script>