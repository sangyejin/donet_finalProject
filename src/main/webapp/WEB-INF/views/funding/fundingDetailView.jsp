<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12px;
	margin: 0;
	padding: 0;
}

#div-container {
	width: 1050px;
	margin: 0 auto;
}

/* 상단 타이틀 이미지 */
#idx_top {
	position: relative;
	width: 100%;
	height: 180px;
	padding: 50px;
	text-align: center;
	margin-bottom: 100px;
	
}

#idx_top::before {
	content: "";
	background: linear-gradient(to bottom, rgba(255, 255, 255,0.8), rgba(255, 255, 255,0.3) 10%),linear-gradient(to top, rgba(255, 255, 255,0.8), rgba(255, 255, 255,0.3) 10%),url("${pageContext.request.contextPath}/resources/upload_files/funding/${funding.thumbnailChangeName}")
		no-repeat 50% 50%/cover;
	opacity: 0.6;
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
}

#idx_top #category, #idx_top #fpName {
	position: relative;
	color: black;
}

#idx_top #fpName {
	font-size: 30px;
	font-weight: 800;
}

/* 섬네일 & 기본 정보 */
#thumb-img-container {
	width: 450px;
	height: 400px;
	/* background-color: rgb(196, 171, 163); */
	display: inline-block;
	background:
		url("${pageContext.request.contextPath}/resources/upload_files/funding/${funding.thumbnailChangeName}")
		no-repeat 50% 50%/cover;
}

#info-left-container, #info-right-container {
	width: 500px;
	display: inline-block;
	padding-left: 0;
	padding-right: 0;
}

#info-right-container {
	margin-right: 0px;
	margin-left:0px;
	padding-left: 0px;
	padding-right: 0;
	flex:1;
	position : relative;
}
#btn-area{
	position : absolute;
	bottom : 0;
}
#info-right-container p, #goalPersent {
	font-size: 34px;
	line-height: 50px;
	padding-left: 0;
	padding-right: 0;
}

.info-label {
	display: block;
}

#info-container {
	width: 100%;
	padding-left: 0;
	padding-right: 0;
	display: flex;
}

/*추가 이미지*/
#img-container, #content-container {
	margin-top: 50px;
	width: 100%;
}

#img-container {
	padding-left: 0px;
	padding-right: 0px;
}

.img {
	padding-left: 20px;
	padding-right: 20px;
}

.content-img {
	width: 310px;
}

.goalPersent-data span {
	font-size: 24px;
	font-weight: 700;
}

.data label {
	font-size: 18px;
}

.data span {
	font-size: 18px;
}

/* 내용작성 칸 */
#content-container {
	overflow:auto;
}

#btn-funding {
	width: 200px;
	height: 40px;
	border-radius: 5px;
	color: white;
	font-weight: 600;
	background-color: rgb(60, 179, 113);
	transition: all 0.5s;
	border: 1px solid rgb(60, 179, 113);
}

#btn-funding:hover {
	border: 1px solid rgb(60, 179, 113);
	color: rgb(60, 179, 113);
	font-weight: 600;
	background-color: white;
}

#btn-share {
	width: 40px;
	height: 40px;
	border-radius: 5px;
	font-weight: 600;
	color: white;
	transition: all 0.5s;
	background:
		url("${ pageContext.servletContext.contextPath }/resources/imgs/share_green.png")
		no-repeat white;
	border: 1px solid rgb(60, 179, 113);
	background-size: 60%;
	background-position: center;
}

#btn-share:hover {
	border: 1px solid rgb(60, 179, 113);
	color: rgb(60, 179, 113);
	font-weight: 600;
	background:
		url("${ pageContext.servletContext.contextPath }/resources/imgs/share_white.png")
		no-repeat rgb(60, 179, 113);
	background-size: 60%;
	background-position: center;
}

.btnArea {
	padding-top: 10px;
	text-align:right;
}

/*펀딩 굿즈*/
.funding-card {
	border: 1px solid #e8e8e8;
	padding:14px;
}
.fgName{
	font-size:18px;
	font-weight:700;
	margin: 4px 0px 4px 0px;
}
.fgContent{
	font-size:14px;
	margin: 4px 0px 4px 0px;
}
.fgPrice{
	color:#a6a6a6;
	font-size:14px;
	margin: 16px 0 0px 0;
}
/*댓글*/
#replyArea {
	padding-top: 100px;
	padding-bottom:100px;
}
#replyList{
	padding-top:20px;
}
.btn-insert-reply {
	height: 36px;
}

