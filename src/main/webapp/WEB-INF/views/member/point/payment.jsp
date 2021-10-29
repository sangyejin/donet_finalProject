<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도넷닷컴</title>
<style>
    #myPerks:hover{  text-decoration:underline;  }

    #divideLine{ border: 0.5px solid gray; width: 650px; margin-top: 10px; margin-bottom: 10px;}

    #paymentBox, #moneyBox{float: left;}
    
    /*div aligns*/
    #paymentBox, #pointPayment,  #divideLine {margin-left : 210px;}
    
    /*box decorations*/
   	#moneyBox{
   	border : 1px solid rgba(232, 240, 214, 0.5); 
   	background : rgba(232, 240, 214, 0.5); 
   	border-radius : 7px;
   	padding : 10px;
   	margin-left : 880px;
   	margin-top : -180px;
   	width : 250px;
   	}

	/*font size and style*/
	#pointPayment,#paymentTotal {font-size : 16px; font-weight : bolder;}
	#paymentTotal{margin-bottom : 20px;}
	#paymentBox>*{font-size : 14px; margin-bottom : 10px;}
	#accountlessLabel, #creditCardLabel{margin-left : 52px;}
	
	#paymentBox>label{margin-right : 10px;}
	
    /*those imgs*/
    #kkoImg,#tssImg{width: 40px; height: 15px; margin-right : 10px;}
    
    #amount{width : 200px; margin-right : 10px;}

</style>

</head>
<body>

	 <jsp:include page="../../common/menubar.jsp"/>
	
    <span><label id="pointPayment">포인트 충전</label> </span>
    <div id="divideLine"></div>

    <div id="paymentBox">
        <label for="kakao"> <img id="kkoImg" src="${ pageContext.servletContext.contextPath }/resources/imgs/point/kko.png"> 카카오페이 결제 </label>
        <input type="radio" name="payment" id="kakao" required>
        <br>
        <label for="toss"> <img id="tssImg" src="${ pageContext.servletContext.contextPath }/resources/imgs/point/tss.png"> 토스 결제 </label>
        <input type="radio" name="payment" id="toss" required>
        <br>
        <label id="accountlessLabel" for="accountless"> 무통장 입금 </label>
        <input type="radio" name="payment" id="accountless" required>
        <br>
        <label id="creditCardLabel" for="creditCard"> 신용카드/직불카드 </label>
        <input type="radio" name="payment" id="creditCard" required>
        <br>
    </div>  

    <div id="moneyBox">
        <!--숫자만 입력할 수 있게 정규식 사용-->
        <label id="paymentTotal" for="amount">결제금액</label>
        <br>
        <input type="number" name="amount" id="amount" required> 원
    </div>

    <jsp:include page="../../common/footer.jsp"/>

</body>
</html>