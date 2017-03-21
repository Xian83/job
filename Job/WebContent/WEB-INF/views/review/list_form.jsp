<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container">
<div class="col-md-10" >
	<table class="table table-bordered" >
		<c:forEach var="i" begin="0" end="${size-1 }">
			<tr>
				<td>
					<div class="media">

						<div class="media-body">
							<a href="/company/detail?cmpn_nm=${review[i].CMPN_NM }"><h4>
									<b>${review[i].CMPN_NM }<b />
								</h4></a>
							<h5>${rank[i].STNDD_BIG_GB } | ${rank[i].WKP_ADRS } </h5>
							
							<p>${review[i].EMAIL} : ${ review[i].CONTENTS}</p>
					
				</td>
				</div>
				</td>
			</tr>
		</c:forEach>

	</table>
</div>

<style>
	input[id=msg]{
		width: 30%;
	}
</style>
<div class="col-md-2" >
<div class="container" >
		<div class="well" id="result" style="height: 40%; width: 30%; overflow-y: scroll; margin-top: 0px; background: gray; "></div>
		<div>
			<input type="text"  class="form-control" id="msg" placeholder="남길내용" />
		</div>
	</div>
</div>
</div>

<script>
	document.getElementById("msg").onkeyup=function(e) {
		if(e.key=='Enter') {
			var xhr = new XMLHttpRequest();
				
				xhr.open("get", "/chat/chatAjax?msg="+this.value,true);
				xhr.send();
			this.value ="";
		}
	}
	
	function getChatLog() {
		var xhr =new XMLHttpRequest();
			xhr.open("get", "/chat/logAjax", true);
			xhr.send();
			xhr.onreadystatechange=function() {
				if(xhr.readyState==4&&xhr.status==200) {
					var obj = JSON.parse(xhr.responseText);
					var html = "";
					for(var i=0; i<obj.length; i++) {
						html += "<b>["+obj[i].id+"]</b> ";
						html += obj[i].msg+"<br>";
					}
					console.log(document.getElementById("result").innerHTML);
					console.log(html);
					if(document.getElementById("result").innerHTML != html){
						document.getElementById("result").innerHTML = html;
						document.getElementById("result").scrollTop = document.getElementById("result").scrollHeight;
					}
				}
			}
	}
	setInterval(getChatLog, 200 );
</script>


