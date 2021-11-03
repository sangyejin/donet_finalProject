<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도넷닷컴</title>


<!-- 결제 구현 위해서 끌고 옴 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>


<style>
#myPerks:hover {
	text-decoration: underline;
}

#divideLine {
	border: 0.5px solid gray;
	width: 650px;
	margin-top: 10px;
	margin-bottom: 10px;
}

#paymentBox, #moneyBox {
	float: left;
}

/*div aligns*/
#paymentBox, #pointPayment, #divideLine {
	margin-left: 210px;
}

/*box decorations*/
#moneyBox {
	border: 1px solid rgba(232, 240, 214, 0.5);
	background: rgba(232, 240, 214, 0.5);
	border-radius: 7px;
	padding: 10px;
	margin-left: 600px;
	margin-top: -425px;
	width: 250px;
	position: absolute;
}

#kakaoMoneyBox, #tossMoneyBox {
	border: 1px solid rgba(232, 240, 214, 0.5);
	background: rgba(232, 240, 214, 0.5);
	border-radius: 7px;
	padding: 10px;
	position: absolute;
	width: 250px;
}

#kakaoMoneyBox {
	margin-left: 660px;
	margin-top: -90px;
	display: none;
}

#tossMoneyBox {
	margin-left: 660px;
	margin-top: -120.5px;
	display: none;
}

/*#kakaoMoneyBox, #tossMoneyBox{display : none}*/
#cardBox {
	border: 1px solid rgba(232, 240, 214, 0.5);
	background: rgba(232, 240, 214, 0.5);
	border-radius: 7px;
	padding: 10px;
	width: 250px;
	margin-left: 50px;
	display: none;
}

/*inside of cardBox*/
#cardNumber {
	width: 225px;
	margin-bottom: 20px;
}

#expireM {
	width: 92px;
	margin-right: 15px;
	margin-bottom: 20px;
}

#expireY {
	width: 92px;
	margin-left: 15px;
}

#cvcNum {
	width: 92px;
	margin-right: 15px;
	margin-bottom: 20px;
}

#cardBankName {
	margin-left: 20px;
}

#expireYLabel {
	margin-left: 95px;
}

#cardNameLabel {
	margin-left: 85px;
}

#surname {
	width: 92px;
	margin-right: 35px;
}

#fstname {
	width: 95px;
	margin-bottom: 20px;
}

#fstnameLabel {
	margin-left: 118px;
}

/*font size and style*/
#pointPayment, #paymentTotal {
	font-size: 16px;
	font-weight: bolder;
}

#paymentTotal {
	margin-bottom: 20px;
}

#paymentBox>* {
	font-size: 14px;
	margin-bottom: 10px;
}

#accountlessLabel, #creditCardLabel {
	margin-left: 52px;
}

#paymentBox>label {
	margin-right: 10px;
}

/*those imgs*/
#kkoImg, #tssImg {
	width: 40px;
	height: 15px;
	margin-right: 10px;
}

#amount, #kakaoAmount, #tossAmount {
	width: 200px;
	margin-right: 10px;
}

/*button*/
.goRound {
	height: 25px;
	width: 55px;
	border-radius: 7px;
	border-style: none;
	background-color: rgb(66, 178, 115);
	color: #ffffff;
	margin-left: 173px;
	margin-top: 20px;
}

.goRound:hover {
	background-color: rgb(232, 240, 214);
	color: #000000;
}
</style>

