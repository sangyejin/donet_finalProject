<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- favicon -->
<link rel="icon"
	href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png"
	type="image/x-icon">

<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">
    
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 

	
	

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
	margin-left: 0%;
	margin-top: 10%;
}

c {
	float: left;
	font-size: 30px;
	font-weight: 800;
}

#totalAmount {
	text-align: right;
}


#thumbnailImg {
	width: 450px;
	height: 350px;
	margin-right: 5%;
	float: left;
}

.detailInfo {
	width: 1050px;
	height: 100px;
	display: inline-block;
}

#total {
	flex: 2;
	margin-top: 13%;
}

.totalAmount {
	text-align: right;
	margin-top: 8%;
	margin-right: 5%;
	font-weight: 800;
}

#term {
	margin-top: 3%;
	margin-left: 8%;
}

z {
	font-size: 18px;
	font-weight: 400;
}

h {
	font-size: 25px;
	font-weight: 800;
}

d {
	font-size: 22px;
	font-weight: 600;
}

#writer {
	margin-left: 0%;
}

.dDate {
	width: 80px;
	height: 40px;
	background-color: rgb(233, 196, 106);
	border-radius: 40px;
	color: white;
	text-align: center;
	margin-top: 13%;
	margin-left: 8%;
}

#submit {
	width: 100px;
	height: 40px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-weight: 600;
	color: white;
	background-color: rgb(60, 179, 113);
	margin-top: 5%;
	margin-left: 8%;
	transition: all 0.5s;
}

#submit:hover {
	width: 300px;
	height: 40px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-weight: 600;
	color: rgb(60, 179, 113);
	background-color: white;
	margin-top: 5%;
	margin-left: 8%;
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
	margin-left: 5%;
	float: right;
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
	margin-left: 5%;
}

#reContent {
	width: 800px;
	height: 38px;
	border-radius: 7px;
	font-size: 15px;
}

d {
	font-size: 20px;
	font-weight: 400;
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

#registration, #toEdit, #reviewDelete {
	cursor: pointer;
	color: rgb(60, 179, 113);
	font-size: 13px;
	font-weight: 500;
	background-color: white;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	float: right;
	margin-right: 3%;
	transition: all 0.5s;
}
.event_view_info{
	min-width: 800px;
	min-height: 800px;
	background-color: rgb(241, 241, 241);
	float: center;
}

#info-container {
	width: 100%;
	padding-left: 0;
	padding-right: 0;
	display: flex;
	margin-bottom:100px;
}

