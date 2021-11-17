<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
<style>


.main-container {
	margin: 0 auto;
	width: 1050px;
	margin-bottom: 100px;
}
.addSupport-container p{
	display:inline-block;
	margin-right:10px;
	
}
#message{
	color:red;
}
#top-div {
	clear:both;
	padding:40px;
	overflow: auto;
	display: flex; 
}
.div-right{
	flex:1;
	display: table;
	
}
.inner-container{
  display: table-cell;
    vertical-align: middle;
}
.categoryName{
	font-size:20px;
	margin-bottom:0;
}
.fpName{
	margin-top:14px;
	word-break:break-all;
	word-wrap:break-word;
	font-size:34px;
}
.dDay{
	font-size:24px;
}
.content-container{
	padding:30px;
}
.presentPrice {
	font-size: 20px;
	font-weight: 700;
	margin: 0;
}
.presentName {
	font-size: 24px;
	margin: 0;
}
.presentContent {
	font-size: 1.4em;
	color: gray;
	margin: 0;
}
.inputText {
	border: 1px solid #e8e8e8;
	height: 42px;
	width: 400px;
	padding-left: 20px;
	margin-bottom:10px;
	margin-top:10px;
}

.main-container hr {
	padding-bottom: 20px;
}
/*섬네일*/
#thumb-img-container {
	width: 100%;
	height: 200px;
	/* background-color: rgb(196, 171, 163); */
	display: inline-block;
	background:
		url("${pageContext.request.contextPath}/resources/upload_files/funding/${funding.thumbnailChangeName}")
		no-repeat 50% 50%/cover;
}

/*선물*/
.fundingGoods-card {
	border: 1px solid #c8c8c8;
	padding: 20px;
	margin: 0px;
}

/* input number의 증가감소 버튼 안보이게 */
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

/* 총 후원 */
.total{
	text-align:center;
	font-size:40px;
}
.total span{
	font-size:40px;
}
.addSupport-container p, .addSupport-container p span {
	font-size:16px;
	margin-top:10px;
}
/* 버튼 */
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

#support-div{
	padding: 10px 10px 10px 20px;
	border:1px solid #e8e8e8;
	margin-top:10px;
}
</style>
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />

	<!-- 오늘 날짜 -->
	<jsp:useBean id="today" class="java.util.Date" />
	<fmt:formatDate var="nowDate" value="${today}" pattern="yyyyMMdd" />

	<!-- 펀딩 끝 날짜 -->
	<fmt:parseDate value="${funding.closeDate }" var="closeD"
		pattern="yyyy-MM-dd" />
	<fmt:formatDate var="closeDate" value="${closeD}" pattern="yyyyMMdd" />


	<div class="wrap">
		<div class="main-container">
			<div id="top-div">
				<div class="col-md-4">
					<div id="thumb-img-container"></div>
				</div>
				<div class="col-md-offset-1 col-md-7 div-right">
					<div class="inner-container">
					<p class="categoryName">${funding.categoryName}</p>
					<p class="fpName">${funding.fpName}</p>
					<p class="dDay">마감까지 ${closeDate-nowDate}일</p>
					</div>
				</div>
			</div>
			<hr>
			<form id="insertForm" action="support/insert" method="post" autocomplete="off">
				<div class="content-container">
					<label for="fundingGoods-container">선물 선택</label> <input
						type="hidden" name="tempPrice" id="tempPrice" value="0" /> <input
						type="hidden" name="fgNo" id="tempFgNo" value="0" />

					<div id="fundingGoods-container">
						<c:forEach var="fg" items="${fundingGoodsList}">
							<div class="fundingGoods-card"
								onclick="selectDiv(${fg.fgPrice},${fg.fgNo});">
								<p class="presentPrice">${fg.fgPrice}Point</p>
								<p class="presentName">${fg.fgName}</p>
								<p class="presentContent">${fg.fgContent}</p>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="content-container">
					<label for="addSupport-container">추가 후원하기</label>
					<div class="addSupport-container">
						<input name="addPrice" id="addPrice" type="number"
							placeHolder="0,000,000" class="rounded-pill inputText" onchange="changeInput();"><span style="font-size: 16px;">원</span>
					</div>
				</div>
				<div class="content-container">
					<label for="addSupport-container">받는이 정보</label>
					<div class="addSupport-container">
						<div class="inputArea">
							<label for="takeName"></label><input name="takeName" type="text" id="takeName"
								 class="rounded-pill inputText" placeHolder="이름을 입력해주세요." required>
						</div>
						<div class="inputArea">
							<label for="takePostCode"></label><input name="takePostCode" id="takePostCode"
								type="text" class="rounded-pill inputText"  placeHolder="우편번호를 입력해주세요" required>
						</div>
						<div class="inputArea">
							<label for="takeAddress"></label><input name="takeAddress" id="takeAddress"
								type="text" class="rounded-pill inputText"  placeHolder="주소를 입력해주세요." required>
						</div>
						<div class="inputArea">
							<label for="takePhone"></label><input name="takePhone" id="takePhone" 
								type="text"  class="rounded-pill inputText" placeHolder="전화번호를 입력해주세요." required>
						</div>
					</div>
				</div>
				<div class="content-container">
				<label for="addSupport-container">잔여 포인트</label>
					
					<div id="support-div">
					<div class="addSupport-container">
						<p>
							<span>${loginUser.point}</span> point
						</p>
						<p id="message"></p>
					</div>
					</div>
				</div>
				<hr>
				<div>
					<div class="total">
						총 <span id="totalSupport">0</span>원 후원하기
					</div>
					<input type="hidden" name="fpPrice" id="hiddenPrice">
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
	function changeInput(){
		var temp=document.getElementById("tempPrice").value;
		var addPrice=document.getElementById("addPrice").value;
		$("#totalSupport").text(Number(temp)+Number(addPrice));
		$("#hiddenPrice").val(Number(temp)+Number(addPrice));
	};
		$(function(){
			$("#btn-support").click(function(){
				console.log($("#totalSupport").text());
				console.log(Number("${loginUser.point}"),Number($("#totalSupport").text()),Number("${loginUser.point}")<Number($("#totalSupport").text()));
				if(document.getElementById("tempFgNo").value=="0"){
					alert("선물이 선택되지않았습니다.");
					return;
				}
				else if(Number("${loginUser.point}")<Number($("#totalSupport").text())){
					$("#message").text('잔여 포인트가 부족합니다.');
					return;
				}
				else{
					if($("#takeName").val()=="" || $("takePostCode").val()=="" ||  $("takePhone").val()=="" ||  $("takeAddress").val()=="" ){
						alert("칸이 비어있습니다.");	
						return;
					}
				$("#insertForm").submit();
				}
			});

			
			$("#btn-back").click(function(){
				location.href="${pageContext.servletContext.contextPath}/funding/${fpNo}";
			});
		});
		
		function selectDiv(price,fgNo){
			var tempPrice= document.getElementById("tempPrice").value = price;
			var tempFgNo=  document.getElementById("tempFgNo").value = fgNo;
			$("#totalSupport").text(tempPrice);
			$("#hiddenPrice").val(tempPrice);
			console.log(event.target);
			$(".fundingGoods-card").css("background-color","");
			event.currentTarget.style.background="#e8e8e8";
		}
	</script>
	<!-- Jquery Mobile Menu -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/animated.headline.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.magnific-popup.js"></script>


	<!-- Nice-select, sticky -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.sticky.js"></script>



	<!-- Jquery Plugins, main Jquery -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>