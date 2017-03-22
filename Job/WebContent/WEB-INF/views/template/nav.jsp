<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<style type="text/css">
.navbar {
	margin-bottom: 0;
	background-color: #f4511e;
	z-index: 9999;
	border: 0;
	font-size: 12px !important;
	line-height: 1.42857143 !important;
	letter-spacing: 4px;
	border-radius: 0;
}

.navbar li a, .navbar .navbar-brand {
	color: #fff !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
	color: #f4511e !important;
	background-color: #fff !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #fff !important;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">itJOB</a>
			</div>t + "#";
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/search/company">Search</a></li>
					<li><a href="/compare/form">Compare</a></li>
					<li><a href="/review/list_form">Review</a></li>
					<li><a href="/rank/form">Rank</a></li>
					<li><a href="/contact/form">Contact</a></li>
				<c:choose>
					<c:when test="${auth eq null or auth eq 'no'}">
						<li><a href="/login/form">Login</a></li>
					</c:when>
					<c:when test="${auth eq 'yes'}">
						<li><a href="/my/index">My Page</a></li>
						<li><a href="/login/logout">Logout</a></li>					
					</c:when>
				</c:choose>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>