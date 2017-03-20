<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

%>
<div>
	<h3>회원정보</h3>
</div>
<div class="well row">	<!-- 12등분  -->
	<div class="col-md-3" align="center">
		<form action="/my/update_picture.jsp" method="post" enctype="multipart/form-data">
				<b>PICTURE</b><br />
				<%-- <img src="<%=picURL %>" width="200" height="200"/> --%>
			<img src="${url}" width="200" height="200"/>
				<hr/>
				<input type="file" class="form-control"	name="pic" />
				<br/>
				<button type="submit" class="btn">사진변경</button>
		</form>
	</div>
	<div class="col-md-9" >
		<form action="/my/update_form_sub.jsp" method="post">
		<p>
			<b>NAME</b><br/>
			<input type="text" class="form-control" name="name" 
				<%-- value="<%=(String)val.get("name")%>"/> --%>
				value="${map.name }"/>
		</p>
		<p>
	<%-- 		<b>AGE</b><br/>
			<select class="form-control" name="age">
				<%for(int i=19; i<=80; i++){ %>
					<option value="<%=i%>" <%=val.get("age").equals(i) ? "selected" : "" %>><%=i %>세</option>
				<%} %>
			</select>
		</p> --%>
		<p>
			<b>GENDER</b><br/>
			<select name="gender" class="form-control">
				<%-- <option value="male" <%=val.get("gender").equals("male") ? "selected" : "" %>>남</option>
				<option value="female" <%=val.get("gender").equals("female") ? "selected" : "" %>>여</option> --%>
				<option value="male" ${map.getder eq 'male' ? 'selected' : ' '  }>남</option>
				<option value="female" ${map.getder eq 'female' ? 'selected' : ' '  }>여</option>
			</select> 
		</p>
		<p>
			<b>E-MAIL</b><br/>
			<input type="email" class="form-control" name="email"
				<%-- value="<%=(String)val.get("email")%>"/> --%>
				value="${map.email }"/>
		</p>
		<br/>
		<p>
			<button type="submit" class="btn">변경하기</button>
			<a href="/my/leave.jsp"><button type="button" class="btn"style="font-size:11pt;color:gray;background-color:pink;">LEAVE</button></a>
		</p>
	</form>
	</div>
</div>