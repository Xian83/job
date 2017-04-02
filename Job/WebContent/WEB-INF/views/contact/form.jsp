<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>

<div class="container">

    <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        고객들이 자주 묻는 질문들을 모아둔 공간입니다. <br/>
        원하시는 답변을 찾지 못하셨다면, <strong>1대1 문의</strong>를 이용해주세요.
    </div>

	<br/>
	<div class="panel-group" id="accordion">
	<div class="faqHeader">회원가입, 로그인</div>
		<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                    	아이디를 변경하고 싶은데 가능한가요?
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
                    이미 회원가입을 하신 경우, 아이디를 변경하실 수 없습니다.
								<br />아이디 변경은 기존 회원의 아이디 중복 문제로 회원님이 임의로 변경하실 수 없으며, 변경을 원하시면
								회원탈퇴 후 신규로 가입하셔야 합니다.
								<br />
								<br />따라서 회원가입 시 신중하게 아이디를 정하시기 바랍니다.
                </div>
            </div>
        </div>
		<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                    	페이스북 로그인으로 itJOB을 이용하고 있는데 탈퇴하면 어떻게 되나요?
                    </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">
                	페이스북 로그인은 회원님의 아이디 정보가 정확한지 페이스북 사이트에 확인 한 후, 해당 아이디로 itJOB
									서비스를 이용하실 수 있도록 되어 있습니다.
									<br />
									<br />그렇기 때문에 페이스북을 탈퇴하시면 더이상 itJOB을 이용하실 수 없습니다.
									<br />또한, 페이스북 로그인으로 이용하시는 모든 서비스 이용에 제한을 받으실 수 있습니다.
                    itJOB 탈퇴 시, 해당 페이스북 아이디로 itJOB을 이용하셨던 이력서, 지원내역 등 모든 정보가 삭제됩니다.<br />
					같은 페이스북 아이디로 다시 itJOB을 이용하실 수 있지만 이전에 저장하셨던 정보들을 더이상 확인하실수 없습니다.          
				</div>
            </div>
        </div>
		<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                    	비밀번호 변경은 어디에서 하나요?
                    </a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body">
                    itJOB ID로 로그인 하신 회원의 경우, [회원정보 관리] 페이지에서 직접 변경이 가능합니다.
									<br />
									<br />비밀번호를 변경하는 방법은 다음과 같습니다.
									<br />1. 회원 로그인 후 [회원정보 관리] 클릭해 주세요.
									<br />2. 비밀번호 변경에서 새로운 비밀번호를 입력해 주세요.
									<br />
									<br />
									<br />소셜로그인 회원의 경우, itJOB에서는 소셜로그인의 비밀번호를 저장하고 있지 않습니다. 해당 소셜
									사이트를 방문하셔서 비밀번호를 변경 해 주세요.
									<br />
									<br />
									<br />개인정보보호를 위해 비밀번호는 정기적으로 변경해 주시길 권장합니다.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                    	회원정보 중에 생년월일과 성별이 잘못
									기입되었습니다. 어떻게 하나요?
                    </a>
                </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse">
                <div class="panel-body">
                    등록된 생년월일과 성별을 수정하실 수 없을 경우, 고객센터로 문의 주시면 간단한 본인 확인 후 안내해 드리도록
									하겠습니다.
									<br />
									<br />
									<strong>[itJOB 고객센터] </strong>
									<br />· ☎: 1588-XXXX
									<br />· E-mail: helpdesk@itjob.co.kr
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                    	회원가입은 어떻게 하나요?
                    </a>
                </h4>
            </div>
            <div id="collapseFive" class="panel-collapse collapse">
                <div class="panel-body">
                    itJOB 개인회원 가입은 온라인상에서 별도의 비용없이 무료 회원가입이 가능하며, 회원 가입 후에 서비스를 이용할
									수 있습니다.
									<br />
									<br />회원가입 방법은 itJOB ID 만들기 또는 소셜 로그인 중에서 선택하실 수 있습니다.
									<br />
									<br />* itJOB ID 만들기
									<br />1. 회원가입 클릭
									<br />2. 회원약관 및 개인정보 수집 및 이용에 대한 안내 동의
									<br />3. 아이디 및 회원정보 입력 후 가입완료
									<br />
									<br />*페이스북 로그인
									<br />1. 페이스북으로 시작 클릭
									<br />2. 페이스북 권한 요청 동의
									<br />3. itJOB 시작 팝업 클릭 시 가입완료
									<br />
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
                    	휴면 안내 메일을 받았는데, 휴면 정책이
									무엇인가요?
                    </a>
                </h4>
            </div>
            <div id="collapseSix" class="panel-collapse collapse">
                <div class="panel-body">
                    itJOB는 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 장기간 서비스를 이용하지 않은 회원의
									개인정보보호를 위하여
									<br />
									<strong>2017년 3월 29일</strong>부터 휴면 정책을 시행합니다.
									<br />
									<br />
									<strong>※ itJOB 휴면 정책 </strong>
									<br />
									<br />

                    <ul>
                        <li>1년 이상 itJOB을
											이용하지 않은 아이디는 휴면 아이디로 보호됩니다.</strong></font>
									<br />사이트를 1년 이상 이용하지 않은 회원은 휴면으로 전환됩니다.
									<br />휴면 아이디로 전환되기 40일 전 메일을 통해 사전 안내를 드리며, 사전 안내 후 휴면 전환 예정일
									이내에 로그인 하시면 휴면 상태로 전환되지 않고 기존과 같이 서비스를 이용하실 수 있습니다. 예정일 내에 로그인을
									하지 않은 경우 휴면 아이디로 전환됩니다.</li>
                        <li>휴면 아이디는 별도로
											분리하여 안전하게 보관됩니다. </strong></font>
									<br />itJOB는 휴면 아이디를 별도로 분리하여 안전하게 보관합니다.
									<br />또한 분리 보관된 개인정보는 휴면 해제 및 다른 법률상 규정 외에는 다른 용도로 사용되지 않습니다.</li>
                        <li>휴면 해제는 어떻게 하나요?
									</strong></font>
									<br />휴면 아이디로 전환되면 간단한 회원 인증을 통하여 휴면을 해제할 수 있습니다.
									<br />내 정보에 등록된 내용이 오래전 연락처인 경우에는 고객센터로 문의해 주세요.</li>
                        <li><strong>※ 관련 법령 및 약관 </strong>
									<br />
									<br />1. 정보통신망법 시행령 제16조(개인정보의 파기 등)
									<br />① 법 제29조제2항에서 "대통령령으로 정하는 기간"이란 1년을 말한다. 다만, 다음 각 호의 경우에는
									해당 호에 따른 기간으로 한다.
									<br />1. 다른 법령에서 별도의 기간을 정하고 있는 경우: 해당 법령에서 정한 기간
									<br />2. 이용자의 요청에 따라 기간을 달리 정한 경우: 달리 정한 기간
									<br />② 정보통신서비스 제공자등은 이용자가 정보통신서비스를 제1항의 기간 동안 이용하지 아니하는 경우에는
									이용자의 개인정보를 해당 기간 경과 후 즉시 파기하거나 다른 이용자의 개인정보와 분리하여 별도로 저장ㆍ관리하여야
									한다.
									<br />③ 정보통신서비스 제공자등은 제2항에 따라 개인정보를 별도로 저장ㆍ관리하는 경우에는 법 또는 다른
									법률에 특별한 규정이 있는 경우를 제외하고는 해당 개인정보를 이용하거나 제공하여서는 아니 된다.
									<br />④ 정보통신서비스 제공자등은 제1항의 기간 만료 30일 전까지 개인정보가 파기되거나 분리되어
									저장ㆍ관리되는 사실과 기간 만료일 및 해당 개인정보의 항목을 전자우편ㆍ서면ㆍ모사전송ㆍ전화 또는 이와 유사한 방법
									중 어느 하나의 방법으로 이용자에게 알려야 한다.
									<br />
									<br />2. 회원약관 제 19 조 ("회원"의 가입해지/서비스중지/자료삭제)
									<br />⑤ 개인정보보호를 위하여 "회원"이 1년 동안 "사이트"를 이용하지 않은 경우, "아이디"를
									"휴면계정"로 분리하여 해당 계정의 이용을 중지할 수 있다. 이 경우 "회사"는 "휴면계정 처리 예정일"로부터
									30일 이전에 해당사실을 전자메일, 서면, SMS 중 하나의 방법으로 사전통지하며 "회원"이 직접 본인확인을
									거쳐, 다시 "사이트" 이용 의사표시를 한 경우에는 "사이트" 이용이 가능하다.</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">
                    	휴면 안내 메일을 받지 못했습니다.
                    </a>
                </h4>
            </div>
            <div id="collapseSeven" class="panel-collapse collapse">
                <div class="panel-body">
                    휴면 안내 메일은 회원정보의 이메일로 발송됩니다.
									<br />
									<br />이메일 주소가 잘못되었거나 스팸편지함에 있는지 확인해 주세요.
									<br />
									<br />이메일을 등록하지 않은 회원님들께는 itJOB 공지사항을 통해 안내해 드리고 있습니다.
									<br />
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">
                    	로그인이 안돼요. 어떻게 하나요?
                    </a>
                </h4>
            </div>
            <div id="collapseEight" class="panel-collapse collapse">
                <div class="panel-body">
                    로그인이 되지 않을 경우 회원님의 PC 설정상태를 확인해 주시기 바랍니다.<br/><br/>
                    <ul>
                        <li>1. 쿠키 등 검색 기록을 삭제해 주세요. </strong>
									<br />(1) 브라우저 실행 > 도구 > 인터넷 옵션 > 일반 > 검색 기록 > [삭제] 클릭해 주세요.
									<br />(2) 맨 위 [즐겨찾기 웹 사이트 데이터 보존]을 제외하고 모든 항목에 체크한 후 아래 [삭제] 버튼
									클릭해 주세요.
									<br />(3) 검색 기록 삭제가 완료되면 인터넷 옵션 창의 [확인] 버튼을 클릭하세요.
									<br />(4) 띄워놓았던 인터넷 브라우저를 모두 닫고 새로 인터넷 브라우저를 열어 itJOB 로그인을
									해주세요.</li>
                        <li>2. 보안 수정 재설정</strong>
									<br />(1) 브라우저 실행 > 도구 > 인터넷 옵션 > 보안 > 인터넷 메뉴를 클릭하고, 보안 수준을 [기본
									수준] 클릭해 주세요.
									<br />(2) 신뢰할 수 있는 사이트 > 사이트 버튼 클릭 후 [*.jobkorea.co.kr]을 추가하여
									등록해 주세요.
									<br />(3) 인터넷 옵션 창의 [확인] 버튼을 클릭하세요.
									<br />(4) 띄워놓았던 인터넷 브라우저를 모두 닫고 새로 인터넷 브라우저를 열어 itJOB 로그인을
									해주세요.</li>
                        <li>3. 제한된 사이트에서 해지 </strong>
									<br />(1) 브라우저 실행 > 도구 > 인터넷 옵션 > 보안 > 제한된 사이트 클릭하고 [사이트] 버튼을
									클릭해 주세요.
									<br />(2) 제한된 사이트로 itJOB가 등록되어 있다면, 선택하신 후 우측의 [제거] 버튼을 클릭해
									주세요.
									<br />(3) 인터넷 옵션 창의 [확인] 버튼을 클릭하세요.
									<br />(4) 띄워놓았던 인터넷 브라우저를 모두 닫고 새로 인터넷 브라우저를 열어 itJOB 로그인을
									해주세요.</li>
						<li>4. 위 항목에 해당하지 않는 경우 itJOB 고객센터로 문의주시면 확인 후 안내 드리도록 하겠습니다.
									<br />
									<br />
									<strong>[itJOB 고객센터] </strong>
									<br />· ☎: 1588-XXXX
									<br /> · E-mail: helpdesk@itjob.co.kr 전화를 주시거나 메일로 내용을 보내주시기
									바랍니다.</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">
                    	회원정보를 수정하고 싶은데 어디서 하는
									건가요?
                    </a>
                </h4>
            </div>
            <div id="collapseNine" class="panel-collapse collapse">
                <div class="panel-body">
                    회원정보 변경은 itJOB 첫화면에서 로그인하신 후, 회원정보 관리 페이지에서 직접 변경이 가능합니다.
									<br />
									<br />회원정보를 수정하는 방법은 다음과 같습니다.
									<br />
									<br />1단계. 회원 로그인 후
									<font color="orange"><strong>[회원정보 관리] </strong></font>클릭해 주세요.
									<br />2단계. 본인 확인을 위해 비밀번호를 한 번 더 입력해 주세요.
									<br />3단계. 원하는 정보를 수정하신 후 [수정하기]를 클릭해 주시면 정보 수정이 완료가 됩니다.
									<br /> 
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">
                    	회원탈퇴는 어떻게 하나요?
                    </a>
                </h4>
            </div>
            <div id="collapseTen" class="panel-collapse collapse">
                <div class="panel-body">
                    itJOB 회원탈퇴는 아래 절차에 따라 진행하실 수 있습니다.
								<br />
								<br />1단계. 회원 로그인 후 고객센터
								<strong><font color="orange">[회원탈퇴 신청]</font></strong>을 클릭해 주세요.
								<br />
								<br />2단계. 탈퇴 전 유의 사항을 반드시 확인 하신 후 탈퇴 신청폼을 작성해 주세요.
								<br />
								<br />3단계. 탈퇴 신청이 완료되면 고객센터에서 확인 후 결과 처리를 통보해 드립니다.
								<br />
								<br />※ 통합아이디 활용으로 회원 탈퇴 시 itJOB, 알바몬, HR파트너스, 데브잡, 캠퍼스몬, 잡부산의
								회원 정보도 삭제되므로 신중히 고려하시기 접수해 주시기 바랍니다.
                </div>
            </div>
        </div>
        <div class="faqHeader">연봉정보</div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">
                    	평균연봉은 어떻게 산출하나요?
                    </a>
                </h4>
            </div>
            <div id="collapseEleven" class="panel-collapse collapse">
                <div class="panel-body">
                    해당회사의 국민연금 납부액 또는 고용보험 납부액과 납부인원수를 역산하여 계산합니다.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwelve">
                    	연봉데이터는 얼마나 정확한가요?
                    </a>
                </h4>
            </div>
            <div id="collapseTwelve" class="panel-collapse collapse">
                <div class="panel-body">
                    상장사, 공공기관 등은 신고된 자료를 바탕으로 하므로 거의 정확하다고 보시면 됩니다. 단, 소규모 사업장 중에서 고연봉 군은 고용보험으로 정확도를 높였으나 아직까지 대부분의 소규모 사업장은 국민연금 정보만을 사용하므로 조금 부정확할 수 있습니다.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThirteen">
                    	입사자 평균 연봉이 다른 경우는 어떤 경우인가요?
                    </a>
                </h4>
            </div>
            <div id="collapseThirteen" class="panel-collapse collapse">
                <div class="panel-body">
                    올해 입사자 연봉은 퇴사인원 없이 입사자만 존재할 때 계산 가능합니다. 그렇지 않을 경우에는 유사한 업종/규모 인원 등을 참조하여 통계적으로 계산합니다. 따라서 전체 평균연봉보다는 정확하지 않을 수 있습니다.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFourteen">
                    	국민연금 상한액은 뭔가요?
                    </a>
                </h4>
            </div>
            <div id="collapseFourteen" class="panel-collapse collapse">
                <div class="panel-body">
                    국민연금 상한액이란, 월급여가 일정 수준 이상인 근로자에게는 급여의 수준에 관계없이 동일한 연금을 납부하도록 하는 개념입니다. 월급이 434만원('16년 7월 개정)이상이라면 1,000만 원이든, 1억이든 월 19만원 정도를 납부하게 됩니다. 따라서 고용보험이 매칭되지 않은 회사들의 연봉은 상한액인 5,400만 원 정도로 연봉이 나타납니다.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFifteen">
                    	국민연금과 고용보험의 평균 연봉은 어떻게 다른가요?
                    </a>
                </h4>
            </div>
            <div id="collapseFifteen" class="panel-collapse collapse">
                <div class="panel-body">
                    국민연금은 월 납부액의 따른 상한액이 있습니다. 고용보험은 상한액 없이 회사가 납부한 금액과 인원으로 추정하기 때문에 구글코리아 같이 연봉이 높을 것이라 기대한 회사의 급여가 정확하게 나올 수 있습니다.
                </div>
            </div>
        </div>
        
	</div>
</div>


<style>
    .faqHeader {
        font-size: 27px;
        margin: 20px;
    }

    .panel-heading [data-toggle="collapse"]:after {
        font-family: 'Glyphicons Halflings';
        content: "\e072"; /* "play" icon */
        float: right;
        color: #F58723;
        font-size: 18px;
        line-height: 22px;
        /* rotate "play" icon from > (right arrow) to down arrow */
        -webkit-transform: rotate(-90deg);
        -moz-transform: rotate(-90deg);
        -ms-transform: rotate(-90deg);
        -o-transform: rotate(-90deg);
        transform: rotate(-90deg);
    }

    .panel-heading [data-toggle="collapse"].collapsed:after {
        /* rotate "play" icon from > (right arrow) to ^ (up arrow) */
        -webkit-transform: rotate(90deg);
        -moz-transform: rotate(90deg);
        -ms-transform: rotate(90deg);
        -o-transform: rotate(90deg);
        transform: rotate(90deg);
        color: #454444;
    }
</style>

<script type="text/javascript">
        $(function () {
            $('.devFaqItem').click(function () {
                var $li = $(this).parent();

                if ($li.is('.on')) {
                    $li.removeClass('on');
                    $li.find('button').removeClass('tplBtnCls_3').addClass('tplBtnMore');
                    $li.find('.searchListData').hide();
                }
                else {
                    var $ul = $(this).closest('ul');
                    $ul.find('li').removeClass('on');
                    $ul.find('button').removeClass('tplBtnCls_3').addClass('tplBtnMore');
                    $ul.find('.searchListData').hide();

                    $li.addClass('on');
                    $li.find('button').removeClass('tplBtnMore').addClass('tplBtnCls_3');
                    $li.find('.searchListData').show();

                    $('html, body').animate({ scrollTop: $li.offset().top }, 200);

                }
            });
        });
    </script>


<br />
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdpNCYLer2YLqWD5YoIBaBqmD8SJm8b9k&callback=initMap"
	async defer></script>

<div align="center">
   <b>[ 위치 ] </b> <br />
   <br />
   <div id="map" style="width: 500; height: 500"></div>
</div>


<script>
	function initMap() {
		// Create a map object and specify the DOM element for display.
		var map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : ${json.results[0].geometry.location.lat},
				lng : ${json.results[0].geometry.location.lng}
			},
			scrollwheel : true,
			zoom : 15
		});
	}
</script>

