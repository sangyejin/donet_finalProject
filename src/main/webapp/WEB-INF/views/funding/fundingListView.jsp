<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!-- favicon -->
<link rel="icon"
	href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png"
	type="image/x-icon">
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- CSS here -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/slicknav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/gijgo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/slick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/nice-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">

<!-- jQuery --> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
<title>도넷닷컴</title>
<style>
*{
	font-family: 'Noto Sans KR', sans-serif;
    font-size: 12px;
    margin: 0;
	padding: 0;
}


.card {
	margin-right: 0px !important;
	padding-left: 30px !important;
}

.cases-caption {
	text-align: center;
	width: 278px !important;
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

.btn-insert {
	background-color: rgba(224, 224, 224);
	height: 42px;
	padding: 0 20px 0 20px !important;
}

.main {
	text-align: center;
}

.div-content {
	display: inline-block;
	width: 1050px;
}

p {
	margin: 0;
}

.progress {
	width: 278px;
}

/* IE 10, 11의 네이티브 화살표 숨기기 */
select::-ms-expand {
	display: none;
}

.div-filter {
	text-align: right;
}

.search-bar {
	text-align: right;
	display: inline-block;
	margin-right: 20px;
	margin-top: 10px;
}

.container, .row {
	width: 1050px;
}

.d-day {
	font-size: 1.2em;
}

.category-hostName {
	font-size: 0.8em;
}

.pagination {
	display: inline-block !important;
}

#filter1, #filter2 {
	display: inline-block;
}

.nice-select {
	float: none;
	display: inline-block;
}

.category-hostName {
	display: block;
}

.case-caption {
	margin: 0 auto;
	padding-top: 10px;
}

#title {
	display: block;
	font-size: 18px;
}

.div-title {
	height: 50px;
}

#btn-insert {
	width: 200px;
	height: 40px;
	border-radius: 5px;
	color: white;
	font-weight: 600;
	color: rgb(60, 179, 113);
	background-color: white;
	transition: all 0.5s;
	border: 1px solid rgb(60, 179, 113);
}

#btn-insert:hover {
	width: 200px;
	height: 40px;
	border-radius: 5px;
	border: 1px solid rgb(60, 179, 113);
	color: white;
	font-weight: 600;
	color: white;
	background-color: rgb(60, 179, 113);
}

#searchInput {
	border: 1px solid #e8e8e8;
	height: 40px;
	width: 200px;
	padding-left: 20px;
	transition: all 0.5s;
}

#searchInput:hover, #searchInput:focus {
	border: 1px solid #e8e8e8;
	height: 40px;
	width: 400px;
	padding-left: 20px;
}

.img-text {
	position: absolute;
	background-color: rgba(60, 179, 113, 0.6);
	border-radius: 50%;
	width: 100px;
	height: 100px;
	position: absolute;
	top: 50px;
	left: 130px;
	padding-top: 35px;
}

.img-text>p {
	text-align: center;
	vertical-align: middle;
	color: white;
	font-weight: 700;
}

.cases-img {
	padding-top:20px;
}
</style>
</head>

