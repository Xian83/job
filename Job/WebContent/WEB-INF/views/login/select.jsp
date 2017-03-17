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
<!-- facebook 로그인 연동 -->
<script>
	// This is called with the results from from FB.getLoginStatus(). 
	function statusChangeCallback(response) { 
		console.log('statusChangeCallback'); 
		console.log(response); 
		// response 객체는 현재 로그인 상태를 나타내는 정보를 보여준다. 
		// 앱에서 현재의 로그인 상태에 따라 동작하면 된다. 
		// FB.getLoginStatus().의 레퍼런스에서 더 자세한 내용이 참조 가능하다. 
		if (response.status === 'connected') { 
			// 페이스북을 통해서 로그인이 되어있다. 
			testAPI(); 
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
			version : 'v2.8'	// 버전 2.1 사용 
		}); 
		
		// 자바스크립트 SDK를 초기화 했으니, FB.getLoginStatus()를 호출한다. 
		//.이 함수는 이 페이지의 사용자가 현재 로그인 되어있는 상태 3가지 중 하나를 콜백에 리턴한다. 
		// 그 3가지 상태는 아래와 같다. 
		// 1. 앱과 페이스북에 로그인 되어있다. ('connected') 
		// 2. 페이스북에 로그인되어있으나, 앱에는 로그인이 되어있지 않다. ('not_authorized') 
		// 3. 페이스북에 로그인이 되어있지 않아서 앱에 로그인이 되었는지 불확실하다. 
		// // 위에서 구현한 콜백 함수는 이 3가지를 다루도록 되어있다. 
		
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
	function testAPI() { 
		console.log('Welcome! Fetching your information.... '); 
		FB.api('/me?fields=id,name,email,first_name,last_name,birthday', function(response) { 
			console.log('Successful login for: ' + response.name);
			console.log(JSON.stringify(response));
			document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + '!';
		}); 
	}
</script>
<!-- 로그인 버튼 -->
<div class="container">
	<!-- Trigger the modal with a button -->
	<button type="button" class="btn btn-default btn-lg" id="myBtn">ItJob Login</button>
	<!-- 소셜 플러그인으로 로그인 버튼을 넣는다. 
	이 버튼은 자바스크립트 SDK에 그래픽 기반의 로그인 버튼을 넣어서 
	클릭시 FB.login() 함수를 실행하게 된다. -->
	<fb:login-button scope="public_profile,email,user_birthday" onlogin="checkLoginState();"></fb:login-button>
	<div id="status"></div>
<!-- 	<button type="button">facebook Login</button> -->
	<p>Not a member? <a href="#">Sign Up for ItJob</a></p>
	
	<!-- 로그인 form Modal로 팝업처리 -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span> Login
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form">
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-user"></span> Username</label> <input
								type="text" class="form-control" id="usrname"
								placeholder="Enter email">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> Password</label> <input
								type="text" class="form-control" id="psw"
								placeholder="Enter password">
						</div>
						<div class="checkbox">
							<label><input type="checkbox" value="" checked>Remember
								me</label>
						</div>
						<button type="submit" class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-off"></span> Login
						</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger btn-default pull-left"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
					<p>
						Not a member? <a href="#">Sign Up</a>
					</p>
					<p>
						Forgot <a href="#">Password?</a>
					</p>
				</div>
			</div>

		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$("#myBtn").click(function() {
			$("#myModal").modal();
		});
	});
</script>
</body>
</html>