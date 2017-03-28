<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>    
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>


<div class="container">
<div id="wrap">
<section id="container">
    
   <section class="content helpSecCont">
      <h1>개인회원 <span class="tahoma">FAQ</span></h1>
            
    <ul class="tabType tabType_05">
        <li class="on"><a href="/contact/form">회원가입∙정보</a></li>
        <li class=""><a href="/contact/form_etc">기타</a></li>
    </ul>
	<span>총</span> <strong class="tahoma">6</strong><span>건</span>

            <form action="/help/faq/user" method="get">
                <input type="hidden" name="tab" value="1" />
                <div class="tabSearchArea">
                    <div class="tabSearchAreaLeft">
                    </div>
                  
                </div>
            </form>
                <div class="tabSearchList">
                    <ul>
                    		<li data-no="167">
                                <button type="button" class="tplBtn tplBtnMore tabSearchListTitle devFaqItem"><span class="tabSearchListTitleWrap"><span class="cl3399ff">[채용정보]</span>지역이나 나이 등의 조건으로 채용정보를 검색할 수는 없나요? </span></button>
                                <div class="searchListData"><ul>itJOB는 어떤 취업 사이트보다도 상세한 검색을 제공하고 있습니다.<br/><br/>채용정보 검색에서는 업·직종, 성별, 학력, 근무지역, 급여정도, 경력, 고용형태, 키워드 등의 조건을 동시에 지정하여 검색할 수 있습니다. <br/><br/>채용정보 검색을 통해서 가장 적합한 채용정보를 찾으시기 바랍니다<br/><br/><a href="http://www.jobkorea.co.kr/List_GI/GI_Search.asp" target="n"><font color="#0061f7"><b>☞ 채용정보 검색</b></font></a></ul></div>
                            </li>
                            <li data-no="318">
                                <button type="button" class="tplBtn tplBtnMore tabSearchListTitle devFaqItem"><span class="tabSearchListTitleWrap"><span class="cl3399ff">[채용정보]</span>스크랩한 채용정보는 무엇인가요?</span></button>
                                <div class="searchListData"><ul>개인회원이 채용정보를 검색, 열람하다가 관심이 있는 채용정보를 발견했을때, 북마크(즐겨찾기)와 같이 별도로 저장해 놓는 것을 말합니다. <br/><br/>채용정보의 상하단에 [스크랩 하기]를 클릭하면 해당 채용정보는 개인회원메뉴에 저장되고, 개인회원은 스크랩한 내용을 개인회원의 메뉴에서 확인하실 수 있습니다. <br/><br/>스크랩한 채용정보는 채용정보가 마감이 되었어도, 스크랩일 기준 3개월까지 확인이 가능합니다. <br/><br/>스크랩한 채용정보는 아래에서 확인 가능합니다. <br/>· 스크랩한 채용정보: <u>HOME > 개인회원 > 입사지원 관리 > 스크랩한 채용정보</u><br/></ul></div>
                            </li>
                            <li data-no="168">
                                <button type="button" class="tplBtn tplBtnMore tabSearchListTitle devFaqItem"><span class="tabSearchListTitleWrap"><span class="cl3399ff">[채용정보]</span>기업명으로 채용정보나 기업정보를 검색할 수 있나요? </span></button>
                                <div class="searchListData"><ul>채용정보 검색에서 기업명에 의한 검색이 가능하며 해당 기업이 현재 진행중인 채용정보를 모두 확인할 수 있습니다.<br/><br/>또한 채용정보와 함께 노출되는 기업명을 클릭하면 해당 기업의 상세 정보를 확인할 수 있습니다.</ul></div>
                            </li>
                            <li data-no="170">
                                <button type="button" class="tplBtn tplBtnMore tabSearchListTitle devFaqItem"><span class="tabSearchListTitleWrap"><span class="cl3399ff">[채용정보]</span>맞춤 채용정보란 무엇인가요?</span></button>
                                <div class="searchListData"><ul>업직종, 키워드, 근무지역, 학력, 경력, 성별, 급여정도, 나이, 고용형태를 내가 원하는 조건대로 설정하면 itJOB의 채용공고 중에 최적화된 맞춤 채용정보를 확인할 수 있습니다. <br/><br/>맞춤 채용정보는 <strong>최대 3개</strong>까지 등록할 수 있으며, RSS 서비스도 이용하실 수 있습니다.<br/> <br/>RSS 서비스를 이용하실 경우 주소 복사를 클릭한 후 RSS Reader 프로그램에 등록하시면 실시간으로 맞춤 채용정보를 확인할 수 있습니다. 맞춤 조건이 변경된 경우는, 변경된 주소를 복사하여 RSS Reader에 다시 등록하셔야 합니다.<br/><br/>맞춤 채용정보는 아래에서 확인 가능합니다. <br/>· 맞춤정보: <u>HOME > 개인회원 > 맞춤 정보 > 맞춤 채용정보</u></ul></div>
                            </li>
          					 <li data-no="291">
                                <button type="button" class="tplBtn tplBtnMore tabSearchListTitle devFaqItem"><span class="tabSearchListTitleWrap"><span class="cl3399ff">[기타 서비스]</span>[캠페인] 구직자라면 알아두어야 할 취업사기 유형</span></button>
                                <div class="searchListData"><ul>최근 나날이 교묘해지는 수법의 취업사기가 늘어나고 있습니다.<br/><br/>최근의 취업사기 사례와 예방법을 알려드리오니, 주의하시기 바랍니다.<br/><br/><strong>취업사기 사례</strong><br/><br/><strong>사례1. 택배기사 면접을 보러 갔는데 화물차 구입부터 하라고?</strong><br/>배달업무를 하던 이 모씨는 이직을 하려고 택배기사 면접을 보러갔다.<br/>지입차량을 먼저 구입하면 일을 바로 시작할 수 있고 매달 350만원 이상의 고정수입이 생긴다는 말을 믿고 계약금, 지입차량 비용 등 2,500만원을 선납했으나 일을 연결해 주지 않았다. <br/>취업을 미끼로 화물차만 비싼 가격으로 판매한 사기였다.<br/><br/><strong>사례2. 입사하면 사무용품은 직접 구입하셔야 합니다.</strong><br/>구직자 김 모씨는 면접 시 4천만 원 정도의 연봉을 받을 수 있다. 대신 사무용품 구입비는 직접 내야 한다는 말에 속아 400만 원을 입금하였다.<br/>출근하라는 연락이 없어 확인해 보니 사무용품 구입 명목으로 현금을 갈취한 사기였다.<br/><br/><strong>사례3. 취업을 축하합니다! 먼저 물건부터 사세요.</strong><br/>구직자 최 모씨는 사무직 모집공고를 보고 해당업체에 찾아갔다. 면접 준비를 만반이 하고 갔지만 그 회사의 제품을 일정액 이상 구매하면 취업을 시켜주겠다는 황당한 소리를 들었다. 즉, 사무직원을 뽑기 위한 게 아닌 물건을 팔기 위한 사기였다.<br/><br/><strong>사례4. 입사 후 제출한 서류가 대출서류로 둔갑?!</strong><br/>30살 김 모씨는 최근 늦은 나이에 한 중소기업에 최종합격을 하였다. 합격한 회사에서 입사 전에 주민등록등본과 초본, 거래내역이 있는 통장을 보내 줄 것을 요청하여 기쁜 마음에 서류를 제출하였다. 첫 출근 일을 오매불망 기다리며 하루하루를 보내고 있는데, 갑자기 대부업체로부터 대출중계수수료를 지불하라는 독촉연락이 왔다. 알고 보니 김 모씨가 제출한 서류를 이용하여 업체에서 대부업체에 대출을 받은 것이다. 김 모씨는 직장도 잃고 순식간에 500만원의 빚을 떠맡게 되었다.<br/><br/><strong>사례5. 면접보러가서 난 단순히 회사 홈페이지에 회원가입만 했을 뿐이라고요!</strong><br/>인사팀 모집공고에 지원을 하고 회사에 방문한 A씨. 어떤 사이트에 약관동의를 하고 회원가입을 하라고 해서 시키는 대로 했다. 동의 후 계약내용을 자세히 보니, 근로계약서가 아니라 홈페이지 분양을 한다는 것에 동의한 것이 아닌가! 졸지에 홈페이지를 사야 하는 상황에 놓였다. 금액을 지불하지 못할 거라면, 본인이 겪은 것처럼 다른 사람을 끌어오는 일을 해야 한다는 황당한 요구까지! <br/><br/><strong>사례6. 통장사본과 체크카드가 그렇게 쓰일 줄이야.</strong><br/>대학생 최 모씨는 학자금 마련을 위해 아르바이트를 찾던 중, 인터넷에서 `PC방 직원모집` 구인광고를 보았다. 지원을 하고 면접통보를 받은 최 모 씨. 해당 업체는 취직에 필요하다며 통장 사본과 체크카드를 요구했다. 최 모씨의 통장과 카드를 갈취한 뒤 수백만 원을 인출해 잠적해버렸다. <br/><br/><strong>사례7. 병역특례로 간 곳이 다단계 판매 회사.</strong><br/>대학 동창으로부터 00전자의 병역특례 일자리를 소개해 주겠다는 연락을 받고 상경한 C 군. 그 친구가 데리고 간 곳은 병역 특례와 관련이 없는 서울 송파구 마천동 소재 미등록 다단계 판매 회사. 그는 4일 연수기간 동안 사업에 참여하라는 압력과 함께 싫은 내색을 하자 판매원으로 가입할 것을 종용 받았다. 친구의 권유로 불법 다단계 회사에 판매원으로 가입한 C 군은 제품을 구입할 돈이 없음에도 수당을 받기 위해서는 제품을 판매해야 했다. <br/><br/><strong>사례8. 문서입력 재택알바 하려면 등록비부터 내라구요?</strong><br/>25살 김 모씨는 재택 근무로 하루에 자료 몇 페이지만 문서로 입력해주면 한 달에 220만원을 준다는 조건의 출판사 구인 광고를 보고 지원하였다. 일을 시작하려면 먼저 30만원을 내야 한다고 해 입금했지만, 돈이 입금되자마자 업체는 연락을 끊어버렸다. <br/><br/><strong>사례9. 채용이 아니라 비영리 단체 회원 모집?!</strong><br/>간호조무사 김 모양은 이직 준비를 하던 중, 한 협회의 구인 광고에 지원하였다. 급여, 고용형태 등 일정한 근로조건을 제시하며 조사요원, 요양보호사, 간호조무사를 채용하던 협회. 하지만 면접에서 협회 회원가입과 함께 회비 20만원을 내라는 황당한 요구를 받았다. 실제로는 채용이 아니라 교육비, 사무실 운영비 충당을 목적으로 회원을 모집하고 있었던 비영리단체의 취업사기였다.<br/><br/><strong>사례10. 담당업무를 위해 공인인증서에 보안카드까지 내라구?</strong><br/>구직자 강 모씨 등 3명은 극심한 취업난에 지칠 무렵 카드발급 회사로부터 합격 통보를 받았다. 들뜬 마음으로 출근날짜만을 기다린 이들에게 입사 전날 회사로부터 한 통의 연락을 받게 되었다. 카드 발급 업무를 담당하기 위해 필요하다며 공인인증서, 보안카드, 신분증, 통장 사본, 통장 비밀번호까지 요구하는게 아닌가! 미심쩍긴 했지만 결국 취업이란 유혹에 넘어간 이들은 3000만원이란 빚을 떠안게 되었다.<br/><br/><strong>사례11. 계좌 만들면 취업시켜준다는 기막힌 회사.</strong><br/>구직자 박 모씨는 인터넷 취업사이트에서 증권선물투자회사의 구인광고를 보고 찾아갔다. 해당 업체는 우선 증권선물계좌를 개설해 일정금액을 입금하면 취직과 높은 수당을 지급하겠다고 했고 순진한 박 씨는 대출을 받아 입금 하게 되었다. 그러나 그곳은 대출금을 가로채기 위해 허위로 만들어진 가짜 회사였고, 박 씨는 채무상환을 못 해 결국 신용불량자가 되고 말았다.<br/><br/><strong>사례12. 돈 벌러 갔다가 험한 꼴 당한 여성구직자들.</strong><br/>간편한 아르바이트를 구하기 위해 구인광고를 알아보던 20살 이 씨. 간단한 대화와 bar 서빙 업무를 한다는 모집 내용을 보고 가벼운 마음으로 찾아갔다. 하지만 알고 봤더니 윤락행위의 목적을 둔 엉터리 업체였다. 돈 벌려고 시작한 일이 키스방까지 이어질 줄이야! <br/><br/><strong>사례13. 정규직이란 말로 날 속이지마!</strong><br/>29살 박 모씨는 정규직을 목표로 취업준비를 하던 중 마음에 드는 모집 공고를 보고 면접을 보러 갔다. 하지만 이게 웬걸? 면접장에서 높은 월급과 프리랜서를 말하며 결국에는 물품판매를 요구하는 것이 아닌가. 정규직이란 달콤한 말로 둔갑한 거짓 구인광고였던 것이다.<br/><br/><strong>사례14. 철없는 사장님의 간 큰 거짓말. </strong><br/>28살 안 모씨는 B사의 인턴 직원으로 근무하다가 퇴사하면서 개인사업을 시작하게 되었다. 하지만 퇴사를 한 후에도 본인 회사의 채용을 위해 전 회사인 B사 명의를 수차례 구인광고에 사용한 사실이 적발되었다. 면접을 보러 온 사람들에게 임금도 기재금액보다 낮게 제시하는 등 철없는 사장님의 간 큰 거짓말은 경찰 수사를 통해 밝혀졌다. <br/><br/><strong>사례10.담당업무를 위해 공인인증서에 보안카드까지 내라구?</strong><br/>구직자 강 모씨 등 3명은 극심한 취업난에 지칠 무렵 카드발급 회사로부터 합격 통보를 받았다. 들뜬 마음으로 출근날짜만을 기다린 이들에게 입사 전날 회사로부터 한 통의 연락을 받게 되었다. 카드 발급 업무를 담당하기 위해 필요하다며 공인인증서, 보안카드, 신분증, 통장 사본, 통장 비밀번호까지 요구하는게 아닌가! 미심쩍긴 했지만 결국 취업이란 유혹에 넘어간 이들은 3000만원이란 빚을 떠안게 되었다.<br/><br/><strong>사례11.계좌 만들면 취업시켜준다는 기막힌 회사.</strong><br/>구직자 박 모씨는 인터넷 취업사이트에서 증권선물투자회사의 구인광고를 보고 찾아갔다. 해당 업체는 우선 증권선물계좌를 개설해 일정금액을 입금하면 취직과 높은 수당을 지급하겠다고 했고 순진한 박 씨는 대출을 받아 입금 하게 되었다. 그러나 그곳은 대출금을 가로채기 위해 허위로 만들어진 가짜 회사였고, 박 씨는 채무상환을 못 해 결국 신용불량자가 되고 말았다.<br/><br/><strong>사례12.돈 벌러 갔다가 험한 꼴 당한 여성구직자들.</strong><br/>간편한 아르바이트를 구하기 위해 구인광고를 알아보던 20살 이 씨. 간단한 대화와 bar 서빙 업무를 한다는 모집 내용을 보고 가벼운 마음으로 찾아갔다. 하지만 알고 봤더니 윤락행위의 목적을 둔 엉터리 업체였다. 돈 벌려고 시작한 일이 키스방까지 이어질 줄이야! <br/><br/><strong>사례13.정규직이란 말로 날 속이지마!</strong><br/>29살 박 모씨는 정규직을 목표로 취업준비를 하던 중 마음에 드는 모집 공고를 보고 면접을 보러 갔다. 하지만 이게 웬걸? 면접장에서 높은 월급과 프리랜서를 말하며 결국에는 물품판매를 요구하는 것이 아닌가. 정규직이란 달콤한 말로 둔갑한 거짓 구인광고였던 것이다.<br/><br/><strong>사례14. 철없는 사장님의 간 큰 거짓말. </strong><br/>28살 안 모씨는 B사의 인턴 직원으로 근무하다가 퇴사하면서 개인사업을 시작하게 되었다. 하지만 퇴사를 한 후에도 본인 회사의 채용을 위해 전 회사인 B사 명의를 수차례 구인광고에 사용한 사실이 적발되었다. 면접을 보러 온 사람들에게 임금도 기재금액보다 낮게 제시하는 등 철없는 사장님의 간 큰 거짓말은 경찰 수사를 통해 밝혀졌다. <br/><br/><strong> 사례15. “대포통장이라뇨?” 고수익 사무직 아르바이트, 알고 봤더니 보이스피싱 사기?</strong><br/>20살 이 모양은 방학을 맞아 아르바이트를 구하던 중, 한 업체로부터 높은 일당의 사무직 아르바이트를 구한다는 전화를 받았다. 아르바이트를 시작하려면 필요하다는 업체에 말에 따라 통장계좌와 체크카드, 주민등록등본을 제출한 이 모양. 그 후 업체로부터 연락이 끊겼고 홈페이지를 찾아 업체에 전화해 보았지만 아르바이트 채용 자체가 없었다는 답변 뿐이었다. 대신 경찰청으로부터 대포통장 명의자이니 조사를 받으러 오라는 통보를 받고 가슴이 철렁 내려 앉고 말았다. 방학 동안 아르바이트를 구하는 학생들을 대상으로 벌이는 보이스피싱 사기였던 것이다.<br/><br/><br/><br/><strong>취업사기 예방 7계명</strong><br/><br/>1. 모집공고 제목이 명확하지 않거나, 모집요강, 기업정보가 충실하지 않은 경우 주의하세요. <br/><br/>2. 구직자간 정보제공게시판 등을 통해 주의 기업 정보를 취득하세요.<br/><br/>3. 지원자격 제한이 ‘사실상 없는’ 기업은 주의하세요.<br/><br/>4. 접수서류에 주민등록등본을 요구할 경우 주의하세요. 등본은 입사확정 후 제출이 일반적이랍니다. <br/><br/>5. 소개비 등의 대가로 금전을 요구하거나 투자를 유도하면서 대출을 알선하고, 신용보증금 등을 요구하는 경우에는 취업사기를 의심해 보세요.<br/>                          <br/>6. 근로계약서 등과 같은 계약서를 작성할 때에는, 꼼꼼히 확인하는 것이 중요합니다.<br/><br/>7. 인사담당자의 연락처가 신원이 불확실한 카톡이나 개인 핸드폰, 개인 메일계정, 메신져 등일 경우 주의하세요. <br/><br/><br/><strong>To. 구직자 여러분</strong><br/><br/>한 번쯤 의심해보는 습관으로 취업사기를 예방하세요.<br/><br/>itJOB는 대한상공회의소(코참비즈)를 통한 상세한 기업정보를 제공하고 있습니다. 입사 지원 전에 참고하세요. <br/><br/>또한 itJOB에는 다른 구직자 분들이 가장 많이 차단한 기업을 볼 수 있는 ‘스마트 열람차단 기능’ 도 있으니 활용해보세요. (로그인 >개인회원페이지 > "열람제한 기업 설정" 에서 보실 수 있습니다.)<br/><br/><br/><strong>To. 취업사기를 일삼는 당신</strong><br/><br/>어려운 취업난을 악용하여 구직자를 두 번 울게 하는 취업사기. <br/>일은 일이지만, 일삼지 말아야 할 것이 있습니다.<br/><br/>허위 구인광고 또는 허위 구인 조건을 제시한 자는 직업안정법 제 47조에 의해 5년 이하의 징역 또는 2천만원 이하의 벌금형을 받게 되니, 유념하세요!<br/><br/><br/>itJOB는 약관을 통해 명시했듯이, 취업사기 없는 안전지대를 만들기 위해 더욱 철저히 관리, 감독하도록 하겠습니다. <br/><br/>감사합니다.<br/><br/><br/>-------------[약관]--------------------------------------<br/><br/>제 19조 ("회원"의 가입해지/서비스중지/자료삭제)<br/>② 다음의 사항에 해당하는 경우 "회사"는 사전 동의 없이 가입해지나 서비스 중지, 채용공고 삭제 조치를 취할 수 있다. <br/>4. 본 서비스 목적에 맞지 않는 분야에 정보를 활용하여 사회적 물의가 발생한 때 <br/>5. 회원이 등록한 정보의 내용이 사실과 다르거나 조작되었을 때 <br/>6. 사업자등록증에 나타난 정보와 기업회원 가입시의 정보가 일치하지 않을 때 <br/>9. 회사명, 담당자 성명, 사무실 연락처 등 구인업체의 중요 정보를 정확하게 기입하지 않았을 때 <br/>13. 허위 구인공고를 등록했을 때 <br/>14. 작성자가 제시한 직종, 업무내용, 근로조건 등이 실제와 현저히 다를 때 <br/>15. 채용공고의 모집요강만으로 업무에 대한 내용이 명확하지 않을 때 <br/>18. 다단계, 피라미드 식의 모집 내용을 등록했을 때 <br/>19. 구인을 가장하여 유학알선, 물품판매, 자금 모금 등을 행하는 내용을 등록했을 때 <br/>20. 교육비, 수강료를 요구하는 수강생 모집광고, 학원 광고를 등록했을 때 <br/>21. 회원모집 형태의 광고 또는 카드회원 모집(수당제 광고) 내용을 등록했을 때 <br/>22. 추천인 모집 광고, 재택 쇼핑몰 분양 광고, 직업소개, 부업알선 광고를 등록했을 때 <br/>23. 취업수수료 등 취업 관련 비용을 필요로 하는 채용공고를 등록했을 때 (운송, 물류, 지입, 인력용역 등) <br/>24. 불건전한 내용의 유흥업소 채용공고를 등록했을 때 <br/>25. 구직자의 피해사례 (채용공고를 통해 구직자가 입사 과정에서 피해가 발생한 경우 또는 재직 중 "기업회원"이 관계법령을 위반하여 피해가 발생한 경우 등)가 접수된 채용공고 <br/>26. 임금체불 사실이 접수되었거나 근로감독원에 진정서가 접수되어 있는 기업 <br/>27. 본 서비스 명예를 훼손하였을 때 <br/>29. 기타 관계법규에 위배되는 내용이거나 사이트의 원활한 운영을 위하여 운영자가 필요하다고 판단한 경우.</ul></div>
                            </li>
          					<li data-no="197">
                                <button type="button" class="tplBtn tplBtnMore tabSearchListTitle devFaqItem"><span class="tabSearchListTitleWrap"><span class="cl3399ff">[기타 서비스]</span>관심기업 정보는 무엇인가요?</span></button>
                                <div class="searchListData"><ul>관심기업 정보는 평소에 입사를 희망하거나 관심있는 기업을 기업정보에서 [관심기업 추가]로 등록해 놓으면, 해당 기업의 채용 진행여부를 개인회원 메뉴에서 확인하실 수 있습니다. <br/><br/>관심기업 정보는 아래에서 확인 가능합니다. <br/>· 관심기업 정보: <u>HOME > 개인회원 > 맞춤 정보 > 관심기업 정보</u></ul></div>
                            </li>
          					
                    </ul>
                </div>

	</section>
	</section>
	</div>
</div>

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