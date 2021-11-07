<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>도넷닷컴</title>
<style>
.container{
	width:1050px;
	margin:0 auto;
}
/*슬라이더*/

.slider-1 {
	width: 1050px;
	height: 400px;
	position: relative;
	margin:5% auto;
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
</style>
<!-- favicon -->
<link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png" type="image/x-icon">
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<!-- CSS here -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/nice-select.css">

</head>
<body>
	<jsp:include page="common/menubar.jsp"/>
	<div class="wrap">
		<div class="container">
		<c:choose>
	<c:when test="${fn:length(eventImageList) != 0}">
			<div class="slider-1">
				<div class="slides">
				<c:forEach items="${eventImageList}" var="ImgList" varStatus="status" begin="0">
						<c:choose>
							<c:when test="${status.begin==0}">
								<div class="active"
									style="background-image:url(${ pageContext.servletContext.contextPath}/resources/upload_files/event/${ImgList.imgChangeName }?auto=compress,format);"></div>
							</c:when>
							<c:otherwise>
								<div style="background-image:url(${ pageContext.servletContext.contextPath}/resources/upload_files/event/${ImgList.imgChangeName }?auto=compress,format);"></div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<div class="page-btns">
					<c:forEach items="${eventImageList}" var="ImgList" varStatus="status" begin="0">
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
		</c:otherwise>
		</c:choose>
		</div>
	</div>
	
<jsp:include page="common/footer.jsp"/>
<script>
$('.slider-1 > .page-btns > div').click(function() {
	var $this = $(this);
	var index = $this.index();

	$this.addClass('active');
	$this.siblings('.active').removeClass('active');

	var $slider = $this.parent().parent();

	var $current = $slider.find(' > .slides > div.active');

	var $post = $slider.find(' > .slides > div').eq(index);

	$current.removeClass('active');
	$post.addClass('active');
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
}, 3000);

</script>
</body>
</html>