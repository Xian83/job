<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    

<div class="container">
	
			<a href="/rank/form"> <button type="submit"> 평균연봉순 </button> </a>
			<a href="/rank/rookie"> <button type="submit"> 신입연봉순 </button> </a>
			<a href="/rank/finance"> <button type="submit"> 재무평가점수순 </button> </a>
			<a href="/rank/employee"> <button type="submit"> 재직자평가순 </button> </a>
</div>


<div class="container">
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
              			<button type="button" class="btn btn-default">신입연봉 0</button> </td>           		
	            	</c:when>
	            	<c:otherwise>
            			<a href="/company/detail?cmpn_nm=${list[i].CMPN_NM }"><h4><b>${list[i].CMPN_NM }<b/></h4></a> 
            			<h5>${list[i].DIVISION } | ${list[i].SCALE }</h5> 
            			<button type="button" class="btn btn-default">재무평가 ${list[i].FINANCE_SCORE }점</button>  
             		    <button type="button" class="btn btn-default">재직자 평판 ${list[i].EMPLOYEE_SCORE }점</button>  
              			<button type="button" class="btn btn-default">기업비교</button>
              			<button type="button" class="btn btn-default">신입연봉 ${list[i].ROOKIE_SALARY }</button> </td>
		            </c:otherwise>
	            </c:choose>
            
           	</td>
            </div>
 			</td>              
         </tr>
      </c:forEach>
               
   </table>
</div>
               
               