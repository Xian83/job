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
               <input name="search" type="text" id="search" placeholder="기업명을 입력해 주세요"
                  style="ime-mode: active; width: 800; height: 37"
                  onkeypress="if(event.keyCode==13){ EnterSearch();return false;}" />
               <!-- <a href="javascript:void(0);">
   <input name="uc_Cond1$CompName" type="text"
            id="uc_Cond1_CompName" value="기업명을 입력해 주세요" 
            onfocus="this.value=&#39;&#39;;" style="ime-mode: active; width:800; height:37"
            onkeypress="if(event.keyCode==13){ EnterSearch();return false;}" />
   <a href="javascript:void(0);"> -->

               <!--    <img
            src="http://image.jinhak.com/job/corp/btn_search.gif" alt="검색"
            id="imgSearch" /></a> 
      <p> -->
               <button type="button" id="sc" class="btn">검색</button>
               </p>
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

<!-- 목록 뷰 -->
<%-- <div class="container">
   <table class="table table-bordered">
      <c:forEach var="obj" items="${list2 }" varStatus="vs">
         <c:if test="${vs.count %2 == 1 }">
            <tr>
         </c:if>
         <td>
            <div class="media">
               <div class="media-left media-middle">
                  <a href="/company/detail?cmpn_nm=${obj.CMPN_NM }"> <img
                     src="${obj.LOGO }" class="media-object" style="width: 60px">
                  </a>
               </div>
               <div class="media-body">
                  <a href="/company/detail?cmpn_nm=${obj.CMPN_NM }"><h4>
                        <b>${obj.CMPN_NM }</b>
                     </h4></a>
                  <h5>${obj.DIVISION }|${obj.SCALE }</h5>
                  <button type="button" class="btn btn-default">재무평가
                     ${obj.FINANCE_SCORE }점</button>
                  <button type="button" class="btn btn-default">재직자 평판
                     ${obj.SLAVE_SCORE }점</button>
                  <button type="button" class="btn btn-default">기업비교</button>
               </div>
            </div>
         </td>
         <c:if test="${vs.count %2 == 0 }">
         </c:if>
      </c:forEach>
   </table>
</div>  --%>





<!-- 상세 조건 검색 - 체크박스 이벤트 처리  -->
<div id="result" style="height: 300"></div>
<script type="text/javascript" charset="utf-8">

$("#sc").on("click", function(){
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
	   }).done(function(aw){         
	      $("#result").html(aw);
	   });
	});

// 위에서 끝부분만 수정하면 <div> result 구역에 뿌려줌
/* 	}).done(function(aw){         
		   var txt = "";
	   for(var i=0; i< aw.list.length; i++) {
	 	  txt +="회사이름 : "+aw.list[i].CMPN_NM+"<br/>";
	 	  txt +="로고 : "+aw.list[i].LOGO+"<br/>";
	 	  txt +="재무평가 : "+aw.list[i].FINANCE_SCORE+"<br/>";
	 	  txt +="재직자평판 : "+aw.list[i].EMPLOYEE_SCORE+"<br/>";
	 	  txt +="규모 : "+aw.list[i].SCALE+"<br/>";
	 	  txt +="분야 : "+aw.list[i].DIVISION+"<br/>";
	   }
	   $("#result").html(txt);
	});
	}); */

</script>

<%-- <!-- 페이지 뷰 --> 
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
 --%>

