<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<h2>추천기업</h2>
<hr/>
<div class="row">
	<c:forEach var="i" items="${list }">
	<div class="col-md-2">
		<div class="thumbnail">
			<a href="/company?cmpn_nm=${i.CMPN_NM}"> 
				<img src="${i.LOGO }"	alt="Lights" style="width: 100%">
				<div class="caption">
					<p align="center">
						${i.CMPN_NM }<br/>
						평균 ${i.SALARY/10000 }만원
					</p>
				</div>
			</a>
		</div>
	</div>
	</c:forEach>
</div>
