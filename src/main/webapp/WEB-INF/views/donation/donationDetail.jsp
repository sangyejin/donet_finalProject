<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon -->
<link rel="icon"
	href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png"
	type="image/x-icon">

<!-- font -->
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">
<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<title>도넷닷컴</title>
<style>
body.dark-theme {
	color: rgb(224, 224, 224);
	background: black;
}

body.dark-theme a {
	color: white;
}

body.dark-theme th {
	color: black;
}

body.dark-theme .btn-toggle {
	border-color: rgb(60, 179, 113);
}

body.light-theme {
	color: black;
	background: white;
}

body.light-theme a {
	color: rgb(60, 179, 113);
}

body.light-theme .top {
	color: white;
}

.outer {
	width: 1050px;
	margin: auto;
}

.top {
	cursor: pointer;
	color: white;
	font-size: 14px;
	background-color: rgb(60, 179, 113);
	border-radius: 5px;
	padding: 7px 5px 7px 7px;
}

.btn-toggle {
	height: 35px;
	cursor: pointer;
	color: rgb(60, 179, 113);
	font-size: 14px;
	background-color: white;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	padding: 7px 5px 7px 7px;
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

.content {
	margin-left: 9%;
	margin-top: 10%;
}

c {
	float: left;
	font-size: 30px;
	font-weight: 800;
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

#thumbnailImg {
	width: 450px;
	height: 350px;
	margin-right: 5%;
	float: left;
}

.detailInfo {
	width: 350px;
	height: 350px;
	display: inline-block;
}

#iconImg {
	float: left;
}

.totalAmount {
	text-align: right;
	margin-top: 5%;
}

#term {
	margin-top: 5%;
}



#writer {
	margin-left: 30%;
}

.dDate {
	width: 80px;
	height: 40px;
	background-color: rgb(233, 196, 106);
	border-radius: 40px;
	color: white;
	text-align: center;
	margin-top: 8%;
	margin-bottom: 2%;
	padding-top:1%;
}

.supporting {
	width: 350px;
	height: 40px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-weight: 600;
	font-size: 15px;
	color: white;
	background-color: rgb(60, 179, 113);
	margin-top: 3%;
	transition: all 0.5s;
}

.supporting:hover {
	width: 350px;
	height: 40px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-weight: 600;
	font-size: 15px;
	color: rgb(60, 179, 113);
	background-color: white;
	margin-top: 3%;
}

f {
	float: left;
	font-size: 30px;
	font-weight: 800;
}

.description {
	margin-top: 5%;
	width: 850px;
}

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

#usePlan {
	font-size: 18px;
	font-weight: 600;
}

#subinfo {
	color: grey;
}

table {
	width: 850px;
	height: 30px;
	margin-top: 5%;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	text-align: center;
	table-layout: fixed;
	word-break: break-all;
}

th {
	background-color: rgb(224, 224, 224);
	border-top: 2px solid #808080;
	border-bottom: 2px solid #808080;
	height: 40px;
	text-align: center;
}

td {
	border-top: 1px solid #808080;
	border-bottom: 1px solid #808080;
	height: 40px;
}

#replyArea>thead>tr>th {
	background-color: rgb(224, 224, 224);
	border-top: 2px solid #808080;
	border-bottom: 2px solid #808080;
}

#comment, #partList {
	font-size: 25px;
	font-weight: 600;
	color: black;
	float: left;
}

c {
	font-size: 25px;
	font-weight: 600;
}

#addReply {
	width: 100px;
	height: 40px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-weight: 600;
	color: white;
	background-color: rgb(60, 179, 113);
	margin-bottom: 0.5%;
	transition: all 0.5s;
}

#addReply:hover {
	width: 100px;
	height: 40px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-weight: 600;
	color: rgb(60, 179, 113);
	background-color: white;
	margin-bottom: 0.5%;
}

#replyContent {
	width: 800px;
	height: 38px;
	border-radius: 7px;
	font-size: 15px;
}

#update {
	width: 40px;
	height: 25px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-weight: 600;
	color: white;
	background-color: rgb(60, 179, 113);
}

