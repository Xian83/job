<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<h2>비교 페이지</h2>
<!-- 처음뿌려지는 쿠키리스트가 가장 먼저본 기업 -->
<c:forEach var="i" begin="0" end="0"> 
	${clist[i] } <br/>
</c:forEach>