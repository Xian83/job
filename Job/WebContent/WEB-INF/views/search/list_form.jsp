<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
.navbar-nav>li {
   margin-left: 30;
   font-size: 12;
}

.well {
   width: 1100;
   border: 2px solid #f45757;
   background-color: #ffffff;
}

body {
   color: #202b69;
}

.btn-group-sm>.btn, .btn-sm {
   border-radius: 20px;
   background-color: rgba(249, 208, 208, 0.99);
   bold: 3px;
   margin-bottom: 6px;
}

.btn-default {
   color: #607D8B;
   border: 2px;
}

.table-bordered {
   border-top: 10px;
}
</style>
<br/>
<div align="center">
	<div class="corp_src well" align="center">
		<form action="/search/detail" method="get">
			<div class="row" align="center">
				<div class="col-md-4">
					<dl>
						<dt>
							<img src="http://image.jinhak.com/job/corp/src_dt01.png"
								alt="지역별" />
						</dt>
						<dd>
							<hr />
							<ul class="nav navbar-nav">
								<li><input type="checkbox" name="chkSido" id="chkSido전체"
									value="전체" /><label for="chkSido전체">전체 </label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido서울"
									value="서울" /><label for="chkSido서울">서울</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido부산"
									value="부산" /><label for="chkSido부산">부산</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido대구"
									value="대구" /><label for="chkSido대구">대구</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido인천"
									value="인천" /><label for="chkSido인천">인천</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido광주"
									value="광주" /><label for="chkSido광주">광주</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido대전"
									value="대전" /><label for="chkSido대전">대전</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido울산"
									value="울산" /><label for="chkSido울산">울산</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido세종"
									value="세종" /><label for="chkSido세종">세종</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido경기"
									value="경기" /><label for="chkSido경기">경기</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido강원"
									value="강원" /><label for="chkSido강원">강원</label></li>
								<li><input type="checkbox" name="AreaSido" id="chkSido충북"
									value="충북" /><label for="chkSido충북">충북</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido충남"
									value="충남" /><label for="chkSido충남">충남</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido전북"
									value="전북" /><label for="chkSido전북">전북</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido전남"
									value="전남" /><label for="chkSido전남">전남</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido경북"
									value="경북" /><label for="chkSido경북">경북</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido경남"
									value="경남" /><label for="chkSido경남">경남</label></li>
								<li><input type="checkbox" name="chkSido" id="chkSido제주"
									value="제주" /><label for="chkSido제주">제주</label></li>
							</ul>
						</dd>
					</dl>
				</div>
				<div class="col-md-4">
					<dl>
						<dt>
							<img src="http://image.jinhak.com/job/corp/src_dt02.png"
								alt="산업별" />
						</dt>
						<dd>
							<hr />
							<ul class="nav navbar-nav">
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCode전체" value="전체" /><label for="chkJinhakCode전체">전체</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ1" value="J1" /><label for="chkJinhakCode전체">제조·화학</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ2" value="J2" /><label for="chkJinhakCodeJ2">은행·금융</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ3" value="J3" /><label for="chkJinhakCodeJ3">IT·미디어</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ4" value="J4" /><label for="chkJinhakCodeJ4">의료·보건</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ5" value="J5" /><label for="chkJinhakCodeJ5">건설·부동산</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ6" value="J6" /><label for="chkJinhakCodeJ6">판매·유통</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ7" value="J7" /><label for="chkJinhakCodeJ7">교육·출판</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ8" value="J8" /><label for="chkJinhakCodeJ8">여가·스포츠</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ9" value="J9" /><label for="chkJinhakCodeJ9">기타서비스</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ10" value="J10" /><label
									for="chkJinhakCodeJ10">공공서비스</label></li>
							</ul>
						</dd>
					</dl>
				</div>
				<div class="col-md-4">
					<dl>
						<dt>
							<img src="http://image.jinhak.com/job/corp/src_dt04.png"
								alt="규모별" />
						</dt>
						<dd>
							<hr />
							<ul class="nav navbar-nav">
								<li><input type="checkbox" name="chkSize" id="chkSize전체"
									value="전체" /><label for="chkSize전체">전체</label></li>
								<li><input type="checkbox" name="chkSize" id="chkSize1"
									value="1" /><label for="chkSize1">대기업</label></li>
								<li><input type="checkbox" name="chkSize" id="chkSize3"
									value="3" /><label for="chkSize3">중견기업</label></li>
								<li><input type="checkbox" name="chkSize" id="chkSize2"
									value="2" /><label for="chkSize2">중소기업</label></li>
								<li><input type="checkbox" name="chkSize" id="chkSize0"
									value="0" /><label for="chkSize0">기타</label></li>
							</ul>
						</dd>
					</dl>
				</div>
			</div>
			<br />
			<div class="bot">
				<div class="inp">
					<input name="search" type="text" id="search"
						placeholder="기업명을 입력해 주세요"
						style="ime-mode: active; width: 800; height: 37"
						onkeypress="if(event.keyCode==13){ EnterSearch();return false;}" />
		
						<button type="button" id="sc" class="btn">검색</button>
				</div>
			</div>
		</form>
	</div>
</div>
<br />

<div align="right">
   <button type="button" class="btn btn-default btn btn-sm">재무평가순
   </button>
   <button type="button" class="btn btn-default btn btn-sm">가나다순</button>
   <br />
</div>