#delete {
	width: 40px;
	height: 25px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-weight: 600;
	color: rgb(60, 179, 113);
	background-color: white;
}

#commentTable {
	width: 1050px;
	height: 40px;
	margin-top: 5%;
	table-layout: fixed;
	word-break: break-all;
}

.delArea {
	float: right;
}



#btn-delete {
	width: 100px;
	height: 40px;
	border-radius: 5px;
	color: white;
	font-weight: 600;
	color: rgb(60, 179, 113);
	background-color: white;
	transition: all 0.5s;
	border: 1px solid rgb(60, 179, 113);
}

#btn-delete:hover {
	width: 100px;
	height: 40px;
	border-radius: 5px;
	border: 1px solid rgb(60, 179, 113);
	color: white;
	font-weight: 600;
	color: white;
	background-color: rgb(60, 179, 113);
}
#btn-update {
	width: 100px;
	height: 40px;
	border-radius: 5px;
	border: 1px solid rgb(60, 179, 113);
	color: white;
	font-weight: 600;
	color: white;
	background-color: rgb(60, 179, 113);
	transition: all 0.5s;
}
#btn-update:hover {
	width: 100px;
	height: 40px;
	border-radius: 5px;
	color: white;
	font-weight: 600;
	color: rgb(60, 179, 113);
	background-color: white;
	border: 1px solid rgb(60, 179, 113);
	
}



#deleteBoard:hover {
	cursor: pointer;
	color: white;
	font-size: 13px;
	font-weight: 500;
	background-color: rgb(60, 179, 113);
	width: 80px;
	height: 40px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	float: right;
	margin-right: 3%;
	transition: all 0.5s;
}
</style>
</head>
<body class="dark-theme || light-theme">
	<jsp:include page="../common/menubar.jsp" />

	<div class="outer">
		<div class="title">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb" style="width: 1050px;">
					<li class="breadcrumb-item"><a href="list.do">후원</a></li>
					<li class="breadcrumb-item active" aria-current="page">후원 프로젝트</li>
				</ol>
			</nav>
			<span class="delArea"> <c:if
					test="${loginUser.userRole eq 'D'}">
					<span><button type="button" id="btn-delete" onclick="deleteBoard(${s.suNo});">삭제하기</button></span>
				</c:if>
			</span>
		</div>
		<div class="content">

			<div>
				<img alt=""
					src="${ pageContext.servletContext.contextPath}/resources/upload_files/donation/${s.thumbnailChange}"
					id="thumbnailImg">
			</div>
			<div class="detailInfo" style="text-align: center; width: 350px;">
				<div style="text-align:left;">
					<b style="font-size: 25px;">${s.suTitle}</b>
				</div>
				<div>
					<b style="font-size: 18px;">${s.suWriter}</b>
				</div>
				<div style="margin-top:3%;">
					<span style="float:left; margin-top:5%; width:80px;">
						<img id="iconImg" alt=""
							src="${ pageContext.servletContext.contextPath}/resources/imgs/donation/person.png">
						<c:choose>
							<c:when test="${empty p}"> 0 명 참여</c:when>
							<c:when test="${!empty p}">${p.total } 명 참여</c:when>
						</c:choose>
					</span>
					
					<fmt:formatNumber var="goalPersent" value="${(s.totalamount/s.goal)*100 }" pattern="0"/>
					<span style="float:right; margin-top:5%;">달성률: ${goalPersent} %</span>
				</div>
						<div class="progressBar">
							<span class="progressbar">
								<span class="gauge" style="width:${goalPersent}%;"></span>	
							</span>
						</div>
				<c:choose>
					<c:when test="${empty p}">
						<div class="totalAmount">
							<b style="font-size: 20px;">누적 0 원</b>
						</div>
					</c:when>
					<c:when test="${!empty p}">
						<div class="totalAmount">
							<b style="font-size: 20px;">누적 ${p.sum } 원</b>
						</div>
					</c:when>
				</c:choose>
					
				<div>
					<div id="term">
						<fmt:formatDate value="${s.suStart}" var="suStart"
							pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${s.suLast}" var="suLast"
							pattern="yyyy-MM-dd" />
						<b style="font-size: 20px;">${suStart} ~ ${suLast} 까지</b>
					</div>
				</div>
				<div class="dDate">
					<b style="font-size: 20px;">D - ${s.ddate }<b>
				</div>
				<c:set var="ymd" value="<%=new java.util.Date()%>" /> 
				<fmt:formatDate value="${ymd}" var="ymd" pattern="yyyy-MM-dd" />

				<c:choose>
					<c:when test="${suLast>ymd }">
						<div>
							<input type="button" value="기부하기" class="supporting">
						</div>
					</c:when>
					<c:when test="${suLast<ymd }">
						<div>
							<input type="button" value="모금이 완료된 사연입니다." class="supporting" disabled>
						</div>
					</c:when>
				</c:choose>
				
			</div>
			<div class="description">
				<pre>
