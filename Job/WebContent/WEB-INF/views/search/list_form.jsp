<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <div class="bot">
					<div class="inp"><input name="uc_Cond1$CompName" type="text" id="uc_Cond1_CompName" value="기업명을 입력해 주세요" onfocus="this.value=&#39;&#39;;" style="ime-mode:active;" onkeypress="if(event.keyCode==13){ EnterSearch();return false;}" /><a href="javascript:void(0);">
							<img src="http://image.jinhak.com/job/corp/btn_search.gif" alt="검색" id="imgSearch" /></a></div>
</div> -->

<!-- <input type = "text"name="val1" width="500" height="50" value="기업명을 입력해 주세요" /> -->

<div class="corp_src ">
	<div class="top at4">
		<dl>
			<dt>
				<img src="http://image.jinhak.com/job/corp/src_dt01.png" alt="지역별" />
			</dt>
			<dd>
				<ul class="wd1">
					<li><input type="checkbox" name="chkSido" id="chkSido전체"
						value="전체" /><label for="chkSido전체">전체</label></li>
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
					<li><input type="checkbox" name="chkSido" id="chkSido충북"
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
		<dl>
			<dt>
				<img src="http://image.jinhak.com/job/corp/src_dt02.png" alt="산업별" />
			</dt>
			<dd>
				<ul class="wd2">
					<li><input type="checkbox" name="chkJinhakCode"
						id="chkJinhakCode전체" value="전체" /><label for="chkJinhakCode전체">전체</label></li>
					<li class="atMaking"><input type="checkbox"
						name="chkJinhakCode" id="chkJinhakCodeJ1" value="J1" /><label
						for="chkJinhakCodeJ1">제조·화학</label>
						<div class="more">
							<ul>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ1전체" chkJinhakCodeSub='1' value="J1전체" /><label
									for="chkJinhakCodeJ1전체">전체</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ101" chkJinhakCodeSub='2' value="J101" /><label
									for="chkJinhakCodeJ101">전자제품·반도체</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ102" chkJinhakCodeSub='2' value="J102" /><label
									for="chkJinhakCodeJ102">전기장비</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ103" chkJinhakCodeSub='2' value="J103" /><label
									for="chkJinhakCodeJ103">기계장비</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ104" chkJinhakCodeSub='2' value="J104" /><label
									for="chkJinhakCodeJ104">자동차·운송장비</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ105" chkJinhakCodeSub='2' value="J105" /><label
									for="chkJinhakCodeJ105">석유·화학</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ106" chkJinhakCodeSub='2' value="J106" /><label
									for="chkJinhakCodeJ106">제약</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ107" chkJinhakCodeSub='2' value="J107" /><label
									for="chkJinhakCodeJ107">의료·정밀·광학</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ108" chkJinhakCodeSub='2' value="J108" /><label
									for="chkJinhakCodeJ108">금속</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ109" chkJinhakCodeSub='2' value="J109" /><label
									for="chkJinhakCodeJ109">시멘트·유리·요업 </label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ110" chkJinhakCodeSub='2' value="J110" /><label
									for="chkJinhakCodeJ110">식품·음료</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ111" chkJinhakCodeSub='2' value="J111" /><label
									for="chkJinhakCodeJ111">섬유·의복</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ112" chkJinhakCodeSub='2' value="J112" /><label
									for="chkJinhakCodeJ112">목재·가구</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ113" chkJinhakCodeSub='2' value="J113" /><label
									for="chkJinhakCodeJ113">종이·인쇄</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ114" chkJinhakCodeSub='2' value="J114" /><label
									for="chkJinhakCodeJ114">기타 제품</label></li>
								<li><input type="checkbox" name="chkJinhakCode"
									id="chkJinhakCodeJ115" chkJinhakCodeSub='2' value="J115" /><label
									for="chkJinhakCodeJ115">고무·플라스틱</label></li>
							</ul>
						</div></li>
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
						id="chkJinhakCodeJ10" value="J10" /><label for="chkJinhakCodeJ10">공공서비스</label></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>
				<img src="http://image.jinhak.com/job/corp/src_dt04.png" alt="규모별" />
			</dt>
			<dd>
				<ul class="wd2">
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




	<!-- 목록 뷰 -->
	<div class="container">
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



	<!-- 상세 조건 검색 - 체크박스 이벤트 처리  -->
	<script type="text/javascript" charset="utf-8">
		$(function() {

			//검색, 검색조건 저장 클릭 시
			$("#imgSearch").on("click", function() {
				//alert($("select[name=ddlScale] option:selected").val());
				//alert($('input:checkbox[name=chkSido]:checked').map(function() {return this.value;}).get().join(','));
				//return;

				EnterSearch();
			});

			// 지역별 전체 체크
			$("input:checkbox[name=chkSido]").on("change", function() {
				//alert($(this).val());
				CheckBox_onchange($(this), $(this).val(), 'chkSido');
				//				var checkedVal = $(this).val();
				//				var numberOfChecked = $('input:checkbox[name=chkSido]:checked').length;
				//				if (checkedVal == "전체" && numberOfChecked > 1)
				//					$('input:checkbox[name=chkSido]:checked:not("#chkSido전체")').prop("checked",false);
				//				else if (checkedVal != "전체")
				//					$("#chkSido전체").prop("checked",false);
			});

			// 산업별 전체 체크
			$("input:checkbox[name=chkJinhakCode]").on("change", function() {
				CheckBox_onchange($(this), $(this).val(), 'chkJinhakCode');
			});

			// 규모별 전체 체크
			$("input:checkbox[name=chkSize]").on("change", function() {
				CheckBox_onchange($(this), $(this).val(), 'chkSize');
			});

			// 강소기업 유형별 전체 체크
			$("input:checkbox[name=chkGangsoType]").on("change", function() {
				CheckBox_onchange($(this), $(this).val(), 'chkGangsoType');
			});

			// 공기업 분류별 전체 체크
			$("input:checkbox[name=chkPublicCode]").on("change", function() {
				CheckBox_onchange($(this), $(this).val(), 'chkPublicCode');
			});

			// 상장여부 전체 체크
			$("input:checkbox[name=chkIsStock]").on("change", function() {
				CheckBox_onchange($(this), $(this).val(), 'chkIsStock');
			});
			// 상장구분 전체 체크
			$("input:checkbox[name=chkIPO]").on("change", function() {
				CheckBox_onchange($(this), $(this).val(), 'chkIPO');
			});

			// 세부업종 전체 체크
			$("input:checkbox[name=chkSubName]").on("change", function() {
				CheckBox_onchange($(this), $(this).val(), 'chkSubName');
			});
			// 그룹사 전체 체크
			$("input:checkbox[name=chkGroupCode]").on("change", function() {
				CheckBox_onchange($(this), $(this).val(), 'chkGroupCode');
			});
			// 취재구분 전체 체크
			$("input:checkbox[name=chkReport]").on("change", function() {
				CheckBox_onchange($(this), $(this).val(), 'chkReport');
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
										+ ']:checked:not("#' + GroupName
										+ '전체")').length == 0)
									$('#' + GroupName + '전체').prop("checked",
											true);
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
																+ ($(this)
																		.width());
														l_position.bottom = parseInt(l_position.top)
																+ parseInt($(
																		this)
																		.height());

														if ((l_position.left <= e.pageX && e.pageX <= l_position.right)
																&& (l_position.top <= e.pageY && e.pageY <= l_position.bottom)) {
															//alert('popup in click');
														} else {
															//alert('popup out click');
															$(this)
																	.hide(
																			"fast");
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
																+ ($(this)
																		.width());
														l_position.bottom = parseInt(l_position.top)
																+ parseInt($(
																		this)
																		.height());

														if ((l_position.left <= e.pageX && e.pageX <= l_position.right)
																&& (l_position.top <= e.pageY && e.pageY <= l_position.bottom)) {
															//alert( 'popup in click' );
														} else {
															//alert( 'popup out click' );
															$(this)
																	.hide(
																			"fast");
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
					$('input:checkbox[chkJinhakCodeSub=2]:checked').prop(
							"checked", false);
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

			var numberOfChecked = $('input:checkbox[name=' + chkName
					+ ']:checked').length;
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
			var Sido = $('input:checkbox[name=chkSido]:checked').map(
					function() {
						return this.value;
					}).get().join(',');
			if (($('input:checkbox[name=chkSido]').length - 1) == $('input:checkbox[name=chkSido]:checked:not("#chkSido전체")').length)
				Sido = "전체";

			var JinhakCode = $('input:checkbox[name=chkJinhakCode]:checked')
					.map(function() {
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

			var Size = $('input:checkbox[name=chkSize]:checked').map(
					function() {
						return this.value;
					}).get().join(',');
			if (($('input:checkbox[name=chkSize]').length - 1) == $('input:checkbox[name=chkSize]:checked:not("#chkSize전체")').length)
				Size = "전체";

			var GangsoType = $('input:checkbox[name=chkGangsoType]:checked')
					.map(function() {
						return this.value;
					}).get().join(',');
			if (($('input:checkbox[name=chkGangsoType]').length - 1) == $('input:checkbox[name=chkGangsoType]:checked:not("#chkGangsoType전체")').length)
				GangsoType = "전체";

			var PublicCode = $('input:checkbox[name=chkPublicCode]:checked')
					.map(function() {
						return this.value;
					}).get().join(',');
			if (($('input:checkbox[name=chkPublicCode]').length - 1) == $('input:checkbox[name=chkPublicCode]:checked:not("#chkPublicCode전체")').length)
				PublicCode = "전체";

			var IsStock = $('input:checkbox[name=chkIsStock]:checked').map(
					function() {
						return this.value;
					}).get().join(',');
			if (($('input:checkbox[name=chkIsStock]').length - 1) == $('input:checkbox[name=chkIsStock]:checked:not("#chkIsStock전체")').length)
				IsStock = "전체";

			var IPO = $('input:checkbox[name=chkIPO]:checked').map(function() {
				return this.value;
			}).get().join(',');
			if (($('input:checkbox[name=chkIPO]').length - 1) == $('input:checkbox[name=chkIPO]:checked:not("#chkIPO전체")').length)
				IPO = "전체";

			var SubName = $('input:checkbox[name=chkSubName]:checked').map(
					function() {
						return this.value;
					}).get().join(',');
			if (($('input:checkbox[name=chkSubName]').length - 1) == $('input:checkbox[name=chkSubName]:checked:not("#chkSubName전체")').length)
				SubName = "전체";

			var GroupCode = $('input:checkbox[name=chkGroupCode]:checked').map(
					function() {
						return this.value;
					}).get().join(',');
			if (($('input:checkbox[name=chkGroupCode]').length - 1) == $('input:checkbox[name=chkGroupCode]:checked:not("#chkGroupCode전체")').length)
				GroupCode = "전체";

			var ReportGubun = $('input:checkbox[name=chkReport]:checked').map(
					function() {
						return this.value;
					}).get().join(',');
			if (($('input:checkbox[name=chkReport]').length - 1) == $('input:checkbox[name=chkReport]:checked:not("#chkReport전체")').length)
				Report = "전체";

			var CName = $('#uc_Cond1_CompName').length == 0 ? "" : $(
					'#uc_Cond1_CompName').val().trim();
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

			var params = "flag=IPO" //1000대기업
					+ "&AreaSido=" + encodeURIComponent(Sido) //지역 시도
					+ "&JCode=" + encodeURIComponent(JinhakCode) //산업(업종)
					+ "&IsStock=" + encodeURIComponent(IsStock) //상장여부
					+ "&Size=" + encodeURIComponent(Size) //규모
					+ "&GangsoType=" + encodeURIComponent(GangsoType) //산업(업종)
					+ "&PublicCode=" + encodeURIComponent(PublicCode) //공기업 분류
					+ "&IPO=" + encodeURIComponent(IPO) //상장구분 (상장,코스닥,..)
					+ "&ThemeName=" + encodeURIComponent('') //테마구분
					+ "&SubName=" + encodeURIComponent(SubName) //세부업종
					+ "&GroupCode=" + encodeURIComponent(GroupCode) //그룹사
					+ "&ReportGubun=" + encodeURIComponent(ReportGubun) //취재구분
					+ "&CName=" + encodeURIComponent(CName) //기업명
					+ "&UserSetting=" + UserSetting + "&TypeJum=" + TypeJum
					+ "&StableJum=" + StableJum + "&GrowJum=" + GrowJum
					+ "&ProfitJum=" + ProfitJum + "&Sort=" + SortVal // 2016.05.19 iframe 변수 참조
			;

			// alert("params : " + params);
			$("#ifrmList")[0].src = "/Comp/Controls/ifrmCompList.aspx?"
					+ params;
		}
	</script>