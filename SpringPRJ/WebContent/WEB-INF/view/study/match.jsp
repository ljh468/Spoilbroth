<%@page import="poly.dto.StudyListDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String user_id = (String) request.getAttribute("user_id");
	String user_name = (String) request.getAttribute("user_name");
	String user_email = (String) request.getAttribute("user_email");
	String join_dt = (String) request.getAttribute("join_dt");
	String user_mbti = (String) request.getAttribute("user_mbti");
	String user_dept = (String) request.getAttribute("user_dept");
	String user_study = (String) request.getAttribute("user_study");
	
	List<StudyListDTO> pList = (List<StudyListDTO>)request.getAttribute("pList");
	int count = pList.size();
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
<!-- owl -->

<style type="text/css">

#box { position: relative; top: 50%; text-align: center; margin-top: -25px; }
#box [class^="hex-icon"] { vertical-align: top; }

[class^="hex-icon"] { width: 42px; height: 50px; margin: 0 10px; display: inline-block; transition: all 0.2s cubic-bezier(0.215, 0.610, 0.355, 1.000); -webkit-transition: all 0.2s cubic-bezier(0.215, 0.610, 0.355, 1.000); }
[class^="hex-icon"]:hover { transform: scale3d(1.2, 1.2, 1); -webkit-transform: scale3d(1.2, 1.2, 1); transition: all 0.35s cubic-bezier(0.000, 1.270, 0.460, 1.650); -webkit-transition: all 0.35s cubic-bezier(0.000, 1.270, 0.460, 1.650); }
[class^="hex-icon"] svg { width: 100%; height: 100%; display: block; }

