<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">

<!-- favicon -->
<link rel="icon"
	href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png"
	type="image/x-icon">

<!-- CSS here -->
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/assets/css/slicknav.css">
<link rel="stylesheet" href="resources/assets/css/flaticon.css">
<link rel="stylesheet" href="resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="resources/assets/css/gijgo.css">
<link rel="stylesheet" href="resources/assets/css/animate.min.css">
<link rel="stylesheet" href="resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="resources/assets/css/fontawesome-all.min.css">
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
	#child{
		background-color: rgb(60, 179, 113);
		color: white;
		font-weight: 600;
	}

</style>
</style>
</head>
<body id="pageTop">
	<jsp:include page="../common/menubar.jsp" />

	<div class="outer">
		<jsp:include page="../donation/supportCategory.jsp" />

		<div class="content">
			<c:if test="${!empty list}">
				<c:forEach items="${ list }" var="s" varStatus="status">
					<div class="supportList"
						onclick="location.href = 'detail.do?suNo=${s.suNo}'">
						<span class="supportOne">
							<div class="thumbnailImg">
								<img alt="" id="thumbnailImg"
									src="${ pageContext.servletContext.contextPath}/resources/imgs/${s.thumbnailChange}">
							</div>
							<div class="supportTitle">
								<h3>${s.suTitle}</h3>
							</div>
							<div class="supportWriter">
								<h6>${s.suWriter}</h6>
							</div>
							<div class="participation">
								<div>
									<img alt="" id="person"
										src="${ pageContext.servletContext.contextPath}/resources/imgs/donation/person.png">
								</div>
								<div id="total">
									<h6>${s.total }명</h6>
								</div>
							</div>
							<div class="progressBar">
								<c:choose>
									<c:when test="${s.goal ne 0 }">
										<c:set var="cul" value="${(s.totalamount/s.goal)*100 }" />
										<c:choose>
											<c:when test="${cul>=100 }">
												<span class="progressbar"> <span class="gauge"
													style="width: 101%;"></span>
												</span>
											</c:when>
											<c:when test="${cul<100 }">
												<span class="progressbar"> <span class="gauge"
													style="width: ${cul}%;"></span>
												</span>
											</c:when>
										</c:choose>
									</c:when>
									<c:when test="${s.goal eq 0 }">
										<span class="progressbar"> <span class="gauge"
											style="width: 0%;"></span>
										</span>
									</c:when>
								</c:choose>
							</div>
							<div class="totalAmount">
								<h3>
									<b>누적 ${s.totalamount } 원</b>
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
		<script>
			function global() {
				location.href = "global";
			}
			function environment() {
				location.href = "environment";
			}
			function animal() {
				location.href = "animal";
			}
			function child() {
				location.href = "child";
			}
			function vulnerable() {
				location.href = "vulnerable";
			}
		</script>

		<jsp:include page="../common/footer.jsp" />
		<jsp:include page="../donation/subMenu.jsp" />
</body>
</html>