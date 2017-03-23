<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<head>
<title>itJOB</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




<style>
.logo-small {
	color: #f4511e;
	font-size: 50px;
}

.logo {
	color: #f4511e;
	font-size: 200px;
}

</style>

</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

	<div style="min-height: 5%;">
		<tiles:insertAttribute name="nav" />
	</div>
	<div style="min-height: 20%;">
		<tiles:insertAttribute name="header" />
	</div>
	<div style="min-height: 65%; margin-left: 50px; margin-right: 50px;">
		<tiles:insertAttribute name="main" />
	</div>
	<div style="min-height: 10%;">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>