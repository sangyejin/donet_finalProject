<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- font -->
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">

<!-- favicon -->
<link rel="icon"
	href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png"
	type="image/x-icon">
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 	

<!-- CSS here -->
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/assets/css/slicknav.css">
<link rel="stylesheet" href="resources/assets/css/flaticon.css">
<link rel="stylesheet"
	href="resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="resources/assets/css/gijgo.css">
<link rel="stylesheet" href="resources/assets/css/animate.min.css">
<link rel="stylesheet" href="resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="resources/assets/css/slick.css">
<link rel="stylesheet" href="resources/assets/css/nice-select.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<title>도넷닷컴</title>
<style>
.outer {
	width: 1050px;
	margin: auto;
}

.supportList {
	width: 260px;
	height: 250px;
	margin-bottom: 10%;
	margin-left: 5%;
	display: inline-block;
	transition: all 0.5s;
}

.supportList:hover {
	cursor: pointer;
	opacity: 0.5;
}

#thumbnailImg {
	width: 260px;
	height: 130px;
}

.participation {
	margin: auto;
	display: flex;
}

#person {
	flex: 1;
}

#total {
	flex: 2;
	margin-left: 2%;
	margin-top: 1.5%;
}

.totalAmount {
	text-align: right;
}

.progressbar {
	display: inline-block;
	width: 260px;
	height: 10px;
	border: 1px solid rgb(85, 85, 85);
	border-radius: 10px;
	align: center;
}

.progressbar>.gauge {
	display: inline-block;
	height: 10px;
	background-color: rgb(60, 179, 113);
	border-radius: 10px;
	margin-left: -2px;
	margin-bottom: 5px;
}

.pagination {
	margin-left: 40%;
}

.page-link {
	
}

.page-item {
	
}

#greenLine {
	background-color: rgb(60, 179, 113);
	width: 1050px;
	height: 3px;
	float: right;
	margin-right: 1%;
}

.title {
	display: inline-block;
}

c {
	float: left;
	font-size: 30px;
	font-weight: 800;
}

</style>
</head>
<body id="pageTop">
	<jsp:include page="../common/menubar.jsp" />

	<div class="outer">
	
		<div class="title">
		<span><c>커뮤니티 > 후원 후기</c></span>
		<span></span>
		<c:if
			test="${loginUser.userRole eq 'A'||loginUser.userRole eq 'B'||loginUser.userRole eq 'C'}">
		<span><button type="button" id="registration"
				onclick="location.href='supportReviewWrite.me'">후기 작성</button></span>
		</c:if>

		<div id="greenLine"></div>
	</div>

		<div class="content">
			<c:if test="${!empty list}">
				<c:forEach items="${ list }" var="r" varStatus="status">
					<div class="supportList"
						onclick="location.href = 'supportReviewDetail.me?reNo=${r.reNo}'">
						<span class="supportOne">
							<div class="thumbnailImg">
								<img alt="" id="thumbnailImg"
									src="">
									<%-- ${ pageContext.servletContext.contextPath}/resources/imgs/${r.imgChangeName} --%>
							</div>
							<div class="supportTitle">
								<h3>제목 : ${r.reTitle}</h3>
							</div>
							<div class="supportWriter">
								<h6>작성자 : ${r.userId}</h6>
							</div>
							<div class="participation">
								<div>
									<img alt="" id="person"
										src="${ pageContext.servletContext.contextPath}/resources/imgs/donation/person.png">
								</div>
								<div id="total">
									<h6>${r.reCount }조회수</h6>
								</div>
							</div>
							
							<div class="totalAmount">
								<h3>
									<b>후기 작성일 ${r.reDate }</b>
								</h3>
							</div>
						</span>
					</div>
				</c:forEach>
			</c:if>
			<div class="pageOuter">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage ne 1 }">
							<li class="page-item"><a class="page-link"
								href="list.do?currentPage=${ pi.currentPage-1 }">Previous</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:choose>
							<c:when test="${ pi.currentPage ne p }">
								<li class="page-item"><a class="page-link"
									href="list.do?currentPage=${ p }">${ p }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>


					<c:choose>
						<c:when test="${ pi.currentPage ne pi.maxPage }">
							<li class="page-item"><a class="page-link"
								href="list.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link"
								href="list.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>

		<jsp:include page="../common/footer.jsp" />
		<div
			style="display: scroll; position: fixed; bottom: 10px; right: 5px;">
			<a class="topTotop" href="#pageTop">TOP▲</a>
		</div>
</body>
</html>