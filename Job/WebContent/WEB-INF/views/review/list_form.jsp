<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container">
	<div class="col-md-10">
	
			<c:forEach var="i" begin="0" end="${size-1 }">
				<div class="media" style="background: #FFE4E1; border-style: solid; border-color: #C1CDC1  ">
					<div class="media-left media-middle" align="center">
						<img src="/img.jpg" class="media-object img-circle" style="width:120px; ">
						<p align="center">${review[i].EMAIL }</p>
					</div>
					<div class="media-body">
						<h4 class="media-heading"><a href="/company/detail?cmpn_nm=${review[i].CMPN_NM }">${review[i].CMPN_NM }</h4></a>
						<p>${ review[i].CONTENTS}</p>
					</div>
				 </div>
			</c:forEach>

		<div align="center" class="well">
			<c:if test="${page ne 1 }">
				<a href="/review/list_form?page=${page -1 }">이전</a>
			</c:if>
			<c:forEach var="p" begin="1" end="${size }" varStatus="vs">
				<c:choose>
					<c:when test="${p eq page }">
						<b style="color: red;">${p }</b>
					</c:when>
					<c:otherwise>
						<a href="/review/list_form?page=${p }">${p }</a>
					</c:otherwise>
				</c:choose>
				<c:if test="${vs.last eq false }">|</c:if>
			</c:forEach>
			<c:if test="${page ne size }">
				<a href="/review/list_form?page=${page +1 }">다음</a>
			</c:if>
		</div>
	</div>

	<style>
input[id=msg] {
	width: 30%;
}
</style>
	<div class="col-md-2">
		<div class="container">
			<div class="well" id="result"
				style="height: 40%; width: 30%; overflow-y: scroll; margin-top: 0px; background: #FFE4E1; border-style: double;"></div>
			<div>
				<input type="text" class="form-control" id="msg" placeholder="남길내용" />
			</div>
		</div>
	</div>
</div>

<script>
	document.getElementById("msg").onkeyup = function(e) {
		if (e.key == 'Enter') {
			var xhr = new XMLHttpRequest();

			xhr.open("get", "/chat/chatAjax?msg=" + this.value, true);
			xhr.send();
			this.value = "";
		}
	}

	function getChatLog() {
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/chat/logAjax", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var obj = JSON.parse(xhr.responseText);
				var html = "";
				for (var i = 0; i < obj.length; i++) {
					html += "<b>[" + obj[i].id + "]</b> ";
					html += obj[i].msg + "<br>";
				}
				console.log(document.getElementById("result").innerHTML);
				console.log(html);
				if (document.getElementById("result").innerHTML != html) {
					document.getElementById("result").innerHTML = html;
					document.getElementById("result").scrollTop = document
							.getElementById("result").scrollHeight;
				}
			}
		}
	}
	setInterval(getChatLog, 200);
</script>


