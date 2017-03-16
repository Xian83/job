<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<title>${title }</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div style="min-height: 5%;">
		<tiles:insertAttribute name="header" />
	</div>
	<div>
		<tiles:insertAttribute name="nav" />
	</div>
	<div style="min-height: 80%; margin-left: 50px; margin-right: 50px;">
		<tiles:insertAttribute name="main" />
	</div>
	<div style="min-height: 10%;">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>