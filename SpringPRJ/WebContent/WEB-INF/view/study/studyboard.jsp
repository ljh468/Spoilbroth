<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.StudyListDTO"%>
<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	UserDTO uDTO = (UserDTO) request.getAttribute("rDTO");
	String user_id = uDTO.getUser_id();
	String user_name = uDTO.getUser_name();
	
	StudyListDTO sDTO = (StudyListDTO) request.getAttribute("sDTO");
	String study_name = (String) request.getAttribute("study_name");
	String study_notify = CmmUtil.nvl(sDTO.getStudy_notify());
	String study_title = CmmUtil.nvl(sDTO.getStudy_title());
	
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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">

</head>
<body data-aos-easing="slide" data-aos-duration="800" data-aos-delay="0">

	<!-- 전체 페이지 START-->
	<div id="colorlib-page">
		<!-- START 왼쪽 NANI -->
		<%@ include file="/WEB-INF/view/sidebar.jsp"%>
		<!-- END 왼쪽 NANI -->

		<!-- START 상단 NANI -->
		<div class="padding" style="padding-bottom: 55px;"></div>
		<div class="sidebar-heading"
			style="text-align: center; position: fixed; top: 0; width: 100%; height: 70px; background-color: #fff; z-index: 5; padding-top: 20px; font-weight: 500; color: black;">
			<div class="hh" style="font-size: 23px; height: 32px;">
				<span>S</span><span>T</span><span>U</span><span>D</span><span>Y</span><span>&nbsp;</span><span>M</span><span>A</span><span>T</span><span>C</span><span>H</span><span>I</span><span>N</span><span>G</span>
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
							<!-- 스터디 개설  START -->
							<div class="" style="margin-left:20px">
							<label style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-top: 18px; margin-bottom: -8px;">
									<%=study_name %> 팀의 커뮤니티 </label>
							</div>
							<div class="emp-profile">
								<!-- 사진 프로필 START -->
								<div class="d-flex card p-3" style="magin: -11px;">



								<form id="uploadForm" enctype="multipart/form-data">
									<div class="d-flex align-items-center">
										<div class="image">
											<img id="preview-image" src="/getStudyImage.do?study_name=<%=study_name%>"
												class="rounded" width="100%">
										</div>
									</div>
									<div id="input-image" class="button mt-2 d-flex flex-row align-items-center">
												<input type="file" id="file" name="fileUplod2" onchange="changeValue(this)" style="display:none"/>
												<input type="hidden" name="study_name" value="<%=study_name %>">
												<button class="btn btn-sm btn-primary w-100" id="btn-upload" style="margin-right: 2px;">Select File</button>
												<button id="btnUpload" class="btn btn-sm btn-primary w-100" style="margin-left: 2px;">Register</button>
									</div>
								</form>
									
									
									
									
									
									<hr>
									<div class="form-group" style="margin-bottom: 0px;">
										<label style="font-size: 22px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
										Title : <%=study_title %>
										</label><br>
										<label style="font-size: 22px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
										스터디 시작일 : <%=sDTO.getStudy_dt() %>
										</label><br>
										<label style="font-size: 22px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
										멤버 : <%=sDTO.getStudy_member() %>
										</label><br>
										<label style="font-size: 22px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
										멤버의 MBTI : 
										</label>
	                					
	              					</div>
									<div class="form-group mt-3">
										<label style="font-size: 25px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
											알림</label>
										<div class="card fontstyle p-2" style="font-size: 22px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
											<%=study_notify %>
											알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.알림문구입니다.
										</div>
									</div>
									<div style="display: flex">
										<label
											style="font-size: 25px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
											게시판</label>
										<button type="button" class="btn btn-outline-warning"
											onclick="location.href='/mbti/mbtimain.do'"
											style="margin-left: 30%;">Let's go Chatting</button>
									</div>
									<hr>
									<!-- 게시판 -->
									<table id="example" class="display" style="width: 100%;font-size: 20px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;"">
										<thead>
											<tr>
												<th>no</th>
												<th>tile</th>
												<th>name</th>
												
												
											</tr>
										</thead>

										<%
											for (int i = 0; i < 2; i++) {
										%>
										<tr>
											<td>1</td>
											<td>공지사항</td>
											<th>재훈</th>
										</tr>
										<tr>
											<td>2</td>
											<td>오늘 언제 보실껀가요??</td>
											<th>두표</th>
										</tr>
										<%
											}
										%>

										
									</table>
									<!-- 스터디 개설  END -->

									<hr style="margin-top: 10px; margin-bottom: 0px;" />

								</div>
							</div>
							<!-- 왼쪽 스크립트 끝 -->

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
	<script
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>


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
	$('#btnUpload').on('click', function(event) {
	    event.preventDefault();
	    
	    var form = $('#uploadForm')[0]
	    var data = new FormData(form);
	    $('#btnUpload').prop('disabled', true);
		
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "/FileUplod2.do",
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
</html>