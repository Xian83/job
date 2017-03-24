<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    


<div class="container" >

  <ul class="nav nav-tabs" style="width: 100%;">
    <li class="active"><a data-toggle="tab" href="#home">평균연봉순</a></li>
    <li><a data-toggle="tab" href="#menu1">신입연봉순</a></li>
    <li><a data-toggle="tab" href="#menu2">재무평가점수순</a></li>
    <li><a data-toggle="tab" href="#menu3">재직자평가순</a></li>
  </ul>
<br/>
  <div class="tab-content" style="width: 100%;">
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
	            	<c:when test="${list[i] eq null }">
						<img src="/picture/logo.jpg" width="50px;" height="40px;">	            		
	            	</c:when>
	            	<c:otherwise>
		            	<a href="/company/detail?cmpn_nm=${list[i].CMPN_NM }"><img src="${list[i].LOGO }" width="50px;" height="40px;" /></a> 
	            	</c:otherwise>
	            </c:choose>
	            </td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${list[i] eq null }">
						회사명 없음	 
			  	</c:when>
	            	<c:otherwise>
            			<a href="/company/detail?cmpn_nm=${list[i].CMPN_NM }"><b>${list[i].CMPN_NM }<b/></a> 
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
		        <td>
		        <c:choose>
	            	<c:when test="${list[i] eq null }">
						0	 
			  	</c:when>
	            	<c:otherwise>
            			<b>${list[i].AVG_SALARY }<b/>
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
    
    <div id="menu1" class="tab-pane fade">
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
	            	<c:when test="${list[i] eq null }">
						<img src="/picture/logo.jpg" width="50px;" height="40px;">	            		
	            	</c:when>
	            	<c:otherwise>
		            	<a href="/company/detail?cmpn_nm=${list[i].CMPN_NM }"><img src="${list[i].LOGO }" width="50px;" height="40px;" /></a> 
	            	</c:otherwise>
	            </c:choose>
	            </td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${list[i] eq null }">
						회사명 없음	 
			  	</c:when>
	            	<c:otherwise>
            			<a href="/company/detail?cmpn_nm=${list[i].CMPN_NM }"><b>${list[i].CMPN_NM }<b/></a> 
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
		        <td>
		        <c:choose>
	            	<c:when test="${list[i] eq null }">
						0	 
			  	</c:when>
	            	<c:otherwise>
            			<b>${list[i].AVG_SALARY }<b/>
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
	            	<c:when test="${list[i] eq null }">
						<img src="/picture/logo.jpg" width="50px;" height="40px;">	            		
	            	</c:when>
	            	<c:otherwise>
		            	<a href="/company/detail?cmpn_nm=${list[i].CMPN_NM }"><img src="${list[i].LOGO }" width="50px;" height="40px;" /></a> 
	            	</c:otherwise>
	            </c:choose>
	            </td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${list[i] eq null }">
						회사명 없음	 
			  	</c:when>
	            	<c:otherwise>
            			<a href="/company/detail?cmpn_nm=${list[i].CMPN_NM }"><b>${list[i].CMPN_NM }<b/></a> 
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
		        <td>
		        <c:choose>
	            	<c:when test="${list[i] eq null }">
						0	 
			  	</c:when>
	            	<c:otherwise>
            			<b>${list[i].AVG_SALARY }<b/>
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
	            	<c:when test="${list[i] eq null }">
						<img src="/picture/logo.jpg" width="50px;" height="40px;">	            		
	            	</c:when>
	            	<c:otherwise>
		            	<a href="/company/detail?cmpn_nm=${list[i].CMPN_NM }"><img src="${list[i].LOGO }" width="50px;" height="40px;" /></a> 
	            	</c:otherwise>
	            </c:choose>
	            </td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${list[i] eq null }">
						회사명 없음	 
			  	</c:when>
	            	<c:otherwise>
            			<a href="/company/detail?cmpn_nm=${list[i].CMPN_NM }"><b>${list[i].CMPN_NM }<b/></a> 
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
		        <td>
		        <c:choose>
	            	<c:when test="${list[i] eq null }">
						0	 
			  	</c:when>
	            	<c:otherwise>
            			<b>${list[i].AVG_SALARY }<b/>
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

               
               