<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- <div class="bot">
					<div class="inp"><input name="uc_Cond1$CompName" type="text" id="uc_Cond1_CompName" value="기업명을 입력해 주세요" onfocus="this.value=&#39;&#39;;" style="ime-mode:active;" onkeypress="if(event.keyCode==13){ EnterSearch();return false;}" /><a href="javascript:void(0);">
							<img src="http://image.jinhak.com/job/corp/btn_search.gif" alt="검색" id="imgSearch" /></a></div>
</div> -->

	<!-- <input type = "text"name="val1" width="500" height="50" value="기업명을 입력해 주세요" /> -->
	

	
<form class="form-horizontal">
	<div class="form-group">
		<div class="col-sm-10">
			<input type="text" class="form-control" id="email"
				placeholder="기업명을 입력해 주세요">
		</div>
		<button type="submit" class="btn btn-danger btn-md" >검색</button>
	</div>
</form>



<div class="corp_src">
		<div class="top at1"><dl>
<dt><img src="http://image.jinhak.com/job/corp/src_dt01.png" alt="지역별" /></dt>
<dd>
	<ul class="wd1"><li><input type="checkbox" name="chkSido" id="chkSido전체" value="전체" /><label for="chkSido전체">전체</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido서울" value="서울" /><label for="chkSido서울">서울</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido부산" value="부산" /><label for="chkSido부산">부산</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido대구" value="대구" /><label for="chkSido대구">대구</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido인천" value="인천" /><label for="chkSido인천">인천</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido광주" value="광주" /><label for="chkSido광주">광주</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido대전" value="대전" /><label for="chkSido대전">대전</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido울산" value="울산" /><label for="chkSido울산">울산</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido세종" value="세종" /><label for="chkSido세종">세종</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido경기" value="경기" /><label for="chkSido경기">경기</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido강원" value="강원" /><label for="chkSido강원">강원</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido충북" value="충북" /><label for="chkSido충북">충북</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido충남" value="충남" /><label for="chkSido충남">충남</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido전북" value="전북" /><label for="chkSido전북">전북</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido전남" value="전남" /><label for="chkSido전남">전남</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido경북" value="경북" /><label for="chkSido경북">경북</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido경남" value="경남" /><label for="chkSido경남">경남</label></li>
<li><input type="checkbox" name="chkSido" id="chkSido제주" value="제주" /><label for="chkSido제주">제주</label></li>
</ul>
</dd>
</dl>
<dl>
<dt><img src="http://image.jinhak.com/job/corp/src_dt02.png" alt="산업별" /></dt>
<dd>
	<ul class="wd2"><li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCode전체" value="전체" /><label for="chkJinhakCode전체">전체</label></li>
<li class="atMaking"><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ1" value="J1" /><label for="chkJinhakCodeJ1">제조·화학</label>
<div class="more">
<ul>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ1전체" chkJinhakCodeSub='1' value="J1전체" /><label for="chkJinhakCodeJ1전체">전체</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ101" chkJinhakCodeSub='2' value="J101" /><label for="chkJinhakCodeJ101">전자제품·반도체</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ102" chkJinhakCodeSub='2' value="J102" /><label for="chkJinhakCodeJ102">전기장비</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ103" chkJinhakCodeSub='2' value="J103" /><label for="chkJinhakCodeJ103">기계장비</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ104" chkJinhakCodeSub='2' value="J104" /><label for="chkJinhakCodeJ104">자동차·운송장비</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ105" chkJinhakCodeSub='2' value="J105" /><label for="chkJinhakCodeJ105">석유·화학</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ106" chkJinhakCodeSub='2' value="J106" /><label for="chkJinhakCodeJ106">제약</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ107" chkJinhakCodeSub='2' value="J107" /><label for="chkJinhakCodeJ107">의료·정밀·광학</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ108" chkJinhakCodeSub='2' value="J108" /><label for="chkJinhakCodeJ108">금속</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ109" chkJinhakCodeSub='2' value="J109" /><label for="chkJinhakCodeJ109">시멘트·유리·요업 </label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ110" chkJinhakCodeSub='2' value="J110" /><label for="chkJinhakCodeJ110">식품·음료</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ111" chkJinhakCodeSub='2' value="J111" /><label for="chkJinhakCodeJ111">섬유·의복</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ112" chkJinhakCodeSub='2' value="J112" /><label for="chkJinhakCodeJ112">목재·가구</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ113" chkJinhakCodeSub='2' value="J113" /><label for="chkJinhakCodeJ113">종이·인쇄</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ114" chkJinhakCodeSub='2' value="J114" /><label for="chkJinhakCodeJ114">기타 제품</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ115" chkJinhakCodeSub='2' value="J115" /><label for="chkJinhakCodeJ115">고무·플라스틱</label></li>
</ul>
</div>
</li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ2" value="J2" /><label for="chkJinhakCodeJ2">은행·금융</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ3" value="J3" /><label for="chkJinhakCodeJ3">IT·미디어</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ4" value="J4" /><label for="chkJinhakCodeJ4">의료·보건</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ5" value="J5" /><label for="chkJinhakCodeJ5">건설·부동산</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ6" value="J6" /><label for="chkJinhakCodeJ6">판매·유통</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ7" value="J7" /><label for="chkJinhakCodeJ7">교육·출판</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ8" value="J8" /><label for="chkJinhakCodeJ8">여가·스포츠</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ9" value="J9" /><label for="chkJinhakCodeJ9">기타서비스</label></li>
<li><input type="checkbox" name="chkJinhakCode" id="chkJinhakCodeJ10" value="J10" /><label for="chkJinhakCodeJ10">공공서비스</label></li>
</ul>
</dd>
</dl>
</div>
<dt><img src="http://image.jinhak.com/job/corp/src_dt04.png" alt="규모별" /></dt>
<dd>
	<ul class="wd2"><li><input type="checkbox" name="chkSize" id="chkSize전체" value="전체" /><label for="chkSize전체">전체</label></li>
