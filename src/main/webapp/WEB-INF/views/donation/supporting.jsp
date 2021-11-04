<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon -->
<link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png" type="image/x-icon">

<!-- font -->
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap" rel="stylesheet">
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<title>도넷닷컴</title>
<style>
.outer {
	width: 1050px;
	margin: auto;
}
#greenLine {
	background-color: rgb(60, 179, 113);
	width: 1050px;
	height: 3px;
	float: right;
}
.labelAdd{
	font-size: 30px;
	font-weight: 600;
	margin-right:3%;
	verticla-align: middle;
}
.man{
	background-color:white;
	width:50px;
	height: 30px;
	border: 1px solid #808080;
	border-radius: 5px;
	verticla-align: middle;
	
}
#addPrice{
	width: 200px;
	height: 35px;
	font-size: 25px;
	text-align:right;
	verticla-align: middle;
}
#addBtn {
	width: 100px;
	height: 35px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-size: 15px;
	font-weight: 600;
	color: rgb(60, 179, 113);
	background-color: white;
	float:right;
	margin-right:35%;
	margin-top:0.8%;
}
#addBtn:hover {
	width: 100px;
	height: 35px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-size: 15px;
	font-weight: 600;
	color: white;
	background-color: rgb(60, 179, 113);
	transition: all 0.5s;
	float:right;
	margin-right:35%;
	margin-top:0.8%;
}
#supportBtn {
	width: 100px;
	height: 35px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-size: 15px;
	font-weight: 600;
	color: white;
	background-color: rgb(60, 179, 113);
	transition: all 0.5s;
}
#supportBtn:hover {
	width: 100px;
	height: 35px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-size: 15px;
	font-weight: 600;
	color: rgb(60, 179, 113);
	background-color: white;
}
#back {
	width: 150px;
	height: 35px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-size: 15px;
	font-weight: 600;
	color: rgb(60, 179, 113);
	background-color: white;
}




</style>
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />

	<div class="outer">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb" style="width:1050px;">
				<li class="breadcrumb-item"><a href="list.do">후원</a></li>
				<li class="breadcrumb-item"><a href="list.do">후원 프로젝트</a></li>
				<li class="breadcrumb-item active" aria-current="page">후원하기</li>
			</ol>
		</nav>
		<div class="main-container">
			<div id="top-div" style="margin-top:5%; text-align:center;">
				<h1>'${loginUser.userId}님'의 소중한 마음 정말 감사합니다</h1>
			</div>
			<div id="greenLine" style="margin-bottom: 5%;"></div>
			<hr>
			
			<div style="margin-left:25%;">
				<div class="content-container">
					<label for="addSupport-container" class="labelAdd">후원하기</label>
						<input name="addPrice" id="addPrice" type="number" placeHolder="0"> 	<label class="labelAdd">원</label>
						<input type="button" value="입력" name="addBtn" id="addBtn">
				</div>
				<div style="margin-left:18%; margin-top:1%;">
						<input type="button" value="1만원" name="oneman" id="oneman" class="man">
						<input type="button" value="2만원" name="twoman" id="twoman" class="man">
						<input type="button" value="3만원" name="threeman" id="threeman" class="man">
				</div>
			</div>
				<hr>
				<div style="">
				<span style="float:left; width:280px; height:100px; margin-left:25%; margin-top:1.2%; border-right:1px solid #808080;">
					<div style="">
					<b style="font-size: 20px;">
					<br>
						총 <span id="totalSupport" style="font-size:20px;">0</span> 원 후원하기
					</b>
					</div>
					<div>
					<b style="font-size: 15px; margin-top:2%;">
					<br>
							잔여 포인트 : <span style="font-size:15px;">${loginUser.point}</span>
					</b>
					</div>
					
				</span>
				<span style="">
				<div >
					<b ><br><br>&nbsp;&nbsp;&nbsp;포인트 결제하신 금액은 기부시 별도 수수료 없이<br>
						&nbsp;&nbsp;&nbsp;단체로 100% 기부됩니다.
					</b><br>
				</div>
				<div>
				<div><br>
					&nbsp;&nbsp;&nbsp;<input type="checkbox" name="agree" id="agree" style="margin-bottom:3%;"> 유료이용약관동의
					<a style="margin-left:3%;" onclick="window.open('select.pop', '_blank', 'width=500, height=600'); return false;">약관보기 ▸</a>
				</div>
				</div>
				</span>
					
				</div>
				<div style="margin-top:3%; text-align:center; margin-right:1%;">
					<span style=""><input type="button" value="후원하기" name="addBtn" id="supportBtn" ></span>
					<span style=""><input type="button" value="목록으로 돌아가기" id="back"></button></span>
				</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
 

	
	<script>
			
			$("#btn-back").click(function(){
				location.href="detail.do?suNo=${p.suNo}";
			});
			
			$("#oneman").click(function(){
				$("#addPrice").val(10000);
			});
			
			$("#twoman").click(function(){
				$("#addPrice").val(20000);
			});
			
			$("#threeman").click(function(){
				$("#addPrice").val(30000);
			});
			
			$("#addBtn").click(function(){
				const price = $("#addPrice").val();
				console.log(price);
				document.getElementById("totalSupport").innerText = price;
			});
			
			$("#back").click(function(){
				location.href="list.do";
			});
			
			$("#supportBtn").click(function(){
				if($("#agree").is(":checked")==true){
					if($("#addPrice").val()!=0){
						
						if(${loginUser.point<num}){
							alert("포인트 충전 후 후원이 가능합니다.");
							location.href="point.me";
						}else {
								var suNo = "${p.suNo}";
								var amount = $("#addPrice").val();

									$.ajax({
										url : "supportCharity",
										type : "post",
										data : {
											amount : amount,
											suNo : suNo,
											userId : "${loginUser.userId}"
										},
										success : function(result) {
											if (result > 0) {
												alert("후원 성공!!");
												location.href="supportAfterPoints?point="+amount;

											} else {
												alert("후원 실패");
											}
										},
										error : function() {
											console.log("댓글 작성 ajax 통신 실패");
										}
									});


						}
					}else{
						alert("후원금액을 입력해주세요.");
					}
				}else{
					alert("유료이용약관에 동의해주세요.");					
				}
			});	

	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>