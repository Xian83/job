<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<style>
body {
	position: relative;
}

.affix {
	top: 20px;
}

div.col-sm-9 div {
	height: auto;
	font-size: 28px;
}

/* #section1 {
	color: #fff;

}

#section2 {
	color: #fff;
	background-color: #673ab7;
}

#section3 {
	color: #fff;
	background-color: #ff9800;
}

#section4 {
	color: #fff;
	background-color: #00bcd4;
}

#section5 {
	color: #fff;
	background-color: #009688;
} */
@media screen and (max-width: 810px) {
	#section1, #section2, #section3, #section41, #section42 {
		margin-left: 150px;
		margin-top: 150px;
	}
}
</style>
	<div class="container">
		<div class="row">
			<nav class="col-sm-3" id="myScrollspy">
				<ul class="nav nav-pills nav-stacked" data-spy="affix"
					data-offset-top="205">

					<div class="panel-body" align="center">
				 <form action="/my/update_pic" method="post"
							enctype="multipart/form-data"> 
							<b>PROFILE PHOTO</b><br /> <img src="${picURL}" width="200" height="200" />
							<hr/>
							<input type="file" id="f" name="pic" style="display: none;" /> <input
								type="hidden" name="email" value="${sessionScope.email}" />
							<button type="button" class="btn" id="add">사진 변경</button>
							<button type="submit" class="btn" id="pic" style="display: none;">등록</button>
				 	</form> 
						<hr id="hh" />
					</div>


					<li><a href="/my/company?#section1"><i class="fa fa-thumbs-o-up" style="font-size:36px"></i><b>  추천 기업 정보</b></a></li>
					<li><a href="/my/company?#section2"><i class="fa fa-refresh" style="font-size:36px"></i><b>  비교한 기업 정보</b></a></li>
					<li><a href="/my/company?#section3"><i class="fa fa-eye" style="font-size:36px"></i><b>  자주 본 기업 정보</b></a></li>
					<li><a href="/my/company?#section4"><i class="fa fa-files-o" style="font-size:36px"></i><b>  스크랩한 기업 정보</b></a></li>
					
				</ul>
			</nav>
	<div class="col-sm-9">
		<form action="/my/result" method="get">
			<p>
				<label for="comment"><b>Email</b> <span id="checkEmail"></span></label><br />
				<input type="email" id="email" name="email" class="form-control"
					value="${infos.EMAIL}" disabled="true">
			</p>
			
				 <c:if test="${infos.FACEBOOK eq 'N' }">
					<p>
						<label for="comment"><b>New Password</b></label><br /> <input
							type="password" name="pass" id="pw1" class="form-control"
							placeholder="비밀번호 입력" >
					</p>
					<p>
						<label for="comment"><b>Password Confirm</b> <span
							id="cmpResult" style="color: red"></span></label><br /> <input
							type="password" name="passcheck" id="pw2" class="form-control"
							placeholder="비밀번호 재입력" >
				
					</p>
					 </c:if> 
					<p>
						<b>NAME</b><br /> <input class="form-control" name="name"
							value="${infos.NAME}" />
					</p>
					<p>
						<b>GENDER</b><br /> <select class="form-control" name="gender">
								<option value="male" ${likeinfos.GENDER eq 'male' ? 'selected' : ' '  }>male</option>
								<option value="female" ${likeinfos.GENDER eq 'female' ? 'selected' : ' '  }>female</option>
						</select>
					</p>
					<p>
						<b>BIRTH</b><br /> <select class="form-control" name="birth">
							<c:forEach var="i" begin="1930" end="2017" step="1">
								<option value="${i}"
									<c:if test="${i eq infos.BIRTH }">selected</c:if>>${i }년</option>
							</c:forEach>
						</select>
					</p>
					<br />
					<p>
				
					<h4>관심 정보 추가</h4> 
					<b>LOCATION</b>
					<br />		
				<select class="form-control" name="location"> 
					<c:forEach var="i" items="${location}">
						<option value="${i.LOCATION}" ${i.LOCATION eq likeinfos.AREA? 'selected' : ' '  }>${i.LOCATION}</option>				
					</c:forEach>
				</select>		
		<p>
		<b>INDUSTRY</b><br />
				<select class="form-control" name="industry"> 
					<c:forEach var="i" items="${industry }">
						<option value="${i.INDUSTRY}" ${i.INDUSTRY eq likeinfos.STNDD_BIG_GB? 'selected' : ' '  }>${i.INDUSTRY}</option>				
					</c:forEach>
				</select>
		</p>
		<p>
		<b>SALARY</b>
					<br />
				<select class="form-control" name="salary_min" id="min"> 
					<c:forEach var="i" begin="1500" end="10000" step="500">
						<option value="${i}" ${i eq likeinfos.SALARY_MIN? 'selected' : ' '  }>최소 ${i} 이상</option>			
					</c:forEach>
					</select>
					<select class="form-control" name="salary_max" id="max"> 
					<c:forEach var="i2" begin="1500" end="10000" step="500">
						<option value="${i2}" ${i2 le likeinfos.SALARY_MIN ? 'disabled' : '' } 
						 ${i2 eq likeinfos.SALARY_MAX? 'selected' : ' '  }>최대 ${i2} 이하</option>			
					</c:forEach>
				</select>
		</p>
			<p>
				<button type="submit" class="btn" id="btn_update">변경</button>
				 <c:if test="${infos.FACEBOOK eq 'N' }">
				<a href="/my/leave_form"><button type="button" class="btn"
								style="font-size: 11pt; color: gray; background-color: pink;">탈퇴</button></a>
				</c:if>
			</p>
			
		</form>
	</div>
