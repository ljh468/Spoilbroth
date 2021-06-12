<%@page import="poly.util.CmmUtil"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Chatting</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
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

<!-- profile -->
<link rel="stylesheet" href="/css/profile.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!-- profile -->

<!-- owl -->

<!-- data table -->

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
				<span>S</span><span>T</span><span>U</span><span>D</span><span>Y</span><span>&nbsp;</span><span>C</span><span>H</span><span>A</span><span>T</span><span>T</span><span>I</span><span>N</span><span>G</span>
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
							<!-- 스터디 개설  START -->
							<div class="" style="margin-left:20px">
							<label style="font-size: 30px; font-family: 'Do Hyeon', sans-serif; font-family: 'Nanum Pen Script', cursive; margin-top: 18px; margin-bottom: -8px;">
									 팀의 채팅창 </label>
							</div>
							<div class="emp-profile">
								<!-- 사진 프로필 START -->
								<div class="d-flex card p-3" style="magin: -11px;">
								
								<div>
								<button type="button" onclick="openSocket()">대화방참여</button>
								<button type="button" onclick="closeSocket();">대화방 나가기</button>
								
								<br>
								<br>
								<br>
								<input type="text" id="sender" value="${sessionScope.user_id}" style="display: none;" >
								<input type=text" id= "messageinput">
								
								<button type="button" onclick="send();">메세지 전송</button>
								<button type="button" onclick="javascript:clearText();">대화내용 지우기</button>
								</div>
								
								
								<!-- Server responses get written here -->
								<div id ="messages">
								</div>
								
								 <div class="chat-box">
                                    <div class="chat-desc customscroll">
                                        <ul id="chat__ul">

                                        </ul>
                                    </div>
                                    <div class="chat-footer">
                                        <div id="micButtonBox"></div>
                                    </div>
                                </div>
                                
                                
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
	function getDatetime() {
	    let _date = new Date();
	    let _hours = _date.getHours();
	    let _min = _date.getMinutes();
	    _hours = _hours < 10 ? '0' + _hours : _hours
	    _min = _min < 10 ? '0' + _min : _min
	    return _hours + ':' + _min;
	}	

</script>

	<!-- websocket javascript -->
    <script type="text/javascript">
        var ws;
        var messages=document.getElementById("messages");
        
        function openSocket(){
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                writeResponse("WebSocket is already opened.");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws=new WebSocket("ws://localhost:8090/echo.do");
            
            ws.onopen=function(event){
                if(event.data===undefined) return;
                
                writeResponse(event.data);
            };
            ws.onmessage=function(event){
                writeResponse(event.data);
            };
            ws.onclose=function(event){
                writeResponse("Connection closed");
            }
        }
        
        function send(){
            var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
            ws.send(text);
            text="";
        }
        
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
            messages.innerHTML+="<br/>"+text;
        }
        function clearText(){
        	console.log(messages.parentNode);
        	messages.parentNode.removeChild(messages)
        }
  </script>

</html>