<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>관심정보 추가 결과</h2>
<c:choose>
	<c:when test="${cnt }">
		<h2>관심정보 추가 성공!! <b>2초</b> 후 메인 페이지로 이동합니다.</h2>
		<meta http-equiv="refresh" content="2;url=/" />
	</c:when>
	<c:otherwise>
		<h2>관심정보 추가 실패!! <b>2초</b> 후 로그인 페이지로 이동합니다.</h2>
		<meta http-equiv="refresh" content="2;url=/login/form" />
	</c:otherwise>
</c:choose>
