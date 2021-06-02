<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String user_seq = (String) request.getAttribute("user_seq");
String user_id = (String) request.getAttribute("user_id");
String user_pwd = (String) request.getAttribute("user_pwd");
String user_email = (String) request.getAttribute("user_email");
String join_dt = (String) request.getAttribute("join_dt");
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>mbti 스터디그룹 추천 매칭</title>
	<meta name="description" content="MBTI를 기반으로 개인의 성격에 맞는 스터디 그룹을 추천해주는 커뮤니티 사이트입니다.">
	
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/andrea-master/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/andrea-master/css/animate.css">
<link rel="stylesheet" href="/andrea-master/css/owl.carousel.min.css">
<link rel="stylesheet" href="/andrea-master/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/andrea-master/css/magnific-popup.css">
<link rel="stylesheet" href="/andrea-master/css/aos.css">
<link rel="stylesheet" href="/andrea-master/css/ionicons.min.css">
<link rel="stylesheet" href="/andrea-master/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/andrea-master/css/jquery.timepicker.css">
<link rel="stylesheet" href="/andrea-master/css/flaticon.css">
<link rel="stylesheet" href="/andrea-master/css/icomoon.css">
<link rel="stylesheet" href="/andrea-master/css/style.css">

<style>
	article{
		display: flex;
		flex-direction: column;
	}

	.question{
		display: none;

	}

	.result{
		display: none;
	}
	
	#img{
		width: 250px; 
		height: 250px;
		margin:  0 auto;
	}

	.share{
		margin: 0 auto;
	}

	.kakao_ad{
		width : 320px;
		margin: 0 auto;
	}

	.banner{
		display: flex;
		justify-content: center;
		width: 300px;
		margin: 0 auto;
	}
	
	.banner-img{
		width:300px;
	}
</style>
</head>

