<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<ul class="nav navbar-nav navbar-right nav navbar-nav">
					<li><a href="/search/company">Search</a></li>
					<li class="dropdown"><a class="dropdown-toggle" 
						data-toggle="dropdown" href="#">Company<span class="caret"></span></a>
						<ul class="dropdown-menu" style="background: #f4511e; width: 0px; ">
							<li><a href="/compare/form">Compare</a></li>
							<li><a href="/review/list_form">Review</a></li>
							<li><a href="/rank/form">Rank</a></li>
						</ul></li>
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