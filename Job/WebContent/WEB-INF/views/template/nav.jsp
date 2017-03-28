<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
.navbar {
	margin-bottom: 0;
	background-color: #f4511e;
	z-index: 9999;
	border: 0;
	font-size: 12px !important;
	letter-spacing: 4px;
	border-radius: 0;
	height: 20px;
}

.navbar li a {
	color: #fff !important;
}

.navbar .navbar-brand {
	color: #fff !important;
}

.navbar-nav li.active a {
	color: #f4511e !important;
	background-color: #fff !important;
}

.navbar-nav li a:hover {
	color: #f4511e !important;
	background-color: #fff !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #fff !important;
}
</style>
<nav
	class="navbar navbar-default navbar-fixed-top navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">itJOB</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right nav navbar-nav w3-padding">
				<li><a href="/search/company" class="w3-bar-item w3-button w3-mobile">Search</a></li>
				<li class="dropdown"><a class="dropdown-toggl w3-bar-item w3-button w3-mobilee"
					data-toggle="dropdown" href="#" >Company<span class="caret"></span></a>
					<ul class="dropdown-menu"
						style="background: #f4511e; min-width: 1px">
						<li><a href="/compare/form">Compare</a></li>
						<li><a href="/review/list_form">Review</a></li>
						<li><a href="/rank/form">Rank</a></li>
					</ul></li>
				<li><a href="/contact/form" class="w3-bar-item w3-button w3-mobile">Contact</a></li>
				<c:choose>
					<c:when test="${auth eq null or auth eq 'no'}">
						<li><a href="/login/form" class="w3-bar-item w3-button w3-mobile">Login</a></li>
					</c:when>
					<c:when test="${auth eq 'yes'}">
						<li><a href="/my/company" class="w3-bar-item w3-button w3-mobile">My Page</a></li>
						<li><a href="/login/logout" class="w3-bar-item w3-button w3-mobile">Logout</a></li>
					</c:when>
				</c:choose>
				<li><form action="/search/company" >
					<input type="text" name="search" class="w3-bar-item form-control"
						placeholder="회사명" style="display: inline-block; width: 150px; height: 50%; margin-top: 10px; ">
					<button class="btn btn-default " type="submit" ><i class="glyphicon glyphicon-search"></i></button>
				</form>
				</li>
			</ul>
		</div>
	</div>
</nav>