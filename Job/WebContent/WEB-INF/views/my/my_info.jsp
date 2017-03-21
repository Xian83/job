<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div></div>
<div class="well row">
	<!-- 12���  -->
	<div class="col-md-3" align="center">
		<form action="/my/update_pic" method="post"
			enctype="multipart/form-data">
			<b>PICTURE</b><br />
			<img src="${url}" width="200" height="200" />
			<hr />
			<input type="file" class="form-control" name="pic" /> <br />
			<button type="submit" class="btn">��������</button>
		</form>
	</div>
	<div class="col-md-9">
		<form action="/my/result" method="post">
			<p>
				<label for="comment"><b>Email</b> <span id="checkEmail"></span></label><br />
				<input type="email" id="email" name="email" class="form-control"
					value="${infos.EMAIL}" disabled="true">
			</p>
			<c:choose>
				<c:when test="${infos.FACEBOOK eq N }">
					<p>
						<label for="comment"><b>New Password</b></label><br /> <input
							type="password" name="pass" id="pw1" class="form-control"
							placeholder="��й�ȣ �Է�" required>
					</p>
					<p>
						<label for="comment"><b>Password Confirm</b> <span
							id="cmpResult" style="color: red"></span></label><br /> <input
							type="password" name="passcheck" id="pw2" class="form-control"
							placeholder="��й�ȣ ���Է�" required>
					</p>
				</c:when>
				<c:otherwise>
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
									<c:if test="${i eq infos.BIRTH }">selected</c:if>>${i }��</option>
							</c:forEach>
						</select>
					</p>
					<br />
					<p>
				
					<h4>���� ���� �߰�</h4>
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
						<option value="${i}" ${i eq likeinfos.SALARY_MIN? 'selected' : ' '  }>�ּ� ${i} �̻�</option>			
					</c:forEach>
					</select>
					<select class="form-control" name="salary_max"> 
					<c:forEach var="i" begin="1500" end="10000" step="500">
						<option value="${i}" ${i eq likeinfos.SALARY_MAX? 'selected' : ' '  }>�ִ� ${i} ����</option>			
					</c:forEach>
				</select>
		</p>
			<p>
				<button type="submit" class="btn">����</button>
				<a href="/my/leave"><button type="button" class="btn"
								style="font-size: 11pt; color: gray; background-color: pink;">Ż��</button></a>
			</p>
			</c:otherwise>
			</c:choose>
		</form>
	</div>
</div>

<script>
	// ��й�ȣ üũ
	function compare() {
		var pw1 = document.getElementById("pw1").value;
		var pw2 = document.getElementById("pw2").value;

		if (pw2.length == 0) {
			document.getElementById("cmpResult").innerHTML = "";
		} else if (pw1 == pw2 && pw2.length > 0) {
			document.getElementById("cmpResult").style.color = 'green';
			document.getElementById("cmpResult").innerHTML = " ��й�ȣ ��ġ";
			flag2 = true;
		} else {
			document.getElementById("cmpResult").style.color = 'red';
			document.getElementById("cmpResult").innerHTML = " <i>��й�ȣ�� ��ġ���� �ʽ��ϴ�.</i>";
			flag2 = false;
		}
		sbtChange();
	}

	// �̸��� üũ	
	$("#checkEmail").on('invalid', function(e) {
		result.innerHTML = "��� �� �� ���� �̸���";
		result.style.color = 'red';
		flag1 = false;
	});
</script>