<!-- 상세 조건 검색 - 체크박스 이벤트 처리  -->
<div id="result" style="height: 300">

 <div class="container">
   <table class="table table-bordered">
      <c:forEach var="i" items="${list2}" varStatus="vs">
         <c:if test="${vs.count %2 == 1 }">
            <tr>
         </c:if>
         <td>
            <div class="media">
               <div class="media-left media-middle">
                  <a href="/company/detail?cmpn_nm=${i.CMPN_NM }"> <img
                     src="${i.LOGO }" class="media-object" style="width: 60px">
                  </a>
               </div>
               <div class="media-body">
                  <a href="/company/detail?cmpn_nm=${i.CMPN_NM }"><h4>
                        <b>${i.CMPN_NM }</b>
                     </h4></a>
                  <h5>${i.DIVISION }|${i.SCALE }</h5>
                  <button type="button" class="btn btn-default">재무평가
                     ${i.FINANCE_SCORE }점</button>
                  <button type="button" class="btn btn-default">재직자 평판
                     ${i.SLAVE_SCORE }점</button>
                  <button type="button" class="btn btn-default">기업비교</button>
               </div>
            </div>
         </td>
         <c:if test="${vs.count %2 == 0 }">
         </c:if>
      </c:forEach>
   </table>
</div> 

 <!-- 페이지 뷰 --> 
<div align="center">
   <c:if test="${page ne 1 }">
      <a href="/search/company?page=${page -1 }">이전</a>
   </c:if>
   <c:forEach var="p" begin="1" end="${size }" varStatus="vs">
      <c:choose>
         <c:when test="${p eq page }">
            <b style="color: red;">${p }</b>
         </c:when>
         <c:otherwise>
            <a href="/search/company?page=${p }">${p }</a>
         </c:otherwise>
      </c:choose>
      <c:if test="${vs.last eq false }">|</c:if>
   </c:forEach>
   <c:if test="${page ne size }">
      <a href="/search/company?page=${page +1 }">다음</a>
      <br />
   </c:if>
   <br />
</div>
</div>

<script type="text/javascript" charset="utf-8">

   // 전체 체크 버튼 
   // 디폴트 전체 체크 해 놓음
   $("input:checkbox[value='전체']").each(function (index, item) {
      var GroupName = $(item).prop('name');
      if ($('input:checkbox[name=' + GroupName + ']:checked:not("#' + GroupName + '전체")').length == 0)
         $('#' + GroupName + '전체').prop("checked", true);
   });

   // 지역별 전체 체크
    $("input:checkbox[name=chkSido]").on("change", function () {
      CheckBox_onchange($(this), $(this).val(), 'chkSido');
   });
   
   // 산업별 전체 체크
   $("input:checkbox[name=chkJinhakCode]").on("change", function () {
      CheckBox_onchange($(this), $(this).val(), 'chkJinhakCode');
   });
   
   // 규모별 전체 체크
   $("input:checkbox[name=chkSize]").on("change", function () {
      CheckBox_onchange($(this), $(this).val(), 'chkSize');
   });
   // 체크박스 전체 선택하면 나머지 해제 / 나머지 선택하면 전체 해제
   function CheckBox_onchange(obj, checkedVal, chkName) {
      if (checkedVal == 'J1' && chkName == 'chkJinhakCode') {
         if ($('#chkJinhakCodeJ1').is(':checked')) $('#chkJinhakCodeJ1전체').prop("checked", true);
         else { $('#chkJinhakCodeJ1전체').prop("checked", true); $('input:checkbox[chkJinhakCodeSub=2]:checked').prop("checked", false); }
         //return;
      }
      else if (obj.attr("chkJinhakCodeSub") == '1') {
         $('#chkJinhakCodeJ1전체').prop("checked", true); $('input:checkbox[chkJinhakCodeSub=2]:checked').prop("checked", false);
         return;
      }
      else if (obj.attr("chkJinhakCodeSub") == '2') {
         if ($('#chkJinhakCodeJ1전체').is(':checked')) { $('#chkJinhakCodeJ1전체').prop("checked", false); }
         return;
      }
               
      var numberOfChecked = $('input:checkbox[name=' + chkName + ']:checked').length;
      if (checkedVal == "전체" && numberOfChecked > 1)
         $('input:checkbox[name=' + chkName + ']:checked:not("#' + chkName + '전체")').prop("checked", false);
      else if (checkedVal != "전체")
         $('#' + chkName + '전체').prop("checked", false);
   }

   
   // 검색버튼 작동
   $("#sc").on("click", function() {
      var search = $("#search").val();
      var chkSido = [];
      var chkJinhakCode = [];
      var chkSize = [];

      $("input[name='chkSido']:checked").each(function() {
         chkSido.push($(this).val());
      });
      $("input[name='chkJinhakCode']:checked").each(function() {
         chkJinhakCode.push($(this).val());
      });
      $("input[name='chkSize']:checked").each(function() {
         chkSize.push($(this).val());
      });

      console.log(search);
      console.log(chkSido);
      console.log(chkJinhakCode);
      console.log(chkSize);

      $.ajax({
         "url" : "/search/detail",
         "method" : "post",
         "data" : {
            "search" : search,
            "chkSido" : chkSido,
            "chkJinhakCode" : chkJinhakCode,
            "chkSize" : chkSize
         }
      }).done(function(aw) {
         $("#result").html(aw);
      })
   });
</script>
