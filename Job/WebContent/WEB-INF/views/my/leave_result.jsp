<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:choose>
	<c:when test="${rst ne 'true' }">
		<h2>탈퇴 성공!! <b>2초</b> 후 메인 페이지로 이동합니다.</h2>
		<meta http-equiv="refresh" content="2;url=/" />
	</c:when>
	<c:otherwise>
		<h2>탈퇴 실패! <b>2초</b> 후 메인 페이지로 이동합니다.</h2>
		<meta http-equiv="refresh" content="2;url=/" />
	</c:otherwise>
</c:choose>