<body>

	<jsp:include page="../common/menubar.jsp" />
	<div class="main">
		<div class="div-top">
			<div>
				<div class="div-category-menu" >
					<c:forEach var="category" items="${category}">
						<button type="button" class="btn btn-light"
							id="${category.categoryNo}">${category.categoryName}</button>
					</c:forEach>
				</div>
			</div>
			<div class="div-filter">
				<p id="searchText"></p>
				<input id="searchInput" name="searchInput" type="text" class="rounded-pill"
					placeholder="검색" aria-describedby="button-addon2"
					onkeyup="if(window.event.keyCode==13){searchText(this.value);}">
				<select name="period" id="period" onchange="selectPeriod(this.value);">
					<option value="">전체</option>
					<option value="SYSDATE < START_DATE">예정</option>
					<option value="SYSDATE BETWEEN START_DATE AND CLOSING_DATE">진행중</option>
					<option value="SYSDATE > CLOSING_DATE">종료</option>
				</select> 
				<select name="order" id="order"  onchange="selectOrder(this.value);">
					<option value="FP_WRITE_DATE DESC">최신순</option>
					<option value="HITS DESC">조회순</option>
					<option value="NUMBER_SUPPORTER DESC">후원자수순</option>
					<option value="RAISED DESC">모인펀딩액순</option>
				</select>
				<c:if
					test="${loginUser.userRole eq 'B'||loginUser.userRole eq 'C'||loginUser.userRole eq 'D'}">
					<button id="btn-insert"
						onclick="location.href='${pageContext.servletContext.contextPath}/funding/insertForm';">등록하기</button>
				</c:if>

			</div>
		</div>


		<div class="div-content">
			<div class="container row" style="margin: 100 auto; width: 1080px;" id="fundingListContent">
			</div>
		</div>

		<!-- pagination -->
		<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination" id="pagination">
			</ul>
		</nav>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>
	<script>
	let pageInfo= {
		currentPage:"${pi.currentPage}",
		listCount:"${pi.listCount}",
		startPage:"${pi.startPage}",
		endPage:"${pi.endPage}",
		maxPage:"${pi.maxPage}",
		pageLimit:"${pi.pageLimit}",
		boardLimit:"${pi.boardLimit}",
		moveCurrentPage(movePage){
			this.currentPage=movePage;
			return pageInfo;
		}
	};
	let categoryNo="${categoryNo}";
	let order="";
	let search="";
	let period="";
	selectFundingList(pageInfo,categoryNo,period,order,search);
		
	function selectFundingList(p,categoryNo,period,order,search){
			//console.log("categoryNo"+categoryNo);
			$.ajax({
				url : "funding/list",
				type : "post",
				data:{
					currentPage: p.currentPage,
					listCount:p.listCount,
					startPage:p.startPage,
					endPage:p.endPage,
					maxPage:p.maxPage,
					pageLimit:p.pageLimit,
					boardLimit:p.boardLimit,
					search:search,
					categoryNo: Number(categoryNo),
					order: order,
					period:period
				},
				success: function(map) {
					let value = "";
					//console.log(pageInfo,order,categoryNo);
					$.each(map.pi,function(i, list){
						pageInfo[i]=list;
					});
					console.log("pi>>");
					console.log(pageInfo);
					console.log(categoryNo);
					$.each(map.fundingList,function(i, list){
						let goalPersent = list.raised/list.goal*100;
						value += `<div class="card col-lg-4 col-md-6 col-sm-6">
										<div class="single-cases mb-40">
											<div class="cases-img">
												<img src="${pageContext.request.contextPath}/resources/upload_files/funding/`+list.thumbnailChangeName+`" alt="`+list.fpName+`"
													width="278px" height="200px">`;
						if(goalPersent>=100){
							value+=`			<div class="img-text">
													<p>COMPLETE</p>
												</div>`;
						}
						value+=`			</div>
											<div class="cases-caption">
												<div class="cases-info">
													<div class="div-title">
												<a href="${pageContext.servletContext.contextPath}/funding/`+list.fpNo+`" id="title">`+list.fpName+`</a>
											</div>
											<p class="category-hostName">
												<span>`+list.categoryName+`</span> | <span>`+list.hostName+`</span>
											</p>
											<p class="dDay">
											<span>`+list.startDate +`~`+ list.closeDate +`</span>
										</p>
											<p class="dDay">
												<span>`+list.dDay +`</span>
											</p>
										</div>
										<div class="progress">
											<div class="progress-bar progress-bar-success"
												role="progressbar"
												aria-valuenow="`+goalPersent+`" aria-valuemin="0"
												aria-valuemax="100"
												style="width:`+goalPersent+`%">`+goalPersent+`%
											</div>
										</div>
										<div class="prices d-flex justify-content-between">
											<p>
												현재:<span> `+list.raised+`</span>
											</p>
											<p>
												목표:<span>`+list.goal+`</span>원
											</p>
										</div>
									</div>
								</div>
							</div>`;
					});
					$("#fundingListContent").html(value);
					paging(pageInfo,categoryNo,period,order,search);
					
				},
				error : function() {
					console.log("구호물품 리스트 조회용 ajax 통신 실패");
				}
			});
			
		}
		
		function selectOrder(value){
			$("#searchText").text('');
			console.log("order",pageInfo,categoryNo,order,period);
			pageInfo.currentPage=1;
			order=value;
			selectFundingList(pageInfo,categoryNo,period,order,search);
		}
		function selectPeriod(value){
			$("#searchText").text('');
			console.log("period",pageInfo,categoryNo,order,period);
			pageInfo.currentPage=1;
			period=value;
			selectFundingList(pageInfo,categoryNo,period,order,search);
		}
		
		function paging(pi,categoryNo,period,order,search){
			var temp=``;

			if(pi.currentPage==1){
				temp=`<li class="disabled page-item">
				<a onclick='selectFundingList(pageInfo.moveCurrentPage(`+(Number(pageInfo.currentPage)-1)+`),"`+categoryNo+`","`+period+`","`+order+`","`+search+`");' class="page-link" aria-label="Previous">
				<i class="ti-angle-left"></i>
				</a></li>`;
			}else{
				temp+=`<li class="page-item">
					<a onclick='selectFundingList(pageInfo.moveCurrentPage(`+(Number(pageInfo.currentPage)-1)+`),"`+categoryNo+`","`+period+`","`+order+`","`+search+`");' class="page-link" aria-label="Previous"> 
					<i class="ti-angle-left"></i>
					</a></li>`;
			}
			for(let i= pi.startPage; i<=pi.endPage;i++){
				if(pi.currentPage==i){
					temp+=`<li class="disabled page-item active">
					<a onclick='selectFundingList(pageInfo.moveCurrentPage(`+i+`),"`+categoryNo+`","`+period+`","`+order+`","`+search+`");' class="page-link">`
					+i+`</a></li>`;
				}else{
					temp+=`<li class="page-item">
					<a onclick='selectFundingList(pageInfo.moveCurrentPage(`+i+`),"`+categoryNo+`","`+period+`","`+order+`","`+search+`");' class="page-link">`
					+i+`</a></li>`;
				}
			}
			if(pi.currentPage==pi.maxPage){
				temp+=`	<li class="disabled page-item">
				<a onclick='selectFundingList(pageInfo.moveCurrentPage(`+(Number(pageInfo.currentPage)+1)+`),"`+categoryNo+`","`+period+`","`+order+`","`+search+`");' class="page-link" aria-label="Next">
				<i class="ti-angle-right"></i>
				</a></li>`;
			}
			else{
				temp+=`<li class="page-item">
				<a onclick='selectFundingList(pageInfo.moveCurrentPage(`+(Number(pageInfo.currentPage)+1)+`),"`+categoryNo+`","`+period+`","`+order+`","`+search+`");' class="page-link" aria-label="Next">
				<i class="ti-angle-right"></i></a></li>`;
			}
			${currentPage}
			$("#pagination").html(temp);
		}
		
		$('.div-category-menu').on('click', function (event) {
        	if (event.target.tagName != 'BUTTON') return false; //버튼누른게 아니면 return
        	$("#searchText").text('');
			$("#searchInput").val('');
			search="";
        	console.log("category",pageInfo,event.target.id,order);
        	pageInfo.currentPage=1;
        	categoryNo=event.target.id;
        	selectFundingList(pageInfo,categoryNo,period,order,search);
    	});
		
		function searchText(text){
			pageInfo.currentPage=1;
			search=text;
			selectFundingList(pageInfo,categoryNo,period,order,search);
			$("#searchText").text("'"+search+"'검색 결과입니다.");
		}
	</script>
	
	<!-- JS here -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/animated.headline.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- Date Picker -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/gijgo.min.js"></script>
	<!-- Nice-select, sticky -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.sticky.js"></script>
	<!-- Progress -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.barfiller.js"></script>

	<!-- counter , waypoint,Hover Direction -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.counterup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.countdown.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/hover-direction-snake.min.js"></script>

	<!-- contact js -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/contact.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.form.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/mail-script.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	
</body>

</html>