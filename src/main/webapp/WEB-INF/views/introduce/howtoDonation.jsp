<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">

<!-- favicon -->
<link rel="icon"
	href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png"
	type="image/x-icon">

<title>도넷닷컴</title>
<style>
   .outer{
        width: 1050px;
        margin: auto;
    }
	#title{
		font-size: 18px;
		font-weight: 600;
		margin-left: 3%;
		color: black;
	}
	#greenLine{
        background-color: rgb(60, 179, 113);
        width: 800px;
        height: 3px;
        float: right;
        margin-right:8%;
	}
	#content{
		text-align: center;
		width: 800px;
		float: right;
		margin-right:8%;
	}
</style>
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

	<div class="outer">
		<jsp:include page="../introduce/sideBar.jsp" />
		
		<span class="main">
			<span id="title">후원 방법</span>
			<span id="subTitle"> | 도넷닷컴의 후원방법에 대해 알아봅시다.</span>
			<div id="greenLine"></div>
			<div id="content">
				<br><br><br><br><br><br>
				<h1>도넷닷컴은 사용자의 직접 참여하는 후원방식을 지원합니다.</h1><br><br><br>
				<p>
					금전적인 지원 뿐만 아니라 사이트 내에 진행중인 다양한 이벤트에 참여하고<br><br>
					
					사소한 습관, 재능기부 등 자신의 선행활동을 다이어리처럼 기록하여<br><br>
					
					획득하는 포인트로 다양한 프로젝트에 후원할 수 있습니다!<br><br>
					
					이러한 다양한 활동으로 색다른 기부의 성취감을 느껴보세요!<br><br>
				</p>
					
				<br><br><br><br><br><br><br><br><br><br>
				<h3 style="font-weight:600;">1. 진행 중인 다양한 이벤트에 참여해 포인트를 획득하세요!</h3><br><br>
				<img src="${ pageContext.servletContext.contextPath}/resources/imgs/introduceImgs/event.PNG" alt="">
				<br><br>
				<p>
					전시회 방문, 게임, 심리테스트 등 다양한 이벤트에 참여하는 것만으로도 <br>
					
					후원할 수 있는 포인트를 얻을 수 있습니다.<br><br>
				</p>
				
				<br><br><br><br><br><br>
				<h3 style="font-weight:600;">2. 자신의 선행활동 기록해 포인트를 획득하세요!</h3><br><br>
				<div class="imgs">
					<span style="float:left;"><img style="width:300px;" src="${ pageContext.servletContext.contextPath}/resources/imgs/introduceImgs/goodthing.PNG" alt=""></span>
					<span ><img style="width:400px;" src="${ pageContext.servletContext.contextPath}/resources/imgs/introduceImgs/goodthings.PNG" alt=""></span>
				</div>
				<br><br><br><br><br><br><br><br>
				<p>
					봉사활동, 재능기부 등 자신의 선행활동을 다이어리처럼 남겨주세요.<br><br>
					
					꼭 거창한 것이 아니어도 좋습니다.<br>
					
					길가는 쓰레기를 주웠다던지, 힘들어하는 친구에게 격려의 말을 건냈다던지<br>
					
					아주 사소한 오지랖에서 비롯되어 주변 사람들에게 관심을 가지는 것만으로도 충분합니다!<br><br><br><br><br><br>
					
					
					
					이러한 게시글을 다른 사람들과 공유하며 커뮤니티를 형성해 소통할 수 있습니다.<br>
					
					게시글 인증 후 포인트를 획득할 수 있고<br>
					
					 더 나아가 생활 속에 깆든 기부습관을 들일 수 있습니다.<br><br>
				</p>				
				
				<br><br><br><br><br><br>
				<<h3 style="font-weight:600;">3. 포인트 결제 충전</h3><br><br>
				<p>
					도넷닷컴의 회원이 되어주세요! <br>

					포인트는 마이페이지에서 직접 포인트를 충전 할 수 있습니다.<br><br>
				</p><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
				
			</div>
		</span>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<jsp:include page="../donation/subMenu.jsp" />
	
	<!-- JS here -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/animated.headline.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- Date Picker -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/gijgo.min.js"></script>
	<!-- Nice-select, sticky -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.sticky.js"></script>
	<!-- Progress -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.barfiller.js"></script>

	<!-- counter , waypoint,Hover Direction -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.counterup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.countdown.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/hover-direction-snake.min.js"></script>

	<!-- contact js -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/contact.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.form.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/mail-script.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>