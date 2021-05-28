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
<title>Spoilbroth_StudyGroup</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="/andrea-master/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/andrea-master/css/animate.css">

<link rel="stylesheet" href="/andrea-master/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/andrea-master/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/andrea-master/css/magnific-popup.css">

<link rel="stylesheet" href="/andrea-master/css/aos.css">

<link rel="stylesheet" href="/andrea-master/css/ionicons.min.css">

<link rel="stylesheet"
	href="/andrea-master/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/andrea-master/css/jquery.timepicker.css">


<link rel="stylesheet" href="/andrea-master/css/flaticon.css">
<link rel="stylesheet" href="/andrea-master/css/icomoon.css">
<link rel="stylesheet" href="/andrea-master/css/style.css">



</head>
<body data-aos-easing="slide" data-aos-duration="800" data-aos-delay="0">

	<div id="colorlib-page">
		<!-- START 왼쪽 NANI -->
		<%@ include file="/WEB-INF/view/sidebar.jsp"%>
		<!-- END 왼쪽 NANI -->

		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">

				<div class="container">

					<!-- 왼쪽 오른쪽 2분할 -->
					<div class="row d-flex">
						<!-- 왼쪽 스크립트 -->
						<div class="col-xl-8 py-5 px-md-5">
							왼쪽 스크립트 시작
							<div class="row pt-md-4">
								<div class="col-md-12">
									<div
										class="blog-entry ftco-animate d-md-flex fadeInUp ftco-animated">
										<a href="single.html" class="img img-2"
											style="background-image: url(/andrea-master/images/image_1.jpg);"></a>
										<div class="text text-2 pl-md-4">
											<h3 class="mb-2">
												<a href="single.html">A Loving Heart is the Truest
													Wisdom</a>
											</h3>
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
							왼쪽 스크립트 끝

						</div>
						<!-- 오른쪽 스크립트 -->
						<div class="col-xl-4 sidebar ftco-animate bg-light pt-5 fadeInUp ftco-animated">
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
							<div>오른쪽 스크립트 시작</div>
						</div>

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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&amp;sensor=false"></script>
	<script src="/andrea-master/js/google-map.js"></script>
	<script src="/andrea-master/js/main.js"></script>


</body>
</html>