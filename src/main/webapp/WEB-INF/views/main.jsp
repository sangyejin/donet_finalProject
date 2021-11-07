<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>도넷닷컴</title>
<style>
.contain {
	width: 1050px;
	margin: 0 auto;
}
/*슬라이더*/
.slider-1 {
	width: 1050px;
	height: 300px;
	position: relative;
	margin: 5% auto;
}

/* 슬라이더 1 - 페이지 버튼 */
.slider-1>.page-btns {
	text-align: center;
	position: absolute;
	bottom: 20px;
	left: 0;
	width: 100%;
}

.slider-1>.page-btns>div {
	width: 20px;
	height: 20px;
	background-color: rgba(255, 255, 255, .5);
	border-radius: 4px;
	display: inline-block;
	cursor: pointer;
}

.slider-1>.page-btns>div.active {
	background-color: rgba(255, 255, 255, 1);
}

/* 슬라이더 1 - 슬라이드 */
.slider-1>.slides>div {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	opacity: 0;
	transition: opacity 0.3s;
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
}

.slider-1>.slides>div.active {
	opacity: 1;
}

/* 슬라이더 좌우 버튼 */
.slider-1>.side-btns>div {
	position: absolute;
	top: 0;
	left: 0;
	width: 25%;
	height: 100%;
	cursor: pointer;
}

.slider-1>.side-btns>div:last-child {
	left: auto;
	right: 0;
}

.slider-1>.side-btns>div>span {
	position: absolute;
	top: 50%;
	left: 20px;
	transform: translatey(-50%);
	background-color: white;
	opacity: 0.5;
	padding: 1px 13px;
	border-radius: 50px;
	font-size: 25px;
}

.slider-1>.side-btns>div:last-child>span {
	left: auto;
	right: 20px;
}

#supportNull {
	height: 300px;
	font-size: 30px;
	text-align: center;
	vertical-align: middle;
	padding-top: 110px;
	background-color: #f6fff5;
}

.fundingImage {
	width: 250px;
	height: 200px;
}

.title {
	disply: inline-block;
	margin-right:20px;
	font-weight:700;
	font-size:20px;
}
.contentTable{
	width:100%;
	border:1px solid #c8c8c8;
}
.contentTable td,.contentTable th{
	border:1px solid #c8c8c8;
	padding:10px;
}
.boardSection{
	padding-left: 1% !important;
	padding-right:1% !important;
	margin-left:0;
	margin-bottom:10%;
	overflow:auto; 
}
.row{
	width:1050px;
	margin-left:0 !important;
	margin-right:0 !important;
}
.content-section{
	margin-top:30px;
}
.cases-img{
	margin-top:20px;
}
.btn-add{
	width:30px;
	height:30px;
	background-color:white;
	border: 1px solid rgb(60, 179, 113);
	color:rgb(60, 179, 113);
	border-radius:25%;
}
.div-title a{
	font-size:18px;
}
.card{
	border:0 !important;
}
.top-banner{
	margin-bottom:100px;
}
.img-text {
	border-radius: 50%;
	width: 100%;
	position: absolute;
	top: 80px;
	left: 0%;
	padding-top: 60px;
}

