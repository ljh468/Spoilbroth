<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String user_id = (String) request.getAttribute("user_id");
	String user_name = (String) request.getAttribute("user_name");
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	function doRegFileCheck(f){
		
		if(f.fileUplod2.value==""){
			swal ('????????? ???????????? ??????????????????.');
			f.fileUplod2.focus();
			return false;
		}
		
		if(f.study_name.value==""){
			swal ('????????? ????????? ??????????????????.');
			f.study_name.focus();
			return false;
		}
		if(f.study_title.value==""){
			swal ('????????? ????????? ??????????????????.');
			f.study_title.focus();
			return false;
		}
		if(f.study_contents.value==""){
			swal ('????????? ???????????? ??????????????????.');
			f.study_contents.focus();
			return false;
		}
		
	}
</script>
</head>
<body data-aos-easing="slide" data-aos-duration="800" data-aos-delay="0">
	
	<!-- ?????? ????????? START-->
	<div id="colorlib-page">
		<!-- START ?????? NANI -->
		<%@ include file="/WEB-INF/view/sidebar.jsp"%>
		<!-- END ?????? NANI -->

		<!-- START ?????? NANI -->
		<div class="padding" style="padding-bottom: 105px;"></div>
		<div class="sidebar-heading" style="text-align: center; position: fixed; top: 0; width: 100%; height:130px; background-color: #fff; z-index: 5; padding-top: 20px;font-weight: 500; color: black;">
			<div class="hh" style="font-size: 23px;height: 32px;">
			<span>S</span><span>T</span><span>U</span><span>D</span><span>Y</span><span>&nbsp;</span><span>M</span><span>A</span><span>T</span><span>C</span><span>H</span><span>I</span><span>N</span><span>G</span>
			</div>
			<hr style=" width: 90%; height: 1.5px; border: none; background-color: #666666;">
			<ul class="tagcloud" style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;margin-bottom: 0px;">
				<a href="/study/match.do" class="tag-cloud-link" style="font-size: 17px; border-width: 1.5px; border-color: #ff0050; float: left; margin-left: 20px;">??????</a>
			</ul>
		</div>
		<!-- END ?????? NANI -->
		
		<!-- ?????? ????????? START-->
		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">
				<div class="container">
				
					<!-- ?????? ????????? 2?????? -->
					<div class="row d-flex">
					
						<!-- ?????? ???????????? -->
						<div class="col-xl-8 px-md-5" style="background-color: #f7fbff;">
							<!-- ????????? ??????  START -->
							<div class="emp-profile">
								<label style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
								????????? ????????????
								</label>
								<!-- ?????? ????????? START -->
								<div class="d-flex card m-2 p-3">
								
										<form action="/study/insertStudyInfo.do" class="p-1 contact-form" method="post" enctype="multipart/form-data" 
											onsubmit="return doRegFileCheck(this)"
											style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive;">
										<div class="profile-card" style="width: 100%;">
												<div class="align-items-center">
													<div class="image">
														<img id="preview-image" src="/andrea-master/images/study.jpg" class="rounded" width="100%" alt="My Image">
													</div>
												</div>
												<div id="input-image" class="button mt-2 d-flex flex-row align-items-center">
													<input type="file" id="file" name="fileUplod2" onchange="changeValue(this)" style="display:none;"/>
													<button class="btn btn-sm btn-primary w-100" id="btn-upload" style="margin-right: 2px;font-size: 20px;">Select File</button>
												</div>
											
										</div>
										
										<div>
	              							<label style="font-size: 22px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-bottom: 0px;">
											????????? ??????
											</label>
	              							<div class="form-group">
		              							<select class="form-control" style="width: 100%; font-size: 22px;" name="study_field">
													<option value="???????????????" selected>???????????????</option>
													<option value="IT??????" selected>IT??????</option>
													<option value="?????????">?????????</option>
													<option value="??????/??????">??????/??????</option>
													<option value="????????????">????????????</option>
													<option value="??????/??????">??????/??????</option>
													<option value="?????????">?????????</option>
													<option value="??????">??????</option>
												</select>
	              							</div>
	              							<div class="form-group">
	                							<input type="text" id="study_name" class="form-control" placeholder="Study Name" name="study_name" style="font-size: 20px;">
	              							</div>
	              							<div class="form-group">
	                							<input type="text" class="form-control" placeholder="Study Title" name="study_title" style="font-size: 20px;">
	              							</div>
								            <div class="form-group">
								                <textarea id="" cols="20" rows="7" class="form-control" placeholder="Message" name="study_contents" style="font-size: 18px;"></textarea>
								            </div>
								            <div class="form-group text-center" style="font-size:24px;margin-bottom: 0px;">
												<input type="submit" value="Create Study" class="btn btn-success py-2 px-3" style="font-size: 20px;">
								             </div>
								            <p class="mb-3" style="font-size: 20px;font-family: 'Do Hyeon', sans-serif;font-family: 'Nanum Pen Script', cursive;color: #6c757d;float: right;">
											By <span><%=user_name%></span>
											</p>
										</div>
								        </form>
									</div>
								</div>
								<!-- ????????? ??????  END -->

								<hr style="margin-top: 10px; margin-bottom: 0px;" />
								
							</div>
						</div>
						<!-- ?????? ???????????? ??? -->
						
						<!-- ????????? ???????????? ?????? -->
						

					</div>
			</section>
		</div>
		<!-- ?????? ????????? END-->
	</div>
	<!-- ?????? ????????? END-->

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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
		$(function () {
			$('#btn-upload').click(function (e) {
				e.preventDefault();
				$('#file').click();
			});
		});
		
		
		function readImage(input) {
		    // ?????? ????????? ????????? ?????? ??????
		    if(input.files && input.files[0]) {
		       
		        // FileReader ???????????? ??????
		        const reader = new FileReader()
		        // ???????????? ????????? ??? ??????
		        reader.onload = e => {
		            const previewImage = document.getElementById("preview-image")
		            console.log("previewImage : " + previewImage)
		            previewImage.src = e.target.result
		        }
		        // reader??? ????????? ????????? ??????
		        reader.readAsDataURL(input.files[0])
		    }
		}
		// input file??? change ????????? ??????
		const inputImage = document.getElementById("input-image")
		inputImage.addEventListener("change", e => {
		    readImage(e.target)
		})
</script>



</html>