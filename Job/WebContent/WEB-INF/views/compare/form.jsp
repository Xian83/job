<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
input[id=aaa] {
	width: 95%;
	padding: 10px 5px;
}
</style>

<h2>비교 페이지 (최근 본 목록 10개까지만)</h2>
<!-- 처음뿌려지는 쿠키리스트가 가장 먼저본 기업 -->

<hr />
	<form action="/compare/result">
		회사1<input type="text" width="600" id="cm1" name="cm1" readonly>
		회사2<input type="text" width="600" id="cm2" name="cm2" readonly>
		<button type="submit">비교</button>
	</form>
<hr />


<c:forEach var="i" begin="0" end="${csize-1 }">
	<input type="checkbox" value="${clist[i] }" id="check_${i}" class="chk"> ${clist[i] }<br/>
</c:forEach>

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
