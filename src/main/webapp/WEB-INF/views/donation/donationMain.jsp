<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	width: 265px;
	height: 280px;
	margin-bottom: 10%;
	margin-left: 5%;
	display: inline-block;
	transition: all 0.5s;
	border: 1px solid #808080;
	border-radius: 5px;
	text-align: center;
}

.supportList:hover {
	cursor: pointer;
	opacity: 0.5;
}

#thumbnailImg {
	width: 260px;
	height: 135px;
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
	width: 30px;
	height: 30px;
}

.page-item {
	cursor: pointer;
	margin-left: 3%;
	text-align: center;
}

.page-link:hover {
	cursor: pointer;
	margin-left: 3%;
	text-align: center;
	background-color: grey;
}

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
							<div>
								<fmt:formatDate value="${s.suDate}" var="suDate"
									pattern="yyyy-MM-dd" />
								<span style="float: left; margin-left: 2%; color:black;"><b>작성일 ㅣ
										${suDate }</b></span> <span style="float: right; margin-right: 2%; color:black;"><b>조회수
										ㅣ ${s.hits }</b></span>
							</div>
							<div class="thumbnailImg">
								<img alt="" id="thumbnailImg"
									src="${ pageContext.servletContext.contextPath}/resources/upload_files/donation/${s.thumbnailChange}">
							</div>
							<div class="supportTitle">
								<b style="font-size:20px;color:black;">${s.suTitle}</b>
							</div>
							<div class="supportWriter">
								<b style="font-size:15px;color:black;">${s.suWriter}</b>
							</div>
							<div class="participation">
								<div>
									<img alt="" id="person"
										src="${ pageContext.servletContext.contextPath}/resources/imgs/donation/person.png">
								</div>
								<div id="total">
									<b style="margin-right:170px; color:black;">후원자수 ${s.total } 명</b>
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
								<b style="margin-right:2%; font-size:18px;color:black;">누적 ${s.totalamount } 원</b>
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
							<li class="page-item disabled"><a class="page-link" href=""><</a></li>
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
								href="list.do?currentPage=${ pi.currentPage+1 }"></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link"
								href="list.do?currentPage=${ pi.currentPage+1 }">></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<script>
			function global() {
				location.href = "global?suCategoryNo=1";
			}
			function environment() {
				location.href = "environment?suCategoryNo=2";
			}
			function animal() {
				location.href = "animal?suCategoryNo=3";
			}
			function child() {
				location.href = "child?suCategoryNo=4";
			}
			function vulnerable() {
				location.href = "vulnerable?suCategoryNo=5";
			}
		</script>

		<jsp:include page="../common/footer.jsp" />
		<jsp:include page="../donation/subMenu.jsp" />
</body>
</html>