.btn-reply {
	border: none;
	background: white;
	color: gray;
}
.aArea{
	text-align:right;
}
.progressBar{
	margin-bottom:1em;
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
/*슬라이더*/

.slider-1 {
	width: 850px;
	height: 400px;
	margin-top: 10%;
	position: relative;
}

/* 슬라이더 1 - 페이지 버튼 */
.slider-1>.page-btns {
	text-align: center;
	position: absolute;
	bottom: 20px;
	left: 0;
	width: 100%;
}

.slider-1>.page-btns>div {
	width: 20px;
	height: 20px;
	background-color: rgba(255, 255, 255, .5);
	border-radius: 4px;
	display: inline-block;
	cursor: pointer;
}

.slider-1>.page-btns>div.active {
	background-color: rgba(255, 255, 255, 1);
}

/* 슬라이더 1 - 슬라이드 */
.slider-1>.slides>div {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	opacity: 0;
	transition: opacity 0.3s;
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
}

.slider-1>.slides>div.active {
	opacity: 1;
}

/* 슬라이더 좌우 버튼 */
.slider-1>.side-btns>div {
	position: absolute;
	top: 0;
	left: 0;
	width: 25%;
	height: 100%;
	cursor: pointer;
}

.slider-1>.side-btns>div:last-child {
	left: auto;
	right: 0;
}

.slider-1>.side-btns>div>span {
	position: absolute;
	top: 50%;
	left: 20px;
	transform: translatey(-50%);
	background-color: white;
	opacity: 0.5;
	padding: 1px 13px;
	border-radius: 50px;
	font-size: 25px;
}

.slider-1>.side-btns>div:last-child>span {
	left: auto;
	right: 20px;
}
</style>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/gijgo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/slick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/nice-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">

</head>

<body>
	<jsp:include page="../common/menubar.jsp" />

	<!-- 오늘 날짜 -->
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" var="nowDate" pattern="yyyy-MM-dd" />
	
	<!-- 펀딩 시작 날짜 -->
	<fmt:parseDate value="${funding.startDate}" var="startD" pattern="yyyy-MM-dd" />
	<fmt:formatDate value="${funding.startDate}" var="startDate" pattern="yyyy-MM-dd" />
	<!-- 펀딩 끝 날짜 -->
	<fmt:parseDate value="${funding.closeDate }" var="closeD" pattern="yyyy-MM-dd" />
	<fmt:formatDate value="${funding.closeDate }" var="closeDate" pattern="yyyy-MM-dd" />

	<!-- D-day계산하기위한 수식 -->
	<fmt:parseNumber value="${startD.time / (1000*60*60*24)}"
		integerOnly="true" var="strDate" />
	<fmt:parseNumber value="${closeD.time / (1000*60*60*24)}"
		integerOnly="true" var="endDate" />

	<!-- 목표 달성 퍼센트 -->
	<fmt:formatNumber var="goalPersent" value="${funding.raised/funding.goal*100}" pattern="0"/>
	<div id="wrap">
		<div id="div-container">
			<div id="idx_top">
				<input type="hidden" name="fpNo">
				<div name="category" id="category">${funding.categoryName}</div>
				<div name="fpName" id="fpName">${funding.fpName}</div>
			</div>
			<div id="info-container" class="container">
				<div id="info-left-container" class="col-md-6">
					<div id="thumb-img-container"></div>
				</div>
				<div id="info-right-container" class="col-md-6">
					<div class="prices d-flex justify-content-between">
						<p> 
						<c:if
								test="${funding.raised/funding.goal<1 &&(nowDate < startDate || nowDate > closeDate)}">
							펀딩 실패
						</c:if>
						<c:if
								test="${funding.raised/funding.goal>=1 &&(nowDate<startDate || nowDate > closeDate)}">
							펀딩 성공
						</c:if>
						<c:if test="${nowDate>=startDate && nowDate<=closeDate}">
							펀딩 진행중
						</c:if>
						</p>

						<p>
							
							달성률 <span id="goalPersent" name="goalPersent">${goalPersent }</span>%
						</p>
					</div>

					<div id="info">
						<div class="progressBar">
							<span class="progressbar"> 
								<span class="gauge" style="width:${goalPersent}%;">
								</span>	
							</span>
						</div>
					</div>
					<div class="data">
						<label for="raised" class="info-label">모인 금액</label> <span
							id="raised"><span name="raised">${funding.raised}</span>원</span>
						/ <span id="goal"> <span name="goal">${funding.goal}</span>원
						</span>
					</div>
					<div class="data">

						<label for="Dday" class="info-label">펀딩 진행 기간</label> <span>${funding.startDate}~${funding.closeDate}</span>
					</div>
					<div class="data">

						<label for="Dday" class="info-label">남은 기간</label> <span id="Dday">D-
							<spanname="dDay"> <span>${endDate-strDate }</span>
					</div>
					<div class="data">
						<label for="supporter" class="info-label">후원자</label> <span
							id="supporter"><span name="supporter">${funding.numberSupporter}</span>명</span>
					</div>
					<div id="btn-area">
						<input type="button" id="btn-funding" value="후원하기" /> <input
							type="button" id="btn-share" value="  "/>
					</div>
				</div>
			</div>
			
			<div class="slider-1">
				<div class="slides">
				<c:forEach items="${fundingImageList}" var="ImgList" varStatus="status" begin="0">
						<c:choose>
							<c:when test="${status.begin}">
								<div class="active"
									style="background-image:url(${ pageContext.servletContext.contextPath}/resources/upload_files/funding/${ImgList.imgChangeName }?auto=compress,format);"></div>
							</c:when>
							<c:otherwise>
								<div style="background-image:url(${ pageContext.servletContext.contextPath}/resources/upload_files/funding/${ImgList.imgChangeName }?auto=compress,format);"></div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<div class="page-btns">
					<c:forEach items="${fundingImageList }" var="ImgList" varStatus="status">
						<c:choose>
							<c:when test="${ status.begin }">
								<div class="active"></div>
							</c:when>
							<c:otherwise>
								<div></div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<div class="side-btns">
					<div>
						<span class="fas fa-angle-left"><</span>
					</div>
					<div>
						<span class="fas fa-angle-right">></span>
					</div>
				</div>
			</div>
			
			<div id="img-container" class="container">
				<c:if test="${not empty fundingImageList}">
				<fmt:parseNumber value = "${12/(fn:length(fundingImageList))} " pattern = "0" var = "num"/>
					<c:forEach var="img" items="${fundingImageList}">
						<div class="col-md-${num}  img">
							<img src="${pageContext.request.contextPath}/resources/upload_files/funding/${img.imgChangeName}" download="${img.imgOriginName}" alt="" class="content-img">
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div id="content-container">
				<div id="content" class="col-md-8">
					<p>${funding.content}</p>
				</div>
				<div id="funding-goods" class="col-md-4">
					<p>선물</p>
					<hr style="margin-top: 0;">
					<c:forEach var="f" items="${fundingGoodsList}">
						<div class="funding-card">
							<div class="fgName">${f.fgName }</div>
							<div class="fgContent">${f.fgContent}</div>
							<div class="fgPrice">${f.fgPrice}원</div>
						</div>
					</c:forEach>
				</div>
				<div style="clear:both; display:none;"></div>
			</div>
			<c:if test="${loginUser.userId == funding.hostId }">
				<div class="btnArea">
					<input type="button" onclick="location.href='${pageContext.servletContext.contextPath}/funding/${funding.fpNo}/supportForm';" id="btn-update" value="수정">
					<input type="button" id="btn-delete" value="삭제">
				</div>
			</c:if>
			<section id="replyArea" class="reply-container">
				<div id="reply-insert" class="container">
					<div id="reply-insert-info">
						<c:if test="${not empty loginUser}">
							<textarea type="text" id="replyContent" class="col-md-10"
								placeholder="댓글을 입력하세요" style="resize: none;"></textarea>
						</c:if>
						<c:if test="${ empty loginUser}">
							<textarea type="text" id="replyContent" class="col-md-10"
								placeholder="로그인한 유저만 사용할 수 있는 서비스 입니다." style="resize: none;"
								disabled></textarea>
						</c:if>
						<div id="reply-insert-btn">
							<input type="button" id="addReply" class="btn-insert-reply col-md-offset-1 col-md-1" value="등록">
						</div>
					</div>
				</div>
				
				<div id="replyList">
				
				</div>
			</section>
		</div>
	</div>
	<script>
		$(function() {
			selectReplyList();
			
			$("#addReply").click(function() {
				var fpNo = "${funding.fpNo}";

				if ($("#replyContent").val().trim().length != 0) {
					$.ajax({
						url : fpNo + "/reply/insert",
						type : "post",
						data : {
							replyContent : $("#replyContent").val(),
							refFundingNo : fpNo,
							writerId : "${loginUser.userId}"
						},
						success : function(result) {
							if (result > 0) {
								$("#replyContent").val("");
								selectReplyList();

							} else {
								alert("댓글등록실패");
							}
						},
						error : function() {
							console.log("댓글 작성 ajax 통신 실패");
						}
					});

				} else {
					alert("댓글 내용이 비어있습니다.");
				}

			});
		});
		$("#btn-funding").click(function(){
			console.log("${loginUser}");
			if(${ nowDate<startDate || nowDate>closeDate } ){
				alert("현재는 펀딩기간이 아닙니다.");
				return;
			}
			if("${loginUser}"!=""){
				location.href='${pageContext.servletContext.contextPath}/funding/${funding.fpNo}/support';
				return;
			}else{
				alert("로그인이 필요한 서비스입니다.");
				return;
			}

		});
		function deleteReply(fpNo, replyNo) {
			if (confirm("댓글을 삭제하시겠습니까? 예: 삭제, 아니오:삭제 취소")) {
				$.ajax({
					url : fpNo + "/reply/" + replyNo + "/delete",
					type : "get",
					success : function() {
						alert("댓글이 삭제되었습니다.");
						selectReplyList();
					},
					error : function() {
						console.log("댓글 리스트조회용 ajax 통신 실패");
					}
				});
			} else {
				alert("댓글 삭제가 취소되었습니다.");
			}

		}
		
		function selectReplyList() {
			const fpNo = "${funding.fpNo}";
			const nowLink = document.location.href;
			console.log(nowLink);
			$.ajax({
						url : fpNo + "/reply",
						type : "get",
						success : function(fundingReplyList) {
							var value = "";
							$.each(fundingReplyList,function(i, r) {
											value += `<div class="reply-group">
														<input type="hidden" name="replyNo" class="replyNo" value="`+r.replyNo+`">
														<div><span class="replyWriterNickName">`+r.writerNickName+`</span>(<span class="replyWriterId">`+ r.writerId+ `</span>)|<span class="replyCreateDate">`+ r.createDate+ `</span></div>
														<div class="replyContent">`+ r.replyContent+ `</div>`;
												if ("${loginUser.userId}" == r.writerId) {
													value += `<div class="aArea"><button class="btn-reply" onclick="updateReplyArea();">수정</button><button class="btn-reply" onclick="deleteReply(`
															+ fpNo
															+ `,`
															+ r.replyNo
															+ `);">삭제</button></div>`;
												}
												if(i<fundingReplyList.length-1){
													value+=`<hr>`;
												}
												value+=`</div>`;
											});
							$("#replyList").html(value);
						},
						error : function() {
							console.log("댓글 리스트조회용 ajax 통신 실패");
						}
					});

		}
	function updateReplyArea(){
		const idx=$(".reply-group").index(event.target.parentElement.parentElement);
		const content=$(".reply-group").eq(idx).children('.replyContent').html();
		console.log(content);
		
		$(".reply-group").eq(idx).children('.replyContent').html(`<textArea style='width:100%;padding:4px;'>`+content.replaceAll('<br>','\n')+`</textArea>`);
		$(".reply-group").eq(idx).children('.aArea').html(`<button class="btn-reply" onclick="updateReply();">저장</button><button class="btn-reply" onclick="selectReplyList();">취소</button>`);
		
	}
	
	function updateReply(){
		if(confirm("정말로 수정하시겠습니까?")){
		const fpNo = "${funding.fpNo}";
		const idx=$(".reply-group").index(event.target.parentElement.parentElement);
		console.log(idx);
		const content=$(".reply-group").eq(idx).children('.replyContent').children("textArea").val().replaceAll('\n','<br>');
		console.log(content);
		const replyNo=$(".reply-group").eq(idx).children('.replyNo').val();
		console.log(replyNo);
		
		$.ajax({
			url : fpNo + "/reply/"+replyNo+"/update",
			type : "post",
			data:{
				replyContent:content
			},
			success : function() {
				alert("댓글이 수정되었습니다.");
				selectReplyList();
			},
			error : function() {
				console.log("댓글 리스트조회용 ajax 통신 실패");
			}
		});
		
		}
		
	}
	
	$('.slider-1 > .page-btns > div').click(function() {
		var $this = $(this);
		var index = $this.index();

		$this.addClass('active');
		$this.siblings('.active').removeClass('active');

		var $slider = $this.parent().parent();

		var $current = $slider.find(' > .slides > div.active');

		var $post = $slider.find(' > .slides > div').eq(index);

		$current.removeClass('active');
		$post.addClass('active');
	});

	// 좌/우 버튼 추가 슬라이더
	$('.slider-1 > .side-btns > div').click(function() {
		var $this = $(this);
		var $slider = $this.closest('.slider-1');

		var index = $this.index();
		var isLeft = index == 0;

		var $current = $slider.find(' > .page-btns > div.active');
		var $post;

		if (isLeft) {
			$post = $current.prev();
		} else {
			$post = $current.next();
		}
		;

		if ($post.length == 0) {
			if (isLeft) {
				$post = $slider.find(' > .page-btns > div:last-child');
			} else {
				$post = $slider.find(' > .page-btns > div:first-child');
			}
		}
		;

		$post.click();
	});

	setInterval(function() {
		$('.slider-1 > .side-btns > div').eq(1).click();
	}, 3000);
	
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