<li><input type="checkbox" name="chkSize" id="chkSize1" value="1" /><label for="chkSize1">대기업</label>
<span class="msgToggle"><img src="http://image.jinhak.com/job/corp/Bl07.gif" alt="도움말" /></span>
<span class="tooltip1 arr2 msgDetail"><strong>대기업?</strong><br />대기업은 상호출자제한기업집단과 일부 공기업, 금융 보험 및 관련 서비스업체가 이에 해당됩니다. 법류적으로는 『중소기업기본법』 제2조에 따른 중소기업과 『중견기업 성장촉진 및 경쟁력 강화에 관한 특별법』 제2조 1호에 따른 중견기업이 아닌 기업을 말합니다.</span>
</li>
<li><input type="checkbox" name="chkSize" id="chkSize3" value="3" /><label for="chkSize3">중견기업</label>
<span class="msgToggle"><img src="http://image.jinhak.com/job/corp/Bl07.gif" alt="도움말" /></span>
<span class="tooltip1 arr2 msgDetail"><strong>중견기업?</strong><br />중견기업은 『중견기업 성장촉진 및 경쟁력 강화에 관한 특별법』 제2조와 시행령에서 정의하는 바와 같이 중소기업 기본법상 중소기업의 범위를 벗어나고, 상호출자제한기업집단에 속하지 않는 기업을 말합니다.<br /><br />업종에 따른 세부적인 조건이 있으나, 일반적으로 상시 근로자수가 1천명 이상인 기업과 자산총액이 5천억원 이상인 기업을 통상적으로 중견기업으로 분류합니다.이밖에 공공기관, 금융, 보험 및 관련서비스업, 비영리법인, 외국법인(자산총액 5조원 이상)이 주식 또는 출자지분율 30% 이상 직간접적으로 소유하면서 최다출자자인 기업이 제외됩니다.</span>
</li>
<li><input type="checkbox" name="chkSize" id="chkSize2" value="2" /><label for="chkSize2">중소기업</label>
<span class="msgToggle"><img src="http://image.jinhak.com/job/corp/Bl07.gif" alt="도움말" /></span>
<span class="tooltip1 arr2 msgDetail"><strong>중소기업?</strong><br />중소기업육성을 위해 제정한 『중소기업기본법』 제2조와 시행령에 따라 정의된 기업을 말합니다. 자산총액이 5천억원 미만, 매출액 규모가 업종에 따라 400억~1,500억 이하인 기업이 이에 해당합니다. 법률에서 추가로 정의한 소기업(업종에 따라 매출액 10~120억 이하)도 중소기업으로 포함하여 단순화했습니다.</span>
</li>
<li><input type="checkbox" name="chkSize" id="chkSize0" value="0" /><label for="chkSize0">기타</label>
</li>
</ul>
</dd>
</dl>






<div class="container">
	<table class="table table-bordered">
		<c:forEach var="obj" items="${list2 }" varStatus="vs">
			<c:if test="${vs.count %2 == 1 }">
				<tr>
			</c:if>
			<td>
				<div class="media">
					<div class="media-left media-middle">
					 <a href="/company/detail?cmpn_nm=${obj.CMPN_NM }">
						<img src="${obj.LOGO }" class="media-object"
							style="width: 60px">
							</a>
					</div>
					<div class="media-body">
						<a
				href="/company/detail?cmpn_nm=${obj.CMPN_NM }"><h4>
						<b>${obj.CMPN_NM }</b>
					</h4></a>   <h5>${obj.DIVISION }  |  ${obj.SCALE }</h5>
				<button type="button" class="btn btn-default">재무평가
					${obj.FINANCE_SCORE }점</button>
				<button type="button" class="btn btn-default">재직자 평판
					${obj.SLAVE_SCORE }점</button>
				<button type="button" class="btn btn-default">기업비교</button>
					</div>
			</td>
			<c:if test="${vs.count %2 == 0 }">
				</tr>
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

