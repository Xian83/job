<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<h2>순위 뿌려주는 페이지</h2>
<div class="container">
	<b> 순위 조건 </b><br /> 
			<!-- <select class="form-control" name="category">
				<option value="salary">연봉순</option>
				<option value="local">지역별</option>
			</select> -->
			<form action="/rank/avgsalary">
				<button type="submit" name="avgsalary"> 평균연봉순 </button>
				
			</form>
			<form action="/rank/rookeysalary">
		
				<button type="submit" name="rookeysalary"> 신입연봉순 </button>
			</form>
			
		<!-- 	<form action="/rank/sortlocal">
				<select class="form-control" name="local">
					<option value="seoul">서울</option>
					<option value="geonggi">경기</option>
				</select> 
				<button type="submit"> 확인 </button> 
			</form> -->
</div>

<%-- <div class="container">
   <table class="table table-bordered">
 		<c:forEach var="obj" items="${list }" begin="1" end="50">
			<tr>
	 		<td>회사명 : <a href="/company/detail"> ${obj.CMPN_NM } </a> | 연봉 : ${obj.AVG_SALARY } <br/></td>
		 	</tr>
		</c:forEach> 
	</table>
</div> --%>

<div class="container">
   <table class="table table-bordered">
      <c:forEach var="i" begin="0" end="49">
         <tr>
            <td><a href="company/detail_form.jsp"><img src="${list2[i].LOGO }" width="100" height="70" /></a> <a
href="company/detail_form.jsp"><h4><b>${obj.CMPN_NM }<b/></h4></a> <h5>${list2[i].DIVISION } | ${list2[i].SCALE }</h5> 
               <button type="button" class="btn btn-default">재무평가 ${list2[i].FINANCE_SCORE }점</button>  
               <button type="button" class="btn btn-default">재직자 평판 ${list2[i].FINANCE_SCORE }점</button>  
               <button type="button" class="btn btn-default">기업비교</button>
              
	           <button type="button" class="btn btn-default">평균연봉 ${list1[i].AVG_SALARY }</button> </td>
               
 			</td>              
         </tr>
      </c:forEach>
               
   </table>
</div>
               
               