<!-- <script type="text/javascript" charset="utf-8">
$("#sc").on("click",function(){
   var chkSido = [];
   
   $("input[name='chkSido']:checked").each(function() {
      chkSido.push($(this).val());
   });
   
   console.log(chkSido);
   
   $.ajax({
      "url" : "/search/detail",
      "method" : "get"
       "data" :  
   }).done(function(){
      
   });
   
});
   
   $(function() {

      //검색, 검색조건 저장 클릭 시
      $("#sc").on("click", function() {
         //alert($("select[name=ddlScale] option:selected").val());
         //alert($('input:checkbox[name=chkSido]:checked').map(function() {return this.value;}).get().join(','));
         //return;

         EnterSearch();
      });

      // 지역별 전체 체크
      $("input:checkbox[name=chkSido]").on("change", function() {
         //alert($(this).val());
         CheckBox_onchange($(this), $(this).val(), 'chkSido');
         //            var checkedVal = $(this).val();
         //            var numberOfChecked = $('input:checkbox[name=chkSido]:checked').length;
         //            if (checkedVal == "전체" && numberOfChecked > 1)
         //               $('input:checkbox[name=chkSido]:checked:not("#chkSido전체")').prop("checked",false);
         //            else if (checkedVal != "전체")
         //               $("#chkSido전체").prop("checked",false);
      });

      // 산업별 전체 체크
      $("input:checkbox[name=chkJinhakCode]").on("change", function() {
         CheckBox_onchange($(this), $(this).val(), 'chkJinhakCode');
      });

      // 규모별 전체 체크
      $("input:checkbox[name=chkSize]").on("change", function() {
         CheckBox_onchange($(this), $(this).val(), 'chkSize');
      });


      // 디폴트 전체
      //$("input:checkbox[value='전체']").prop("checked", true);
      $("input:checkbox[value='전체']")
            .each(
                  function(index, item) {
                     var GroupName = $(item).prop('name');
                     //alert(GroupName);
                     // 전체를 제외한 체크 없으면 전체 체크
                     //alert($('input:checkbox[name=' + GroupName + ']:checked:not("#' + GroupName + '전체")').length);
                     if ($('input:checkbox[name=' + GroupName
                           + ']:checked:not("#' + GroupName + '전체")').length == 0)
                        $('#' + GroupName + '전체').prop("checked", true);
                  });

      // 맨처음 : 추천대학은 EnterSearch 다른경우는 디폴트
      // ifrmList src 는 항상 공란이므로 매번 리퀘스트를 다시 만들어준다.
      // /Comp/Controls/ifrmCompList.aspx?flag=IPO&ThemeName=&Sort=a.TotJum desc&IsRecom=IPO
      //alert($("#txtReq").val());
      //alert($("#ifrmList")[0].src);
      if ($("#txtReq").val() == '') {
         if ("IPO" == "Recom")
            EnterSearch();
         else
            $("#txtReq")
                  .val(
                        "/Comp/Controls/ifrmCompList.aspx?flag=IPO&ThemeName=&Sort=a.TotJum desc&IsRecom=IPO");
      }
      if ($("#ifrmList")[0].src == '')
         $("#ifrmList")[0].src = $("#txtReq").val();

      $(document)
            .mousedown(
                  function(e) {
                     // 부모html에서 자식iframe 접근, 제어  // jQuery
                     //$('#iframe').contents().find('#foo').text('안녕하세요');
                     $('#ifrmList')
                           .contents()
                           .find('.msgDetail')
                           .each(
                                 function() {
                                    if ($(this).css('display') == 'block') {
                                       var l_position = $(this)
                                             .offset();
                                       l_position.right = parseInt(l_position.left)
                                             + ($(this).width());
                                       l_position.bottom = parseInt(l_position.top)
                                             + parseInt($(this)
                                                   .height());

                                       if ((l_position.left <= e.pageX && e.pageX <= l_position.right)
                                             && (l_position.top <= e.pageY && e.pageY <= l_position.bottom)) {
                                          //alert('popup in click');
                                       } else {
                                          //alert('popup out click');
                                          $(this).hide("fast");
                                       }
                                    }
                                 });

                     $('.msgDetail')
                           .each(
                                 function() {
                                    if ($(this).css('display') == 'block') {
                                       var l_position = $(this)
                                             .offset();
                                       l_position.right = parseInt(l_position.left)
                                             + ($(this).width());
                                       l_position.bottom = parseInt(l_position.top)
                                             + parseInt($(this)
                                                   .height());

                                       if ((l_position.left <= e.pageX && e.pageX <= l_position.right)
                                             && (l_position.top <= e.pageY && e.pageY <= l_position.bottom)) {
                                          //alert( 'popup in click' );
                                       } else {
                                          //alert( 'popup out click' );
                                          $(this).hide("fast");
                                          //$(this).hide();
                                       }
                                    }
                                 });
                  });

   });

   // 체크박스 전체 선택하면 나머지 해제 / 나머지 선택하면 전체 해제
   function CheckBox_onchange(obj, checkedVal, chkName) {
      //alert(checkedVal + ' // ' + chkName);
      //alert(obj.attr("chkJinhakCodeSub"));
      if (checkedVal == 'J1' && chkName == 'chkJinhakCode') {
         if ($('#chkJinhakCodeJ1').is(':checked'))
            $('#chkJinhakCodeJ1전체').prop("checked", true);
         else {
            $('#chkJinhakCodeJ1전체').prop("checked", true);
            $('input:checkbox[chkJinhakCodeSub=2]:checked').prop("checked",
                  false);
         }
         //return;
      } else if (obj.attr("chkJinhakCodeSub") == '1') {
         $('#chkJinhakCodeJ1전체').prop("checked", true);
         $('input:checkbox[chkJinhakCodeSub=2]:checked').prop("checked",
               false);
         return;
      } else if (obj.attr("chkJinhakCodeSub") == '2') {
         if ($('#chkJinhakCodeJ1전체').is(':checked')) {
            $('#chkJinhakCodeJ1전체').prop("checked", false);
         }
         return;
      }

      var numberOfChecked = $('input:checkbox[name=' + chkName + ']:checked').length;
      if (checkedVal == "전체" && numberOfChecked > 1)
         $(
               'input:checkbox[name=' + chkName + ']:checked:not("#'
                     + chkName + '전체")').prop("checked", false);
      else if (checkedVal != "전체")
         $('#' + chkName + '전체').prop("checked", false);
   }
   String.prototype.endsWith = function(pattern) {
      var d = this.length - pattern.length;
      return d >= 0 && this.lastIndexOf(pattern) === d;
   };
   // 기업명 입력후 엔터적용
   function EnterSearch() {
      // 전체외 모두체크 ==> 전체 로 ...
      var Sido = $('input:checkbox[name=chkSido]:checked').map(function() {
         return this.value;
      }).get().join(',');
      if (($('input:checkbox[name=chkSido]').length - 1) == $('input:checkbox[name=chkSido]:checked:not("#chkSido전체")').length)
         Sido = "전체";

      var JinhakCode = $('input:checkbox[name=chkJinhakCode]:checked').map(
            function() {
               return this.value;
            }).get().join(',');
      if (($('input:checkbox[name=chkJinhakCode]').length - 1) == $('input:checkbox[name=chkJinhakCode]:checked:not("#chkJinhakCode전체")').length)
         JinhakCode = "전체";

      // J1,J1전체 예외
      //alert((',' + JinhakCode + ',').indexOf(',J1,'));
      if ((',' + JinhakCode + ',').indexOf(',J1,') > -1)
         JinhakCode = (',' + JinhakCode + ',').replace(',J1,', '');
      if (JinhakCode.substr(0, 1) == ',')
         JinhakCode = JinhakCode.substr(1);
      if (JinhakCode.endsWith(','))
         JinhakCode = JinhakCode.substr(0, JinhakCode.length - 1);
      //alert(JinhakCode);

      var Size = $('input:checkbox[name=chkSize]:checked').map(function() {
         return this.value;
      }).get().join(',');
      if (($('input:checkbox[name=chkSize]').length - 1) == $('input:checkbox[name=chkSize]:checked:not("#chkSize전체")').length)
         Size = "전체";

      var CName = $('#search').length == 0 ? "" : $(
            '#search').val().trim();
      if (CName == "기업명을 입력해 주세요")
         CName = "";

      // 유저셋팅 여부는 모든항목 25% 아니면...
      var UserSetting = 'N';
      var TypeJum = 0, StableJum = 0, GrowJum = 0, ProfitJum = 0;

      //alert($("select[name=ddlScale] option:selected").val());

      var SortVal = $('#ifrmList').get(0).contentWindow.SortVal;
      //alert('SortVal='+SortVal);
      if (SortVal == null)
         SortVal = $('#txtSortVal').val();

      var params = "&chkSido=" + encodeURIComponent(Sido) //지역 시도
            + "&JCode=" + encodeURIComponent(JinhakCode) //산업(업종)
            + "&Size=" + encodeURIComponent(Size) //규모
            + "&search=" + encodeURIComponent(CName) //기업명
      ;
      

      // alert("params : " + params);
      $("#ifrmList")[0].src = "/Comp/Controls/ifrmCompList.aspx?" + params;
      
      // 내가 함 - 검색 버튼 누르면 파람값 넘기기 
      var chkSido = document.getElementById("chkSido").value;
      var chkJinhakCode = document.getElementById("chkJinhakCode").value;
      var chkSize = document.getElementById("chkSize").value;
      var search = document.getElementById("search").value;
      
      var params2 = "&chkSido=" + chkSido //지역 시도
      + "&JCode=" + chkJinhakCode //산업(업종)
      + "&Size=" + chkSize //규모
      + "&search=" + search //기업명
   ;

      System.out.println("param2 = " +params2);
      console.log("param2 = " +params2);
      $("#sc").onclick(function(){
         
         {"size":1,"list2":[{"CMPN_NM":"메디헬스","LOGO":"http://image.jinhak.com/job/site/tmp02.gif","FINANCE_SCORE":63.5,"EMPLOYEE_SCORE":100,"SCALE":"중소기업","DIVISION":"판매ㆍ유통"},
            {"CMPN_NM":"메디헬스","LOGO":"http://image.jinhak.com/job/site/tmp02.gif","FINANCE_SCORE":63.5,"EMPLOYEE_SCORE":100,"SCALE":"중소기업","DIVISION":"판매ㆍ유통"},
            {"CMPN_NM":"메디헬스","LOGO":"http://image.jinhak.com/job/site/tmp02.gif","FINANCE_SCORE":63.5,"EMPLOYEE_SCORE":100,"SCALE":"중소기업","DIVISION":"판매ㆍ유통"}],"page":"1"}
         }
         $.ajax({
            "url" : "/search/detail?"+params2 // 일단 ajax로 파라미터 q를 넘김  => ajax에서 파라미터 받고, 보낼 값 형식 지정해야 함
         }).done(function(a){                        // 파라미터 값이 하나 있으니 아무 변수이름(상관x) 하나 지정해서 값 받음
            console.log(a);
            $("#result").append("회사이름 : "+a[0]+" / "+a[1]+"<br/>");  
         
            $("#result").append("로고 : "+a.LOGO+"<br/>");  
            $("#result").append("재무평가 : "+a.FINANCE_SCORE+"<br/>");  
            $("#result").append("재직자평판 : "+a.EMPLOYEE_SCORE+"<br/>"); 
            $("#result").append("규모 : "+a.SCALE+"<br/>"); 
            $("#result").append("분야 : "+a.DIVISION+"<br/>"); 
         });
      })
      
   } -->
     
</script>

