<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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

.w3-myfont {
	font-family: "Comic Sans MS", cursive, sans-serif;
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
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.';
			} else {
				// 페이스북에 로그인이 되어있지 않다. 따라서, 앱에 로그인이 되어있는지 여부가 불확실하다. 
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into Facebook.';
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
				appId : '1907163846218532', // App ID 
				cookie : true, // 쿠키가 세션을 참조할 수 있도록 허용 
				xfbml : true, // 소셜 플러그인이 있으면 처리 
				version : 'v2.8' // 버전 2.8 사용 
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
		}(document, 'script', 'facebook-jssdk'));

		// 로그인이 성공한 다음에는 간단한 그래프API를 호출한다. 
		// 이 호출은 statusChangeCallback()에서 이루어진다. 
		function login() {
			FB.api('/me?fields=id,name,email,first_name,last_name,birthday',
			function(response) {
				$.ajax({
					"url" : "/login/fbLogin",
					"method" : "post",
					"data" : {
						"info" : JSON.stringify(response)
					}
				}).done(
					function(rst) {
						if (rst) {
							$("#status").append(" 로그인 성공<br/>");
						} else {
							location.replace("/");
						}
					});
			});
		}
	</script>
<div align="center">
	<img src="/500.jpg" class="w3-block" alt="forest" style="width: 50%" height="50%">
	<br/>
</div>
	<div align="center" class="w3-container " >

		<button
			onclick="document.getElementById('id01').style.display='block'"
			class="w3-button w3-black w3-large">Login</button>

		<div id="id01" class="w3-modal">
			<div class="w3-modal-content w3-card-4 w3-animate-zoom"
				style="max-width: 600px;">

				<div class="w3-center">
					<br> <span
						onclick="document.getElementById('id01').style.display='none'"
						class="w3-button w3-xlarge w3-hover-red w3-display-topright"
						title="Close Modal">&times;</span>
					<h2>
						<p class="w3-xxlarge w3-myfont">Welcome To ItJob</p>
					</h2>
				</div>

				<form action="/login/result" method="post">
					<div class="w3-section">
						<label><b>email</b></label> <input
							class="w3-input w3-border w3-margin-bottom" type="text"
							placeholder="Enter Useremail" name="email" id="flag1" required>
						<label><b>Password</b></label> <input class="w3-input w3-border"
							type="password" placeholder="Enter Password" name="pass"
							id="flag2" required>
						<button class="w3-button w3-block w3-green w3-section w3-padding"
							type="submit">Login</button>
						<input class="w3-check w3-margin-top" type="checkbox" name="keep"
							checked> 로그인유지
					</div>
					<!-- facebook 로그인 버튼 -->
					<fb:login-button scope="public_profile,email,user_birthday"
						onlogin="checkLoginState();" data-auto-logout-link="true"></fb:login-button>
					<!-- 			<div class="fb-login-button" data-max-rows="4" data-size="pinterest" data-show-faces="false" data-auto-logout-link="true"></div> -->
					<div id="status"></div>
				</form>

				<div class="w3-container w3-border-top w3-padding-16 w3-light-grey" align="left">
					<button
						onclick="document.getElementById('id01').style.display='none'"
						type="button" class="w3-button w3-red">취소</button>
					<span class="w3-right w3-padding w3-hide-small"> <a href="/join/step01">회원가입</a></span>
				</div>

			</div>
		</div>
		<p>
		
		<p class="w3-large w3-myfont">아직 회원이 아니십니까? <span style="color: blue;"><a href="/join/step01"><i>회원가입 페이지로 이동</i></a></span></p>
		</p>
	</div>





	<!-- 	<div class="well">
		<form action="/login/result" method="post">

			facebook 로그인 버튼
			<fb:login-button scope="public_profile,email,user_birthday"
				onlogin="checkLoginState();" data-auto-logout-link="true"></fb:login-button>
						<div class="fb-login-button" data-max-rows="4" data-size="pinterest" data-show-faces="false" data-auto-logout-link="true"></div>
			<div id="status"></div>

		</form>
	</div> -->
</body>
</html>