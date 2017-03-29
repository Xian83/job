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

		<input type="text" id="cm1" name="cm1" readonly placeholder="기업1" class="form-control">
		<b style="font-size: 20px;"> vs </b> <input type="text" id="cm2"
			name="cm2" readonly placeholder="기업2" class="form-control"> <br />
		<p>
			<button type="button" id="compare" class="btn">비교</button>
		</p>
	</div>
</div>

<hr id="hh" />



<div class="container">
	<!-- 최근 본 리스트 : 최근 본 순서대로 내림차순10개 -->
	<div style="text-align: left;"><legend style="font-size: 12px; text-align: left; width: 80%;">최근본기업 (최대10개까지)</legend>
		<c:choose>
			<c:when test="${csize gt 10 }">
				<c:forEach var="i" begin="0" end="9">
					
					<input type="checkbox" value="${clist[i] }" id="check_${i}"
						class="chk" style="width: 100px; text-align: left;"> <span style="font-size: 12px;">${clist[i] }</span><br/> 
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${csize eq 0 }">
						<c:forEach var="i" begin="0" end="0">
							<span style="font-size: 12px;">비교할 기업을 선택해주세요</span><br/> 
						</c:forEach>
					</c:when>	
					<c:otherwise>
						<c:forEach var="i" begin="0" end="${csize-1 }">
							<input type="checkbox" value="${clist[i] }" id="check_${i}"
							class="chk" style="width: 100px; text-align: left;"> <span style="font-size: 12px;">${clist[i] }</span><br/> 
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
			</c:otherwise>
		</c:choose>
	</div>
	
	<!-- 추천 리스트  -->
	
	<div style="text-align: left;"><legend style="font-size: 12px; text-align: left; width: 80%;">추천기업</legend>
		<c:choose>
			<c:when test="${list_r eq null}">
				<c:forEach var="i" begin="0" end="0">
					<span style="font-size: 12px;">로그인을 해야 볼 수 있습니다</span>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="i" begin="0" end="${list_r.size()-1 }">
					<input type="checkbox" value="${list_r[i].CMPN_NM }" id="check_${i}"
						class="chk" style="width: 100px; text-align: left;"><span style="font-size: 12px;"> ${list_r[i].CMPN_NM } </span><br/>			
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</div>
</div>



<script>


	$('#compare').attr('disabled',true);


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
		
		
		if($("#cm1").val() == "" || $("#cm2").val() == ""){
			$('#compare').attr('disabled',true);
		}else {
			$('#compare').attr('disabled',false);
		}
		
	});
	
	
	
	
	
	$("#compare").on("click", function(){
		var cm1 = $("#cm1").val();
		var cm2 = $("#cm2").val();
		
		var popUrl = "/compare/result?cm1="+cm1+"&cm2="+cm2; //팝업창에 출력될 페이지 URL
		var popOption = "width=1000, height=800, resizable=no, status=no, menubar=no, left=300;"; //팝업창 옵션(optoin)
		window.open(popUrl, "", popOption);
	});
	
	
	
	
</script>


