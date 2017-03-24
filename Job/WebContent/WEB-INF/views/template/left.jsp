<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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

출처: http://nine01223.tistory.com/192 [스프링연구소(spring-lab)]

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
				<input type="file" name="pic" style="display: inline;"/>  
				<input type="hidden" name="email" value="${sessionScope.email}"/>
				<button type="submit" class="btn">사진변경</button>
			</form>
			<hr id="hh"/>	
			<table>
				<tr>
					<th><a href="/my/info"><i class="fa fa-address-card" style="font-size:36px"></i><br/>자기정보관리</a></th>
					<th><a href="/my/recommand"><i class="fa fa-thumbs-o-up" style="font-size:36px"></i><br/>추천 기업 정보</a></th>
					<th><a href="/my/interest"><i class="fa fa-files-o" style="font-size:36px;"></i><br/>스크랩한 기업 정보</a></th>
				</tr>
					<th><a href="/my/info"><i class="fa fa-eye" style="font-size:36px"></i><br/>자주 본 기업</a></th>
					<th><a href="/my/recommand"><i class="fa fa-spinner" style="font-size:36px;"></i><br/>최근 본 기업</a></th>
					<th><a href="/my/interest"><i class="fa fa-columns" style="font-size:36px;"></i><br/>공채달력</a></th>
			</table>
		</div>

	</div>
