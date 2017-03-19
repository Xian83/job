<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<div class="container">
	<b> 순위 조건 </b><br /> 
			
				<a href="/rank/form"> <button type="submit"> 평균연봉순 </button> </a>
		
				<a href="/rank/rookeysalary"> <button type="submit"> 신입연봉순 </button> </a>
				
				<a href="/rank/financescore"> <button type="submit"> 재무평가점수순 </button> </a>
				
				<a href="/rank/slavescore"> <button type="submit"> 재직자평가순 </button> </a>
		
</div>


<div class="container">
   <table class="table table-bordered">
      <c:forEach var="i" begin="0" end="49">
         <tr>
        
            <td>
            <div class="media">
            <div class="media-left media-middle">
            <a href="/company/detail?cmpn_nm=${list2[i].CMPN_NM }"><img src="${list2[i].LOGO }" width="100" height="70" /></a> 
         	</div>
            <div class="media-body">
            <a href="/company/detail?cmpn_nm=${list2[i].CMPN_NM }"><h4><b>${list2[i].CMPN_NM }<b/></h4></a> <h5>${list2[i].DIVISION } | ${list2[i].SCALE }</h5> 
               <button type="button" class="btn btn-default">재무평가 ${list2[i].FINANCE_SCORE }점</button>  
               <button type="button" class="btn btn-default">재직자 평판 ${list2[i].FINANCE_SCORE }점</button>  
               <button type="button" class="btn btn-default">기업비교</button>
              
	           <button type="button" class="btn btn-default">신입연봉 ${list1[i].ROOKEY_SALARY }</button> </td>
            </div>
 			</td>              
         </tr>
      </c:forEach>
               
   </table>
</div>
               
               