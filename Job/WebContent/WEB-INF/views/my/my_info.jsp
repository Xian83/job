<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div></div>
<div class="well row">
	<!-- 12등분  -->
	<div class="col-md-3" align="center">
		<form action="/my/update_picture.jsp" method="post"
			enctype="multipart/form-data">
			<b>PICTURE</b><br />
			<%-- <img src="<%=picURL %>" width="200" height="200"/> --%>
			<img src="${url}" width="200" height="200" />
			<hr />
			<input type="file" class="form-control" name="pic" /> <br />
			<button type="submit" class="btn">사진변경</button>
		</form>
	</div>
	<div class="col-md-9">
		<form action="/my/update_form_sub.jsp" method="post">
				<p>
			<label for="comment"><b>Email</b> <span id="checkEmail"></span></label><br /> 
			<input type="email"
				id="email" name="email" class="form-control" value="${infos.EMAIL}" disabled="true">
		</p>
			<p>
			<label for="comment"><b>New Password</b></label><br /> <input
				type="password" name="pass" id="pw1" class="form-control"
				placeholder="비밀번호 입력" required>

			
				<label for="comment"><b>Password Confirm</b> <span
					id="cmpResult" style="color: red"></span></label><br /> <input
					type="password" name="passcheck" id="pw2" class="form-control"
					placeholder="비밀번호 재입력" required>
			</p>
			<p>
			<b>NAME</b><br /> <input class="form-control" name="name" />
			<%-- <input type="text" class="form-control" name="name" 
				value="<%=(String)val.get("name")%>"/>
				value="${map.name }"/> --%>
			</p>
			<p>
				<b>BIRTH</b><br /> <select class="form-control" name="birth">
				<c:forEach var="i" begin="1930" end="2017" step="1">
					<option value="${i}" <c:if test="${i eq infos.BIRTH }">selected</c:if>>${i }</option>
				<%-- 	<option value="${i}" <%=infos.get("BIRTH").equals(i) ? "selected" : "" %> >${infos.BIRTH}</option> --%>
					</c:forEach>
				</select>
			</p>
			<p>
				<b>LOCATION</b><br />
				<select class="form-control" name="Location"> 
					<c:forEach var="i" items ="${location }">
						<option value="${i.LOCATION}">${i.LOCATION}</option>				
					</c:forEach>
				</select>
		</p>
			
			
			<p>
				<button type="submit" class="btn">변경하기</button>
				<a href="/my/leave.jsp"><button type="button" class="btn"
						style="font-size: 11pt; color: gray; background-color: pink;">LEAVE</button></a>
			</p>
		</form>
	</div>
</div>

<script>

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
	
// 이메일 체크	
	$("#checkEmail").on('invalid', function (e) {
		result.innerHTML = "사용 할 수 없는 이메일";
		result.style.color = 'red';
		flag1 = false;
	 });
	 
</script>