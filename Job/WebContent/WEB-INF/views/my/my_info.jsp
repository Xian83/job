<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div></div>
<div class="well row">
	<!-- 12등분  -->

	<div class="col-md-12">
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
				<select class="form-control" name="salary_min"> 
					<c:forEach var="i" begin="1500" end="10000" step="500">
						<option value="${i}" ${i eq likeinfos.SALARY_MIN? 'selected' : ' '  }>최소 ${i} 이상</option>			
					</c:forEach>
					</select>
					<select class="form-control" name="salary_max"> 
					<c:forEach var="i" begin="1500" end="10000" step="500">
						<option value="${i}" ${i eq likeinfos.SALARY_MAX? 'selected' : ' '  }>최대 ${i} 이하</option>			
					</c:forEach>
				</select>
		</p>
			<p>
				<button type="submit" class="btn" id="btn">변경</button>
				<a href="/my/leave_form"><button type="button" class="btn"
								style="font-size: 11pt; color: gray; background-color: pink;">탈퇴</button></a>
			</p>
		
		</form>
	</div>
</div>

<script>

	//버튼 활성화
	var flag1 = false;
	var flag2 = false;

	
	function sbtChange() {
		if(flag1 && flag2 ) {
			document.getElementById("btn").disabled = false;
		}else {
			document.getElementById("btn").disabled = false;
		}
	}
	
	document.getElementById("pw1").onkeyup = function(){
		compare();
		sbtChange();
	}
	document.getElementById("pw2").onkeyup = function(){
		compare();
		sbtChange();
	}
	
	
	// 비밀번호 체크
	function compare(){
		var pw1 = document.getElementById("pw1").value;
		var pw2 = document.getElementById("pw2").value;
		
		if(pw2.length == 0 ){
			document.getElementById("cmpResult").innerHTML = "";
		} else if(pw1 == pw2 && pw2.length > 0){
			document.getElementById("cmpResult").style.color = 'green';
			document.getElementById("cmpResult").innerHTML = " 비밀번호 일치";	
			flag2 = true;
		} else {
			document.getElementById("cmpResult").style.color = 'red';
			document.getElementById("cmpResult").innerHTML = " <i>비밀번호가 일치하지 않습니다.</i>";
			flag2 = false;
		}
		sbtChange();
	}	
	

	
</script>