<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.cm1 cm2 {
	width: 150px;
	height: 100px;
	text-align: center;
}
hr[id='hh']{
    border: none;
   
    color: #CDB79E;
    background-color: #CDB79E;
    height: 2px;
    width: 100%;
}


</style>




<div>
	<div class="well" align="center" style="background: white;">

		<input type="text" id="cm1" name="cm1" readonly placeholder="기업1">
		<b style="font-size: 20px;"> vs </b> <input type="text" id="cm2"
			name="cm2" readonly placeholder="기업2"> <br />
		<p>
			<button type="button" id="compare" disabled="true">비교</button>
		</p>
	</div>
</div>

<hr id="hh" />



<div class="container">
	<!-- 최근 본 리스트 : 최근 본 순서대로 내림차순 -->
	<div style="text-align: left;"><legend style="font-size: 12px; text-align: left; width: 80%;">최근본리스트</legend>
		<c:choose>
			<c:when test="${csize gt 10 }">
				<c:forEach var="i" begin="${csize-10 }" end="${csize-1 }">

					<input type="checkbox" value="${clist[i] }" id="check_${i}"
						class="chk" style="width: 100px; text-align: left;"> <span style="font-size: 12px;">${clist[i] }</span><br/> 
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="i" begin="0" end="${csize-1 }">
					<input type="checkbox" value="${clist[i] }" id="check_${i}"
						class="chk" style="width: 100px; text-align: left;"> <span style="font-size: 12px;">${clist[i] }</span><br/> 
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	
	<!-- 추천 리스트  -->
	
	
</div>



<script>
	$(".chk").on("change", function() {
		//console.log($(this).val());
		var val = $(this).val();
		if ($(this).prop("checked")) {
			if ($("#cm1").val() == "") {
				$("#cm1").val(val);
			} else if ($("#cm2").val() == "") {
				$("#cm2").val(val);
			} else {
				window.alert("최대2개까지만 선택가능합니다.");
				$(this).prop("checked", false);
			}
		} else {
			if ($("#cm1").val() == val) {
				$("#cm1").val("");
			} else if ($("#cm2").val() == val) {
				$("#cm2").val("");
			}
		}
	});
	
	$("#bt_${i }").on("click", function() {
		$("#check_${i}").prop("checked", true);
		$("#comparelist").html("asdf");

	});
	
	
	$("#compare").on("click", function(){
		var cm1 = $("#cm1").val();
		var cm2 = $("#cm2").val();
		
		var popUrl = "/compare/result?cm1="+cm1+"&cm2="+cm2; //팝업창에 출력될 페이지 URL
		var popOption = "width=1000, height=800, resizable=no, status=no, menubar=no, left=300;"; //팝업창 옵션(optoin)
		window.open(popUrl, "", popOption);
	});
	
	
	var c1 = $("#cm1").prop("checked");
	var c2 = $("#cm2").prop("checked");
		
		console.log(c1);
		
		$("#compare").disabled=false;	
	
	
	
</script>


