<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<h2>순위 뿌려주는 페이지</h2>
<div class="well">
	<b> 순위 조건 </b><br /> 
			<!-- <select class="form-control" name="category">
				<option value="salary">연봉순</option>
				<option value="local">지역별</option>
			</select> -->
			<form action="/rank/sortsalary">
				<button type="submit" name="salary"> 연봉순 </button>
			</form>
			<form action="/rank/sortlocal">
				<select class="form-control" name="local">
					<option value="seoul">서울</option>
					<option value="geonggi">경기</option>
				</select> 
				<button type="submit"> 확인 </button> 
			</form>
</div>

<c:forEach var="obj" items="${list }" begin="1" end="50">
	회사명 : ${obj.CMPN_NM } <%-- | 연봉 : ${obj.AVG_SALARY } --%> <br/>
</c:forEach>