<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<!--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<style>
/* body {
	font-size: 15px;
} */
#floatMenu {
	position: absolute;
	width: 200px;
}
</style>

<div class="container">
	<div class="col-md-10">
		<h2>
			<b>REVIEW</b>
		</h2>
		<h5>
			<span style="color: #4682B4">(상세 기업 페이지에 남겨진 리뷰를 확인하실 수 있습니다)</span>
		</h5>
		<br />

		<div class="inp">
			<div align="right">
				<input name="CName" type="text" id="search"
					placeholder="기업명을 입력해 주세요"
					style="ime-mode: active; width: 400; height: 37"
					onkeypress="if(event.keyCode==13){javascript:search();}" />

				<button type="button" id="sc" class="btn" onclick="scBtn()">검색</button>
			</div>
		</div>
	</div>
	<div class="col-md-2">
		<h2>
			<b>CHAT</b>
		</h2>
		<h5>
			<span style="color: #4682B4">(채팅에 참여하세요)</span>
		</h5>
	</div>
</div>
<div class="container" id="result2">
	<div class="col-md-10">
		<span style="color: #4682B4;"><b>검색 결과 총 ${cnt }개</b></span> <br />
		<table class="table">
			<tbody>
				<c:forEach var="i" items="${review }">
					<tr>
						<td><img src="${i.LOGO }"
							class="media-object img-Rounded Corners" style="width: 90px;">
							<br /></td>
						<td>
							<h5 class="media-heading"
								style="display: inline-block; font-size: 20px">
								<a href="/company?cmpn_nm=${i.CMPN_NM }"><b>${i.CMPN_NM }</b></a>
							</h5> <fmt:formatDate value="${i.WDATE }" pattern="yyyy-MM-dd" /><br />
							<div
								style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/spare.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
								<p
									style="WIDTH: ${i.RATE}%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
								</p>

							</div>

						</td>
						<td>
							<p>
								${i.CONTENTS}
								<c:set var="email" value="${fn:split(i.EMAIL, '@')}"></c:set>
								<br />written by. ${email[0]}
							</p>

						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3" align="center">
						<ul class="pagination">
							<c:if test="${page ne 1 }">
								<li><a href="/review/list_form?page=${page -1 }"
									class="pagelinks">이전</a></li>
							</c:if>
							<c:forEach var="p" begin="1" end="${size > 10 ? 10 : size}"
								varStatus="vs">
								<c:choose>
									<c:when test="${p eq page }">
										<li class="active"><a href="#" class="pagelinks disabled">${p }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="/review/list_form?page=${p }"
											class="pagelinks">${p }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${page ne size }">
								<li><a href="/review/list_form?page=${page +1 }"
									class="pagelinks">다음</a></li>
							</c:if>
						</ul>

					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="col-md-2">
		<div id="floatMenu">

			<div class="well" id="result"
				style="height: 400px; width: 300px; overflow-y: scroll; margin-top: 0px; background: #F0F8FF; border-style: double;">

			</div>
			<div style="width: 300px">
				<input type="text" class="form-control" id="msg"
					placeholder="메세지를 남겨주세요" />
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
		
		
		$(document).ready(function() {
			 
			// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
			var floatPosition = parseInt($("#floatMenu").css('top'));
			// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		 
			$(window).scroll(function() {
				// 현재 스크롤 위치를 가져온다.
				var scrollTop = $(window).scrollTop();
				var newPosition = scrollTop + floatPosition + "px";
		 
				/* 애니메이션 없이 바로 따라감
				 $("#floatMenu").css('top', newPosition);
				 */
		 
				$("#floatMenu").stop().animate({
					"top" : newPosition
				}, 500);
		 
			}).scroll();
		 
		});
		
		
		// 검색버튼 작동 - ajax 안 하면 지울 것
		function scBtn() {
			search();
		};
		
		function search() {
			
			var CName = $("#search").val();
			
			console.log(CName);

			//jQuery.ajaxSettings.traditional = true;
			$.ajax({
				"url" : "/review/search",
				"method" : "post",
				"data" : {
					"CName" : CName
				}
			}).done(function(aw) {
				$("#result2").html(aw);
			})
		}
		
	</script>
