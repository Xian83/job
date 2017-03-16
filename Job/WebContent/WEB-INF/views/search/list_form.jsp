<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h2>기업 목록</h2>
	<c:forEach var = "one" items ="${list }">
		 ${one.CMPN_NM} <br/>  
	</c:forEach>


