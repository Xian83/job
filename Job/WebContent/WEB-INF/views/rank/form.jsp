<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
   

<div class="container" >

  <ul class="nav nav-tabs" style="width: 100%;">
    <li class="active"><a data-toggle="tab" href="/rank/form">평균연봉순</a></li>
    <li><a data-toggle="tab" href="/rank/rookeysalary">신입연봉순</a></li>
    <li><a data-toggle="tab" href="/rank/form">재무평가점수순</a></li>
    <li><a data-toggle="tab" href="/rank/form">재직자평가순</a></li>
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
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
  </div>
</div>









<%-- <div class="container">
   <table class="table table-bordered">
      <c:forEach var="i" begin="0" end="49">
         <tr>
         	<td text-align="center">
         		<br/><br/>
         		<i>${i+1 }</i>
         	</td>
            <td>
            <div class="media">
            <div class="media-left media-middle">
	            <c:choose>
	            	<c:when test="${list[i] eq null }">
						<img src="/picture/logo.jpg" width="100" height="70">	            		
	            	</c:when>
	            	<c:otherwise>
		            	<a href="/company/detail?cmpn_nm=${list[i].CMPN_NM }"><img src="${list[i].LOGO }" width="100" height="70" /></a> 
	            	</c:otherwise>
	            </c:choose>
         	</div>
            <div class="media-body">
            
               <c:choose>
	            	<c:when test="${list[i] eq null }">
						회사명 없음	 
						<h5>산업군 내용없음</h5> 
						<button type="button" class="btn btn-default">재무평가 0점</button>  
             		    <button type="button" class="btn btn-default">재직자 평판 0점</button>  
              			<button type="button" class="btn btn-default">기업비교</button>
              			<button type="button" class="btn btn-default">평균연봉 0</button> </td>           		
	            	</c:when>
	            	<c:otherwise>
            			<a href="/company/detail?cmpn_nm=${list[i].CMPN_NM }"><h4><b>${list[i].CMPN_NM }<b/></h4></a> 
            			<h5>${list[i].DIVISION } | ${list[i].SCALE }</h5> 
            			<button type="button" class="btn btn-default">재무평가 ${list[i].FINANCE_SCORE }점</button>  
             		    <button type="button" class="btn btn-default">재직자 평판 ${list[i].EMPLOYEE_SCORE }점</button>  
              			<button type="button" class="btn btn-default">기업비교</button>
              			<button type="button" class="btn btn-default">평균연봉 ${list[i].AVG_SALARY }</button> </td>
		            </c:otherwise>
	            </c:choose>
            
           	</td>
            </div>
 			</td>              
         </tr>
      </c:forEach>
               
   </table>
</div> --%>
               
               