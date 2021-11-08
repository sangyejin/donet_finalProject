<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도넷닷컴</title>
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

.div-main {
	margin: 0 auto;
	width: 1050px;
	text-align: center;
}

.content {
	margin: 50px 0px 50px 0px;
}

h1, h2 {
	font-weight: 700;
}
#btn-back {
	width: 200px;
	height: 40px;
	border-radius: 5px;
	color: white;
	font-weight: 600;
	color: rgb(60, 179, 113);
	background-color: white;
	transition: all 0.5s;
	border:1px solid rgb(60, 179, 113);
}

#btn-back:hover {
	width: 200px;
	height: 40px;
	border-radius: 5px;
	border:1px solid rgb(60, 179, 113);
	color: white;
	font-weight: 600;
	color: white;
	background-color: rgb(60, 179, 113);
}

</style>

</head>

<body>
	<jsp:include page="../common/menubar.jsp" />

	<div class="div-main">
		<h1>펀딩 후원 완료</h1>
		<div class="content">
			<img src="${pageContext.request.contextPath}/resources/upload_files/funding/${funding.thumbnailChangeName}" alt="" width="400px">
			<h2>${funding.fpName}</h2>
			<p>
				[ ${funding.fpName} ]을 후원해주셔서 감사합니다.<br> 더 나은 세상을 위해 노력하겠습니다.<br>:)
			</p>
		</div>
		<button type="button" id="btn-back" onclick="location.href = '${pageContext.request.contextPath}/funding';">목록으로 돌아가기</button>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>

</html>