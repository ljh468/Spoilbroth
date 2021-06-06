<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.StudyListDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user_id = (String) request.getAttribute("user_id");
	String user_email = (String) request.getAttribute("user_email");
	String user_name = (String) request.getAttribute("user_name");
	String user_mbti = (String) request.getAttribute("user_mbti");
	String user_dept = (String) request.getAttribute("user_dept");
	String user_img = (String) request.getAttribute("user_img");
	String studys = (String) request.getAttribute("user_study");
	System.out.print("studys : " + studys);
	int study_count = 0;
	String[] user_study = studys.split(",");
	if (studys.equals("")) {
		study_count = user_study.length - 1;
	} else {
		study_count = user_study.length;
	}

	List<StudyListDTO> pList = (List<StudyListDTO>) request.getAttribute("pList");
	if(pList == null){
		pList = new ArrayList<StudyListDTO>();
	}
	int count = pList.size();
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

<!-- owl -->

<!-- card -->
<style>
</style>

</head>
<body data-aos-easing="slide" data-aos-duration="800" data-aos-delay="0">

	<!-- 전체 페이지 START-->
	<div id="colorlib-page">
		<!-- START 왼쪽 NANI -->
		<%@ include file="/WEB-INF/view/sidebar.jsp"%>
		<!-- END 왼쪽 NANI -->

		<!-- START 상단 NANI -->
		<div class="padding" style="padding-bottom: 70px;"></div>
		<div class="sidebar-heading"
			style="text-align: center; position: fixed; top: 0; width: 100%; height: 70px; background-color: #fff; z-index: 5; padding-top: 20px; font-weight: 500; color: black;">
			<div class="hh" style="font-size: 23px; height: 32px;">
				<span>M</span><span>Y</span><span>&nbsp;</span><span>S</span><span>T</span><span>U</span><span>D</span><span>Y</span>
			</div>
			<hr
				style="width: 90%; height: 1.5px; border: none; background-color: #666666;">
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

								<!-- 사진 프로필 START -->
								<div class="d-flex">


									<div class="profile-card">
										<form id="uploadForm" enctype="multipart/form-data">
											<div class="d-flex align-items-center">
												<div class="image">
													<img id="preview-image" src="/getImage.do?user_id=<%=user_id %>" class="rounded" width="100%" alt="My Image">
												</div>
											</div>
											<div id="input-image" class="button mt-2 d-flex flex-row align-items-center">
												<input type="file" id="file" name="fileUplod" onchange="changeValue(this)" style="display:none"/>
												<button class="btn btn-sm btn-primary w-100" id="btn-upload" style="margin-right: 2px;">Select File</button>
												<button id="btnUpload" class="btn btn-sm btn-primary w-100" style="margin-left: 2px;">Register</button>
											</div>
										</form>
									</div>

									<div class="profile-card"
										style="padding-left: 20px; padding-top: 20px;">
										<h5
											style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; letter-spacing: 13px;">
											<%=user_name%></h5>
										<h6
											style="font-size: 25px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
											<%=user_dept%></h6>
										<p class="mb-2"
											style="font-size: 20px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; color: #6c757d;">
											Join Study : <span><%=study_count%>/5</span>
										</p>
									</div>
								</div>
								<!-- 사진프로필  END -->


								<hr style="margin-top: 10px; margin-bottom: 0px;" />


								<!-- 사용자 정보 START-->
								<div class="row"
									style="font-size: 18px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
									<div class="col-md-6">
										<div class="profile-head">
											<ul class="nav nav-tabs" id="myTab" role="tablist">
												<li class="nav-item"><a class="nav-link active"
													id="home-tab" data-toggle="tab" href="#home" role="tab"
													aria-controls="home" aria-selected="true">About</a></li>
												<li class="nav-item"><a class="nav-link"
													id="profile-tab" data-toggle="tab" href="#profile"
													role="tab" aria-controls="profile" aria-selected="false">Timeline</a>
												</li>
											</ul>
										</div>
									</div>

								</div>
								<div class="row"
									style="font-size: 18px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
									<div class="col-md-8">
										<div class="tab-content profile-tab" id="myTabContent">
											<div class="tab-pane fade show active" id="home"
												role="tabpanel" aria-labelledby="home-tab">
												<div class="row">
													<div class="col-6">
														<label>User Id</label>
													</div>
													<div class="col-6">
														<div style="margin-left: 20px; color: #0062cc;"><%=user_id%></div>
													</div>
												</div>

												<div class="row">
													<div class="col-6">
														<label>Email</label>
													</div>
													<div class="col-6">
														<div style="margin-left: 20px; color: #0062cc;"><%=user_email%></div>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label>MBTI</label>
													</div>
													<div class="col-6">
														<div style="margin-left: 20px; color: #0062cc;"><%=user_mbti%></div>
													</div>
												</div>

											</div>

											<div class="tab-pane fade" id="profile" role="tabpanel"
												aria-labelledby="profile-tab">
												<div class="row">
													<div class="col-md-12">
														<label>Join Study Group List</label>
													</div>
												</div>

												<%
													for (int i = 0; i < study_count; i++) {
												%>
												<div class="row">
													<div style="margin-left: 20px; color: #0062cc;"><%=user_study[i]%></div>
												</div>
												<%
													}
												%>

											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 사용자 정보 END-->


							<!-- Join Study Group -->
							<!-- 슬라이드 -->
							<div class="slider-1">
								<label
									style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
									내가 가입한 스터디 </label>
								<div class="owl-carousel owl-theme">
									<%
										for (StudyListDTO sDTO : pList) {
									%>
									<!-- 가입한 스터디 리스트로 뿌려줌 -->
									<div class="item"
										style="font-size: 33px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; coler: white;">
										<img
											src="/getStudyImage.do?study_name=<%=sDTO.getStudy_name()%>"
											class="rounded" width="100%">
										<div class="txt-box"></div>
										<div style="margin-top: 20px; margin-bottom: 0px;">
											<div style="font-size: 25px"><%=sDTO.getStudy_name()%></div>
											<ul style="font-size: 20px">
												<li><%=sDTO.getStudy_title()%></li>
												<li><%=sDTO.getStudy_contents()%></li>
												<li><%=sDTO.getStudy_member()%></li>
											</ul>
										</div>
									</div>
									<%
										}
									%>

								</div>
							</div>
							<!-- 슬라이드 END-->

							<!-- Join Study Group -->
							<!-- 그룹목록 START -->
							<hr style="margin-top: 5px; margin-bottom: 0px;" />
							<!-- My 프로필 메인화면 -->
							<label
								style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
								가입한 스터디 목록 </label>
							<hr style="margin-top: 5px; margin-bottom: 0px;" />

							<!-- 스터디 목록 정보 START-->
							<%
								for (StudyListDTO pDTO : pList) {
							%>
							<%
								String[] arr = pDTO.getStudy_member().split(",");
									int membercount = arr.length;
							%>
							<div class="emp-profile">
								<div class="d-flex">
									<div class="profile-card">
										<div class="d-flex align-items-center">
											<div class="image">
												<img
													src="/getStudyImage.do?study_name=<%=pDTO.getStudy_name()%>"
													class="rounded" width="100%">
											</div>
										</div>
										<div class="button mt-2 d-flex flex-row align-items-center">
											
											<button class="btn btn-sm btn-primary w-100"
												onclick="location.href='/study/studyboard.do?study_name=<%=pDTO.getStudy_name()%>' "
												method="get";>Study Join</button>
											
										</div>
									</div>

									<div class="profile-card"
										style="padding-left: 20px; padding-top: 20px;">
										<h5
											style="font-size: 26px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; letter-spacing: 8px;">
											<%=pDTO.getStudy_name()%></h5>
										<h6
											style="font-size: 22px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
											<%=pDTO.getStudy_title()%></h6>
										<p class="mb-2"
											style="font-size: 20px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; color: #6c757d;">
											Join Study : <span><%=membercount%>/5</span>
										</p>
									</div>
								</div>
							</div>
							<div class="meta-wrap"
								style="font-size: 22px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
								<p class="meta">
									<span style="color: cornflowerblue;"><i
										class="icon-folder-o mr-2"></i><%=pDTO.getStudy_field()%></span> <span><i
										class="icon-calendar mr-2"></i><%=pDTO.getStudy_dt()%></span>
								</p>
								<p class="mb-4" style="font-size: 18px;"><%=pDTO.getStudy_contents()%></p>
							</div>

							<!-- 스터디 목록 정보 END-->
							<hr style="margin-top: 5px; margin-bottom: 0px;" />
							<%
								}
							%>
							<!-- 그룹목록 END -->

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

