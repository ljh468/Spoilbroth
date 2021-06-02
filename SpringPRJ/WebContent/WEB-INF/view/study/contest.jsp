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

<!-- profile -->
<link rel="stylesheet" href="/css/profile.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!-- profile -->

<!-- owl -->
<script src="/andrea-master/js/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">
<link rel="stylesheet" href="/css/owlowl.css">

<!-- data table -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">



</head>
<body data-aos-easing="slide" data-aos-duration="800" data-aos-delay="0">

	<!-- 전체 페이지 START-->
	<div id="colorlib-page">
		<!-- START 왼쪽 NANI -->
		<%@ include file="/WEB-INF/view/sidebar.jsp"%>
		<!-- END 왼쪽 NANI -->

		<!-- START 상단 NANI -->
		<div class="padding" style="padding-bottom: 160px;"></div>
		<div class="sidebar-heading" style="text-align: center; position: fixed; top: 0; width: 100%; height:190px; background-color: #fff; z-index: 5; padding-top: 20px;font-weight: 500; color: black;">
			<div class="hh" style="font-size: 23px;height: 32px;">
			<span>S</span><span>T</span><span>U</span><span>D</span><span>Y</span><span>&nbsp;</span><span>I</span><span>M</span><span>F</span><span>O</span><span>R</span><span>M</span><span>A</span><span>T</span><span>I</span><span>O</span><span>N</span>
			</div>
			<hr style="width: 90%; height: 1.5px; border: none; background-color: #666666;">
			<ul class="tagcloud" style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
				<a href="/study/match.do" class="tag-cloud-link"
					style="font-size: 17px; border-width: 1.5px; border-color: #ff0050;">이전</a>
				<a href="#" class="tag-cloud-link"
					style="font-size: 17px; border-width: 1.5px; border-color: #ffc107;">공익/아이디어</a>
				<a href="#" class="tag-cloud-link"
					style="font-size: 17px; border-width: 1.5px; border-color: #ffc107;">IT/소프트웨어</a>
				<a href="#" class="tag-cloud-link"
					style="font-size: 17px; border-width: 1.5px; border-color: #ffc107;">패션/디자인</a>
				<a href="#" class="tag-cloud-link"
					style="font-size: 17px; border-width: 1.5px; border-color: #ffc107;">광고/마케팅</a>
				<a href="#" class="tag-cloud-link"
					style="font-size: 17px; border-width: 1.5px; border-color: #ffc107;">문학/시나리오</a>
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
						<div class="col-xl-8 px-md-5" style="background-color: #f7fbff;">

							<!-- My 프로필 메인화면 -->
							<div class="emp-profile">
								<label
									style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
									공모전 정보 </label>
								<hr style="margin-top: 0px; margin-bottom: 8px;" />
								<div class="row" style="font-size: 11px;">

									<!-- 공모전 리스트 반복 -->
									<div class="col-12">
										<!-- 
									<table id="userList" >
									  <thead>
									    <tr>
									      <th>이름</th>
									      <th>사번</th>
									      <th>이메일</th>
									      <th>SC권한</th>
									      <th>직위</th>
									    </tr>
									  </thead>
									</table>
									 -->
										<table id="example" class="display" style="width: 100%">
											<thead>
												<tr>
													<th>분야</th>
													<th>공모전명</th>
													<th>주최</th>
													<th>현황</th>
													<th>보러가기</th>
												</tr>
											</thead>

											<%
												for (int i = 0; i < 20; i++) {
											%>
											<tr>
												<td>IT개발</td>
												<td>한이음 ICT멘토링 공모전</td>
												<td>정보통신부</td>
												<td>D-20</td>
												<td onclick="location.href='/study/contestdetail.do'">클릭</td>
											</tr>
											<%
												}
											%>

											<tfoot>
												<tr>
													<th>분야</th>
													<th>공모전명</th>
													<th>주최</th>
													<th>현황</th>
													<th>보러가기</th>
												</tr>
											</tfoot>
										</table>
									</div>
								</div>
							</div>

							<!-- Join Study Group -->
							<!-- 그룹목록 START -->
							<div class="row pt-md-4">
								<div class="col-md-12">
									<!-- 데이터 테이블 -->

								</div>
							</div>
							<!-- 그룹목록 END -->

							왼쪽 스크립트 끝
						</div>

						<!-- 오른쪽 스크립트 -->
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
							<div>오른쪽 스크립트 시작</div>
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
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				troke-width="4" stroke="#eeeeee"></circle>
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
	<script src="/andrea-master/js/main.js"></script>
	<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>

</body>
<script type="text/javascript">
	$('.slider-1 > .owl-carousel').owlCarousel({
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
<script>
	$(document).ready(function() {
		$('#example').DataTable({});
	});
</script>
<!--  <script>
var table = $("#userList").DataTable();
	table.destroy();
	
	$.ajax({
	  url:"selectUserList.do",
	  type:"POST",
	  data : { dept_id : dept_id },
	  success:
	  	
	  	function(data){
	 	 $("#userList").dataTable({
	 	 data: data,
	 	 columns: [
	  		{ data: 'user_nm_ko' },
	  		{ data: 'user_id' },
	       	{ data: 'email' },
	        { data: 'enable' },
	        { data: 'pos_nm' }
	  		
	  		]
	  	});
	
	    },error:function(request, status, error){
	    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
</script>-->
</html>