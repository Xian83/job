<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<html>
 <meta charset="utf-8">
<head>
	<style>
		input[type=text] {
			width: 130px;
			box-sizing: border-box;
			border: 2px solid #ccc;
			border-radius: 4px;
			font-size: 16px;
			background-color: white;
			background-image: url('http://herald.dawn.com/_img/search.png');
			background-position: 10px 10px;
			background-repeat: no-repeat;
			padding: 12px 20px 12px 40px;
			-webkit-transition: width 0.4s ease-in-out;
			transition: width 0.4s ease-in-out;
		}
		
		input[type=text]:focus {
			width: 100%;
		}
	</style>
</head>
<body>
	<h1>검색 테스트용</h1>
	<div align="center">
	<form action="/search/company">
		<input type="text" name="search" id="search" placeholder="Search.." />
	</form>
	</div>
</body>
</html>


<script>
 $("#search").keyup(function(){
	$.ajax({
		"url" : "search/index_search?q="+$(this).val()    
	}).done(function (q) {			
		$("#result").append(q+"<br/>");	
	});
})

</script>



<!-- 
<div class="row">
  <div class="col-md-4">
    <div class="thumbnail">
      <a href="/w3images/lights.jpg">
        <img src="/w3images/lights.jpg" alt="Lights" style="width:100%">
        <div class="caption">
          <p>Lorem ipsum...</p>
        </div>
      </a>
    </div>
  </div>
  <div class="col-md-4">
    <div class="thumbnail">
      <a href="/w3images/nature.jpg">
        <img src="/w3images/nature.jpg" alt="Nature" style="width:100%">
        <div class="caption">
          <p>Lorem ipsum...</p>
        </div>
      </a>
    </div>
  </div>
  <div class="col-md-4">
    <div class="thumbnail">
      <a href="/w3images/fjords.jpg">
        <img src="/w3images/fjords.jpg" alt="Fjords" style="width:100%">
        <div class="caption">
          <p>Lorem ipsum...</p>
        </div>
      </a>
    </div>
  </div>
</div>
 -->



<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
   <div class="row">
  <div class="col-md-4">
    <div class="thumbnail">
      <img src="img_chania.jpg" alt="Chania">  <img src="img_chania.jpg" alt="Chania">  <img src="img_chania.jpg" alt="Chania">
</div>
    </div>
  

    <div class="item">
      <img src="noimg.jpg" alt="Chania">
       <img src="noimg.jpg" alt="Chania">
        <img src="noimg.jpg" alt="Chania">
    </div>

    <div class="item">
      <img src="c.jpg" alt="Flower">
      <img src="c.jpg" alt="Flower">
      <img src="c.jpg" alt="Flower">
    </div>
  </div>
  </div>
  </div>



  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
 