</body>
<script type="text/javascript">
		$(function () {
			$('#btn-upload').click(function (e) {
				e.preventDefault();
				$('#file').click();
			});
		});
		
		
		function readImage(input) {
		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		       
		        // FileReader 인스턴스 생성
		        const reader = new FileReader()
		        // 이미지가 로드가 된 경우
		        reader.onload = e => {
		            const previewImage = document.getElementById("preview-image")
		            console.log("previewImage : " + previewImage)
		            previewImage.src = e.target.result
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0])
		    }
		}
		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("input-image")
		inputImage.addEventListener("change", e => {
		    readImage(e.target)
		})
</script>

<script type="text/javascript">
	$('.slider-1 > .owl-carousel')
			.owlCarousel(
					{
						autoplay : true, // 오토 플레이
						autoplayTimeout : 3000, // 오토 플레이 시에 다음 슬라이드로 넘어가는 주기, 2초
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

<script type="text/javascript">
	$('#btnUpload').on('click', function(event) {
	    event.preventDefault();
	    
	    var form = $('#uploadForm')[0]
	    var data = new FormData(form);
	    $('#btnUpload').prop('disabled', true);
		
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "/FileUplod.do",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function (data) {
	        	$('#btnUpload').prop('disabled', false);
	        	alert('등록이 성공하였습니다.')
	        },
	        error: function (e) {
	            $('#btnUpload').prop('disabled', false);
	            alert('등록이 실패하였습니다.');
	        }
	    });
	})
</script>
</html>