</head>
<body>

	<jsp:include page="../../common/menubar.jsp" />

	<span><label id="pointPayment">포인트 충전</label> </span>
	<div id="divideLine"></div>

	<div id="paymentBox">
		<label for="kakao"> <img id="kkoImg"
			src="${ pageContext.servletContext.contextPath }/resources/imgs/point/kko.png">
			카카오페이 결제
		</label> <input type="radio" name="payment" id="kakao" required>
		
		<div id="kakaoMoneyBox">
			<label id="paymentTotal" for="amount">결제금액</label> <br> <input
				type="number" name="kakaoAmount" id="kakaoAmount" required> 원
			<button type="submit" class="goRound" id="kakaoPayButton">결제</button>
		</div>
		
		<br> 
		
		<label for="toss"> <img id="tssImg"
			src="${ pageContext.servletContext.contextPath }/resources/imgs/point/tss.png">
			토스 결제
		</label> <input type="radio" name="payment" id="toss" required>
		<div id="tossMoneyBox">
			<label id="paymentTotal" for="amount">결제금액</label> <br> <input
				type="number" name="tossAmount" id="tossAmount" required> 원
			<button type="submit" class="goRound" id="tossPayButton">결제</button>
		</div>
		<br>

		<!-- 카드결제 -->
		<label id="creditCardLabel" for="payment"> 신용카드/직불카드 </label> <input
			type="radio" name="payment" id="creditCard" required> <br>

		<div id="cardBox">
			<form id="insertCard" method="post" action="insertCard.me">
				<label id="cardNumberLabel" for="cardNumber">신용카드/직불카드 번호</label> <br>
				<input type="text" name="cardNumber" id="cardNumber" required>
				<br> <label id="expireMLabel" for="expireM">만료 월</label> <label
					id="expireYLabel" for="expireY">만료 년</label> <br> <input
					type="text" name="expireM" id="expireM" maxlength="2" required>
				/ <input type="text" name="expireY" id="expireY" maxlength="2"
					required> <br> <label id="cvcNumLabel" for="cvcNum">CVC번호</label>
				<!-- 보안코드 -->
				<label id="cardNameLabel" for="bankName">은행명</label> <br> <input
					type="text" name="cvcNum" id="cvcNum" required> <select
					name="cardBankName" id="cardBankName">
					<c:if test="${!empty bkList}">
						<c:forEach items="${ bkList }" var="bk" varStatus="status">
							<option value="${bk.bankNo }">${bk.bankName }</option>
						</c:forEach>
					</c:if>
				</select> <br> <label id="surnameLabel" for="surname">성</label> <label
					id="fstnameLabel" for="fstname">이름</label> <br> <input
					type="text" name="surname" id="surname" required> <input
					type="text" name="fstname" id="fstname" required>

				<div id="moneyBox">
					<label id="paymentTotal" for="amount">결제금액</label> <br> <input
						type="number" name="amount" id="amount" required> 원
					<button type="submit" class="goRound">결제</button>
				</div>

				<br>

			</form>

		</div>

	</div>



	<jsp:include page="../../common/footer.jsp" />

	<!-- 카드 결제창 숨김 보임 -->
	<script>
		$(document).ready(function(){
			$("#creditCard").click(function(){
				$('#cardBox').show();
				$('#kakaoMoneyBox').hide();
				$('#tossMoneyBox').hide();	
			})
			
			$("#kakao").click(function(){
				$('#kakaoMoneyBox').show();
				$('#cardBox').hide();
				$('#tossMoneyBox').hide();
			})
			
			$("#toss").click(function(){
				$('#tossMoneyBox').show();
				$('#kakaoMoneyBox').hide();
				$('#cardBox').hide();
			})
		})
	</script>

	<!-- 카카오페이 -->
	<script>
		$(function(){
			$("#kakaoPayButton").click(function(){
			var IMP = window.IMP; // 생략가능
			var amount = $('#kakaoAmount').val();
			
			   IMP.init('imp55607723');  // 가맹점 식별 코드

			   IMP.request_pay({
			      pg : 'kakao', // 결제방식
			       pay_method : 'card',	// 결제 수단
			       merchant_uid : 'merchant_' + new Date().getTime(),
			     	 name : '도넷닷컴 : 포인트 충전',	// order 테이블에 들어갈 주문명 혹은 주문 번호
			       amount : amount,	// 결제 금액
			       buyer_email :  '개인정보보호',	// 구매자 email
			      	buyer_name :  '개인정보보호',	// 구매자 이름
			       buyer_tel :   '개인정보보호',	// 구매자 전화번호
			       buyer_addr :   '개인정보보호',	// 구매자 주소
			       buyer_postcode : '개인정보보호',	// 구매자 우편번호
			     	m_redirect_url : 'updatePoint.me'	// 결제 완료 후 보낼 컨트롤러의 메소드명
			       
			       
			   }, function(rsp) {
				if ( rsp.success ) { // 성공시
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					
					location.href="updatePoint.me?amount=" + amount;
					
				} else { // 실패시
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
			});
			   
			})
			
		})

	</script>
	
	<!-- 토스  -->
	<script>
		$(function(){
			$("#tossPayButton").click(function(){
				
			var IMP = window.IMP; // 생략가능
			var amount = $('#tossAmount').val();
			
			   IMP.init('imp61728876');  // 가맹점 식별 코드

			   IMP.request_pay({
			      pg : 'toss', // 결제방식
			       pay_method : 'card',	// 결제 수단
			       merchant_uid : 'merchant_' + new Date().getTime(),
			     	 name : '도넷닷컴 : 포인트 충전',	// order 테이블에 들어갈 주문명 혹은 주문 번호
			       amount : amount,	// 결제 금액
			       buyer_email :  '개인정보보호',	// 구매자 email
			      	buyer_name :  '개인정보보호',	// 구매자 이름
			       buyer_tel :   '개인정보보호',	// 구매자 전화번호
			       buyer_addr :   '개인정보보호',	// 구매자 주소
			       buyer_postcode : '개인정보보호',	// 구매자 우편번호
			       
			   }, function(rsp) {
				if ( rsp.success ) { // 성공시
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;					
				} else { // 실패시
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				

			});
			   setTimeout(function(){
				   location.href="updatePoint.me?amount=" + amount;
			   }, 20000)
			   
			})
			
		})

	</script>

</body>
</html>