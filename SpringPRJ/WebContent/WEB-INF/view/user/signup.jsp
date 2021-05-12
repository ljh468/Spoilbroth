<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>SignUp</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="/login/css/main.css">
<!--===============================================================================================-->
<style>
.container-login100:before{
        content: "";
        background: url(/login/images/desk20.jpg); padding-bottom:20px;
        background-size: cover;
        opacity: 0.8;
        position: absolute;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
    }


출처: https://ddorang-d.tistory.com/89 [도라미도라미]
</style>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100 p-b-20" style=" padding-bottom:20px;">
			<div class="wrap-login100">
				<div class="login100-form" style="font-size:30px;color: darkcyan; padding-bottom: 30px;" >
						Sign Up
				</div>

				<form class="login100-form validate-form" style="padding-top: 30px;padding-bottom: 30px;">
				
					<div class="wrap-input100 validate-input m-b-20" data-validate="UserId is required">
						<span class="label-input100">ID</span>
						<input class="input100" type="text" name="userid" id="userid" placeholder="Enter userId">
						<span class="focus-input100"></span>
					</div>
					
										
				
					<div class="wrap-input100 validate-input m-b-20" data-validate="Useremail is required">
						<span class="label-input100">Email</span>
						<input class="input100" type="email" name="useremail" placeholder="Enter useremail">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="pwd" placeholder="Enter password">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
						<span class="label-input100">Password check</span>
						<input class="input100" type="password" name="pwd2" id="passWordCheck" placeholder="your Password Check">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 m-b-20" data-validate="userdept is required">
						<span class="label-input100">DEPT</span>
						<select class="form-control" style="width:100%" name="userdept">
							<option value="dataAnalysis" selected>데이터분석과</option>
							<option value="medicalInformation">의료정보과</option>
							<option value="digitalContent">디지털콘텐츠과</option>
							<option value="jewelryDesign">주얼리디자인과</option>
							<option value="fashionDesign">패션디자인과</option>
							<option value="fashionIndustry">패션산업과</option>
						</select>
					</div>
					
					<div class="wrap-input100 validate-input m-b-18" data-validate = "age is required">
						<span class="label-input100">Age</span>
						<input class="input100" name="age" id="age" type="number" min='18' max='40' step='1'>
						<span class="focus-input100"></span>
					</div>
					
					</div>
					<div class="padding" style="padding-bottom: 50px;"></div>
						
					
					
					<div class="container-login100-form-btn" style="padding-top: 20px;">
						<button class="login100-form-btn" style="margin: auto; z-index: 5;">
							Register
						</button>
					</div>
				</form>
				
				
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
	<script src="/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/login/vendor/bootstrap/js/popper.js"></script>
	<script src="/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/login/js/main.js"></script>

</body>
</html>