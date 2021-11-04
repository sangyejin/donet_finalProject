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
<style>
* {
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 12px;
}

.main-container {
	margin: 0 auto;
	width: 1050px;
	background-color: antiquewhite;
	margin-bottom: 100px;
}

#top-div {
	height: 200px;
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
		url("${pageContext.request.contextPath}/resources/upload_files/goods/${goods.thumbnailChangeName}")
		no-repeat 50% 50%/cover;
}

/*선물*/
.fundingGoods-card {
	border: 1px solid black;
	padding: 10px;
	margin: 10px;
}

.presentPrice {
	font-size: 1.4em;
	font-weight: 700;
	margin: 0;
}

.presentName {
	font-size: 1.4em;
	margin: 0;
}

.presentContent {
	font-size: 1.4em;
	color: gray;
	margin: 0;
}
#balance{
	display:inline-block;
	margin-right:10px;
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
			<form id="insertForm" action="support/insert" method="post">

				<div id="top-div">
					<div class="col-md-4">
						<div id="thumb-img-container"></div>
					</div>
					<div class="col-md-offset-1 col-md-7">
						<p>${goods.goodsCategoryName}</p>
						<p>${goods.goodsName}</p>
						<p>${goods.goodsPrice}</p>
						<p>
							<input type="number" name="purchaseAmount" value="1" onchange="settingAmount(this.value);"><span>개</span>
						</p>
						<p>
							<span>후원처:</span>
							<select name="beneficiaryNo" id="beneficiary">
								<c:forEach var="beneficiary" items="${beneficiaryList}">
									<option value="${beneficiary.beNo}">${beneficiary.beName}</option>
								</c:forEach>
							</select>
						</p>
					</div>
				</div>
				<hr>
				<div>
					<p>
						총 <span id="totalSupport">${goods.goodsPrice}</span>원
						<input type="hidden" name="purchasePrice" id="hiddenTotalPrice" value="${goods.goodsPrice}">
					</p>
				</div>
				<div class="content-container">
					<label for="support-info-container">후원</label>
					<div class="addSupport-container">
						<p id="balance">
							잔여 포인트 : <span>${loginUser.point}</span>
						</p>
						<p id="message"></p>
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
				console.log(Number("${loginUser.point}"),Number($("#totalAmount").text()),Number("${loginUser.point}")<Number($("#totalAmount").text()));
				if(Number("${loginUser.point}")<Number($("#totalAmount").text())){
					$("#message").text("잔여 포인트가 부족합니다.");
					return false;
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
</body>
</html>