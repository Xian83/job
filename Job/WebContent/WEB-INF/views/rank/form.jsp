<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<h2>순위 뿌려주는 페이지</h2>

<c:forEach var="obj" items="${list }" begin="1" end="50">
	회사명 : ${obj.CMPN_NM } | 평균연봉 : ${obj.AVG_SALARY } <br/>
</c:forEach>