<body data-aos-easing="slide" data-aos-duration="800" data-aos-delay="0">

	<div id="colorlib-page">
		<!-- START 왼쪽 NANI -->
		<%@ include file="/WEB-INF/view/sidebar.jsp"%>
		<!-- END 왼쪽 NANI -->
		
		<!-- START 상단 NANI -->
		<div class="padding" style="padding-bottom: 70px;"></div>
		<div class="sidebar-heading" style="text-align: center; position: fixed; top: 0; width: 100%; height:70px; background-color: #fff; z-index: 5; padding-top: 20px;font-weight: 500; color: black;">
			<div class="hh" style="font-size: 23px;height: 32px;">
			<span>M</span><span>B</span><span>T</span><span>I</span><span>&nbsp;</span><span>A</span><span>N</span><span>A</span><span>L</span><span>Y</span><span>S</span><span>I</span><span>S</span>
			</div>
			<hr style=" width: 90%; height: 1.5px; border: none; background-color: #666666;">
		</div>
		<!-- END 상단 NANI -->
		
		<div id="colorlib-main">
			<div class="container">
				<section class="ftco-section ftco-no-pt ftco-no-pb">

					<!-- 왼쪽 오른쪽 2분할 -->
					<div class="row d-flex">
						<!-- 왼쪽 스크립트 -->
						<div class="col-xl-8 py-4 px-md-5" style="background-color: #f7fbff;">
							

							<button type="button" class="btn btn-outline-warning" onclick="location.href='/mbti/mbtimain.do'" style="border-radius: 5px;">My MBTI</button>
							<span style="padding-left: 50px;"></span>
							<button type="button" class="btn btn-outline-warning active" onclick="location.href='/mbti/mbtianalysis.do'" style="border-radius: 5px;">MBTI Analysis</button>
							<hr>
							<div class="text-center" style="font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; font-size: 32px;">
							내 성격은 무엇일까요?</div>
							
							<div class="row p-2">
								<div class="card p-l-55 p-r-55 p-t-65 p-b-54 shadowbox col-12" style="font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; font-size: 20px;">
									
									<!-- 시작 화면 -->
									<article class="start mt-5 mb-3">
										<button type="button" class="btn btn-success" style="border-radius: 10px; font-size: 20px;" onclick="start();">
											Test Start</button>
									</article>

									<!-- 문제 화면 -->
									<article class="question">
										<div class="progress mt-4">
											<div class="progress-bar" role="progressbar" style="width: calc(100/12*0%)" ></div>
										  </div>
										<h3 id="title" class="text-center mt-3" style="font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; font-size: 25px;"
										>문제</h3>

										<input type="hidden" id="type" value="EI">
										
										<button type="button" id="A" class="btn btn-primary mt-3" style="border-radius: 10px; font-size: 20px;">
											YES</button>
										<button type="button" id="B" class="btn btn-primary mt-2 mb-3" style="border-radius: 10px; font-size: 20px;" >
											NO</button>
									
									</article>
									<!-- 결과 화면 -->
									<article class="result">
										<img id="img" class="rounded-circle mt-5" src="lion.jpg" alt="">
										<h3 id="animal" class="text-center mt-2" style="font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; font-size: 32px;"
										>이름</h2>
										<h3 id="explain" class="mt-2" style="font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; font-size: 20px;"
										>&nbsp&nbsp설명</h3>
										<!-- Go to www.addthis.com/dashboard to customize your tools --> <div class="share addthis_inline_share_toolbox"></div>
									</article>

									<!-- 하단 배너 -->
									<article class="mt-3"></article>
									<a href="#">
										<!-- <img class="banner-img" src="lion.jpg" alt=""> -->
									</a>

									<input type="hidden" id="EI" value="0">
									<input type="hidden" id="SN" value="0">
									<input type="hidden" id="TF" value="0">
									<input type="hidden" id="JP" value="0">

								</div>
							</div>
							
								

							<div class="row pt-md-4">
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex fadeInUp ftco-animated">
										<div class="text text-2 pl-md-4">
											
											<div class="meta-wrap">
												<p class="meta">
													<span><i class="icon-calendar mr-2"></i>June 28,
														2019</span> <span><a href="single.html"><i
															class="icon-folder-o mr-2"></i>Travel</a></span> <span><i
														class="icon-comment2 mr-2"></i>5 Comment</span>
												</p>
											</div>
											<p class="mb-4">A small river named Duden flows by their
												place and supplies it with the necessary regelialia.</p>
											<p>
												<a href="#" class="btn-custom">Read More <span
													class="ion-ios-arrow-forward"></span></a>
											</p>
										</div>
									</div>
								</div>
							</div>
						
						<div style="text-align: center;">
								<button type="button" class="btn btn-success" style="border-radius: 10px;" onclick="location.href='/mbti/mbtianalysis.do' ">Start</button>
							
						</div>
						왼쪽 스크립트 끝
						</div>
							
						<!-- 오른쪽 스크립트 -->
						<div class="col-xl-3 sidebar ftco-animate bg-light pt-5 fadeInUp ftco-animated">
							<div>오른쪽 스크립트 시작</div>
							
							

							<div class="sidebar-box ftco-animate">
								<h3 class="sidebar-heading">Archives</h3>
								<ul class="categories">
									<li><a href="#">Decob14 2018 <span>(10)</span></a></li>
									<li><a href="#">September 2018 <span>(6)</span></a></li>
									<li><a href="#">August 2018 <span>(8)</span></a></li>
									<li><a href="#">July 2018 <span>(2)</span></a></li>
									<li><a href="#">June 2018 <span>(7)</span></a></li>
									<li><a href="#">May 2018 <span>(5)</span></a></li>
								</ul>
							</div>

							<div class="sidebar-box ftco-animate">
								<h3 class="sidebar-heading">Paragraph</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Ducimus itaque, autem necessitatibus voluptate quod mollitia
									delectus aut.</p>
							</div>
							<div>오른쪽 스크립트 끝</div>
						</div>

					
				</div>
			</section>
		</div>
	</div>
	<!-- END COLORLIB-PAGE -->

	<!-- loader -->
	<div id="ftco-loader" class="fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee"></circle>
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"></circle></svg>
	</div>
