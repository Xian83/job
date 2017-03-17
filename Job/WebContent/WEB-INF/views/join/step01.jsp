<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1>약관동의</h1>
<br/>
<div align="center">
	<b>이용약관, 개인정보 수집 및 이용 약관(필수)에 모두 동의합니다.</b> <input type="checkbox" id="chkAll" />
	<hr />
	<div class="form-group" style="height: 150;" id="rule01" align="left">
		<label for="comment">이용약관(필수)에 동의합니다.</label> <input type="checkbox"
			id="chk01" />
		<textarea class="form-control" rows="5" id="comment">
제 1 조 (목적)
이 약관은 itJOB 주식회사 ("회사" 또는 "itJOB")가 제공하는 itJOB 및 itJOB 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
제 2 조 (정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 itJOB 및 itJOB 관련 제반 서비스를 의미합니다.
②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
③"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미합니다.
④"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
⑤"유료서비스"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함) 및 제반 서비스를 의미합니다.
⑥"포인트"라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.
⑦"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
		</textarea>
	</div>
	<div class="form-group" style="height: 150;" id="rule02" align="left">
		<label for="comment">개인정보 수집 및 이용 약관(필수)에 동의합니다.</label> <input
			type="checkbox" id="chk02" />
		<textarea class="form-control" rows="5" id="comment">
정보통신망법 규정에 따라 itJOB에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 itJOB 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, itJOB는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
회원가입 시점에 itJOB가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 가입인증 휴대폰번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대폰번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 가입인증 휴대폰번호를 필수항목으로 수집합니다. 그리고 단체 대표자명, 비밀번호 발급용 멤버 이름 및 이메일주소를 선택항목으로 수집합니다.
			서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
		</textarea>
	</div>
	<a href="/join/step02" class="btn btn-info btn-block" role="button">Next</a>
</div>
<script>
	var flag1 = $("#chk01").prop("checked");
	var flag2 = $("#chk02").prop("checked");

	$("#chkAll").on("change", function() {
		$("#chk01").trigger("change");
		$("#chk02").trigger("change");
	});

	$("#chk01").on("change", function() {
		$("#rule01").toggle(1000);
		$("#chk01").prop("checked", !$("#chk01").prop("checked"));
		check();
	});

	$("#chk02").on("change", function() {
		$("#rule02").toggle(1000);
		$("#chk02").prop("checked", !$("#chk02").prop("checked"));
		check();
	});

	function check() {
		if (flag1 && flag2) {
			$("#btn").prop("disabled", false);
		} else {
			$("#btn").prop("disabled", true);
		}
	}
</script>
