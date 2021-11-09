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
	width: 290px;
	height: 340px;
	margin-bottom: 10%;
	margin-left: 3.5%;
	margin-right: 1%;
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
	width: 287px;
	height: 150px;
	margin-top:1%;
}

.participation {
	margin: auto;
	margin-top: 5%;
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
	margin-top:2%;
	text-align: right;
}

.progressBar {
	text-align: center;
}

.progressbar {
	display: inline-block;
	width: 100%;
	height: 10px;
	border: none;
	border-radius: 10px;
	text-align: left;
	background-color: #e8e8e8;
	box-shadow: inset 0px 1px 0.5px 0.5px #858B94;
	overflow:hidden;
}

.progressbar>.gauge {
	display: inline-block;
	height: 10px;
	background-color: rgba(60, 179, 113);
	border-radius: 10px;
	padding-top:0px;
	margin-left: 0px;
	margin-bottom: 6px;
	box-shadow: inset 0px 1px 0.5px 0.5px rgba(50, 140, 90);
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
.supportTitle{
	margin-left:5%;
	width:265px;
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
</style>
</head>
<body id="pageTop">
	<jsp:include page="../common/menubar.jsp" />

	<div class="outer">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="list.do">후원</a></li>
				<li class="breadcrumb-item active" aria-current="page">후원 프로젝트</li>
			</ol>
		</nav>
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
							<div class="supportTerm">
								<fmt:formatDate value="${s.suStart}" var="suStart" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${s.suLast}" var="suLast" pattern="yyyy-MM-dd" />
								<b style="font-size:15px;color:black;">${suStart } ~ ${suLast } </b>
							</div>
							<div class="participation">
								<span>
									<img alt="" id="person"
										src="${ pageContext.servletContext.contextPath}/resources/imgs/donation/person.png">후원자수 ${s.total } 명
								</span>
								<fmt:formatNumber var="goalPersent" value="${(s.totalamount/s.goal)*100 }" pattern="0"/>
								<span style="float:right; margin-left:35%;">달성률: ${goalPersent} %</span>
							</div>
							
						<div class="progressBar">
							<span class="progressbar">
								<span class="gauge" style="width:${goalPersent}%;"></span>	
							</span>
						</div>
							<div class="totalAmount">
								<b style="margin-right:2%; font-size:18px;color:black;">누적 ${s.totalamount } 원</b>
							</div>

						</span>
					</div>
				</c:forEach>
			</c:if>
			<div class="pageOuter">
				<ul class="pagination" style="margin-left:38%;">
					<c:choose>
						<c:when test="${ pi.currentPage ne 1 }">
							<li class="page-item"><a class="page-link"
								href="list.do?currentPage=${ pi.currentPage-1 }"><</a></li>
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
								href="list.do?currentPage=${ pi.currentPage+1 }">></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link"
								href="list.do?currentPage=${ pi.currentPage+1 }">></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>


		<jsp:include page="../common/footer.jsp" />
		<jsp:include page="../donation/subMenu.jsp" />
	
</body>
</html>