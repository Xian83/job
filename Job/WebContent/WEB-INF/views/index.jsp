<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
	</script>
<html>
 <meta charset="utf-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
       <!--  <link href="css/font-awesome.min.css" rel="stylesheet"> -->
 
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
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
		<input type="text" name="search" id="search" placeholder="Search.." />
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

<c:forEach var = "one" items ="${list }">
		 ${one.CMPN_NM} <br/>  
	</c:forEach>
 