<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 

<div class="container" align="center" >

  <ul class="nav nav-tabs" style="width: 80%;">
    <li class="active"><a data-toggle="tab" href="#home">평균연봉순</a></li>
    <li><a data-toggle="tab" href="#menu1">신입연봉순</a></li>
    <li><a data-toggle="tab" href="#menu2">재무평가점수순</a></li>
    <li><a data-toggle="tab" href="#menu3">재직자평가점수순</a></li>
  </ul>
<br/>
  <div class="tab-content" style="width: 80%;">
    <div id="home" class="tab-pane fade in active">
    	<div class="table-responsive">          
		  <table class="table" text-align="center" style="width: 100%;">
		    <thead>
		      <tr>
		        <th>#</th>
		        <th>로고</th>
		        <th>회사명</th>
		        <th>평균연봉</th>
		        <th>비교그래프</th>
		      </tr>
		    </thead>
		    <tbody>
		    <c:forEach var="i" begin="0" end="49">
		      <tr height="50px;">
		        <td>${i+1 }</td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${avg[i] eq null }">
						<img src="/picture/logo.jpg" width="50px;" height="40px;">	            		
	            	</c:when>
	            	<c:otherwise>
		            	<a href="/company/detail?cmpn_nm=${avg[i].CMPN_NM }"><img src="${avg[i].LOGO }" width="50px;" height="40px;" /></a> 
	            	</c:otherwise>
	            </c:choose>
	            </td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${avg[i] eq null }">
						회사명 없음	 
			  	</c:when>
	            	<c:otherwise>
            			<a href="/company/detail?cmpn_nm=${avg[i].CMPN_NM }"><b>${avg[i].CMPN_NM }<b/></a> 
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
		        <td>
		        <c:choose>
	            	<c:when test="${avg[i] eq null }">
						0	 
			  	</c:when>
	            	<c:otherwise>
            			<b><fmt:formatNumber value="${avg[i].AVG_SALARY }" groupingUsed="true"/>원<b/>
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
	            <td>
	            	
	            </td>
		      </tr>
		    </c:forEach>
		    </tbody>
		  </table>
  		</div>
    </div>
    
    <div id="menu1" class="tab-pane fade">
      <div class="table-responsive">          
		  <table class="table" text-align="center" style="width: 100%;">
		    <thead>
		      <tr>
		        <th>#</th>
		        <th>로고</th>
		        <th>회사명</th>
		        <th>신입연봉</th>
		        <th>비교그래프</th>
		      </tr>
		    </thead>
		    <tbody>
		    <c:forEach var="i" begin="0" end="49">
		      <tr height="50px;">
		        <td>${i+1 }</td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${rookie[i] eq null }">
						<img src="/picture/logo.jpg" width="50px;" height="40px;">	            		
	            	</c:when>
	            	<c:otherwise>
		            	<a href="/company/detail?cmpn_nm=${rookie[i].CMPN_NM }"><img src="${rookie[i].LOGO }" width="50px;" height="40px;" /></a> 
	            	</c:otherwise>
	            </c:choose>
	            </td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${rookie[i] eq null }">
						회사명 없음	 
			  	</c:when>
	            	<c:otherwise>
            			<a href="/company/detail?cmpn_nm=${rookie[i].CMPN_NM }"><b>${rookie[i].CMPN_NM }<b/></a> 
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
		        <td>
		        <c:choose>
	            	<c:when test="${rookie[i] eq null }">
						0	 
			  	</c:when>
	            	<c:otherwise>
            			<b><fmt:formatNumber value="${rookie[i].ROOKIE_SALARY }" groupingUsed="true"/>원<b/>
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
	            <td>
	            	그래프자리
	            </td>
		      </tr>
		    </c:forEach>
		    </tbody>
		  </table>
  		</div>
    </div>
    <div id="menu2" class="tab-pane fade">
      <div class="table-responsive">          
		  <table class="table" text-align="center" style="width: 100%;">
		    <thead>
		      <tr>
		        <th>#</th>
		        <th>로고</th>
		        <th>회사명</th>
		        <th>재무평가</th>
		        <th>비교그래프</th>
		      </tr>
		    </thead>
		    <tbody>
		    <c:forEach var="i" begin="0" end="49">
		      <tr height="50px;">
		        <td>${i+1 }</td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${finance[i] eq null }">
						<img src="/picture/logo.jpg" width="50px;" height="40px;">	            		
	            	</c:when>
	            	<c:otherwise>
		            	<a href="/company/detail?cmpn_nm=${finance[i].CMPN_NM }"><img src="${finance[i].LOGO }" width="50px;" height="40px;" /></a> 
	            	</c:otherwise>
	            </c:choose>
	            </td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${finance[i] eq null }">
						회사명 없음	 
			  	</c:when>
	            	<c:otherwise>
            			<a href="/company/detail?cmpn_nm=${finance[i].CMPN_NM }"><b>${finance[i].CMPN_NM }<b/></a> 
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
		        <td>
		        <c:choose>
	            	<c:when test="${finance[i] eq null }">
						0	 
			  	</c:when>
	            	<c:otherwise>
            			<b><fmt:formatNumber value="${finance[i].FINANCE_SCORE }" groupingUsed="true"/>점<b/>
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
	            <td>
	            	그래프자리
	            </td>
		      </tr>
		    </c:forEach>
		    </tbody>
		  </table>
  		</div>
    </div>
    <div id="menu3" class="tab-pane fade">
      <div class="table-responsive">          
		  <table class="table" text-align="center" style="width: 100%;">
		    <thead>
		      <tr>
		        <th>#</th>
		        <th>로고</th>
		        <th>회사명</th>
		        <th>재직자평점</th>
		        <th>비교그래프</th>
		      </tr>
		    </thead>
		    <tbody>
		    <c:forEach var="i" begin="0" end="49">
		      <tr height="50px;">
		        <td>${i+1 }</td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${employee[i] eq null }">
						<img src="/picture/logo.jpg" width="50px;" height="40px;">	            		
	            	</c:when>
	            	<c:otherwise>
		            	<a href="/company/detail?cmpn_nm=${employee[i].CMPN_NM }"><img src="${employee[i].LOGO }" width="50px;" height="40px;" /></a> 
	            	</c:otherwise>
	            </c:choose>
	            </td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${employee[i] eq null }">
						회사명 없음	 
			  	</c:when>
	            	<c:otherwise>
            			<a href="/company/detail?cmpn_nm=${employee[i].CMPN_NM }"><b>${employee[i].CMPN_NM }<b/></a> 
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
		        <td>
		        <c:choose>
	            	<c:when test="${employee[i] eq null }">
						0	 
			  	</c:when>
	            	<c:otherwise>
            			<b><fmt:formatNumber value="${employee[i].EMPLOYEE_SCORE }" groupingUsed="true"/>점<b/>
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
	            <td>
	            	그래프자리
	            </td>
		      </tr>
		    </c:forEach>
		    </tbody>
		  </table>
  		</div>
    </div>
  </div>
</div>