</div>

	<script src="/andrea-master/js/jquery.min.js"></script>
	<script src="/andrea-master/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/andrea-master/js/popper.min.js"></script>
	<script src="/andrea-master/js/bootstrap.min.js"></script>
	<script src="/andrea-master/js/jquery.easing.1.3.js"></script>
	<script src="/andrea-master/js/jquery.waypoints.min.js"></script>
	<script src="/andrea-master/js/jquery.stellar.min.js"></script>
	<script src="/andrea-master/js/owl.carousel.min.js"></script>
	<script src="/andrea-master/js/jquery.magnific-popup.min.js"></script>
	<script src="/andrea-master/js/aos.js"></script>
	<script src="/andrea-master/js/jquery.animateNumber.min.js"></script>
	<script src="/andrea-master/js/scrollax.min.js"></script>
	<script src="/andrea-master/js/main.js"></script>
	<!-- Go to www.addthis.com/dashboard to customize your tools -->
	<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-60b49e426e7db5c0"></script>

</body>
<!-- 문제 가져오는 로직 -->
<script>
	var num = 1;
	var q = {
            1: {"title": "연말 약속, 다 잡았는데 어쩔 수 없지. <br>집콕이 곧 안전이다. <br>근데, 나 집에서 뭐하지?", "type": "EI", "A": "집에 있는게 답답하다.. 친구들과 만나서 수다떨고 싶으니 줌으로 비대면 파티를 연다", "B": "집콕? 오히려 좋아. 집에서 조용히 읽고 싶었던 책을 읽으며 가족들하고 오손도손 보내야지."},
            2: {"title": "아무리 돌아도 그 곳이 그 곳 같아 목적지를 찾을 수 없다. 어떻게 해야 할까?", "type": "SN", "A": "마침 저기에 지도가 있으니 우선 보고 찾는 게 시간을 아끼는 길이라 생각한다.", "B": " 내 직감은 이 쪽이라고 말하고 있으니 목적지를 찾을 겸 구경도 한다."},
            3: {"title": "그럴 의도는 아니였는데.. 대화하다가 상대방을 서운하게 했다! 나의 행동은?", "type": "TF", "A": "미안해, 하지만 내가 말하려고 했던건.. 상대를 설득시킨다.", "B": "내가 진짜 그런 의도는 아니였어. 화났어? 우선 상대방의 화를 풀어주려한다."},
            4: {"title": "올해 계획, 계획했던 것보다 달성을 못할 것 같은데 이건 어떻게 조정해야할까?", "type": "JP", "A": "빠르게 판단하고 계획해 진행해야한다! 우선 행동을 멈추고 비상소집 후 회의를 진행한다.", "B": "이렇게 될 줄 예상하고 있었어. 우선 할 수 있는 것부터 실행해보고 방법을 찾아나간다."},
            5: {"title": "연말에는 내년에 계획을 세워야지! 21년의 나는 어떤 계획을 세울까?", "type": "EI", "A": "적극적으로 강의, 강연을 다니며 지식을 흡수하며 인맥을 확장해간다.", "B": "독서와 명상을 통해 차분하고 깊이 있는 사람이 될 수 있도록한다."},
            6: {"title": "일이 너무 많아서 머리가 복잡해! 계획했던 일을 이번 주까지 끝내야하는데 할 수 있을까?", "type": "SN", "A": "기간을 조금 늘리더라도 정확하게 처리한다.", "B": "빠르게 일을 끝내고 수정할 게 생기면 그때가서 처리한다."},
            7: {"title": "연말이고, 연초라 내 의지가 끌어오른다! 뭐라도 해야할 것 같은데, 어떡하지?", "type": "TF", "A": "투두리스트를 적어 하나씩 처리할 수 있도록 계획한다.", "B": "우선 해봐야 도전하는 느낌도 난다! 당장 뭐라도 시작한다."},
            8: {"title": "2020년이 마무리됐다...만,내가 원하는 바를 이루지는 못했다. 나는 어떻게 생각하는 타입?", "type": "JP", "A": " 올해 정말 수고했지만, 내가 원하는 결과는 얻지 못했어 내년에는 더 타이트하고 체계적으로 목표와 일정을 짜서 해결해내고 말거야!", "B": "비록 내가 원하는 바는 이루지 못했지만, 오히려 좋아, 목표에 대한 변수를 파악하고 새로운 방향을 알아냈으니까!"},
            9: {"title": "연말, 팀에게 감사인사를 하고 싶다. 하지만 예산은 한정되어있고.. 어떻게 선물을 준비할까?", "type": "EI", "A": "비슷한 가격대의 선물을 골라 모두에게 선물한다.", "B": "가장 고마웠던 팀원에게 조용히 편지와 선물을 준비한다."},
            10: {"title": "연초에는 정말 새로운 사람이 되고 싶다. 그럼, 뭐부터 해야하지? 연초계획을 세울 때 내 스타일은?", "type": "SN", "A": "현실적으로 이룰 수 있는 계획들을 세워 진행한다.", "B": "포부는 크면 클수록 좋아. 계획은 최대한 크게 세운다."},
            11: {"title": "친구가 이직에 대한 고민을 하고 있다! 다른 사람의 계획에 있어 당신의 반응은?", "type": "TF", "A": "그럼 이렇게 해보는 건 어때? 계획들에 대한 분석적으로 살펴보고 다양한 의견을 준다", "B": "아 진짜? 그런 고민 왜 혼자 하고 있었어! 그동안 안힘들었어? 라고 위로하며 공감한다."},
            12: {"title": "2021년 내 목표는 자기개발, 나는 어떤식으로 자기개발하는 스타일일까?", "type": "JP", "A": "우선 기초 이론부터 차근차근 배워서 성장해나가고 싶어! 커리큘럼을 보고 꼼꼼하게 공부 계획을 세워서 수강한다.", "B": "시도를 해봐야 내가 어떤 유형에 맞는 지 확인 가능하다고 생각하기 때문에 강의를 수강해본다"}
        }
        var result = {
            "ISTJ": {"animal": "계획만 세워도 오늘 공부의 반은 했다! 프로계획러 <strong>하마</strong>", "explain": "시험일정이 잡혔을 때, 친구들과 약속이 잡혔을 때 먼저 나서서 계획을 세우는 타입이에요. 점심먹을 때는 디저트를, 디저트 먹을 때는 저녁을, 저녁 먹을때는 다음 날 아침을 미리미리 생각해서 결정장애가 있는 주변인에게 사랑받아요. 하지만, 주로 했던 일들 위주로 계획을 세우다보니 도전적인 거에는 서툴 수 있어요. 책임감과 추진력이 강한 당신! 올해는 도전적으로 일을 주도해봐요.", "img": "hippo.png"},
            "ISFJ": {"animal": "이 계획으로 밀고가고는 싶지만, 너가 그렇게 하고 싶다면.. 배려왕 <strong>부엉이</strong>", "explain": "다른 사람과 계획을 짤 때 너의 말도, 너의 말도 옳다.는 황희정승형 마인드를 가지고 있어요. 모두를 의견을 듣고 모두가 원하는 방향으로 계획을 세우고 싶어하기 때문에 조금 스트레스를 받기도 해요. 하지만, 본인만의 계획을 세울 땐 확고하게, 완벽한 계획을 세워 달성해나가려고 하는 외유내강 타입이에요. 하지만, 주어진 계획을 잘 이뤄나가지 못할 경우에 큰 스트레스를 받아요. 남들과의 의견 조율에서는 좀 더 본인 의견을 내세우거나 본인의 계획에서는 살짝 여유를 주는게 좋아요.", "img": "owl.png"},
            "INFJ": {"animal": "계획적으로 생활하는 것이 곧 삶의 기쁨 스케쥴러 <strong>물소</strong>", "explain": "첫 만남에 맘에 드는 상대를 발견하고 결혼까지 생각하는 당신은 일을 진행하면서 계속해서 미래를 상상하고 자극받는 걸 좋아해요. 모든 일에는 이유와 의미가 있다고 생각하는 당신! 그만큼 다 중요하다고 생각하기 때문에 허투루 일을 하는 사람이 아니에요. 그래서 더 목표를 중요하게 여겨요. 계획에는 어떠한 목표가 있는지 확인하고 맞는 계획을 세워 이뤄나가려해요. 완벽한 계획을 추구해요. 그만큼 추진력도 강해 주변에서 믿음직한 사람이라고 많이 들어요.", "img": "buffalo.png"},
            "INTJ": {"animal": "치타는 다 계획이 있구나.. 이 모든 것은 나의 큰 그림! 선구자 <strong>치타</strong>", "explain": "연애 상담을 하다보면 결혼과 출산까지 염두해서 조언을 해주는 당신은 나무보다 숲, 아니 달에서 우주 저만리까지 보는 사람이에요. 큰틀을 우선적으로 생각하다보니 꿈꾸는 목표치가 점점 높아지고, 불어나는 계획들을 자각하지 못하다 다시 돌아가기도 해요. 하지만, 이 모든 건 내 목표를 이루어나가기 위한 것! 들어가는 시간이 곧 '투자'라고 생각하기 때문에 해결책을 찾아 실행해요. 미래를 낙관적으로 판단하는 성향이 있기 때문에 보다 더 강하게 목표를 향해 달려나가려 노력해요.", "img": "cheetah.png"},
            "ISTP": {"animal": "계획은 계획일 뿐. 목표가 확실하면 된다!  상황에 따라 움직이는 유연한 <strong>나무늘보</strong>", "explain": "안드로이드급의 무표정으로 느긋하게 있는 것처럼 보이지만 언제든지 다른 방향으로 움직일 수 있도록 머리에서 이미 계산을 다 굴리고 있어요. 이미 세워진 계획이 있더라도 목표를 더 잘 달성하기 위해서라면 다 뒤집더라도 다시 할 수 있는 용기를 가지고 있어요. 꽂힌 일은 사막에서 바늘찾는 일을 하는 것처럼 꼼꼼하게하지만 그렇지 않으면 손에서 놓아버리는 과감함도 가지고 있어요. 하지만 때로는 생각만 과감하고 행동은 뜨뜻미지근한 경우가 있어 이상과 현실의 괴리감에 빠지기도 해요.", "img": "sloth.png"},
            "ISFP": {"animal": "모로 가도 서울로만 가면 돼! 계획 하나가 틀어져도 긍정적인 온화한 <strong>거북이</strong>", "explain": "비행기 티켓만 끊어도 내가 할 수 있는 여행 계획은 다 한 것! 이미 목적지를 정한 것만으로도 큰 일을 생각했다고 생각해요. 때에 따라 바꿀 수 있는게 계획이고, 내가 원하는 바만 이룰 수 있다면 유연하게 생각하며 움직여요. 웬만해서는 항상 여유롭고, 재미있게 일을 진행하고 싶어해요. 그렇다보니 결정을 내려야하는 순간이 온다면 최대한 피하고 싶어해요.", "img": "turtle.png"},
            "INFP": {"animal": "내 계획이 가장 나답고 완벽한 계획이야. 나잘알 <strong>코끼리</strong>", "explain": "나는 내가 제일 좋아.. 나만큼 나를 잘 아는 사람은 없어! 내가 세운 계획이 정말 의미있다고 믿기 때문에 강한 추진력으로 실행할 수 있어요. 평소에 자기 자신을 잘 파악하고 있고 믿고 있기 때문에 본인이 세운 계획에 있어 자신감이 넘쳐요. 일이 진행되면서 일어나는 평가에 객관적이고 냉철한 편이에요. 하지만, 실행하는 중간에 생각대로 진행되지 않는다면  그 다음 단계로 가는데 망설임을 느끼곤 해요. ", "img": "elephant.png"},
            "INTP": {"animal": "계획은 여러개 있을 수록 좋아! a안부터 d안까지 계획을 만들어 움직이는 <strong>침팬지</strong>", "explain": "계획이 틀어져? 오히려 좋아. 다른 계획들도 짜볼 수 있으니까! 라고 생각하는 당신. 계획은 많으면 많을수록 변수에 대항할 수 있다고 생각해요. 사실, 실행하는 과정보다 계획을 세울 때 더 재미를 느껴요. 그래서 계획은 a안부터 d안까지 계속해서 만들어나가지만 계획은 계획일 뿐, 즉흥적으로 행동할 때가 많아요. 반복되는 걸 좋아하지 않는 성향때문에 시행착오를 겪을 일이 많겠지만, 호기심이 가득한 당신에겐 시행착오조차 즐거움으로 다가올 거에요.", "img": "chimpanzee.png"},
            "ESTP": {"animal": "백문이불여일견, 계획은 세우되 행동이 우선! 일단 뭐라도 해봐야 직성이 풀리는 <strong>악어</strong>", "explain": "월급 3일 전, 계좌 잔고 520원. 하지만 어떻게든 잘 되지 않을까?라고 생각하며 긍정적으로 세상을 바라보는 시각을 가지고 있어요. 직접적인 경험을 통해 얻는 것이 더 소중하다고 생각하기 때문에 계획을 짜서 그대로 움직이는 거에는 흥미를 느끼지 못해요. 혹시라도 계획을 진행함에 있어 어려움이 생긴다면 기가막힌 순발력으로 타협점을 찾아 진행해요. 오늘의 할 일을 내일로 미루는 게 특기이긴 하지만 순발력이 좋고 긍정적이기 때문에 모든 순간에 즐거움을 느껴요.", "img": "alligator.png"},
            "ESFP": {"animal": "매일 반복되는 일상이 지루해! 계획적인건 싫어! 언제나 새로운 자극제를 찾아다니는 <strong>미어캣</strong>", "explain": "계획이 곧 족쇄. 계획을 세워 진행하는 일은 틀에 맞춰 사는 것 같아 답답함을 느끼는 자유로운 영혼의 소유자에요. 가끔씩 세우는 계획은 여행이나 운동같이 액티비티성이 강한 활동들을 위한 것이에요. 계획이 틀어져도 상관없어요. 내일은 내일의 해가 뜬다고 생각하기 때문이에요. 하지만 발등에 불이 떨어진 경우 빠르게 일을 처리하는 편이에요.", "img": "meerkat.png"},
            "ENFP": {"animal": "반짝이는 아이디어로 새로운 계획을 짜 지루할 틈이 없는 <strong>멋쟁이 사자</strong>", "explain": "새로운 계획, 새로워, 늘 짜릿해. 도중에 계획이 틀어져도 상관없어요, 아이디어가 반짝반짝 떠오르기 때문이죠. 계획적으로 해야하나 싶으면서도 계획을 세워 시작하면 끝없는 추진력을 얻어 일을 진행하는 타입이에요. 새로운 시도를 좋아해 중간중간 새롭게 계획되는 일들이 있어도 주저하지 않아요. 집단 생활에서 계획이 잘 되어가고 있다면 좋아하는 동료들의 모습을 보고 더 힘을 얻어 일을 추진해요.", "img": "lion.png"},
            "ENTP": {"animal": "새로운 도전은 언제나 좋아! 새롭게 정해진 계획을 당황하지 않고 즐기는 <strong>태양새</strong>", "explain": "낯선 계획에서, 가장 재밌는 냄새가 난다..도전적인 걸 좋아하기 때문에 정해진 계획대로 움직이는 건 지양해요. 단순 반복적인 일은 지루해요. 어려워 보여도 새롭게 시도해 해결할 수 있는 일을 더 선호해요. 가끔 엄청난 계획이 떠올라서 메모를 해두지만, 그걸 다시 열어보지 않는 매력이 있어요. 아이디어가 넘치는 당신. 아이디어를 이루기 위해 조금은 계획적으로 움직이면 더 발전할 수 있을 거에요!", "img": "sunbird.png"},
            "ESTJ": {"animal": "a부터 z까지 계획해 목표를 향해 나아가는 <strong>불도저 기린</strong>", "explain": "여행, 시험, 약속에도 계획표를 먼저짜는 스타일인 당신! 일정 계획에 진심인 당신은 특유의 현실적인 감각으로 철저하게 계획해 주변 사람들에게 믿음직한 사람이에요. 전 유교국가였던 나라의 국민답게 살짝 보수적으로 문제에 접근을 하지만, 그만큼 책임감을 가지고 강하게 계획을 추진할 수 있어요. 책임감이 강하고 그만큼 추진력도 있어 주어진 목표를 체계적으로 달성해나가는 모습은 정말 듬직해요. 하지만 계속 달려나가다보면 언젠가는 기름이 떨어지는 법. 여유로운 느낌을 선호하지 않는 당신이지만, 때로는 휴식을 취해 미래를 도모할 줄 알아야해요.", "img": "giraffe.png"},
            "ESFJ": {"animal": "주어진 목표를 이루기 위해 모두가 함께 성장해나가길 원하는 페이스메이커 <strong>고릴라</strong>", "explain": "숨쉬는 것도 내 계획 중 일부! 항상 최고의 아웃풋을 원하기 때문에 계획을 철저하게 세우려 노력해요. 한 번 일을 시작하면 끝까지 성공적으로 진행하려하는 진취적인 성격이에요. 여유로운 걸 불안해하기 때문에 계획이 빡빡한 편이에요. 조금은 자신을 놓는 법을 배울 필요가 있어요. 리더가 되는 경우가 많아 일을 함께 추진할 때 모두가 계획을 잘 수행할 수 있도록 이끌어나가요.", "img": "gorilla.png"},
            "ENFJ": {"animal": "내 계획은 모두 조절할 수 있어! 너와 맞추기 위해서라면. 평화주의자 <strong>카피바라</strong>", "explain": "사실...니 계획에 맞추는게 내 계획이야. 조화와 균형을 중시여기기 때문에 남들과 계획을 세울 때 의견을 모으는 걸 중요하게 생각해요. 속해있는 집단의 업무와 목적을 개인의 일보다 우선순위를 높여 생각해요. 계획을 세울 때 뜬구름을 잡는 두루뭉실한 목표보다 현실적인 목표를 세워 진행하는 걸 선호해요. 사람들을 굉장히 좋아하고 배려하지만, 보기보다 철저하고 현실적인 당신. 가끔은 자신만을 위한 계획을 세워보는 것도 좋아요.", "img": "capybara.png"},
            "ENTJ": {"animal": "내 사전에 결정장애란 없다! 선택의 순간, 단호하게 결정을 내리는 판사 <strong>호랑이</strong>", "explain": " '오늘은 김치찌개 드시죠!' 계획을 진행함에 있어 결정이 필요한 상황에서 갈팡질팡 하는 일 없이 빠르게 결정하고 진행하는 타입이에요. #### 혼자하는 것보다 다른 사람들과 함께 일을 진행하는 걸 선호해 함께하는 일에서 두각을 나타내요. 계획이 수립될 때 같이 협력해서 아이디어를 도출하는 과정에서 희열을 느껴요. 완벽함을 추구하기 때문에 스스로를 힘들게 할 수 있어요, 가끔은 사람들과 어울리며 여유를 즐겨봐요.", "img": "tiger.png"}
        }
	function start (){
		$(".start").hide();
		$(".question").show();
		next();
	}
	$("#A").click(function(){
		var type = $("#type").val();
		var preValue = $("#"+type).val();
		$("#"+type).val(parseInt(preValue)+1);
		next();
	});
	$("#B").click(function(){
		next();
	});
	function next() {
		if(num == 13){
			$(".question").hide();
			$(".result").show();

			// MBTI 로직
			var mbti = "";
			($("#EI").val() < 2 ) ? mbti += "I" : mbti += "E";
			($("#SN").val() < 2 ) ? mbti += "N" : mbti += "S";
			($("#TF").val() < 2 ) ? mbti += "F" : mbti += "T";
			($("#JP").val() < 2 ) ? mbti += "P" : mbti += "J";
			alert(mbti);
			
			$("#img").attr("src", result[mbti]["img"]);
			$("#animal").html(result[mbti]["animal"]);
			$("#explain").html(result[mbti]["explain"]);

		}else{
			$(".progress-bar").attr('style','width : calc(100/12*'+num+'%)'); 
			$("#title").html(q[num]["title"]);
			$("#type").val(q[num]["type"]);
			$("#A").html(q[num]["A"]);
			$("#B").html(q[num]["B"]);
			num++;
		}
	}

</script>
</html>