.hex-icon-sun path:first-of-type { fill: #fff; }
.hex-icon-sun circle { stroke: #757579; stroke-width: 2px; fill: none; }
.hex-icon-sun circle:last-of-type { stroke-width: 2px; stroke-dasharray: 2,7.4; }

.hex-icon-wave path:first-of-type { fill: #219cb5; }
.hex-icon-wave circle { stroke: #fff; stroke-width: 2px; fill: none; }
.hex-icon-wave mask circle { fill: #fff; stroke: none; }
.hex-icon-wave path:last-of-type { fill: #fff; }

.hex-icon-heart path:first-of-type { fill: #7b5af7; }
.hex-icon-heart path:last-of-type { fill: #fff; transform-origin: 21px 25px; -webkit-transform-origin: 21px 25px;
  animation: hex-icon-heart-beat 1s linear infinite;
  -webkit-animation: hex-icon-heart-beat 1s linear infinite;
}
@keyframes hex-icon-heart-beat { 0% { transform: scale3d(1, 1, 1); } 30% { transform: scale3d(0.75, 0.75, 1); } 60% { transform: scale3d(1, 1, 1); } }
@-webkit-keyframes hex-icon-heart-beat { 0% { -webkit-transform: scale3d(1, 1, 1); } 30% { -webkit-transform: scale3d(0.75, 0.75, 1); } 60% { -webkit-transform: scale3d(1, 1, 1); } }

</style>

</head>
<body data-aos-easing="slide" data-aos-duration="800" data-aos-delay="0">
	
	<!-- 전체 페이지 START-->
	<div id="colorlib-page">
		<!-- START 왼쪽 NANI -->
		<%@ include file="/WEB-INF/view/sidebar.jsp"%>
		<!-- END 왼쪽 NANI -->

		<!-- START 상단 NANI -->
		<div class="padding" style="padding-bottom: 175px;"></div>
		<div class="sidebar-heading" style="text-align: center; position: fixed; top: 0; width: 100%; height:190px; background-color: #fff; z-index: 5; padding-top: 20px;font-weight: 500; color: black;">
			<div class="hh" style="font-size: 23px;height: 32px;">
			<span>S</span><span>T</span><span>U</span><span>D</span><span>Y</span><span>&nbsp;</span><span>M</span><span>A</span><span>T</span><span>C</span><span>H</span><span>I</span><span>N</span><span>G</span>
			</div>
			<hr style=" width: 90%; height: 1.5px; border: none; background-color: #666666;">
			<ul class="tagcloud" style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
				<a href="#" class="tag-cloud-link" style="font-size: 17px; border-width: 1.5px; border-color: #ffc107;"> 자유스터디</a>
				<a href="#" class="tag-cloud-link" style="font-size: 17px; border-width: 1.5px; border-color: #ffc107;">공모전</a>
				<a href="#" class="tag-cloud-link" style="font-size: 17px; border-width: 1.5px; border-color: #ffc107;">어학/회화</a>
				<a href="#" class="tag-cloud-link" style="font-size: 17px; border-width: 1.5px; border-color: #ffc107;">봉사활동</a>
				<a href="#" class="tag-cloud-link" style="font-size: 17px; border-width: 1.5px; border-color: #ffc107;">취업/면접</a>
				<a href="#" class="tag-cloud-link" style="font-size: 17px; border-width: 1.5px; border-color: #ffc107;">스포츠</a>
				<a href="#" class="tag-cloud-link" style="font-size: 17px; border-width: 1.5px; border-color: #ffc107;">여행</a>
			</ul>
		</div>
		<!-- END 상단 NANI -->
		<hr />
		<!-- 메인 페이지 START-->
		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">
				<div class="container">
					
				<!-- 공보전정보, 개설하기 버튼 Start -->
				<div class="row">
					<div class="col-2">
					<span class="hex-icon-sun" OnClick="location.href='/study/contest.do'">
    					<svg>
      					<path d="M19,1 Q21,0,23,1 L39,10 Q41.5,11,42,14 L42,36 Q41.5,39,39,40 L23,49 Q21,50,19,49 L3,40 Q0.5,39,0,36 L0,14 Q0.5,11,3,10 L19,1" />
      					<circle cx="21" cy="25" r="8" />
      					<circle cx="21" cy="25" r="12">
        				<animateTransform attributeName="transform" attributeType="XML" type="rotate" from="0 21 25" to="360 21 25" dur="3.5s" repeatCount="indefinite" />
      					</circle>
    					</svg>
  					</span>
					</div>
					
					<div class="col-3" OnClick="location.href='/study/contest.do'">
  					<label style="font-size: 20px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
							공모전 정보</label>
					</div>
					
					<div class="col-2" OnClick="location.href='/study/studyopen.do'">
					<span class="hex-icon-heart">
    					<svg>
      					<path d="M19,1 Q21,0,23,1 L39,10 Q41.5,11,42,14 L42,36 Q41.5,39,39,40 L23,49 Q21,50,19,49 L3,40 Q0.5,39,0,36 L0,14 Q0.5,11,3,10 L19,1" />
      					<path d="M11,17 Q16,14,21,20 Q26,14,31,17 Q35,22,31,27 L21,36 L11,27 Q7,22,11,17" />
    					</svg>
  					</span>
					</div>
					
					<div class="col-3" OnClick="location.href='/study/studyopen.do'">
  					<label style="font-size: 20px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
							개설하기</label>
					</div>
				</div>
				<hr style="margin-top: 5px; margin-bottom: 0px;" />
				<!-- 공보전정보, 개설하기 버튼 END -->
					
					<!-- 왼쪽 오른쪽 2분할 -->
					<div class="row d-flex">
					
						<!-- 왼쪽 스크립트 -->
						<div class="col-xl-8 px-md-5" style="background-color: #f7fbff;">
							<!-- 추천 Study Group -->
							<!-- 슬라이드 -->
							<div class="slider-1">
								<label style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
								추천 스터디
								</label>
								
								<div class="owl-carousel owl-theme">
								
									<!-- 가입한 스터디 리스트로 뿌려줌 -->
									<div class="item" style="coler:white">
										<div style="background-image: url(/andrea-master/images/image_1.jpg); height:180px;">
											<div class="txt-box">
											</div>
										</div>
										<div>
										<div style="font-size:20px">hi</div>
											<ul>
												<li>목록1</li>
												<li>목록1</li>
											</ul>
										</div>
									</div>
									
									<div class="item" style="coler:white">
										<div style="background-image: url(/andrea-master/images/image_2.jpg); height:180px;">
										</div>
										<div>
											<div style="font-size:20px">hi</div>
											<ul>
												<li>목록1</li>
												<li>목록1</li>
											</ul>
										</div>
									</div>
									

								</div>
							</div>
							<!-- 슬라이드 END-->
							<hr style="margin-top: 5px; margin-bottom: 0px;" />
							<!-- My 프로필 메인화면 -->
							<label style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
								스터디 목록
							</label>
							<hr style="margin-top: 5px; margin-bottom: 0px;" />
							
							<!-- 스터디 목록 정보 START-->
							<%for(StudyListDTO pDTO : pList) {%>
							<% 	String[] arr = pDTO.getStudy_member().split(",");
								int membercount = arr.length;
							%>
							<div class="emp-profile">
								<div class="d-flex">
									<div class="profile-card">
										<div class="d-flex align-items-center">
											<div class="image">
												<img src="/getStudyImage.do?study_name=<%=pDTO.getStudy_name() %>" class="rounded" width="100%">
											</div>
										</div>
										<div class="button mt-2 d-flex flex-row align-items-center">
										<% if(user_study.contains(pDTO.getStudy_name())) { %>
											<button class="btn btn-sm btn-primary w-100" onclick="location.href='/study/studyboard.do?study_name=<%=pDTO.getStudy_name() %>' " method="get";>
												Study Join</button>
										<% }else { %>
											<button class="btn btn-sm btn-primary w-100" onclick="location.href='/study/studyinfo.do?study_name=<%=pDTO.getStudy_name() %>' " method="get";>
												Study Join</button>
										<% } %>
										</div>
									</div>
									
									<div class="profile-card" style="padding-left: 20px; padding-top: 20px;">
										<h5
											style="font-size: 26px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;letter-spacing: 8px;">
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
							<div class="meta-wrap" style="font-size: 22px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
								<p class="meta">
									<span  style="color: cornflowerblue;"><i class="icon-folder-o mr-2"></i><%=pDTO.getStudy_field() %></span>
									<span><i class="icon-calendar mr-2"></i><%=pDTO.getStudy_dt() %></span>
								</p>
								<p class="mb-4" style="font-size: 18px;"><%=pDTO.getStudy_contents()%></p>
							</div>
								
							<!-- 스터디 목록 정보 END-->
							<hr style="margin-top: 5px; margin-bottom: 0px;" />
							<% } %>
						</div>

						<!-- 오른쪽 스크립트 START -->
						
						<!-- 오른쪽 스크립트 END -->
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
</html>