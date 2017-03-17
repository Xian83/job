<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>로그인 결과</h2>
<c:choose>
	<c:when test="${rst }">
		<h2>회원정보 일치!! <b>2초</b> 후 메인 페이지로 이동합니다.</h2>
		<meta http-equiv="refresh" content="2;url=/" />
	</c:when>
	<c:otherwise>
		<h2>회원정보 불일치! <b>2초</b> 후 로그인 페이지로 이동합니다.</h2>
		<meta http-equiv="refresh" content="2;url=/login" />
	</c:otherwise>
</c:choose>
