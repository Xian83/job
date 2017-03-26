<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--  carousel -->
<style>
.carousel-inner>.item>.container, .carousel-inner>.item>a>img {
   width: 70%;
   margin: auto;
}

.thumbnail {
   margin-bottom: 0;
}
</style>


   <div class="col-md-12" style="margin-bottom: 20px;">
      <div class="container">
         <br>
         <div id="myCarousel" class="carousel slide" style="width: 100%;">
            <!-- Indicators -->
            <ol class="carousel-indicators" style="display: none;">
               <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
               <li data-target="#myCarousel" data-slide-to="1"></li>
               <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox" align="center">
				
               <div class="item active"> <b> < 평균연봉 top3 > </b>
                  <div class="container" align="center">
                     <div class="row" align="center">
                      	
                        <div class="col-md-3" style="width: 220px;">
                        <a href="/company/detail?cmpn_nm=${avg[0].CMPN_NM }"><button type="submit" style="background: white;">
                           <div class="thumbnail href1" style="width: 200px; border: none;">
                           <p><img src="${avg[0].LOGO }" width="150" height="100"><br/><br/></p><p>${avg[0].CMPN_NM } </p><br/>
                           <p><fmt:formatNumber value="${avg[0].AVG_SALARY }" groupingUsed="true"/>원 </p><br/>
                           </div>
                        </button></a>
                        </div>
                       
                     	<div class="col-md-1"></div>
                        <div class="col-md-3" style="width: 220px;">
                        <a href="/company/detail?cmpn_nm=${avg[1].CMPN_NM }"><button type="submit" style="background: white;">
                           <div class="thumbnail href2" style="width: 200px; border: none;">
                           <p><img src="${avg[1].LOGO }" width="150" height="100"><br/><br/></p><p>${avg[1].CMPN_NM } </p><br/>
                           <p><fmt:formatNumber value="${avg[1].AVG_SALARY }" groupingUsed="true"/>원 </p><br/>
                           </div>
                        </button></a>
                        </div>
                   		<div class="col-md-1"></div>
                        <div class="col-md-3" style="width: 220px;">
                        <a href="/company/detail?cmpn_nm=${avg[2].CMPN_NM }"><button type="submit" style="background: white;">
                           <div class="thumbnail href3" style="width: 200px; border: none;">
                           <p><img src="${avg[2].LOGO }" width="150" height="100"><br/><br/></p><p>${avg[2].CMPN_NM } </p><br/>
                           <p><fmt:formatNumber value="${avg[2].AVG_SALARY }" groupingUsed="true"/>원 </p><br/>
                           </div>
                        </button></a>
                        </div>
                 
                     </div>
	          		
                  </div>
 				</div>

                <div class="item"> <b> < 신입연봉 top3 > </b>
                  <div class="container" align="center">
                     <div class="row" align="center">
                      	
                        <div class="col-md-3" style="width: 220px;">
                        <a href="/company/detail?cmpn_nm=${rookie[0].CMPN_NM }"><button type="submit" style="background: white;">
                           <div class="thumbnail href1" style="width: 200px; border: none;">
                           <p><img src="${rookie[0].LOGO }" width="150" height="100"><br/><br/></p><p>${rookie[0].CMPN_NM } </p><br/>
                           <p><fmt:formatNumber value="${rookie[0].ROOKIE_SALARY }" groupingUsed="true"/>원</p><br/>
                           </div>
                        </button></a>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-3" style="width: 220px;">
                        <a href="/company/detail?cmpn_nm=${rookie[1].CMPN_NM }"><button type="submit" style="background: white;">
                           <div class="thumbnail href1" style="width: 200px; border: none;">
                           <p><img src="${rookie[1].LOGO }" width="150" height="100"><br/><br/></p><p>${rookie[1].CMPN_NM } </p><br/>
                           <p><fmt:formatNumber value="${rookie[1].ROOKIE_SALARY }" groupingUsed="true"/>원</p><br/>
                           </div>
                        </button></a>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-3" style="width: 220px;">
                        <a href="/company/detail?cmpn_nm=${rookie[2].CMPN_NM }"><button type="submit" style="background: white;">
                           <div class="thumbnail href1" style="width: 200px; border: none;">
                           <p><img src="${rookie[2].LOGO }" width="150" height="100"><br/><br/></p><p>${rookie[2].CMPN_NM } </p><br/>
                           <p><fmt:formatNumber value="${rookie[2].ROOKIE_SALARY }" groupingUsed="true"/>원</p><br/>
                           </div>
                        </button></a>
                        </div>
                        
                     </div>
                  </div>
 				</div>

                <div class="item"> <b> < 재무평점 top3 > </b>
                  <div class="container" align="center">
                     <div class="row" align="center">
                      	
                        <div class="col-md-3" style="width: 220px;">
                        <a href="/company/detail?cmpn_nm=${finance[0].CMPN_NM }"><button type="submit" style="background: white;">
                           <div class="thumbnail href1" style="width: 200px; border: none;">
                           <p><img src="${finance[0].LOGO }" width="150" height="100"><br/><br/></p><p>${finance[0].CMPN_NM } </p><br/>
                           <p><fmt:formatNumber value="${finance[0].FINANCE_SCORE }" groupingUsed="true"/>점</p><br/>
                           </div>
                        </button></a>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-3" style="width: 220px;">
                        <a href="/company/detail?cmpn_nm=${finance[1].CMPN_NM }"><button type="submit" style="background: white;">
                           <div class="thumbnail href1" style="width: 200px; border: none;">
                           <p><img src="${finance[1].LOGO }" width="150" height="100"><br/><br/></p><p>${finance[1].CMPN_NM } </p><br/>
                           <p><fmt:formatNumber value="${finance[1].FINANCE_SCORE }" groupingUsed="true"/>점</p><br/>
                           </div>
                        </button></a>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-3" style="width: 220px;">
                        <a href="/company/detail?cmpn_nm=${finance[2].CMPN_NM }"><button type="submit" style="background: white;">
                           <div class="thumbnail href1" style="width: 200px; border: none;">
                           <p><img src="${finance[2].LOGO }" width="150" height="100"><br/><br/></p><p>${finance[2].CMPN_NM } </p><br/>
                           <p><fmt:formatNumber value="${finance[2].FINANCE_SCORE }" groupingUsed="true"/>점</p><br/>
                           </div>
                        </button></a>
                        </div>
                       
                     </div>
                  </div>
 				</div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button"
               data-slide="prev" style="background: white;"> <span
               class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color: red;"></span>
               <span class="sr-only">Previous</span>
            </a> <a class="right carousel-control" href="#myCarousel" role="button"
               data-slide="next" style="background: white;"> <span
               class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color: red;"></span>
               <span class="sr-only">Next</span>
            </a>
         </div>
      </div>
