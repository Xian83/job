<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
input[id=aaa] {
	width: 80%;
	padding: 10px 5px;
}
</style>

<!-- 처음뿌려지는 쿠키리스트가 가장 먼저본 기업 -->


<div align="center">
<div class="well" align="center" style="width: 80%;">
	<form action="/compare/result">
		<input type="text" width="600" id="cm1" name="cm1" readonly placeholder="기업1"> <b style="font-size: 20px;"> vs </b>
		<input type="text" width="600" id="cm2" name="cm2" readonly placeholder="기업2"> <br/>
		<p><button type="submit">비교</button></p>
	</form>
</div>
</div>


<div class="container">

	<div class="well">
	
	<c:forEach var="i" begin="0" end="${csize-1 }">
		<input type="checkbox" value="${clist[i] }" id="check_${i}" class="chk"> ${clist[i] } 
	</c:forEach>
	
	</div>
</div>

<script>

$(".chk").on("change", function(){
	//console.log($(this).val());
	var val = $(this).val();
	if($(this).prop("checked")) {
		if($("#cm1").val()==""){
			$("#cm1").val(val);
		}else if($("#cm2").val()=="") {
			$("#cm2").val(val);
		}else {
			window.alert("최대2개까지만 선택가능합니다.");
			$(this).prop("checked", false);
		}
	} else {
		if($("#cm1").val()==val){
			$("#cm1").val("");
		}else if($("#cm2").val()==val) {
			$("#cm2").val("");
		}		
	}
});
	$("#bt_${i }").on("click", function() {
		$("#check_${i}").prop("checked", true);
		$("#comparelist").html("asdf");

	});
	

</script>
