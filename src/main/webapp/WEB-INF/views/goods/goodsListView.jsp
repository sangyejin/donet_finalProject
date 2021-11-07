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
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
<title>도넷닷컴</title>
<style>
* {
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 12px;
}

.card {
	margin-right: 0px !important;
	padding-left: 15px !important;
}

.cases-caption {
	text-align: center;
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

#filter1{
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

.title {
	display: block;
	font-size: 20px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.div-title {
	height: 60px;
}

.goodsPrice{
	font-weight:700;
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

#search {
	border: 1px solid #e8e8e8;
	height: 40px;
	width: 200px;
	padding-left: 20px;
	transition: all 0.5s;
}

#search:hover, #search:focus {
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
	margin-top:30px;
	margin-bottom:20px;
}
</style>

</head>

<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="main">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">후원</a></li>
				<li class="breadcrumb-item active" aria-current="page">펀딩 프로젝트</li>
			</ol>
		</nav>
		<div class="div-top">
			<div>
				<div class="div-category-menu">
					<c:forEach var="category" items="${categoryList}">
						<button type="button" class="btn btn-light btn-category" id="${category.goodsCategoryNo}">${category.goodsCategoryName}</button>
					</c:forEach>
				</div>
			</div>
			<div class="div-filter">
				<p id="searchText"></p>
				<input id="search" name="search" type="text" class="rounded-pill" placeholder="검색" aria-describedby="button-addon2"
				onkeyup="if(window.event.keyCode==13){searchText(this.value);}" />
				</select> 
				<select name="filter2" id="filter1" onchange="selectOrder(this.value);">
					<option value="CREATE_DATE DESC">최신순</option>
					<option value="HITS DESC">인기순</option>
					<option value="GOODS_PRICE ASC">낮은가격순</option>
					<option value="GOODS_PRICE DESC">높은가격순</option>
				</select>
				<c:if
					test="${loginUser.userRole eq 'D'}">
					<button id="btn-insert"
						onclick="location.href='${pageContext.servletContext.contextPath}/goods/insertForm';">등록하기</button>
				</c:if>
			</div>
		</div>

		<div class="div-content">
			<div class="container row" id="goodsListContent" style="margin: 100 auto; width: 1080px;">
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
	let order="${order}";
	let search="";
	selectGoodsList(pageInfo,categoryNo,order,search);
		
	function selectGoodsList(p,categoryNo,order,search){
			//console.log("categoryNo"+categoryNo);
			
			$.ajax({
				url : "goods/list",
				type : "post",
				data:{
					search:search,
					currentPage: p.currentPage,
					listCount:p.listCount,
					startPage:p.startPage,
					endPage:p.endPage,
					maxPage:p.maxPage,
					pageLimit:p.pageLimit,
					boardLimit:p.boardLimit,
					categoryNo:categoryNo,
					order: order
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
					$.each(map.goodsList,function(i, list){	
						value += `<div class="card col-lg-4 col-md-6 col-sm-6">
									<div class="single-cases mb-40">
										<div class="cases-img"  onclick="location.href='${pageContext.servletContext.contextPath}/goods/`+list.goodsNo+`';">
											<img src="${pageContext.request.contextPath}/resources/upload_files/goods/`+list.thumbnailChangeName+`" alt="`+list.goodsName+`"
														width="278px" height="200px">
										</div>
										<div class="cases-caption">
											<div class="cases-info">
												<div class="div-title">
													<a href="${pageContext.servletContext.contextPath}/goods/`+list.goodsNo+`" class="title">`+list.goodsName+`</a>
												</div>
												<p class="goodsPrice">
													`+list.goodsPrice+`원
												</p>
											</div>
										</div>
									</div>
								</div>`;
					});
					$("#goodsListContent").html(value);
					paging(pageInfo);
					
				},
				error : function() {
					console.log("구호물품 리스트 조회용 ajax 통신 실패");
				}
			});
			
		}
		
		function selectOrder(order){
			$("#searchText").text('');
			console.log("order",pageInfo,categoryNo,order);
			pageInfo.currentPage=1;
			selectGoodsList(pageInfo,categoryNo,order,search);
		}
		
		function paging(pi){
			var temp=``;

			if(pi.currentPage==1){
				temp=`<li class="disabled page-item">
				<a onclick='selectGoodsList(pageInfo.moveCurrentPage(`+(Number(pageInfo.currentPage)-1)+`),"`+categoryNo+`","`+order+`","`+search+`");' class="page-link" aria-label="Previous">
				<i class="ti-angle-left"></i>
				</a></li>`;
			}else{
				temp+=`<li class="page-item">
					<a onclick='selectGoodsList(pageInfo.moveCurrentPage(`+(Number(pageInfo.currentPage)-1)+`),"`+categoryNo+`","`+order+`","`+search+`");' class="page-link" aria-label="Previous"> 
					<i class="ti-angle-left"></i>
					</a></li>`;
			}
			for(let i= pi.startPage; i<=pi.endPage;i++){
				if(pi.currentPage==i){
					temp+=`<li class="disabled page-item active">
					<a onclick='selectGoodsList(pageInfo.moveCurrentPage(`+i+`),"`+categoryNo+`","`+order+`","`+search+`");' class="page-link">`
					+i+`</a></li>`;
				}else{
					temp+=`<li class="page-item">
					<a onclick='selectGoodsList(pageInfo.moveCurrentPage(`+i+`),"`+categoryNo+`","`+order+`","`+search+`");' class="page-link">`
					+i+`</a></li>`;
				}
			}
			if(pi.currentPage==pi.maxPage){
				temp+=`	<li class="disabled page-item">
				<a onclick='selectGoodsList(pageInfo.moveCurrentPage(`+(Number(pageInfo.currentPage)+1)+`),"`+categoryNo+`","`+order+`","`+search+`");' class="page-link" aria-label="Next">
				<i class="ti-angle-right"></i>
				</a></li>`;
			}
			else{
				temp+=`<li class="page-item">
				<a onclick='selectGoodsList(pageInfo.moveCurrentPage(`+(Number(pageInfo.currentPage)+1)+`),"`+categoryNo+`","`+order+`","`+search+`");' class="page-link" aria-label="Next">
				<i class="ti-angle-right"></i></a></li>`;
			}
			
			$("#pagination").html(temp);
		}
		
		$('.div-category-menu').on('click', function (event) {
			$("#searchText").text('');
			$("#search").val('');
			search="";
        	if (event.target.tagName != 'BUTTON') return false; //-버튼누른게 아니면 return서
        	console.log("category",pageInfo,event.target.id,order);
        	pageInfo.currentPage=1;
        	categoryNo=event.target.id;
        	selectGoodsList(pageInfo,categoryNo,order,search);
    	});
		
		function searchText(text){
			pageInfo.currentPage=1;
			search=text;
			selectGoodsList(pageInfo,categoryNo,order,search);
			$("#searchText").text("'"+text+"'검색 결과입니다.");
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