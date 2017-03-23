<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
            <ol class="carousel-indicators">
               <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
               <li data-target="#myCarousel" data-slide-to="1"></li>
               <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox" align="center">

               <div class="item active">
                  <div class="container" align="center">
                     <div class="row" align="center">
                      	<div class="col-md-1"></div>
                        <div class="col-md-3" style="width: 200px;">
                           <div class="thumbnail href1" style="width: 200px;"><img src="/picture/logo.jpg"></div>
                        </div>
                        <div class="col-md-3" style="width: 200px;">
                           <div class="thumbnail href2" style="width: 200px;"><img src="/picture/logo.jpg"></div>
                        </div>
                        <div class="col-md-3" style="width: 200px;">
                           <div class="thumbnail href3" style="width: 200px;"><img src="/picture/logo.jpg"></div>
                        </div>
                        <div class="col-md-1"></div>
                     </div>
                  </div>
 				</div>
          

                <div class="item">
                  <div class="container" align="center">
                     <div class="row" align="center">
                      	<div class="col-md-1"></div>
                        <div class="col-md-3" style="width: 200px;">
                           <div class="thumbnail href1" style="width: 200px;"><img src="/picture/logo.jpg"></div>
                        </div>
                        <div class="col-md-3" style="width: 200px;">
                           <div class="thumbnail href2" style="width: 200px;"><img src="/picture/logo.jpg"></div>
                        </div>
                        <div class="col-md-3" style="width: 200px;">
                           <div class="thumbnail href3" style="width: 200px;"><img src="/picture/logo.jpg"></div>
                        </div>
                        <div class="col-md-1"></div>
                     </div>
                  </div>
 				</div>

                <div class="item">
                  <div class="container" align="center">
                     <div class="row" align="center">
                      	<div class="col-md-1"></div>
                        <div class="col-md-3" style="width: 200px;">
                           <div class="thumbnail href1" style="width: 200px;"><img src="/picture/logo.jpg"></div>
                        </div>
                        <div class="col-md-3" style="width: 200px;">
                           <div class="thumbnail href2" style="width: 200px;"><img src="/picture/logo.jpg"></div>
                        </div>
                        <div class="col-md-3" style="width: 200px;">
                           <div class="thumbnail href3" style="width: 200px;"><img src="/picture/logo.jpg"></div>
                        </div>
                        <div class="col-md-1"></div>
                     </div>
                  </div>
 				</div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button"
               data-slide="prev"> <span
               class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
               <span class="sr-only">Previous</span>
            </a> <a class="right carousel-control" href="#myCarousel" role="button"
               data-slide="next"> <span
               class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
               <span class="sr-only">Next</span>
            </a>
         </div>
      </div>
</div>



<br/>
<br/>
<br/>
<br/>

<!--  여기서부터 바로가기  -->

<div class="col-md-12" align="center">
<div class="container" align="center" style="width:1000px;">
  <div class="row" align="center">
  	
     <div class="col-sm-2" style="width: 200px;" align="center" >
        <button type="submit" width: 200px;><a href="/search/company"><img src="/picture/logo.jpg" alt="search" width="200px" height="220"></a></button>
        <p><strong>상세검색</strong></p>
     </div>
     <div class="col-sm-2" style="width: 200px;" align="center">
        <button type="submit" width: 200px;><a href="/compare/form"><img src="/picture/logo.jpg" alt="compare" width="200px" height="220"></a></button>
        <p><strong>상세검색</strong></p>
     </div>
     <div class="col-sm-2" style="width: 200px;" align="center">
        <button type="submit" width: 200px;><a href="/rank/form"><img src="/picture/logo.jpg" alt="rank" width="200px" height="220"></a></button>
        <p><strong>상세검색</strong></p>
     </div>
        <div class="col-sm-2" style="width: 200px;" align="center">
        <button type="submit" width: 200px;><a href="/my/recommand"><img src="/picture/logo.jpg" alt="hit" width="200px" height="220"></a></button>
        <p><strong>상세검색</strong></p>
     </div>
     <div class="col-sm-2" style="width: 200px;" align="center">
        <button type="submit" width: 200px;><a href="/my/applyInfo"><img src="/picture/logo.jpg" alt="calendar" width="200px" height="220"></a></button>
        <p><strong>상세검색</strong></p>
     </div>
     
  </div>
</div>
</div>

