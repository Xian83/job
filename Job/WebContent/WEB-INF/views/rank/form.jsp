<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 

<div class="container" align="center" >

  <ul class="nav nav-tabs" style="width: 80%;">
    <li class="active"><a data-toggle="tab" href="#home" style="font-size: large;"><b>평균연봉순</b></a></li>
    <li><a data-toggle="tab" href="#menu1" style="font-size: large;"><b>신입연봉순</b></a></li>
    <li><a data-toggle="tab" href="#menu2" style="font-size: large;"><b>재무평가점수순</b></a></li>
   <!--  <li><a data-toggle="tab" href="#menu3">재직자평가점수순</a></li> -->
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
		        <th>분야</th>
		        <th>규모</th>
		        <th>평균연봉</th>
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
		            	<a href="/company?cmpn_nm=${avg[i].CMPN_NM }"><img src="${avg[i].LOGO }" width="50px;" height="40px;" /></a> 
	            	</c:otherwise>
	            </c:choose>
	            </td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${avg[i] eq null }">
						회사명 없음	 
			  	</c:when>
	            	<c:otherwise>
            			<a href="/company?cmpn_nm=${avg[i].CMPN_NM }"><b>${avg[i].CMPN_NM }<b/></a> 
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
	            <td>
	            <c:choose>
	            	<c:when test="${avg[i] eq null }">
						정보없음	 
			  	    </c:when>
	            	<c:otherwise>
            			<b>${avg[i].DIVISION }<b/> 
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
	            <td>
	            <c:choose>
	            	<c:when test="${avg[i] eq null }">
						정보없음	 
			  	    </c:when>
	            	<c:otherwise>
            			<b>${avg[i].SCALE }<b/>
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
		        <td>
		        <c:choose>
	            	<c:when test="${avg[i] eq null }">
						0	 
			  	</c:when>
	            	<c:otherwise>
            			<b>
            				<c:choose>
                           	   <c:when test="${avg[i].AVG_SALARY / 10000 gt 4} ">
                           	   	<fmt:formatNumber value="${avg[i].AVG_SALARY / 10000 +1}" groupingUsed="true"/>(만원)</p><br/>
                           	   </c:when>
                           	   <c:otherwise>
                           	   	<fmt:formatNumber value="${avg[i].AVG_SALARY / 10000 }" groupingUsed="true"/>(만원)</p><br/>
                           	   </c:otherwise>
                           </c:choose>
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
		        <th>분야</th>
		        <th>규모</th>
		        <th>신입연봉</th>
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
		            	<a href="/company?cmpn_nm=${rookie[i].CMPN_NM }"><img src="${rookie[i].LOGO }" width="50px;" height="40px;" /></a> 
	            	</c:otherwise>
	            </c:choose>
	            </td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${rookie[i] eq null }">
						회사명 없음	 
			  	</c:when>
	            	<c:otherwise>
            			<a href="/company?cmpn_nm=${rookie[i].CMPN_NM }"><b>${rookie[i].CMPN_NM }<b/></a> 
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
	            <td>
	            <c:choose>
	            	<c:when test="${rookie[i] eq null }">
						정보없음	 
			  	    </c:when>
	            	<c:otherwise>
            			<b>${rookie[i].DIVISION }<b/>
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
	            <td>
	            <c:choose>
	            	<c:when test="${rookie[i] eq null }">
						정보없음	 
			  	    </c:when>
	            	<c:otherwise>
            			<b>${rookie[i].SCALE }<b/>
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
		        <td>
		        <c:choose>
	            	<c:when test="${rookie[i] eq null }">
						0	 
			  	</c:when>
	            	<c:otherwise>
            			<b>
            				<c:choose>
                           	   <c:when test="${rookie[i].AVG_SALARY / 10000 gt 4} ">
                           	   	<fmt:formatNumber value="${rookie[i].ROOKIE_SALARY / 10000 +1}" groupingUsed="true"/>(만원)</p><br/>
                           	   </c:when>
                           	   <c:otherwise>
                           	   	<fmt:formatNumber value="${rookie[i].ROOKIE_SALARY / 10000 }" groupingUsed="true"/>(만원)</p><br/>
                           	   </c:otherwise>
                           </c:choose>
            	    </c:otherwise>
	            </c:choose>
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
		        <th>분야</th>
		        <th>규모</th>
		        <th>재무평가점수</th>
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
		            	<a href="/company?cmpn_nm=${finance[i].CMPN_NM }"><img src="${finance[i].LOGO }" width="50px;" height="40px;" /></a> 
	            	</c:otherwise>
	            </c:choose>
	            </td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${finance[i] eq null }">
						회사명 없음	 
			  	</c:when>
	            	<c:otherwise>
            			<a href="/company?cmpn_nm=${finance[i].CMPN_NM }"><b>${finance[i].CMPN_NM }<b/></a> 
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
	            <td>
	            <c:choose>
	            	<c:when test="${finance[i] eq null }">
						정보없음	 
			  	    </c:when>
	            	<c:otherwise>
            			<b>${finance[i].DIVISION }<b/>
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
	            <td>
	            <c:choose>
	            	<c:when test="${finance[i] eq null }">
						정보없음	 
			  	    </c:when>
	            	<c:otherwise>
            			<b>${finance[i].SCALE }<b/>
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
	            
	            
		      </tr>
		    </c:forEach>
		    </tbody>
		  </table>
  		</div>
    </div>
    <!-- 삭제한 재직자평가부분 내용 -->
    <%-- <div id="menu3" class="tab-pane fade">
      <div class="table-responsive">          
		  <table class="table" text-align="center" style="width: 100%;">
		    <thead>
		      <tr>
		        <th>#</th>
		        <th>로고</th>
		        <th>회사명</th>
		        <th>분야</th>
		        <th>규모</th>
		        <th>재직자평가점수</th>
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
		            	<a href="/company?cmpn_nm=${employee[i].CMPN_NM }"><img src="${employee[i].LOGO }" width="50px;" height="40px;" /></a> 
	            	</c:otherwise>
	            </c:choose>
	            </td>
		        
		        <td>
		        <c:choose>
	            	<c:when test="${employee[i] eq null }">
						회사명 없음	 
			  	</c:when>
	            	<c:otherwise>
            			<a href="/company?cmpn_nm=${employee[i].CMPN_NM }"><b>${employee[i].CMPN_NM }<b/></a> 
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
	            <td>
	            <c:choose>
	            	<c:when test="${employee[i] eq null }">
						정보없음	 
			  	    </c:when>
	            	<c:otherwise>
            			<b>${employee[i].DIVISION }<b/>
            	    </c:otherwise>
	            </c:choose>
	            </td>
	            
	            <td>
	            <c:choose>
	            	<c:when test="${employee[i] eq null }">
						정보없음	 
			  	    </c:when>
	            	<c:otherwise>
            			<b>${employee[i].SCALE }<b/>
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
	            
		      </tr>
		    </c:forEach>
		    </tbody>
		  </table>
  		</div>
    </div> --%>
  </div>
</div>