</style>
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<body class="dark-theme || light-theme">
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">
		<div class="title">
		<span><c>후원 후기> 상세 보기</c></span>
		
		<c:if
			test="${loginUser.userRole eq 'A'||loginUser.userRole eq 'B'||loginUser.userRole eq 'C'}">
		<span><button type="button" id="registration"
				onclick="location.href='supportReviewWrite.me'">후기 작성</button></span>
		</c:if>
		

		
		<div id="greenLine"></div>
	</div>
		<div class="content">

			<div class="detailInfo">
				
				<div class="flaot-right" id="reCount" style="float:right;">
					<d>조회수 : ${ rv.reCount }</d> 
				</div>
				
				<div class="flaot-right" id="reComentCount" style="float:right;">
					<d>댓글수 : <span id="rcount" style="font-size:20px;">0</span>  &emsp;|&emsp; </d>
				</div>	
			
				<div class="text" id="reTitle">
					<h>제목 : ${ rv.reTitle } </h>
				</div>
							
				<div id="userId">
					<d>작성자 : ${ rv.userId } </d>
				</div>
						
				<div class="title" id="reDate">
					<span><d>후기 작성할 날짜 : ${ rv.reDate } </d></span>											
				</div>		
				<c:if test="${ !empty loginUser }">
					<%-- <span><button type="button" id="toEdit"
						onclick="location.href='${pageContext.servletContext.contextPath}/member/${rv.reNo}/supportReviewUpdateForm';">수정하기</button></span>
						 --%>
					<span><button type="button" id="toEdit"
						onclick="location.href = 'supportReviewUpdateForm.me?reNo=${rv.reNo}'">수정하기</button></span>	
				
					<span><button type="button" id="reviewDelete"
						onclick= 'deleteReview("${rv.reNo}")'>삭제하기</button></span>	
						
					<form id="postReviewInfo" method="post" action="">
						<input type="hidden" name="reviewNum" value="${ rv.reNo }">
					</form>	
					
					
								
				</c:if>
			</div>
			<div class="description" id="info-container">
				
				<div class="event_view_info" style="float:center;">
	                <div class="contentArea" >
	               	<p> ${ rv.reContent} </p>
	                	</div>
	                	<br>
                    <!-- image -->
                    
                </div>
				
				
			</div>

			

		</div>
		
					<c:if test="${fn:length(at) != 0}">
			<div class="slider-1">
				<div class="slides">
				<c:forEach items="${at}" var="ImgList" varStatus="status" begin="0">
						<c:choose>
							<c:when test="${status.begin==0}">
								<div class="active"
									style="background-image:url(${ pageContext.servletContext.contextPath}/resources/upload_files/${ImgList.imgChangeName }?auto=compress,format);"></div>
							</c:when>
							<c:otherwise>
								<div style="background-image:url(${ pageContext.servletContext.contextPath}/resources/upload_files/${ImgList.imgChangeName }?auto=compress,format);"></div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<div class="page-btns">
					<c:forEach items="${at}" var="ImgList" varStatus="status" begin="0">
						<c:choose>

							<c:when test="${status.begin==0 }">

							

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
						<span class="fas"><</span>
					</div>
					<div>
						<span class="fas">></span>
					</div>
				</div>
			</div>
		</c:if>
		
		<div style="margin-top: 10%;">
			<span><a id="comment" href="">댓글&nbsp;&nbsp; </a></span>
			<div id="greenLine" style="margin-bottom: 5%;"></div>
                    	<c:if test="${ !empty loginUser }">
					<div>
						<span style="margin-top: -5%;"><d>${ sessionScope.loginUser.userId}</d></span>
						<span style="margin-left: 3%;"><input type="text"
							id="reContent" placeholder="내용을 입력해주세요"></span> <span
							style=""><input type="submit" class="btn btn-secondary" id="addReply" value="댓글등록"></span>
					</div>
                        </c:if>
                        <c:if test="${ empty loginUser }">
					<div>
						<span style="margin-top: -5%;"><d>${ sessionScope.loginUser.userId}</d></span>
						<span style="margin-left: 7%;"><input type="text"
							id="reContent" placeholder="도넷닷컴의 회원이 되어주세요!" disabled></span> <span
							style=""><input type="submit" class="btn btn-secondary" id="addReply" style="width:100px;" value="댓글등록" ></span>
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
		 				<label for="reply_no">댓글 번호</label> 
		 				<input class="form-control" id="reply_no" name="reply_no" readonly> 
		 			</div> 
		 			<div class="form-group"> 
		 				<label for="reply_date">댓글 작성일</label> 
		 				<input class="form-control" id="reply_date" name="reply_date" readonly> 
		 			</div> 
					<div class="form-group"> 
						<label for="reply_text">댓글 내용</label>
		  				<input class="form-control" id="reply_text" name="reply_text" placeholder="댓글 내용을 입력해주세요"> 
		  			</div> 
		  			<div class="form-group"> 
		  				<label for="reply_writer">댓글 작성자</label> 
		  				<input class="form-control" id="reply_writer" name="reply_writer" readonly> 
		  			</div>
		  			<div class="form-group" style="visibility:hidden;"> 
		  				<label for="reply_rno">댓글 고유번호</label> 
		  				<input class="form-control" id="reply_rno" name="reply_rno" readonly> 
		  			</div>
				</div> 
				<div class="modal-footer"> 
					<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button> 
					<button type="button" class="btn btn-success modalModBtn" onclick="updateReply();">수정</button> 
				</div> 
			</div> 
		</div>
	</div>
	
     <script>
     <!--ajax 댓글작성-->
		$(function() {
			selectReplyList();

			$("#addReply").click(function() {
				var reNo = "${rv.reNo}";

				if ($("#reContent").val().trim().length != 0) {

					$.ajax({
						url : "insertReComent.me",
						type : "post",
						data : {
							reContent : $("#reContent").val(),
							reBno : reNo,
							reWriter : "${loginUser.userId}"
						},
						success : function(result) {
							if (result > 0) {
								$("#reContent").val("");
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

			var reNo = "${rv.reNo}";
			console.log(reNo)
			$.ajax({
						url : "rvList.me",
						dataType : "json",
						contentType: "application/json; charset=utf-8",
						headers: { 
						    Accept : "application/json"
						},
						data : {reNo : reNo},
						type : "get",
						success : function(commentList) {
									$("#rcount").text(commentList.length);


									var num = commentList.length
									var value = "";
									$.each(commentList, function(i, obj) {


												value += "<tr>"
															+ "<td>"+ num--+ "</td>"
															+ "<td>"+ obj.reCreateDate+ "</td>"
															+ "<td colspan='1'>"+ obj.reWriter+ "</td>"
															+ "<td colspan='6' style='text-align:left;'>"+ obj.reContent+ "</td>"

												if ("${loginUser.userId}" == obj.reWriter) {
													value += "<td colspan='2' style='border-top: 1px solid #808080;'>"
																+ "<div>"
																	+ "<span style='margin-left:60px;'><input type='submit' id='delete' value='삭제' onclick='deleteReply("+ obj.reNo+ ")'></span>"
																	+ "<span style='display:inline-block; float:right;'><button id='update' data-toggle='modal' data-target='#modifyModal'>수정</button></span>"
																+ "</div>"
															+ "</td>";
												} else {
													value += "<td></td><td></td>";
												}
												value += "<td style='visibility:hidden; border-bottom: 1px solid #808080;'>"+ obj.reNo+ "</td></tr>";
											});
							$("#replyArea tbody").html(value);
						},
						error : function() {
							console.log("댓글 리스트조회용 ajax 통신 실패");
							console.log(reNo)
						}
					});
		}
    	
    	function deleteReply(reNo){
    		if (confirm("댓글을 삭제하시겠습니까?(Y/N)")) {
				$.ajax({
					url : "reReplydelete.me/"+reNo,
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
    	
    	$(document).on("click", "#update", function () { 
    		var row = $(this).parent().parent().parent().parent();
    		var tr = row.children();
    		
    		var reNo = tr.eq(0).text();
    		var reCreateDate = tr.eq(1).text();
    		var reWriter = tr.eq(2).text();
    		var reContent = tr.eq(3).text();
    		var reBno = tr.eq(5).text();
    		
    		$(".modal-body #reply_no").val( reNo ); 
    		$(".modal-body #reply_date").val( reCreateDate ); 
    		$(".modal-body #reply_writer").val( reWriter ); 
    		$(".modal-body #reply_text").val( reContent ); 
    		$(".modal-body #reply_rno").val( reBno ); 
		 });
    	
    	function updateReply(){
    		if(confirm("댓글을 수정하시겠습니까?(Y/N)")){
    		const reNo = "${rv.reNo}";
    		console.log("댓글 번호"+reNo);
    		const reContent=$('#reply_text').val();
    		console.log(reContent);
    		const reBno=$('#reply_rno').val();
    		console.log(reBno);
    		
    		$.ajax({
    			url : "reReviewupdate.me/"+reBno+"/"+reNo,
    			type : "post",
    			data:{
    				reContent:reContent
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
    
    function deleteReview(reNo){
		if (confirm("후기을 삭제하시겠습니까?(Y/N)")) {
			$.ajax({
				url : "Reviewdelete.me/"+reNo,
				type : "get",
				success : function() {
					alert("후기가 삭제되었습니다");
					location.href="supportReviewList.me";
				},
				error : function() {
					console.log("댓글 리스트조회용 ajax 통신 실패");
				}
			});
		} else {
			alert("후기 삭제가 취소되었습니다");
		}	
	}
    
    
    /* function fixReview(reNo){
		if (confirm("후기을 삭제하시겠습니까?(Y/N)")) {
			$.ajax({
				url : "Reviewdelete.me/"+reNo,
				type : "get",
				success : function() {
					alert("후기가 삭제되었습니다");
					location.href="supportReviewList.me";
				},
				error : function() {
					console.log("댓글 리스트조회용 ajax 통신 실패");
				}
			});
		} else {
			alert("후기 삭제가 취소되었습니다");
		}	
	} */
    
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
	
	
</body>
</html>