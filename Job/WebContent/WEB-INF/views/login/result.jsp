<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${rst }">
		<meta http-equiv="refresh" content="0.1;url=${url }" />
	</c:when>
	<c:otherwise>
		<h2>로그인실패</h2>
		<meta http-equiv="refresh" content="0.5;url=${url }" />
	</c:otherwise>
</c:choose>
