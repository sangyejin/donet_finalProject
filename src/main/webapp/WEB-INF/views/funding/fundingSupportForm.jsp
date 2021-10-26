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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
.main-container {
	margin: 0 auto;
	width: 1050px;
	background-color: antiquewhite;
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
				<div class="col-md-3">
					<img src="${pageContext.request.contextPath}/resources/upload_files/funding/${ funding.thumbnailChangeName}" alt="">
				</div>
				<div class="col-md-offset-1 col-md-8">
					<p>${funding.categoryName}</p>
					<p>${funding.fpName}</p>
					<p>마감까지 ${closeDate-nowDate }일</p>
				</div>
			</div>
			<hr>
			<div class="content-container">
				<label for="fundingGoods-container">선물 선택</label> <input
					type="hidden" name="tempPrice" id="tempPrice" value="0" />
				<div id="fundingGoods-container">
					<c:if test="${not empty fundingGoodsList}">
						<c:forEach var="fg" items="fundingGoodsList">
							<div class="fundingGoods-card"
								onclick="selectDiv(${fg.fgPrice});">
								<p>${fg.fgPrice}Point</p>
								<p>${fg.fgName}</p>
								<p>${fg.fgContent}</p>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<div class="content-container">
				<label for="addSupport-container">추가 후원하기</label>
				<div class="addSupport-container">
					<input name="fpPrice" id="fpPrice" type="number" placeHolder="0,000,000"><span>원</span>
					<button id="btn-setting">입력</button>
				</div>
			</div>
			<div class="content-container">
				<label for="addSupport-container">받는이 정보</label>
				<div class="addSupport-container">
					<div class="inputArea">
						<label for="takeName"></label><input name="takeName" type="text"
							placeHolder="이름을 입력해주세요.">
					</div>
					<div class="inputArea">
						<label for="takePostCode"></label><input name="takePostCode"
							type="text" placeHolder="우편번호를 입력해주세요">
					</div>
					<div class="inputArea">
						<label for="takeAddress"></label><input name="takeAddress"
							type="text" placeHolder="주소를 입력해주세요.">
					</div>
					<div class="inputArea">
						<label for="takePhone"></label><input name="takePhone" type="text"
							placeHolder="전화번호를 입력해주세요.">
					</div>
				</div>
			</div>
			<hr>
			<div>
				<p>
					총 <span id="totalSupport"></span>원 후원하기
				</p>
			</div>
			<div class="content-container">
				<label for="support-info-container">후원</label>
				<div class="addSupport-container">
					<p id="">
						잔여 포인트 : <span>${loginUser.point}</span>
					</p>
					<p id="message"></p>
				</div>
			</div>
			<div id="btnArea">
				<button id="btn-support">후원하기</button>
				<button id="btn-back">목록으로 돌아가기</button>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			$("#btn-setting").click(function(){
				var temp=document.getElementById("tempPrice").value;
				var fpPrice=document.getElementById("fpPrice").value;
				$("#totalSupport").text(temp+fpPrice);
			});
			
			$("#btn-support").click(function(){
				if(document.getElementById("tempPrice").value==""){
					alert("선물이 선택되지않았습니다.");
				}
				else{
					
				}
			});
			
			$("#btn-back").click(function(){
				location.href="/funding";
			});
		});

		function selectDiv(price){
			var temp= document.getElementById("tempPrice").value = price;
			$("#totalSupport").text(temp);
		}
	</script>
</body>
</html>