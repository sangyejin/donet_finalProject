<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도넷닷컴</title>
<!-- font -->
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12px;
	margin: 0;
	padding: 0;
}

#div-container {
	width: 1050px;
	margin: 0 auto;
}

/* 상단 타이틀 이미지 */
#idx_top {
	position: relative;
	width: 100%;
	height: 180px;
	padding: 50px;
	text-align: center;
	margin-bottom: 100px;
}


#idx_top #category, #idx_top #fpName {
	position: relative;
	color: black;
}

#idx_top #fpName {
	font-size: 30px;
	font-weight: 800;
}

/* 섬네일 & 기본 정보 */
#thumb-img-container {
	width: 450px;
	height: 400px;
	/* background-color: rgb(196, 171, 163); */
	display: inline-block;
	background:
		url("${pageContext.request.contextPath}/resources/upload_files/goods/${goods.thumbnailChangeName}")
		no-repeat 50% 50%/cover;
}

#info-left-container, #info-right-container {
	width: 500px;
	display: inline-block;
	padding-left: 0;
	padding-right: 0;
}

#info-right-container {
	margin-right: 0px;
	padding-left: 0;
	padding-right: 0;
}

#info-right-container p, #goalPersent {
	font-size: 34px;
	line-height: 50px;
	padding-left: 0;
	padding-right: 0;
}

.info-label {
	display: block;
}

#info-container {
	/* height: 400px; */
	width: 100%;
	padding-left: 0;
	padding-right: 0;
}

/*추가 이미지*/
#img-container, #content-container {
	margin-top: 50px;
	width: 100%;
}

#img-container {
	padding-left: 0px;
	padding-right: 0px;
}

.img {
	padding-left: 20px;
	padding-right: 20px;
}

.content-img {
	width: 310px;
}

.goalPersent-data span {
	font-size: 24px;
	font-weight: 700;
}

.data label {
	font-size: 18px;
}

.data span {
	font-size: 18px;
}

/* 내용작성 칸 */
#content-container {
	overflow:auto;
}

#btn-support {
	width: 200px;
	height: 40px;
	border-radius: 5px;
	color: white;
	font-weight: 600;
	background-color: rgb(60, 179, 113);
	transition: all 0.5s;
	border: 1px solid rgb(60, 179, 113);
}

#btn-support:hover {
	border: 1px solid rgb(60, 179, 113);
	color: rgb(60, 179, 113);
	font-weight: 600;
	background-color: white;
}

#btn-share {
	width: 40px;
	height: 40px;
	border-radius: 5px;
	font-weight: 600;
	color: white;
	transition: all 0.5s;
	background:
		url("${ pageContext.servletContext.contextPath }/resources/imgs/share_green.png")
		no-repeat white;
	border: 1px solid rgb(60, 179, 113);
	background-size: 60%;
	background-position: center;
}

#btn-share:hover {
	border: 1px solid rgb(60, 179, 113);
	color: rgb(60, 179, 113);
	font-weight: 600;
	background:
		url("${ pageContext.servletContext.contextPath }/resources/imgs/share_white.png")
		no-repeat rgb(60, 179, 113);
	background-size: 60%;
	background-position: center;
}

.btnArea {
	padding-top: 10px;
	text-align:right;
}

/*펀딩 굿즈*/
.funding-card {
	border: 1px solid gray;
}

/*댓글*/
#replyArea {
	padding-top: 100px;
	padding-bottom:100px;
}
#replyList{
	padding-top:20px;
}
.btn-insert-reply {
	height: 36px;
}

.btn-reply {
	border: none;
	background: white;
	color: gray;
}
.aArea{
	text-align:right;
}
</style>

<!-- font -->
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">

<!-- favicon -->
<link rel="icon"
	href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png"
	type="image/x-icon">
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- CSS here -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/slicknav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/gijgo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/slick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/nice-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />

	<div id="wrap">
		<div id="div-container">
			<div id="info-container" class="container">
				<div id="info-left-container" class="col-md-6">
					<div id="thumb-img-container"></div>
				</div>
				<div id="info-right-container" class="col-md-6">
					<div class="data">
						<span name="goodsName">${goods.goodsName}</span>
					</div>
					<div class="data">
						<span name="goodsCategoryName">${goods.goodsCategoryName}</span>
					</div>
					<div class="data">
						<span id="goodsPrice"><span name="goodsPrice">${goods.goodsPrice}</span>원</span>
					</div>
					<div class="data">
						<span id=numberSupporter"><span name="numberSupporter">${goods.numberSupporter}</span>명이 기부했습니다.</span>
					</div>
					<div id="btn-area">
						<input type="button" onclick="location.href='${pageContext.servletContext.contextPath}/goods/${goods.goodsNo}/support';" id="btn-support" value="기부하기" /> <input
							type="button" id="btn-share" value="  "/>
					</div>
				</div>
			</div>
			<div id="content-container">
				<div id="content">
					<p>${goods.content}</p>
				</div>
				<div style="clear:both; display:none;"></div>
			</div>
			<c:if test="${loginUser.userRole=='D' }">
				<div class="btnArea">
					<input type="button" onclick="location.href='${pageContext.servletContext.contextPath}/goods/${goods.goodsNo}/updateForm';" id="btn-update" value="수정">
					<input type="button" id="btn-delete" value="삭제">
				</div>
			</c:if>
		</div>
	</div>
	<script>
		$("#btn-delete").click(function(){
			if(confirm("정말로 삭제하시겠습니까?")){
				location.href='${pageContext.servletContext.contextPath}/goods/${goods.goodsNo}/delete';
			}
		});
	</script>
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