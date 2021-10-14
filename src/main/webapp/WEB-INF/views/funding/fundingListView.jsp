<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- font -->
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>

<title>도넷닷컴</title>
<style>
* {
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 12px;
}
.div-top {
	margin: auto;
	width: 1050px;
	margin-bottom: 50px;
}

.div-category-menu {
	display: inline-block;
	background-color: rgba(248, 248, 248);
	padding: 1em 10em;
	text-align: center;
	box-shadow: 4px 4px 4px 4px rgba(199, 199, 199);
	margin-bottom: 50px;
	width: 1050px;
}

.btn-light {
	display: inline-block;
	background-color: rgba(224, 224, 224);
	/* padding: 0.5em 1em; */
	margin-left: 1em;
}

.main {
	text-align: center;
}

.div-content {
	display: inline-block;
	width: 1050px;
}

.div-card {
	padding: 30px 0;
}

.image {
	display: inline-block;
	margin-top: 16px auto;
	width: 240px;
	height: 200px;
	background-color: beige;
}

.div-card-info {
	margin-top: 10px;
	background-color: aliceblue;
	width: 240px;
	height: 140px;
	word-break: break-all;
	overflow: hidden;
	margin: auto;
}

.div-card-info-top {
	overflow: hidden;
	word-break: break-all;
	text-align: center;
}

.progress {
	border-radius: 0px;
	height: 4px;
	margin-bottom: 0;
}

h1 {
	text-align: left;
	margin-left: 70px;
	font-size: 2em;
}

p {
	margin: 0;
}

.div-goalPersent {
	color: rgb(60, 179, 113);
	text-align: right;
	margin-right: 10px;
}

select {
	outline: 0;
	border: 0;
	-webkit-appearance: none;
	/* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
	background: url('${ pageContext.servletContext.contextPath }/resources/imgs/caret-down.png') no-repeat 95% 50%;
	background-size: 10px;
	/* 화살표 모양의 이미지 */
	padding: 4px;
	/* padding-right: 4px; */
}

option {
	padding: 4px;
	/* padding-right: 4px; */
}

/* IE 10, 11의 네이티브 화살표 숨기기 */
select::-ms-expand {
	display: none;
}

.div-filter {
	text-align: right;
	margin-right: 40px;
}

.search-bar {
	text-align: right;
	display: inline-block;
	margin-right: 20px;
	margin-top: 10px;
}

.container {
	width: 1050px;
}

.d-day {
	font-size: 1.2em;
}

.category-hostName {
	font-size: 0.8em;
}

.title {
	height: 40px;
}
</style>
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="main">
		<div class="div-top">
			<h1>후원 > 펀딩프로젝트</h1>
			<div>
				<div class="div-category-menu">
					<c:forEach var="categoryName" items="${category}">
						<button type="button" class="btn btn-light" id="btn-${categoryName}">${categoryName}</button>
					</c:forEach>
				</div>
			</div>
			<div class="div-filter">
				<div class="mx-auto mt-5 search-bar input-group mb-3">
					<input name="q" type="text" class="form-control rounded-pill"
						placeholder="검색" aria-label="Recipient's username"
						aria-describedby="button-addon2">
					<div class="input-group-append"></div>
				</div>
				<select name="filter2" id="filter2">
					<option value="1">전체</option>
					<option value="2">진행중</option>
					<option value="3">종료</option>
				</select> <select name="filter1" id="filter1">
					<option value="1">최신순</option>
					<option value="2">인기순</option>
					<option value="3">마감임박</option>
				</select>
			</div>

		</div>


		<div class="div-content">
			<div class="container row" style="margin: 100 auto;">
				<c:forEach var="list" items="${list}">
					<div class="div-card col-xs-12 col-md-6 col-lg-3"
						style="margin: 0 auto;">
						<div class="image"
							style="background-image: url('${list.thumb}'); background-repeat:no-repeat; background-size:240px 200px;">
						</div>
						<div class="div-card-info">
							<div class="div-card-info-top">
								<a href="">
									<div class="title">
										<strong>${list.title}</strong>
									</div>
								</a>
								<p class="category-hostName">
									<span>${list.categoryName }</span>|<span>${list.hostName}</span>
								</p>
								<p class="d-day">
									<strong>D-<span id="dDay" name="dDay">${list.dDay}</span></strong>
								</p>
								<p>
									<span id="nowAmount" name="nowAmount">${list.nowAmount }</span>원
									/ 목표 <span id="goalAmount" name="goalAmount">${goalAmount}</span>원
								</p>
							</div>
							<div class="progress">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="${list.achieveRate}"
									aria-valuemin="0" aria-valuemax="100" style="width:"${list.achieveRate}%">
								</div>
							</div>
							<div class="div-goalPersent">
								<strong><span>${list.achieveRate}</span>%</strong>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
</body>

</html>