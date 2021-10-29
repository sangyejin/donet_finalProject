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

    #divideLine{ border: 1px solid gray; width: 800px; margin-top: 10px; margin-bottom: 10px;}

    #paymentBox, #moneyBox{float: left;}

    /*those imgs*/
    #kkoImg{width: 40px; height: 15px;}

    #tssImg{width: 40px; height: 15px;}

</style>

</head>
<body>
    <span><label id="pointPayment">포인트 충전</label> <label id="paymentTotal">결제금액</label></span>
    <div id="divideLine"></div>

    <div id="paymentBox">
        <label for="kakao"> <img id="kkoImg" src="/Users/wangsubin/FRONTEND/source_final/결제/kko.png"> 카카오페이 결제 </label>
        <input type="radio" name="payment" id="kakao">
        <br>
        <label for="toss"> <img id="tssImg" src="/Users/wangsubin/FRONTEND/source_final/결제/tss.png"> 토스 결제 </label>
        <input type="radio" name="payment" id="toss">
        <br>
        <label for="accountless"> 무통장 입금 </label>
        <input type="radio" name="payment" id="accountless">
        <br>
        <label for="creditCard"> 신용카드/직불카드 </label>
        <input type="radio" name="payment" id="creditCard">
        <br>
    </div>  

    <div id="moneyBox">
        <label for="amount">결제금액</label>
        <!--숫자만 입력할 수 있게 정규식 사용-->
        <input type="number" name="amount" id="amount">
        <br>
        <label for="usingPerks">적립금사용</label>
        <input type="number" name="usingPerks" id="usingPerks">
        <br>
        <!--3자리수마다 끊기 구현 가능?-->
        <label>잔여 적립금 : <a id="myPerks">1,000</a> 원 </label> 
    </div>


</body>
</html>