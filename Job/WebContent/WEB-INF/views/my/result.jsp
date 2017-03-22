<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>관심정보 결과</h2>
<c:choose>
	<c:when test="${rst ne 1 }">
		<h2>변경 성공!! <b>2초</b> 후 이전 페이지로 이동합니다.</h2>
		<meta http-equiv="refresh" content="2;url=/my/info" />
	</c:when>
	<c:otherwise>
		<h2>변경 실패! <b>2초</b> 후 이전 페이지로 이동합니다.</h2>
		<meta http-equiv="refresh" content="2;url=/my/info" />
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${rst2 ne 1 }">
		<h2>변경 성공!! <b>2초</b> 후 이전 페이지로 이동합니다.</h2>
		<meta http-equiv="refresh" content="2;url=/my/info" />
	</c:when>
	<c:otherwise>
		<h2>변경 실패! <b>2초</b> 후 이전 페이지로 이동합니다.</h2>
		<meta http-equiv="refresh" content="2;url=/my/info" />
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${rst3 ne 1 }">
		<h2>변경 성공!! <b>2초</b> 후 이전 페이지로 이동합니다.</h2>
		<meta http-equiv="refresh" content="2;url=/my/info" />
	</c:when>
	<c:otherwise>
		<h2>변경 실패! <b>2초</b> 후 이전 페이지로 이동합니다.</h2>
		<meta http-equiv="refresh" content="2;url=/my/info" />
	</c:otherwise>
</c:choose>