.img-text>p {
	text-align: center;
	vertical-align: middle;
	color: white;
	font-weight: 700;
	font-size:40px;
}
.imgDiv{
	position:relative;
}
.disabled{
	pointer-events : none;
}
</style>
<!-- favicon -->
<link rel="icon"
	href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png"
	type="image/x-icon">
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- CSS here -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/slicknav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/gijgo.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/animate.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/animated-headline.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>도넷닷컴</title>
</head>
<body>
	<jsp:include page="common/menubar.jsp" />
	<div class="wrap">
		<div class="contain">
			<div class="top-banner">
			<c:choose>
				<c:when test="${fn:length(supportList) != 0}">
					<div class="slider-1">
						<div class="slides">
							<c:forEach items="${supportList}" var="list" varStatus="status"
								begin="0">
								<c:choose>
									<c:when test="${status.begin==0}">
										<div class="active imgDiv" 
											style="background-image:url(${pageContext.servletContext.contextPath}/resources/upload_files/donation/${list.thumbnailChange}?auto=compress,format);"
											onclick="location.href='${pageContext.servletContext.contextPath}/detail.do?suNo=${list.suNo }';">
											<div class="img-text"><p>${list.suTitle}</p></div>
											</div>
									</c:when>
									<c:otherwise>
										<div class="imgDiv hiddenDiv" 
										onclick="location.href='${pageContext.servletContext.contextPath}/detail.do?suNo=${list.suNo }';"
										style="background-image:url(${pageContext.servletContext.contextPath}/resources/upload_files/donation/${list.thumbnailChange}?auto=compress,format);">
											<div class="img-text"><p>${list.suTitle}</p></div>
										</div>

									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						<div class="page-btns">
							<c:forEach items="${supportList}" var="list" varStatus="status"
								begin="0">
								<c:choose>
									<c:when test="${status.begin==0}">
										<div class="active"></div>
									</c:when>
									<c:otherwise>
										<div></div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						<div class="side-btns">
							<div>
								<span class="fas"><</span>
							</div>
							<div>
								<span class="fas">></span>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div id="supportNull">후원프로젝트가 준비중입니다.</div>
				</c:otherwise>
			</c:choose>
			</div>
			<div>
				<section class="row">
					
					
					<div id="noticeBoard" class="boardSection col-md-6">
						<span class="title">공지사항</span>
						<button type="button" class="btn-add"
							 onclick="location.href='${pageContext.request.contextPath}/list.no';">
							></button>
						<div class="notice-section content-section">
							<table id="noticeTable" class="contentTable">
								<colgroup>
									<col style="width: 60%">
									<col style="width: 40%">
								</colgroup>
								<thead>
									<th>제목</th>
									<th>날짜</th>
								</thead>
								<tbody>
									<c:forEach var="notice" items="${noticeList}">
										<tr>
											<td>${notice.noticeTitle}</td>
											<td>${notice.noticeDate}</td>
											<td style="display:none;visibility:hidden;">${notice.noticeNo}</td>
										<tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					
					<div id="eventBoard" class="boardSection col-md-6">
						<span class="title">이벤트</span>
						<button class="btn-add" type="button" onclick="location.href='${pageContext.request.contextPath}/list.ev';">></button>
						<div class="event-section content-section">
								<table id="eventTable" class="contentTable">
								<colgroup>
									<col style="width: 60%">
									<col style="width: 40%">
								</colgroup>
								<thead>
									<th>제목</th>
									<th>기간</th>
								</thead>
								<tbody>
									<c:forEach var="event" items="${eventList}">
										<tr>
											<td>${event.eventTitle}</td>
											<td>${event.eventStart}~${event.eventLast}</td>
											<td style="display:none;visibility:hidden;">${event.eventNo}</td>
										<tr>
									</c:forEach>
								</tbody>
							</table>
				</section>

				<section class="row">
					<div id="fundingBoard" class="boardSection col-md-6"  class=" col-md-6" style=" padding-left: 0px; padding-right: 0px;">
						<span class="title">펀딩 프로젝트</span>
						<button type="button" class="btn-add"
							onclick="location.href='${pageContext.request.contextPath}/funding';">
							></button>
						<div class="funding-section  content-section">
							<c:forEach var="funding" items="${fundingList}">
								<div class="card col-md-6 col-sm-6">
										<div class="single-cases mb-40" style="margin-bottom: 20px;">
											<div class="cases-img">
												<img src="${pageContext.request.contextPath}/resources/upload_files/funding/${ funding.thumbnailChangeName}" alt="${ funding.thumbnailOriginName}"
													onclick="location.href='${pageContext.servletContext.contextPath}/funding/${funding.fpNo}';"
													width="220px" height="200px"></div>
											<div class="cases-caption">
												<div class="cases-info">
													<div class="div-title">
												<a href="${pageContext.servletContext.contextPath}/funding/${funding.fpNo}" class="content-title">${funding.fpName}</a>
											</div>
											<p class="dDay">
											<span>${funding.startDate}~${funding.closeDate}</span>
										</p>
										</div>
										<div class="progressBar">
										<span class="progressbar"> 
											<span class="gauge" style="width: `+goalPersent+`%">
											</span>	
										</span>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
					
					
					<div id="goodsBoard" class="boardSection col-md-6">
						<span class="title">구호물품</span>
						<button type="button" class="btn-add"
							onclick="location.href='${pageContext.request.contextPath}/goods';">
							></button>
						<div class="goods-section content-section">
							<c:forEach var="goods" items="${goodsList}">
								<div class="card col-md-6 col-sm-12">
									<div class="single-cases mb-40">
										<div class="cases-img"  >
											<img src="${pageContext.request.contextPath}/resources/upload_files/goods/${goods.thumbnailChangeName}" alt="${goods.thumbnailOriginName }"
														onclick="location.href='${pageContext.servletContext.contextPath}/goods/${goods.goodsNo}';"
														width="220px" height="200px">
										</div>
										<div class="cases-caption">
											<div class="cases-info">
												<div class="div-title">
													<a href="${pageContext.servletContext.contextPath}/goods/${goods.goodsNo}" class="goods-title">${goods.goodsName}</a>
												</div>
												<p class="goodsPrice">
													${goods.goodsPrice}원
												</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					
						</div>
				</section>
			</div>
		</div>
	</div>

	<jsp:include page="common/footer.jsp" />
	<script>
	function hidden(){
		return false;
	}
	function supportLink(suNo){
		location.href='${pageContext.servletContext.contextPath}/detail.do?suNo='+suNo;
	}
	$("#noticeTable tr").click(function(){
		var tr = $(this);
		var td = tr.children();
		location.href="${pageContext.request.contextPath}/detail.no?noticeNo="+td.eq(2).text();
	});
	$("#eventTable tr").click(function(){
		var tr = $(this);
		var td = tr.children();
		location.href="${pageContext.request.contextPath}/detail.ev?eno="+td.eq(2).text();
	});
	$('.slider-1 > .page-btns > div').click(function() {
			var $this = $(this);
			var index = $this.index();

			$this.addClass('active');
			$this.siblings('.active').removeClass('active');
			var $slider = $this.parent().parent();

			var $current = $slider.find(' > .slides > div.active');

			var $post = $slider.find(' > .slides > div').eq(index);

			$current.removeClass('active');
			$current.addClass('disabled');
			$post.addClass('active');
			$post.removeClass('disabled');
		});

		// 좌/우 버튼 추가 슬라이더
		$('.slider-1 > .side-btns > div').click(function() {
			var $this = $(this);
			var $slider = $this.closest('.slider-1');

			var index = $this.index();
			var isLeft = index == 0;

			var $current = $slider.find(' > .page-btns > div.active');
			var $post;

			if (isLeft) {
				$post = $current.prev();
			} else {
				$post = $current.next();
			}
			;

			if ($post.length == 0) {
				if (isLeft) {
					$post = $slider.find(' > .page-btns > div:last-child');
				} else {
					$post = $slider.find(' > .page-btns > div:first-child');
				}
			}
			;

			$post.click();
		});

		setInterval(function() {
			$('.slider-1 > .side-btns > div').eq(1).click();
		}, 5000);
	</script>
	<!-- JS here -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/animated.headline.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- Date Picker -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/gijgo.min.js"></script>
	<!-- Nice-select, sticky -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.sticky.js"></script>
	<!-- Progress -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.barfiller.js"></script>

	<!-- counter , waypoint,Hover Direction -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.counterup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/hover-direction-snake.min.js"></script>

	<!-- contact js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/contact.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.form.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/mail-script.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>