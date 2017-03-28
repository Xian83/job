<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
	
<style>
	th {
	width: 200px;
	height: 100px;
	text-align: center;
}
hr[id='hh']{
    border: none;
   
    color: #CDB79E;
    background-color: #CDB79E;
    height: 2px;
    width: 100%;
}

</style>
<div class="panel panel-default ">
		<div class="panel-heading " align="center" style="background: #f4511e; height: 90px">
			<h2>프로필</h2>
			
		</div>

		<div class="panel-body" align="center" style="background: #ECF1EF">
			
			<form action="/my/update_pic" method="post"
				enctype="multipart/form-data">
				<b>PICTURE</b><br /> <img src="${url}" width="150" height="150" />
				<hr/>
				<input type="file" id="f" name="pic" style="display: none;"/>  
				<input type="hidden" name="email" value="${sessionScope.email}"/>
				<button type="button" class="btn" id="add">사진 변경</button><span id="fname"></span>
				<button type="submit" class="btn" id="pic" style="display: none;">등록</button>
			</form>
			<hr id="hh"/>	
			<table>
				<tr>
					<th><a href="/my/info"><i class="fa fa-address-card" style="font-size:36px"></i><br/>개인 정보 관리</a></th>
					<th><a href="/my/recommand"><i class="fa fa-thumbs-o-up" style="font-size:36px"></i><br/>추천 기업 정보</a></th>
					<th><a href="/my/scrap"><i class="fa fa-files-o" style="font-size:36px;"></i><br/>스크랩한 기업 정보</a></th>
				</tr>
					<th><a href="/my/visit"><i class="fa fa-eye" style="font-size:36px"></i><br/>자주 본 기업</a></th>
					<th><a href="/my/lately"><i class="fa fa-spinner" style="font-size:36px;"></i><br/>최근 본 기업</a></th>
					<th><a href="/my/compare"><i class="fa fa-refresh" style="font-size:36px;"></i><br/>비교한 기업 정보</a></th>
			</table>
		</div>

	</div>
	
	<script>
	$("#add").on("click", function(){ 
		$("#f").trigger("click");    
		console.log($("#f"));
	});
	$("#f").on("change", function(){
		$("#pic").trigger("click");  
	});
</script>