${s.content}
	</pre>
			</div>

			<div class="slider-1">
				<div class="slides">
					<c:forEach items="${ ImgList }" var="ImgList" varStatus="status">
						<c:choose>
							<c:when test="${ status.index==0 }">
								<div class="active"
									style="background-image:url(${ pageContext.servletContext.contextPath}/resources/upload_files/donation/${ImgList.imgChangeName }?auto=compress,format);"></div>
							</c:when>
							<c:otherwise>
								<div
									style="background-image:url(${ pageContext.servletContext.contextPath}/resources/upload_files/donation/${ImgList.imgChangeName }?auto=compress,format);"></div>
							</c:otherwise>
						</c:choose>

					</c:forEach>
				</div>
				<div class="page-btns">
					<c:forEach items="${ ImgList }" var="ImgList" varStatus="status">
						<c:choose>
							<c:when test="${ status.index==0 }">
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

			<div style="margin-top: 10%;">
				<span id="usePlan">기부금 사용계획</span> <span id="subinfo"> | 기부금은
					다음과 같이 사용됩니다</span>
				<div id="greenLine" style="width: 850px; margin-right: 11%;"></div>
				<div id="usePlanContent">
					<table>
						<tr>
							<th>구분</th>
							<th>상세 내용</th>
							<th>사용 금액</th>
						</tr>

						<c:forEach items="${ u }" var="u" varStatus="status">
							<tr>
								<td>${u.division }</td>
								<td>${u.content }</td>
								<td>${u.amount }원</td>
								<c:set var="total" value="${total + u.amount}" />
							</tr>
						</c:forEach>
						<tr>
							<td colspan="3" style="text-align: right; font-weight: 600;"><U>목표금액
									: ${total} 원</U>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>
				</div>
			</div>

			<div style="margin-top: 10%;">
				<span id="usePlan">프로젝트 사업정보</span> <span id="subinfo"> | 해당
					후원 프로젝트의 상세정보 입니다</span>
				<div id="greenLine" style="width: 850px; margin-right: 11%;"></div>
				<div id="usePlanContent">
					<table>
						<tr>
							<th>후원 프로젝트 명</th>
							<th>주최자</th>
							<th>모금 기간</th>
							<th>사업대상</th>
							<th>사업기간</th>
						</tr>
						<tr>
							<td>${s.suTitle }</td>
							<td>${s.suWriter }</td>
							<td>${suStart}~${suLast}</td>
							<td>${s.target }</td>
							<fmt:formatDate value="${s.bstart }" var="bstart"
								pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${s.blast }" var="blast"
								pattern="yyyy-MM-dd" />
							<td>${bstart}~${blast}</td>
						</tr>
					</table>
				</div>
			</div>
				<c:choose>
					<c:when test="${suLast>ymd }">
						<div>
							<input type="button" value="기부하기" class="supporting" style="margin: 15% 30%;">
						</div>
					</c:when>
					<c:when test="${suLast<ymd }">
						<div>
							<input type="button" value="모금이 완료된 사연입니다." class="supporting" style="margin: 15% 30%;" disabled>
						</div>
					</c:when>
				</c:choose>
		</div>
		<div style="margin-top: 10%;">
			<span><a id="comment">댓글&nbsp;&nbsp; </a></span>
			<div id="greenLine" style="margin-bottom: 5%;"></div>
			<c:if test="${ !empty loginUser }">
				<div>
					<span style="margin-top: -5%; font-size:25px;">${ sessionScope.loginUser.userId}</span>
					<span style="margin-left: 3%;"><input type="text"
						id="replyContent" placeholder="내용을 입력해주세요"></span> <span style=""><input
						type="button" class="btn btn-secondary" id="addReply" value="댓글등록"></span>
				</div>
			</c:if>
			<c:if test="${ empty loginUser }">
				<div>
					<span style="margin-top: -5%;"><d>${ sessionScope.loginUser.userId}</d></span>
					<span style="margin-left: 7%;"><input type="text"
						id="replyContent" placeholder="도넷닷컴의 회원이 되어주세요!" disabled></span>
					<span style=""><input type="button"
						class="btn btn-secondary" id="addReply" style="width: 100px;"
						value="댓글등록"></span>
				</div>
			</c:if>
			<table id="replyArea" class="table" align="center">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성일</th>
						<th colspan="1">아이디</th>
						<th colspan="6">댓글(<span id="rcount">0</span>)
						</th>
						<th></th>
						<th colspan='2'></th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<div style="margin-top: 10%;">
				<span><a id="partList">참여내역</a></span>
				<div id="greenLine"></div>
				<div style="height: 50px;"></div>
				<table id="commentTable" style="">
					<tr>
						<th>번호</th>
						<th>작성일</th>
						<th colspan="2">아이디</th>
						<th colspan="8">참여내역</th>
					</tr>

					<c:forEach items="${ pList }" var="pList" varStatus="status">
						<c:set var="no" value="${no+1 }" />
						<tr>

							<td>${no }</td>
							<td>${pList.payDate }</td>
							<td colspan="2">${pList.userId }</td>
							<td colspan="8"">${pList.amount }원참여</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

	</div>
	<!-- 댓글 수정 시 모달 -->
	<div class="modal fade" id="modifyModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="reply_no">댓글 번호</label> <input class="form-control"
							id="reply_no" name="reply_no" readonly>
					</div>
					<div class="form-group">
						<label for="reply_date">댓글 작성일</label> <input class="form-control"
							id="reply_date" name="reply_date" readonly>
					</div>
					<div class="form-group">
						<label for="reply_text">댓글 내용</label> <input class="form-control"
							id="reply_text" name="reply_text" placeholder="댓글 내용을 입력해주세요">
					</div>
					<div class="form-group">
						<label for="reply_writer">댓글 작성자</label> <input
							class="form-control" id="reply_writer" name="reply_writer"
							readonly>
					</div>
					<div class="form-group" style="visibility: hidden;">
						<label for="reply_rno">댓글 고유번호</label> <input class="form-control"
							id="reply_rno" name="reply_rno" readonly>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-success modalModBtn"
						onclick="updateReply();">수정</button>
				</div>
			</div>
		</div>
	</div>

	<script>
	<!--ajax 댓글작성-->
		$(function() {
			selectReplyList();

			$("#addReply").click(function() {
				var suNo = "${s.suNo}";

				if ($("#replyContent").val().trim().length != 0) {

					$.ajax({
						url : "insert.re",
						type : "post",
						data : {
							replyContent : $("#replyContent").val(),
							refBoardNo : suNo,
							replyWriter : "${loginUser.userId}"
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
					alert("댓글을 입력해주세요");
				}

			});
		});

		function selectReplyList() {

			var suNo = "${s.suNo}";

			$.ajax({
						url : "list.re",
						data : {suNo : suNo},
						type : "get",
						success : function(commentList) {
									$("#rcount").text(commentList.length);


									var num = commentList.length
									var value = "";
									$.each(commentList, function(i, obj) {


												value += "<tr>"
															+ "<td>"+ num--+ "</td>"
															+ "<td>"+ obj.createDate+ "</td>"
															+ "<td colspan='1'>"+ obj.replyWriter+ "</td>"
															+ "<td colspan='6' style='text-align:left;'>"+ obj.replyContent+ "</td>"

												if ("${loginUser.userId}" == obj.replyWriter) {
													value += "<td colspan='2' style='border-top: 1px solid #808080;'>"
																+ "<div>"
																	+ "<span style='margin-left:60px;'><input type='submit' id='delete' value='삭제' onclick='deleteReply("+ obj.replyNo+ ")'></span>"
																	+ "<span style='display:inline-block; float:right;'><button id='update' data-toggle='modal' data-target='#modifyModal'>수정</button></span>"
																+ "</div>"
															+ "</td>";
												} else {
													value += "<td></td><td></td>";
												}
												value += "<td style='visibility:hidden; border-bottom: 1px solid #808080;'>"+ obj.replyNo+ "</td></tr>";
											});
							$("#replyArea tbody").html(value);
						},
						error : function() {
							console.log("댓글 리스트조회용 ajax 통신 실패");
						}
					});
		}

		function deleteReply(replyNo) {
			if (confirm("댓글을 삭제하시겠습니까?(Y/N)")) {
				$.ajax({
					url : "delete.re/" + replyNo,
					type : "get",
					success : function() {
						alert("댓글이 삭제되었습니다");
						selectReplyList();
					},
					error : function() {
						console.log("댓글 리스트조회용 ajax 통신 실패");
					}
				});
			} else {
				alert("댓글 삭제가 취소되었습니다");
			}
		}

		$(document).on("click", "#update", function() {
			var row = $(this).parent().parent().parent().parent();
			var tr = row.children();

			var replyNo = tr.eq(0).text();
			var createDate = tr.eq(1).text();
			var replyWriter = tr.eq(2).text();
			var replyContent = tr.eq(3).text();
			var replyRno = tr.eq(5).text();

			$(".modal-body #reply_no").val(replyNo);
			$(".modal-body #reply_date").val(createDate);
			$(".modal-body #reply_writer").val(replyWriter);
			$(".modal-body #reply_text").val(replyContent);
			$(".modal-body #reply_rno").val(replyRno);
		});

		function updateReply() {
			if (confirm("댓글을 수정하시겠습니까?(Y/N)")) {
				const suNo = "${s.suNo}";
				console.log(suNo);
				const content = $('#reply_text').val();
				console.log(content);
				const replyNo = $('#reply_rno').val();
				console.log(replyNo);

				$.ajax({
					url : "update.re/" + suNo + "/" + replyNo,
					type : "post",
					data : {
						replyContent : content
					},
					success : function() {
						alert("댓글이 수정되었습니다");
						selectReplyList();
					},
					error : function() {
						console.log("댓글 리스트조회용 ajax 통신 실패");
					}
				});
			}

		}
	</script>
	<script>
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
	<jsp:include page="../common/footer.jsp" />
	<div class="subMenu">
		<div
			style="display: scroll; position: fixed; bottom: 10px; right: 5px;">
			<a href="#" class="top">Top▲</a>
		</div>
		<div
			style="display: scroll; position: fixed; bottom: 3px; right: 60px;">
			<button class="btn-toggle">Dark-Mode</button>
		</div>
	</div>
	<script>
		$('.supporting').click(function(){
			if(${ empty sessionScope.loginUser }){
				alert("로그인이 필요한 서비스 입니다.");
				location.href="loginForm.me";
				 
			}else{
				location.href='supporting?suNo=${s.suNo}';
				
			}
		});
	</script>
	<script type="text/javascript">
		$(window).scroll(function() {
			if ($(this).scrollTop() > 400) {
				$('.subMenu').fadeIn();
			} else {
				$('.subMenu').fadeOut();
			}
		});

		$('.top').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});

		const btn = document.querySelector('.btn-toggle');
		btn.addEventListener('click', function() {
			document.body.classList.toggle('light-theme');
		});
	</script>
	
	<script>
		function deleteBoard(suNo) {
			if (confirm("정말로 게시글을 삭제하시겠습니까?(Y/N)")) {
				$.ajax({
					url : "delete.do/" + suNo,
					type : "get",
					success : function() {
						alert("게시글이 삭제되었습니다");
						document.location.href='delete.do/${s.suNo}';
					},
					error : function() {
						console.log("ajax 통신 실패");
					}
				});
			} else {
				alert("게시글 삭제가 취소되었습니다");
			}
		}	
	</script>
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>