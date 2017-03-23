<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style>
.jumbotron {
	background-color: #f4511e;
	color: #fff;
	padding: 10px 25px;
}

#search {
	width: 300px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	color: black;
	background-color: white;
	background-image: url('http://herald.dawn.com/_img/search.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	padding: 12px 20px 12px 40px;
	-webkit-transition: width 0.4s ease-in-out;
	transition: width 0.4s ease-in-out;
}

#search:focus {
	width: 85%;
}
</style>
</head>
<body>
	<div align="center" class="jumbotron" style="padding-top: 150px;">
		<h2>이력서 쓰기전에, 면접가기 전에</h2><br/>
		<form action="/search/company">
			<input type="text" name="search" id="search" placeholder="궁금한 기업명 입력" />
		</form>
	</div>
</body>
</html>
<script>
 $("#search").keyup(function(){
	$.ajax({
		"url" : "search/index_search?q="+$(this).val()    
	}).done(function (q) {			
		$("#result").append(q+"<br/>");	
	});
})
</script>