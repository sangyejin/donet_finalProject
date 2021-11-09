<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- font -->
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
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

<style>
* {
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 12px;
}

.main-container {
	margin: 0 auto;
	width: 1050px;
	margin-bottom: 100px;
}

#top-div {
	display:flex;
}
.div-left{
	flex:left;
}
.div-right{
	flex:right;
}
.main-container hr {
	padding-bottom: 20px;
}
/*섬네일*/
#thumb-img-container {
	width: 100%;
	height: 100%;
	/* background-color: rgb(196, 171, 163); */
	display: inline-block;
	background:
		url("${pageContext.request.contextPath}/resources/upload_files/goods/${goods.thumbnailChangeName}")
		no-repeat 50% 50%/cover;
}


#balance{
	display:inline-block;
	margin-right:10px;
	margin-bottom:0;
}
#message{
	display:inline-block;
	color:red;
}
/* input number의 증가감소 버튼 안보이게 */
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

.inputText {
	border: 1px solid #e8e8e8;
	height: 42px;
	width: 130px;
	text-align:center;
	margin-right:20px;
}
.nice-select {
	float: none;
	display: inline-block;
}
#beneficiary+.nice-select {
	float: none;
	display: inline-block;
	width:30%;
}
#beneficiary+.nice-select>.list{
	float: none;
	display: inline-block;
	width:100%;
}

#btnArea{
	margin-top:50px;
	text-align:center;
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
#btn-back {
	width: 200px;
	height: 40px;
	border-radius: 5px;
	color: rgb(60, 179, 113);
	font-weight: 600;
	background-color:  white;
	transition: all 0.5s;
	border: 1px solid rgb(60, 179, 113);
}

#btn-back:hover {
	border: 1px solid rgb(60, 179, 113);
	color:white;
	font-weight: 600;
	background-color:  rgb(60, 179, 113);
}

.total{
	margin-top:40px;
	text-align:center;
	font-size:40px;
}
.total span{
	font-size:40px;
}

#support-div{
	padding: 10px 10px 10px 20px;
	border:1px solid #e8e8e8;
	margin-top:10px;
}
.content-container{
	margin-top:80px;
}
</style>
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />

	<div class="wrap">
		<div class="main-container">
			<form id="insertForm" action="support/insert" method="post" autocomplete="off">
				<div id="top-div">
					<div class="col-md-4 div-left">
						<div id="thumb-img-container"></div>
					</div>
					<div class="col-md-offset-1 col-md-7 div-right">
						<p>${goods.goodsCategoryName}</p>
						<p>${goods.goodsName}</p>
						<p>${goods.goodsPrice}원</p>
						<p>
							<span style="margin-right:30px;">수량</span>
							<input type="number" name="purchaseAmount"  class="rounded-pill inputText"  value="1" onchange="settingAmount(this.value);"><span>개</span>
						</p>
						<p>
							<span style="margin-right:20px;">후원처 </span>
							<select name="beneficiaryNo" id="beneficiary">
								<c:forEach var="beneficiary" items="${beneficiaryList}">
									<option value="${beneficiary.beNo}">${beneficiary.beName}</option>
								</c:forEach>
							</select>
						</p>
					</div>
					
				</div>
				<div class="content-container">
				<label for="addSupport-container">잔여 포인트</label>
				<div id="support-div">
					<div class="addSupport-container">
						<p id="balance">
							<span>${loginUser.point}</span> point
						</p>
						<p id="message"></p>
					</div>
					</div>
				</div>
				<hr>
				<div>
					<div  class="total">
						총 <span id="totalSupport">${goods.goodsPrice}</span>원
						<input type="hidden" name="purchasePrice" id="hiddenTotalPrice" value="${goods.goodsPrice}">
					</div>
				</div>
				
				
				<div id="btnArea">
					<button id="btn-support" type="button">후원하기</button>
					<button id="btn-back" type="button">목록으로 돌아가기</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<script>
		$(function() {
			$("#btn-support").click(function(){
				if( Number("${loginUser.point}") < Number($("#hiddenTotalPrice").val()) ){
					$("#message").text("잔여 포인트가 부족합니다.");
					return;
				}else{
					$("#insertForm").submit();
				}
				
			});
			function support() {

			};

			$("#btn-back").click(
				function() {
					location.href = "${pageContext.servletContext.contextPath}/goods/${goodsNo}";
			});
		});


		function settingAmount(val){
			$("#totalSupport").text(Number("${goods.goodsPrice}")*val);
			$("#hiddenTotalPrice").val(Number("${goods.goodsPrice}")*val);
		}
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