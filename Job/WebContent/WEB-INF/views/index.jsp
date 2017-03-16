<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<style>
		input[type=text] {
			width: 130px;
			box-sizing: border-box;
			border: 2px solid #ccc;
			border-radius: 4px;
			font-size: 16px;
			background-color: white;
			background-image: url('http://herald.dawn.com/_img/search.png');
			background-position: 10px 10px;
			background-repeat: no-repeat;
			padding: 12px 20px 12px 40px;
			-webkit-transition: width 0.4s ease-in-out;
			transition: width 0.4s ease-in-out;
		}
		
		input[type=text]:focus {
			width: 100%;
		}
	</style>
</head>
<body>
	<h1>검색 테스트용</h1>
	<div align="center">
	<form action="/search/name">
		<input type="text" name="search" placeholder="Search.." />
	</form>
	</div>
</body>
</html>