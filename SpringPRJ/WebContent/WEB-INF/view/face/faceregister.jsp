<%@page import="poly.dto.ContestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Spoilbroth_StudyPlace</title>
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

<link rel="stylesheet" type="text/css" href="/css/map.css">
<style type="text/css">

</style>
</head>
<body data-aos-easing="slide" data-aos-duration="800" data-aos-delay="0">

	<!-- 전체 페이지 START-->
	<div id="colorlib-page">
		<!-- START 왼쪽 NANI -->
		<%@ include file="/WEB-INF/view/sidebar.jsp"%>
		<!-- END 왼쪽 NANI -->

		<!-- START 상단 NANI -->
		<div class="padding" style="padding-bottom: 90px;"></div>
		<div class="sidebar-heading"
			style="text-align: center; position: fixed; top: 0; width: 100%; background-color: #fff; z-index: 5; padding-top: 20px; font-weight: 500; color: black;">
			<div class="hh" style="font-size: 23px; height: 32px;">
				<span>F</span><span>A</span><span>C</span><span>E</span>&nbsp;<span>R</span><span>E</span><span>S</span><span>I</span><span>S</span><span>T</span><span>E</span><span>R</span>
			</div>
			<hr style="width: 90%; height: 1.5px; border: none; background-color: #666666;">
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
							<div class="emp-profile" style="">
								<label style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
								얼굴 등록하기 </label>
								<hr style="margin-top: 0px; margin-bottom: 8px;" />
								<div class="" style="font-size: 11px; margin: 0px;">
									<p style="font-size: 23px; color:royalblue; margin-bottom: 0px; letter-spacing:1px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
									카메라에 얼굴을 마주보고 움직이지 마세요.</p><br>
									<p style="font-size: 23px; color:lightcoral; margin-bottom: 0px; letter-spacing:1px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
									학습 시작하기 버튼을 누르면</p><br>
									<p style="font-size: 23px; color:royalblue; letter-spacing:1px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
									100장의 사진을 찍습니다.</p><br>
									<!-- 얼굴 등록하기 -->
									<div class="d-flex card p-3" style="width: 100%; height: 500px; margin-bottom: 10px;">
									<!-- 웹캠 보여주기 -->
										<video id="video" width="100%" height="100%" autoplay ></video>
										<div id="progress">0</div>
									</div>
									<button id="webcamBtn" class="btn btn-sm btn-primary w-100" style="height: 45px; margin-top: 5px; font-size: 17px;">학습 시작하기</button>
									<!-- 끝 -->
								</div>
							</div>
							<!-- My 프로필 메인화면 끝-->
						</div>
						<!-- 오른쪽 스크립트 -->
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
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script>

	

    if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
        navigator.mediaDevices.getUserMedia({video: true }).then(function(stream) {
            var video = document.getElementById('video');
            video.srcObject = stream;
            video.play();
        });
    }

    var canvas = document.getElementById('canvas');
    var context = canvas.getContext('2d');
    var video = document.getElementById('video');
    var facebtn = document.getElementById('webcamBtn');
    var progress = document.getElementById('progress');
    
    facebtn.addEventListener("click", function() {
    	for (var i = 0; i < 100; i++) {
    	console.log("facebtn 함수 진입!");
        // screenShot($("#video"));
        progress.innerHTML=i;
    	}
    });
    
</script>
<script>
	var canvas = document.getElementById('canvas');
	var context = canvas.getContext('2d');
	var video = document.getElementById('video');
	var facebtn = document.getElementById('webcamBtn');
	var progress = document.getElementById('progress');

	window.addEventListener("load", function(){
		
		if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
		    navigator.mediaDevices.getUserMedia({video: true }).then(function(stream) {
		        var video = document.getElementById('video');
		        video.srcObject = stream;
		        video.play();
		    });
		};
		var imglist = [];
		
		facebtn.onclick = function(){
			for (var i = 0; i < 100; i++) {
				console.log("facebtn 함수 진입!");
			    // screenShot($("#video"));
			    progress.innerHTML=i+1;
			    
			    var target = document.querySelector("#video");
			    if (target != null && target.length > 0) {
			        let t = target[0];
			        html2canvas(t).then(function(canvas) {
			            let myImg = canvas.toDataURL("image/png");
			            myImg = myImg.replace("data:image/png;base64,", "");
			            imglist.push(myImg);
					};
				};
		};
		
	});
	
	function screenShot(target) {
		
	    if (target != null && target.length > 0) {
	        let t = target[0];
	        html2canvas(t).then(function(canvas) {
	            let myImg = canvas.toDataURL("image/png");
	            myImg = myImg.replace("data:image/png;base64,", "");
	
	            $.ajax({
	                type : "POST",
	                data : {
	                    "imgSrc" : myImg
	                },
	                dataType : "text",
	                url : "/roadMapFileUpload",
	                success : function(data) {
	                    if(data == 1){
	                        console.log("저장 성공!");
	                    } else {
	                        console.log("저장 실패!");
	                    }
	                },
	                error : function(a, b, c) {
	                    alert("에러 발생!");
	                }
	            });
	        });
	    }
	}
</script>
</html>