</div>



<br/>
<br/>
<br/>
<br/>
<div align="center">
	<p>
		<h5>↓ 바로가기 ↓</h5>
	</p><hr/>
</div>

<!--  여기서부터 바로가기  -->


<div class="container" align="center" style="width:80%">
  <div class="row">
  	 <div class="col-md-1"></div>
     <div class="col-md-2" style="border: none;" class="thumbnail">
        <a href="/search/company"><button type="submit" style="width:200px;" ><img src="/picture/c.jpg">
        	<div class="caption">
        	검색
        	</div>
        </button></a>
     </div>
     <div class="col-md-2" style="border: none;" class="thumbnail">
        <a href="/compare/form"><button type="submit" style="width: 200px;"><img src="/picture/c.jpg">
        	<div class="caption">
        	비교
        	</div>
        </button></a>
     </div>
      <div class="col-md-2" style="border: none;" class="thumbnail">
        <a href="/rank/form"><button type="submit" style="width: 200px;"><img src="/picture/c.jpg">
        	<div class="caption">
        	순위
        	</div>
        </button></a>
     </div>
     <div class="col-md-2" style="border: none;" class="thumbnail">
        <a href="/my/recommand"><button type="submit" style="width: 200px;"><img src="/picture/c.jpg">
        	<div class="caption">
        	추천기업
        	</div>
        </button></a>
     </div>
     <div class="col-md-2" style="border: none;" class="thumbnail">
        <a href="/my/applyInfo"><button type="submit" style="width: 200px;"><img src="/picture/c.jpg">
        	<div class="caption">
        	공채달력
        	</div>
        </button></a>
     </div>
     <div class="col-md-1"></div>
     
  </div>
</div>


<hr/>








