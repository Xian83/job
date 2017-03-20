<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<style>
.modal-header, h4, .close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}
</style>
</head>
<body>
<script>
	function statusChangeCallback(response) { 
		console.log('statusChangeCallback'); 
		console.log(response); 

		if (response.status === 'connected') { 
			// 페이스북을 통해서 로그인이 되어있다. 
// 			testAPI(); 
			login(); 			
// 			location.href="/index";	//시작페이지로 이동
			// history.back(); //이전 페이지로 이동
		} else if (response.status === 'not_authorized') { 
			// 페이스북에는 로그인 했으나, 앱에는 로그인이 되어있지 않다. 
			document.getElementById('status').innerHTML = 'Please log ' + 'into this app.'; 
		} else { 
			// 페이스북에 로그인이 되어있지 않다. 따라서, 앱에 로그인이 되어있는지 여부가 불확실하다. 
			document.getElementById('status').innerHTML = 'Please log ' + 'into Facebook.'; 
		} 
	} 
	
	// 이 함수는 누군가가 로그인 버튼에 대한 처리가 끝났을 때 호출된다. 
	// onlogin 핸들러를 아래와 같이 첨부하면 된다. 
	function checkLoginState() { 
		FB.getLoginStatus(function(response) { 
			statusChangeCallback(response); 
		});
	} 
	
	window.fbAsyncInit = function() { 
		FB.init({ 
			appId : '1907163846218532',	// App ID 
			cookie : true,	// 쿠키가 세션을 참조할 수 있도록 허용 
			xfbml : true,	// 소셜 플러그인이 있으면 처리 
			version : 'v2.8'	// 버전 2.8 사용 
		}); 
		
		FB.getLoginStatus(function(response) { 
			statusChangeCallback(response); 
		}); 
	}; 
		
	// SDK를 비동기적으로 호출 
	(function(d, s, id) { 
		var js, fjs = d.getElementsByTagName(s)[0]; 
		if (d.getElementById(id)) 
			return; 
		js = d.createElement(s); 
		js.id = id; 
// 		js.src = "//connect.facebook.net/ko_KR/sdk.js";
		js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=1907163846218532";
		fjs.parentNode.insertBefore(js, fjs); 
	} (document, 'script', 'facebook-jssdk')); 
	
	// 로그인이 성공한 다음에는 간단한 그래프API를 호출한다. 
	// 이 호출은 statusChangeCallback()에서 이루어진다. 
	function login(){
		FB.api('/me?fields=id,name,email,first_name,last_name,birthday', function(response) {
			$.ajax({
				"url" : "/login/fbLogin",
				"method" : "post",
				"data" : {
					"info" : JSON.stringify(response)
				}
			}).done(function(rst){
				if(rst){
					$("#status").append(rst.name + " 로그인 성공<br/>");
				} else {
					$("#status").append(rst.name + " 추가정보 입력 필요 " + rst.exist + "<br/>");
				}
			});
		});		
	}
</script>
<div>
	<h3>로그인</h3>
</div>
<div class="well">
	<form action="/login/result" method="post">
		<p>
			<b>EMAIL</b><br/>
			<input type="text" name="email" id="flag1" class="form-control">
		</p>		
		<p>
			<b>PASS</b><br/>
			<input type="password"  name="pass" id="flag2" class="form-control">
		</p>
		<p>
			<input type="checkbox" name="keep" checked />로그인 유지&nbsp;&nbsp;&nbsp;
			<button type="submit" class="btn btn-info btn-block" id="btn">Login</button><br/>
		</p>
			<!-- facebook 로그인 버튼 -->
			<fb:login-button scope="public_profile,email,user_birthday" onlogin="checkLoginState();" data-auto-logout-link="true"></fb:login-button>
<!-- 			<div class="fb-login-button" data-max-rows="4" data-size="pinterest" data-show-faces="false" data-auto-logout-link="true"></div> -->
			<div id="status"></div>
		<p>
			아직 회원이 아니십니까? <a href="/join/step01"><i>회원가입 페이지로 이동</i></a>
		</p>
	</form>
</div>
</body>
</html>