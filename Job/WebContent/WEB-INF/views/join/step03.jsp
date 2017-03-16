<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h3>STEP 02. 추가정보 입력</h3>
</div>
<div class="well">
	※ 이단계를 건너띄려면 <a href="/join/result.jsp"><button type="button" class="btn">건너뛰기</button></a>를 눌러주세요.
	<form action="/join/result.jsp" method="post">	
		<p>
			<b>NAME</b><br/>
			<input type="text" name="name" class="form-control" id="t1" onkeyup="javascript:enableBtn()">
		</p>
		<p>
			<b>AGE</b><br/>
			<select class="form-control" name="age">
				<%for(int i = 19; i<=80; i++){ %>
					<option value="<%=i %>"> <%=i %></option>
					
				<%}%> 
			</select>
		</p>
		<p>
			<b>GENDER</b><br/>
			<select name="gender" class="form-control">
				<option value="male">남</option>
				<option value="female">여</option>
			</select>
		</p>
		<p>
			<b>E-MAIL</b><br/>
			<input type="email" name="email" class="form-control" id="t2" onkeyup="javascript:enableBtn()">
		</p>	
		<p>
			<button type="submit" class="btn" id="btn" disabled>등록하기</button>
		</p>
	</form>
</div>
<script>
	function enableBtn(){
		var t1 = document.getElementById("t1").value;
		var t2 = document.getElementById("t2").value;
		
		if(t1 != "" && t2 != ""){
			document.getElementById("btn").disabled = false;
		} else {
			document.getElementById("btn").disabled = true;
		}
	}
</script>