</div>
</div>


<script>
	// Salary combobox Select
	$("#min").on("change",function(){
		var cu = $(this).val();
		var opt ="";
		for(var i = Number(cu); i<=10000 ; i += 500 ) {
			opt += "<option value='"+i+"'>최대 "+i +"이하</option>";
		}
		$("#max").html(opt);
	});

	//버튼 활성화
	var flag = false;

	function sbtChange() {
		if (flag) {
			document.getElementById("btn_update").disabled = false;
		} else {
			document.getElementById("btn_update").disabled = true;
		}
	}

	// New PAssWord = pw1 / Password Confirm = pw2
	document.getElementById("pw1").onkeyup = function() {
		compare();
		sbtChange();
	}
	document.getElementById("pw2").onkeyup = function() {
		compare();
		sbtChange();
	}

	// 비밀번호 체크
	function compare() {
		var pw1 = document.getElementById("pw1").value;
		var pw2 = document.getElementById("pw2").value;

		if (pw2.length == 0) {
			document.getElementById("cmpResult").innerHTML = "";
		} else if (pw1 == pw2 && pw2.length > 0) {
			document.getElementById("cmpResult").style.color = 'green';
			document.getElementById("cmpResult").innerHTML = " 비밀번호 일치";
			flag = true;
		} else {
			document.getElementById("cmpResult").style.color = 'red';
			document.getElementById("cmpResult").innerHTML = " <i>비밀번호가 일치하지 않습니다.</i>";
			flag = false;
		}
		sbtChange();
	}

	// 사진 등록 버튼
	$("#add").on("click", function() {
		$("#f").trigger("click");
		console.log($("#f"));
	});
	$("#f").on("change", function() {
		$("#pic").trigger("click");
	});

	// 스크랩 체크 박스 - 아직 다 안 됐음
	$(function() {
		$("#change").on("click", function() {
			// 1개이상 체크하도록 한다.
			if ($(".chkclass :checked").size() < 1) {
				alert("1개 이상의 기업을 선택하세요");
				return;
			} else {

				//param 만들기
				var param = "";
				$(".chkclass :checked").each(function() {
					if ($(this.prop("cheked"))) {
						param += "&name=" + $(this).val();
					}
					console.log('param : ' + param);
				});

				$.ajax({
					url : '/my/interestAjax',
					type : 'post',
					data : param,
					success : function(data) {
						console.log('return string : ' + data);
					},
					error : function() {
						console.log('error');
					}
				});
			}
		});
	});
</script>