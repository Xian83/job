<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<head>
<title>itJOB</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<div style="min-height: 5%;">
		<tiles:insertAttribute name="nav" />
	</div>
	<div style="min-height: 20%;">
		<tiles:insertAttribute name="header" />
	</div>
	<div style="min-height: 60%; margin-left: 10px; margin-right: 10px;">
		<div class="row">
		<div class="col-md-10">
			<tiles:insertAttribute name="main" />
		</div>
		<div class="col-md-2">
			<tiles:insertAttribute name="right" />
		</div>
		</div>
	</div>
	<div style="min-height: 15%;">
		<tiles:insertAttribute name="footer" />
	</div>	
</body>
</html>