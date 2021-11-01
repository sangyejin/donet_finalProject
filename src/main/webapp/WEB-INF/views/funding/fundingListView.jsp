<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/gijgo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/slick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/nice-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">

<title>도넷닷컴</title>
<style>
* {
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 1.4em;
}

.card {
	margin-right: 0px !important;
	padding-left: 30px !important;
}

.cases-caption {
	text-align: center;
	width: 278px !important;
}

.div-top {
	margin: auto;
	width: 1050px;
	margin-bottom: 50px;
}

.div-category-menu {
	display: inline-block;
	background-color: rgba(248, 248, 248);
	padding: 1em 10em;
	text-align: center;
	box-shadow: 4px 4px 4px 4px rgba(199, 199, 199);
	margin-bottom: 50px;
	width: 1050px;
}

.btn-insert {
	background-color: rgba(224, 224, 224);
	height: 42px;
	padding: 0 20px 0 20px !important;
}

.main {
	text-align: center;
}

.div-content {
	display: inline-block;
	width: 1050px;
}

p {
	margin: 0;
}

.progress {
	width: 278px;
}

/* IE 10, 11의 네이티브 화살표 숨기기 */
select::-ms-expand {
	display: none;
}

.div-filter {
	text-align: right;
}

.search-bar {
	text-align: right;
	display: inline-block;
	margin-right: 20px;
	margin-top: 10px;
}

.container, .row {
	width: 1050px;
}

.d-day {
	font-size: 1.2em;
}

.category-hostName {
	font-size: 0.8em;
}

.pagination {
	display: inline-block !important;
}

#filter1, #filter2 {
	display: inline-block;
}

.nice-select {
	float: none;
	display: inline-block;
}

.category-hostName {
	display: block;
}

.case-caption {
	margin: 0 auto;
	padding-top: 10px;
}

#title {
	display: block;
	font-size: 18px;
}

.div-title {
	height: 50px;
}

#btn-insert {
	width: 200px;
	height: 40px;
	border-radius: 5px;
	color: white;
	font-weight: 600;
	color: rgb(60, 179, 113);
	background-color: white;
	transition: all 0.5s;
	border: 1px solid rgb(60, 179, 113);
}

#btn-insert:hover {
	width: 200px;
	height: 40px;
	border-radius: 5px;
	border: 1px solid rgb(60, 179, 113);
	color: white;
	font-weight: 600;
	color: white;
	background-color: rgb(60, 179, 113);
}

#search {
	border: 1px solid #e8e8e8;
	height: 40px;
	width: 200px;
	padding-left: 20px;
	transition: all 0.5s;
}

#search:hover, #search:focus {
	border: 1px solid #e8e8e8;
	height: 40px;
	width: 400px;
	padding-left: 20px;
}

.img-text {
	position: absolute;
	background-color: rgba(60, 179, 113, 0.6);
	border-radius: 50%;
	width: 100px;
	height: 100px;
	position: absolute;
	top: 50px;
	left: 130px;
	padding-top: 35px;
}

.img-text>p {
	text-align: center;
	vertical-align: middle;
	color: white;
	font-weight: 700;
}

.cases-img {
	position: static;
}
</style>
</head>

<body>

	<jsp:include page="../common/menubar.jsp" />

	<div class="main">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">후원</a></li>
				<li class="breadcrumb-item active" aria-current="page">펀딩 프로젝트</li>
			</ol>
		</nav>
		<div class="div-top">
			<div>
				<div class="div-category-menu">
					<c:forEach var="category" items="${category}">
						<button type="button" class="btn btn-light"
							id="btn-${category.categoryNo}">${category.categoryName}</button>
					</c:forEach>
				</div>
			</div>
			<div class="div-filter">
				<input id="search" name="search" type="text" class="rounded-pill"
					placeholder="검색" aria-describedby="button-addon2"> <select
					name="filter1" id="filter2">
					<option value="1">전체</option>
					<option value="2">진행중</option>
					<option value="3">종료</option>
				</select> <select name="filter2" id="filter1">
					<option value="1">최신순</option>
					<option value="2">인기순</option>
					<option value="3">마감임박</option>
				</select>
				<c:if
					test="${loginUser.userRole eq 'B'||loginUser.userRole eq 'C'||loginUser.userRole eq 'D'}">
					<button id="btn-insert"
						onclick="location.href='${pageContext.servletContext.contextPath}/funding/insertForm';">등록하기</button>
				</c:if>

			</div>

		</div>


		<div class="div-content">
			<div class="container row" style="margin: 100 auto; width: 1080px;">

				<c:forEach var="list" items="${list}" varStatus="status">
					<fmt:parseDate value="${list.startDate}" var="startDate"
						pattern="yyyy-MM-dd" />
					<fmt:parseNumber value="${startDate.time / (1000*60*60*24)}"
						integerOnly="true" var="strDate" />
					<fmt:parseDate value="${list.closeDate }" var="closeDate"
						pattern="yyyy-MM-dd" />
					<fmt:parseNumber value="${closeDate.time / (1000*60*60*24)}"
						integerOnly="true" var="endDate" />
					<div class="card col-lg-4 col-md-6 col-sm-6">
						<div class="single-cases mb-40">
							<div class="cases-img">
								<img src="${pageContext.request.contextPath}/resources/upload_files/funding/${list.thumbnailChangeName}" alt="${list.fpName}"
											width="278px" height="200px">
									<c:if test="${list.raised/list.goal*100 >=100}">
										<div class="img-text">
											<p>COMPLETE</p>
										</div>
									</c:if>


							</div>
							<div class="cases-caption">
								<div class="cases-info">
									<div class="div-title">
										<a href="${pageContext.servletContext.contextPath}/funding/${list.fpNo}" id="title">${list.fpName}</a>
									</div>
									<p class="category-hostName">
										<span>${list.categoryName}</span> | <span>${list.hostName}</span>
									</p>
									<p class="dDay">
										<span>${endDate-strDate }</span>
									</p>
								</div>
								<!-- Progress Bar -->
								<div class="progress">
									<div class="progress-bar progress-bar-success"
										role="progressbar"
										aria-valuenow="${list.raised/list.goal*100}" aria-valuemin="0"
										aria-valuemax="100"
										style="width: ${list.raised/list.goal*100}%">${list.raised/list.goal*100}%
									</div>
								</div>
								<div class="prices d-flex justify-content-between">
									<p>
										현재:<span> ${list.raised}</span>
									</p>
									<p>
										목표:<span> ${list.goal}</span>원
									</p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<!-- pagination -->
		<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">
				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="disabled page-item"><a
							href="funding?currentPage=${pi.currentPage-1 }" class="page-link"
							aria-label="Previous"> <i class="ti-angle-left"></i>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a
							href="funding?currentPage=${pi.currentPage-1 }" class="page-link"
							aria-label="Previous"> <i class="ti-angle-left"></i>
						</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
					<c:choose>
						<c:when test="${ pi.currentPage eq i }">
							<li class="disabled page-item active"><a
								href="funding?currentPage=${i}" class="page-link">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a href="funding?currentPage=${i}"
								class="page-link">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<li class="disabled page-item"><a
							href="funding?currentPage=${pi.currentPage+1 }" class="page-link"
							aria-label="Next"> <i class="ti-angle-right"></i>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a
							href="funding?currentPage=${pi.currentPage+1 }" class="page-link"
							aria-label="Next"> <i class="ti-angle-right"></i></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

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