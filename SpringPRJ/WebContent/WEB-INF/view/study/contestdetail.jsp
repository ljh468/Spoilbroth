<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String user_id = (String) request.getAttribute("user_id");
	String user_email = (String) request.getAttribute("user_email");
	String join_dt = (String) request.getAttribute("join_dt");
	String user_name = "이재훈";
	String user_mbti = "ENTP";
	String user_dept = "데이터분석과";
	
	String[] study_group = user_name.split("");
	int study_count = study_group.length;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Spoilbroth_StudyGroup</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap"	rel="stylesheet">
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

<!-- profile -->
<link rel="stylesheet" href="/css/profile.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!-- profile -->

<!-- owl -->
<script src="/andrea-master/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">
<link rel="stylesheet" href="/css/owlowl.css">
<!-- owl -->

<style>
	.fontstyle{
		font-size: 20px;
		font-family: 'Do Hyeon', sans-serif;
		font-family: 'Nanum Pen Script', cursive;
		margin-bottom: 0px;
	}
</style>
</head>
<body data-aos-easing="slide" data-aos-duration="800" data-aos-delay="0">
	
	<!-- 전체 페이지 START-->
	<div id="colorlib-page">
		<!-- START 왼쪽 NANI -->
		<%@ include file="/WEB-INF/view/sidebar.jsp"%>
		<!-- END 왼쪽 NANI -->

		<!-- START 상단 NANI -->
		<div class="padding" style="padding-bottom: 100px;"></div>
		<div class="sidebar-heading" style="text-align: center; position: fixed; top: 0; width: 100%; background-color: #fff; z-index: 5; padding-top: 20px;font-weight: 500;">
		Study Imformation
			<hr style=" width: 90%; height: 1.5px; border: none; background-color: #666666;">
			<ul class="tagcloud" style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;margin-bottom: 0px;">
				<a href="/study/contest.do" class="tag-cloud-link" style="font-size: 17px; border-width: 1.5px; border-color: #ff0050; float: left; margin-left: 20px;">이전</a>
			</ul>
		</div>
		<!-- END 상단 NANI -->
		
		<!-- 메인 페이지 START-->
		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">
				<div class="container">
				
					<!-- 왼쪽 오른쪽 2분할 -->
					<div class="row d-flex">
					
						<!-- 왼쪽 스크립트 -->
						<div class="col-xl-8 px-md-5">
							<!-- 스터디 개설  START -->
							<div class="emp-profile">
								<label style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
								공모전명 : 한이음 ICT 멘토링 공모전
								</label>
								<!-- 사진 프로필 START -->
								<div class="d-flex card m-2 p-3">
									
									<div class="d-flex align-items-center">
										<div class="image">
											<img src="/andrea-master/images/image_1.jpg" class="rounded"width="100%">
										</div>
									</div>
											
									<div>
           								<label style="font-size: 20px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
										분야</label>
              							<div class="card fontstyle">
		              					Study Name
		              					</div>
		              					
		              					<label style="font-size: 20px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
										응모대상</label>
              							<div class="card fontstyle">
		              					Study Name
		              					</div>
		              					
		              					<label style="font-size: 20px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
										주최/주관</label>
              							<div class="card fontstyle">
		              					Study Name
		              					</div>
		              					
		              					<label style="font-size: 20px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
										접수기간</label>
              							<div class="card fontstyle">
		              					Study Name
		              					</div>
		              					
		              					<label style="font-size: 20px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
										총 상금</label>
              							<div class="card fontstyle">
		              					Study Name
		              					</div>
		              					
		              					<label style="font-size: 20px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
										홈페이지</label>
              							<div class="card fontstyle">
		              					<a href="URL">이동</a>
		              					</div>
		              							
	              						
									</div>
								</div>
								<!-- 스터디 개설  END -->

								<hr style="margin-top: 10px; margin-bottom: 0px;" />
								
							</div>
						</div>
						<!-- 왼쪽 스크립트 끝 -->
						
						<!-- 오른쪽 스크립트 시작 -->
						<div
							class="col-xl-4 sidebar ftco-animate bg-light pt-5 fadeInUp ftco-animated">
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
				</div>
			</section>
		</div>
		<!-- 메인 페이지 END-->
	</div>
	<!-- 전체 페이지 END-->

	<!-- loader -->
	<div id="ftco-loader" class="fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" troke-width="4" stroke="#eeeeee"></circle>
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"></circle></svg>
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
</body>
<script type="text/javascript">
	$('.slider-1 > .owl-carousel')
			.owlCarousel(
					{
						autoplay : true, // 오토 플레이
						autoplayTimeout : 6000, // 오토 플레이 시에 다음 슬라이드로 넘어가는 주기, 2초
						loop : true,
						margin : 0,
						nav : true,
						navText : [],
						responsive : {
							0 : {
								items : 1
							}
						}
					});

	var $firstDot = $('.slider-1 > .owl-carousel > .owl-dots > .owl-dot.active');

	$firstDot.removeClass('active');

	setTimeout(function() {
		$firstDot.addClass('active');
	}, 100);
</script>
</html>