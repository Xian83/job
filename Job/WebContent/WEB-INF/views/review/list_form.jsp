<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<style>
input[id=msg] {
	width: 30%;
}

hr {
	border: none;
	color: gray;
	background-color: gray;
	height: 2px;
	width: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="col-md-10">

			<c:forEach var="i" begin="0" end="${size-1 }">
				<div class="media" style="background: white;">
					<div class="media-left media-heading" align="center">
						<%-- 				
					자기 컴퓨터(서버)에서 업로드한 프로필 사진이라면, 보일 겁니다.
					<img src="${review[i].picURL }" class="media-object img-circle" style="width:120px; "> 
--%>
						<img src="${review[i].picURL }" class="media-object "
							style="width: 60;" align="left">

					</div>
					<div class="media-body row content">
						<h5 class="media-heading" style="display: inline-block;">
							<a href="/company/detail?cmpn_nm=${review[i].CMPN_NM }">${page *6-5+i}.
								${review[i].CMPN_NM } 
						</h5>
						</a> <b style="font-size: x-small;">${review[i].WDATE }</b><br />
						<div
							style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/spare.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
							<p
								style="WIDTH: 100%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
							</p>

						</div>
						<br />
						<p>
							<c:set var="email" value="${fn:split(review[i].EMAIL, '@')}"></c:set>
							${email[0]} : ${ review[i].CONTENTS}
						</p>
					</div>
				</div>
				<hr />
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
			<br />
		</div>



		<div class="col-md-2">
			<div class="container">
				<div class="well" id="result"
					style="height: 40%; width: 30%; overflow-y: scroll; margin-top: 0px; background: #FFE4E1; border-style: double;">

				</div>
				<div>
					<input type="text" class="form-control" id="msg" placeholder="남길내용" />
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			if(session.getAttribute("name")==null){
				var son = "손님"+(int)(Math.random()*10000)+1;
				session.setAttribute("name", son);
			}
		});
		
		$.ajax({
			"url" : "/chat/chatAjax?msg=join1234555"
		});

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
</body>

