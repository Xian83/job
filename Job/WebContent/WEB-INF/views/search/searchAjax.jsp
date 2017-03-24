<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
.navbar-nav>li {
   margin-left: 30;
   font-size: 12;
}

.well {
   width: 1100;
   border: 2px solid #f45757;
   background-color: #ffffff;
}

body {
   color: #202b69;
}

.btn-group-sm>.btn, .btn-sm {
   border-radius: 20px;
   background-color: rgba(249, 208, 208, 0.99);
   bold: 3px;
   margin-bottom: 6px;
}

.btn-default {
   color: #607D8B;
   border: 2px;
}

.table-bordered {
   border-top: 10px;
}
</style>

<div class="container">
   <table class="table table-bordered">
      <c:forEach var="i" begin="0" end="${list2.list.size()-1}" varStatus="vs">
         <c:if test="${vs.count %2 == 1 }">
            <tr>
         </c:if>
         <td>
            <div class="media">
               <div class="media-left media-middle">
                  <a href="/company/detail?cmpn_nm=${list2.list[i].CMPN_NM }"> <img
                     src="${list2.list[i].LOGO }" class="media-object" style="width: 60px">
                  </a>
               </div>
               <div class="media-body">
                  <a href="/company/detail?cmpn_nm=${list2.list[i].CMPN_NM }"><h4>
                        <b>${list2.list[i].CMPN_NM }</b>
                     </h4></a>
                  <h5>${list2.list[i].DIVISION }|${list2.list[i].SCALE }</h5>
                  <button type="button" class="btn btn-default">재무평가
                     ${list2.list[i].FINANCE_SCORE }점</button>
                  <button type="button" class="btn btn-default">재직자 평판
                     ${list2.list[i].SLAVE_SCORE }점</button>
                  <button type="button" class="btn btn-default">기업비교</button>
               </div>
            </div>
         </td>
         <c:if test="${vs.count %2 == 0 }">
         </c:if>
      </c:forEach>
   </table>
</div> 