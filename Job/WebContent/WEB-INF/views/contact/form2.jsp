<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>


<div class="container">
	<section id="container">
		<section class="content helpSecCont">
			<h1>
				개인회원 <span class="tahoma">FAQ</span>
			</h1>

			<ul class="tabType tabType_05">
				<li class="on"><a href="/contact/form">회원가입∙정보</a></li>
				<li class=""><a href="/contact/form_etc">기타</a></li>
			</ul>

			<form action="/help/faq/user" method="get">
				<input type="hidden" name="tab" value="1" />
				<div class="tabSearchArea">
					<div class="tabSearchAreaLeft">
						<span>총</span> <strong class="tahoma">31</strong><span>건</span>
					</div>

				</div>
			</form>
			<div class="tabSearchList">
				<ul>
					<li data-no="121">
						<button type="button"
							class="tplBtn tplBtnMore tabSearchListTitle devFaqItem">
							<span class="tabSearchListTitleWrap"><span
								class="cl3399ff">[회원가입&#183;로그인]</span>아이디를 변경하고 싶은데 가능한가요?</span>
						</button>
						<div class="searchListData">
							<ul>
								이미 회원가입을 하신 경우, 아이디를 변경하실 수 없습니다.
								<br />아이디 변경은 기존 회원의 아이디 중복 문제로 회원님이 임의로 변경하실 수 없으며, 변경을 원하시면
								회원탈퇴 후 신규로 가입하셔야 합니다.
								<br />
								<br />따라서 회원가입 시 신중하게 아이디를 정하시기 바랍니다.
							</ul>
						</div>
					</li>
					<li data-no="188">
						<button type="button"
							class="tplBtn tplBtnMore tabSearchListTitle devFaqItem">
							<span class="tabSearchListTitleWrap"><span
								class="cl3399ff">[회원가입&#183;로그인]</span>회원탈퇴는 어떻게 하나요?</span>
						</button>
						<div class="searchListData">
							<ul>
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
							</ul>
						</div>
					</li>
					<li data-no="190">
						<button type="button"
							class="tplBtn tplBtnMore tabSearchListTitle devFaqItem">
							<span class="tabSearchListTitleWrap"><span
								class="cl3399ff">[회원가입&#183;로그인]</span>itJOB을 탈퇴하면 패밀리사이트도 이용할 수
								없나요?</span>
						</button>
						<div class="searchListData">
							<ul>
								itJOB 패밀리사이트는 한 개의 아이디로 통합되어 운영되므로, itJOB, 알바몬, HR파트너스, 데브잡,
								캠퍼스몬, 잡부산 사이트에서 모두 탈퇴 처리가 됩니다.
								<br />
								<br />이 점 유의하셔서 탈퇴하시기 전에 신중히 고려하시기 바랍니다.
							</ul>
						</div>
					</li>
					<li data-no="320">
						<button type="button"
							class="tplBtn tplBtnMore tabSearchListTitle devFaqItem">
							<span class="tabSearchListTitleWrap"><span
								class="cl3399ff">[보안]</span>IP 보안 사용방법이 어떻게 되나요?</span>
						</button>
						<div class="searchListData">
							<ul>
								1. 로그인 박스에 기본적으로 IP보안 ON으로 세팅되어 있어 로그인만 하시면 IP보안이 동작됩니다.
								<br />
								<br />2. 만약 IP보안을 원하지 않고 이전과 동일한 서비스를 이용하고 싶으신 회원님께서는 IP보안을 OFF
								한 상태에서 로그인하시면 됩니다.
								<br />
								<br />3. 만약 한번 IP보안을 OFF한 컴퓨터에서는 30일간 OFF상태가 지속되어 이용하실 수 있습니다.
								<br />(단, 다른 컴퓨터를 이용하거나, 쿠키를 삭제할 경우에는 다시 IP보안은 ON상태로 변경됩니다.)
								<br />
								<br />4. IP보안이 동작중일 경우에는 회원님의 PC와 네트워크 환경에 따라 지속적으로 자동 로그아웃 될 수
								있으며, 로그인이 불편하실 경우에는 로그인시 IP보안을 OFF한 후 이용하시면 됩니다. 단, IP보안 서비스는
								받으실 수 없습니다.
								<br />
							</ul>
						</div>
					</li>
					<li data-no="319">
						<button type="button"
							class="tplBtn tplBtnMore tabSearchListTitle devFaqItem">
							<span class="tabSearchListTitleWrap"><span
								class="cl3399ff">[보안]</span>IP 보안이란?</span>
						</button>
						<div class="searchListData">
							<ul>사용자의 IP를 체크하여 멀리 떨어진 장소에서 부정한 방법으로 로그인 권한을 이용하는 것을 차단할 수
								있는 서비스 입니다.
							</ul>
						</div>
					</li>
					<li data-no="299">
						<button type="button"
							class="tplBtn tplBtnMore tabSearchListTitle devFaqItem">
							<span class="tabSearchListTitleWrap"><span
								class="cl3399ff">[보안]</span>수동 설치를 통하여 보안 프로그램을 설치했는데, 삭제는 어떻게
								하나요?</span>
						</button>
						<div class="searchListData">
							<ul>
								수동 설치를 통하여 보안 프로그램을 설치한 경우 제어판의 ‘프로그램 추가/제거’에
								BeSafeWebManualSetup 항목이 추가되어 있는 것을 확인할 수 있습니다. 해당 프로그램을 삭제하시려면,
								제거 버튼을 클릭하여 삭제하시면 됩니다.
								<br />또한 수동 제거툴을 이용하여 보안 프로그램을 삭제하셔도 됩니다.
								<br />
								<br />
								<center>
									<a href="/WebSecuritySetup/Manualuninstaller.exe"><b>[보안
											프로그램 수동제거툴 다운로드]</b></a>
								</center>
								<br />
							</ul>
						</div>
					</li>
					<li data-no="300">
						<button type="button"
							class="tplBtn tplBtnMore tabSearchListTitle devFaqItem">
							<span class="tabSearchListTitleWrap"><span
								class="cl3399ff">[보안]</span>보안 프로그램 수동 설치는 어떻게 하나요?</span>
						</button>
						<div class="searchListData">
							<ul>
								[보안 프로그램 수동 설치하기]를 클릭하여 보안 프로그램을 다운로드 한 후
								‘BeSafeWebManualSetup.exe’’을 실행하면 보안 프로그램이 자동으로 설치됩니다.
								<br />
								<br />
								<center>
									<a href="/WebSecuritySetup/BeSafeWebManualSetup.exe"><b>[보안
											프로그램 수동 설치하기]</b></a>
								</center>
								<br />
							</ul>
						</div>
					</li>
					<li data-no="297">
						<button type="button"
							class="tplBtn tplBtnMore tabSearchListTitle devFaqItem">
							<span class="tabSearchListTitleWrap"><span
								class="cl3399ff">[보안]</span>보안 프로그램을 설치하지 않고, itJOB 사이트를 이용할 수는
								없나요?</span>
						</button>
						<div class="searchListData">
							<ul>
								itJOB의 대부분은 보안 프로그램을 설치하지 않고 이용하실 수 있으나 보안이 반드시 필요한 일부 페이지는 반드시
								보안 프로그램 (WebProtector) 을 설치하셔야 정상적으로 이용하실 수 있습니다.
								<br />
							</ul>
						</div>
					</li>
					<li data-no="298">
						<button type="button"
							class="tplBtn tplBtnMore tabSearchListTitle devFaqItem">
							<span class="tabSearchListTitleWrap"><span
								class="cl3399ff">[보안]</span>웹페이지를 통해서 자동으로 보안 프로그램이 설치되었는데, 삭제는
								어떻게 하나요?</span>
						</button>
						<div class="searchListData">
							<ul>
								기본적으로 보안 프로그램은 해당 보안이 적용되어 있는 페이지에 접속하지 않는 이상 시스템에 아무런 영향을 미치지
								않으므로 삭제하지 않으셔도 됩니다. 굳이 삭제를 해야 하는 경우라면 ‘수동 제거툴’을 이용하여 삭제하시면 됩니다.
								‘수동 제거툴’을 이용하여 보안 프로그램을 제거할 경우 열려져 있는 모든 보안페이지가 자동으로 닫히므로, 작업을
								완료한 후에 제거를 하셔야 합니다.
								<br />
								<br />
								<center>
									<a href="/WebSecuritySetup/Manualuninstaller.exe"><b>[보안
											프로그램 수동제거툴 다운로드]</b></a>
								</center>
								<br />
							</ul>
						</div>
					</li>
					<li data-no="294">
						<button type="button"
							class="tplBtn tplBtnMore tabSearchListTitle devFaqItem">
							<span class="tabSearchListTitleWrap"><span
								class="cl3399ff">[보안]</span>보안 웹페이지를 요청했는데, 한참 동안 응답이 없다가 페이지를
								읽을 수가 없습니다.</span>
						</button>
						<div class="searchListData">
							<ul>
								보안 프로그램이 정상적으로 동작하지 않는 경우로 아래와 같이 문제를 해결하시기 바랍니다.
								<br />
								<br />1. 수동 제거툴을 다운로드 합니다.
								<br />2. 브라우저를 모두 닫습니다.
								<br />3. 다운로드 한 수동 제거툴을 실행하여 현재 설치되어 있는 보안 프로그램을 제거합니다.
								<br />4. 다시 브라우저를 열어 페이지 접속을 시도합니다.
								<br />5. 위의 방법으로도 해결이 안될 경우 고객센터로 문의하여 주시기 바랍니다.
								<br />
								<br />
								<center>
									<a href="/WebSecuritySetup/Manualuninstaller.exe"><b>[보안
											프로그램 수동제거툴 다운로드]</b></a>
								</center>
								<br />
							</ul>
						</div>
					</li>
					<li data-no="293">
						<button type="button"
							class="tplBtn tplBtnMore tabSearchListTitle devFaqItem">
							<span class="tabSearchListTitleWrap"><span
								class="cl3399ff">[보안]</span>보안 웹페이지를 요청했는데, 알 수 없는 문자들이 화면에
								출력됩니다.</span>
						</button>
						<div class="searchListData">
							<ul>
								보안 프로그램이 정상적으로 동작하지 않는 경우로서 아래와 같이 문제를 해결하시기 바랍니다.
								<br />
								<br />1. 수동 제거툴을 다운로드 합니다.
								<br />2. 브라우저를 모두 닫습니다.
								<br />3. 다운로드 한 수동 제거툴을 실행하여 현재 설치되어 있는 보안 프로그램을 제거합니다.
								<br />4. 다시 브라우저를 열어 페이지 접속을 시도합니다.
								<br />5. 위의 방법으로도 해결이 안될 경우 고객센터로 문의하여 주시기 바랍니다.
								<br />
								<br />
								<center>
									<a href="/WebSecuritySetup/Manualuninstaller.exe"><b>[보안
											프로그램 수동제거툴 다운로드]</b></a>
								</center>
								<br />
							</ul>
						</div>
					</li>
				</ul>
			</div>
			<div class="tplPagination">
				<ul>
					<li><a href="/contact/form">1</a></li>
					<li><span class="now">2</span></li>
				</ul>
			</div>
			<div class="questBtnArea">
				<p class="txtQuest">원하시는 답변을 찾지 못하셨다면, 고객센터에 문의해주세요.</p>
				<a class="btnQuest" href="/help/inquiry" target="_self">문의하기</a>
			</div>
		</section>
	</section>
</div>

<script type="text/javascript">
	//-- NSM Conversion Check Start
	var Nsm_Code = "0";
	if (Nsm_Code != "0") {
		var nsmX = new Image();
		nsmX.src = "http://ntracker.nsm-corp.com/c/rcv.php?code=" + Nsm_Code;
	}
	function NsmConversionClick(Nsm_Code) {
		var nsmX = new Image();
		//alert(Nsm_Code);
		nsmX.src = "http://ntracker.nsm-corp.com/c/rcv.php?code=" + Nsm_Code;
	}
	//-- NSM Conversion Check End
</script>



<script>
	/* usage */
	(function($) {
		$(window).load(
				function() {
					(function(i, s, o, g, r, a, m) {
						i['GoogleAnalyticsObject'] = r;
						i[r] = i[r] || function() {
							(i[r].q = i[r].q || []).push(arguments)
						}, i[r].l = 1 * new Date();
						a = s.createElement(o),
								m = s.getElementsByTagName(o)[0];
						a.async = 1;
						a.src = g;
						m.parentNode.insertBefore(a, m)
					})(window, document, 'script',
							'https://www.google-analytics.com/analytics.js',
							'ga');

					ga('create', 'UA-75522609-1', 'jobkorea.co.kr', {
						'allowLinker' : true,
						'name' : 'trackerOne2'
					});
					ga('require', 'linker');
					ga('linker:autoLink', [ 'jobbusan.co.kr' ]);
					ga('trackerOne2.send', 'pageview');

				});
	})(jQuery);
</script>

<script type='text/javascript'>
	if (window._dslog) {
		window._dslog.setUID('');
		window._dslog.dispatch();
	} else {
		var dslog_tag = document.getElementById('dslog_tag');
		if (dslog_tag != null && dslog_tag != undefined) {
			dslog_tag.onload = dslog_tag.onreadystatechange = function() {
				dslog_tag.onload = dslog_tag.onreadystatechange = null;
				window._dslog.setUIDCookie('');
				window._dslog.dispatch()
			}
		}
	}
</script>


<script type="text/javascript" src="/Scripts/json2.js"></script>
<script type="text/javascript" src="/Scripts/jquery.cookie.min.js"></script>
<script type="text/javascript"
	src="http://i.jobkorea.kr/content/js/jk_uit.js?20161025"></script>


<script type="text/javascript">
	$(function() {
		$('.devFaqItem').click(
				function() {
					var $li = $(this).parent();

					if ($li.is('.on')) {
						$li.removeClass('on');
						$li.find('button').removeClass('tplBtnCls_3').addClass(
								'tplBtnMore');
						$li.find('.searchListData').hide();
					} else {
						var $ul = $(this).closest('ul');
						$ul.find('li').removeClass('on');
						$ul.find('button').removeClass('tplBtnCls_3').addClass(
								'tplBtnMore');
						$ul.find('.searchListData').hide();

						$li.addClass('on');
						$li.find('button').removeClass('tplBtnMore').addClass(
								'tplBtnCls_3');
						$li.find('.searchListData').show();

						$('html, body').animate({
							scrollTop : $li.offset().top
						}, 200);

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