<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

 <!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
   
 

    .carousel-inner img {
      width: 100%; /* Set width to 100% */
      min-height: 200px;
    }

   
    @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
    }
  </style>
</head>
<body>


<div align="center">
<p>
������
</p>
</div>
<div class="container">
<div class="row">
  <div class="col-sm-8">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img src="https://placehold.it/800x400?text=IMAGE" alt="Image">
          <div class="carousel-caption">
            <p>���⿡ �ΰ�</p>
          </div>      
        </div>

        <div class="item">
          <img src="https://placehold.it/800x400?text=����� ���������" alt="Image">
          <div class="carousel-caption">
            <h3>���� ���</h3>
            <p>����̸�</p>
            <p>��ġ</p>
          <p>�Ի�</p>
         <p>���</p>
          <p>�Ѹ���׵��</p>
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
  </div>
  <div class="col-sm-4">
    <div class="well">
      <p>������տ���</p>
    </div>
    <div class="well">
       <p>�����򱺿���</p>
    </div>
    <div class="well">
       <p>�ο�</p>
    </div>
  </div>
</div>
<hr>
</div>

<div class="container text-center">    
  <h3>����</h3>
  <br>
  <div class="row">
    
    </div>
    <div class="col-sm-3">
      <div class="well">
       <p>���̵�</p> 
      </div>
      <div class="well">
       <p>���̵�</p> 
      </div>
    </div>  
    <div class="col-sm-9">
      <div class="well">
       <p>����</p>
      </div>
      <div class="well">
       <p>����</p>
      </div>
    </div>  
  </div>
  <div align="center">
    <form action="input_result" method="get">
	����: <input type="text" name="??"/>
        <button type="submit">���</button>
</form>
</div>
<hr>
</div>



<div class="container text-center">    
  <h3>�ΰ����</h3>
  <br>
  <div class="row">
    <div class="col-sm-2">
    <table>
  <tr>
    <th>.</th>
    <th>.</th>
  </tr>
  <tr>
    <td>.</td>
    <td>.</td>
  </tr>
  <tr>
    <td>.</td>
    <td>.</td>
  </tr>
</table>
      <p>�׷��� 1</p>
    </div>
    <div class="col-sm-2"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>��Ʈ 2</p>    
    </div>
    <div class="col-sm-2"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>�׷��� 3</p>
    </div>
    <div class="col-sm-2"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>��Ʈ 4</p>
    </div> 
    <div class="col-sm-2"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>ǥ 5</p>
    </div>     
    <div class="col-sm-2"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>���� 6</p>
    </div> 
  </div>
</div><br>


</body>
</html>