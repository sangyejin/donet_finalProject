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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
* {
	/* font-family: 'Gugi', cursive;*/
	/*font-family: 'Song Myung', serif;*/
	/* font-family: 'Nanum Gothic Coding', monospace; */
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
	background:
		url("${pageContext.request.contextPath}/resources/upload_files/funding/${funding.thumbnailChangeName}")
		no-repeat 50% 50%/cover;
	opacity: 0.4;
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
	padding-left: 0;
	padding-right: 0;
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
	/* height: 400px; */
	width: 100%;
	padding-left: 0;
	padding-right: 0;
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

#btnArea {
	padding-top: 10px;
}

/*펀딩 굿즈*/
.funding-card {
	border: 1px solid gray;
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
}
</style>
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
							달성률 <span id="goalPersent" name="goalPersent">${funding.raised/funding.goal*100}</span>%
						</p>
					</div>

					<div id="info">
						<div class="progress">
							<div class="progress-bar progress-bar-success" role="progressbar"
								aria-valuenow="${funding.raised/funding.goal*100}"
								aria-valuemin="0" aria-valuemax="100"
								style="width: ${funding.raised/funding.goal*100}%">
								${funding.raised/funding.goal*100}</div>
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
						<input type="button" onclick="location.href='${pageContext.servletContext.contextPath}/funding/${funding.fpNo}/supportForm';" value="후원하기" /> <input
							type="button" id="btShare" value="  " />
					</div>
				</div>
			</div>
			<div id="img-container" class="container">
				<c:if test="${not empty fundingImage}">
					<c:forEach var="img" items="${fundingImageList}" varStatus="status">
						<div class="col-md-${(fn:length(fundingImageList))/2} img">
							<img
								src="${pageContext.request.contextPath}/resources/upload_files/funding/${img.imgChangeName }"
								alt="" class="content-img">
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div id="content-container">
				<div id="content" class="col-md-9">
					<p>${funding.content}</p>
				</div>
				<div id="funding-goods" class="col-md-3">
					<c:forEach var="f" items="${fundingGoodsList}">
						<div class="funding-card">
							<div class="fgName">${f.fgName }</div>
							<div class="fgPrice">${f.fgPrice}원</div>
							<p class="fgContent">${f.fgContent}</p>
						</div>
					</c:forEach>
				</div>
			</div>
			<c:if test="${loginUser.userId == funding.hostId }">
				<div class="btnArea">
					<input type="button" onclick="location.href='${pageContext.servletContext.contextPath}/funding/${funding.fpNo}/supportForm';" value="수정">
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
							<input type="button" id="addReply"
								class="btn-insert-reply col-md-offset-1 col-md-1" value="등록">
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
			var fpNo = "${funding.fpNo}";
			var nowLink = document.location.href;
			console.log(nowLink);
			$
					.ajax({
						url : fpNo + "/reply",
						type : "get",
						success : function(fundingReplyList) {
							$("#rcount").text(fundingReplyList.length);

							var value = "";
							$.each(
										fundingReplyList,
										function(i, r) {
											value += `<div class="reply-group">
														<input type="hidden" name="replyNo">
														<div>`+r.writerNickName+`(`+ r.writerId+ `)|`+ r.createDate+ `</div>
														<div>`+ r.replyContent+ `</div>`;
												if ("${loginUser.userId}" == r.writerId) {
													value += `<div class="aArea"><button class="btn-reply" onclick="updateReply();">수정</button><button class="btn-reply" onclick="deleteReply(`
															+ fpNo
															+ `,`
															+ r.replyNo
															+ `);">삭제</button></div>`;
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
		function updateReply(event){
			console.log(event.currentTarget);
		}
	</script>
</body>

</html>