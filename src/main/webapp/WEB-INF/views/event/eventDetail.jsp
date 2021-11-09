<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도넷닷컴</title>

	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">    
   
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>  
	    
    <style>
       *{
        margin:0 auto;
      }
        body{
          width: 100%;
          height: 100%;
          margin: 0 auto;
        }
        .container{
            width: 80%;
           
        }
        
        .eventBox{
            height: 80px;
            width: 80%;
            border: 1px solid black;
          
        }
        .event_view_wrap{
            height: 80px;
            width: 80%;
            border: none;
            background-color:rgb(241, 241, 241);
         
        }
        .active{
            background-color: rgb(142, 211, 173);
        }
        button{
            transition:0.5s;
            cursor:pointer;
            float: center;
            width: 50px;
            height: 40px;
            border: none;
            
        }
       button:hover{
            transform: scale(1.05);
            box-shadow: 10px 10px 15px rgba(0,0,0,0.3);
        }
        img{
            height:80%;
            width:80%;
          }
          
          div[class^="col-"]{
            margin : 15px;
            padding: 0;
          }
          
          .row{
              display: table;
              text-align: center;
          }
          [class*="col-"] {
              
              display: table-cell;
              vertical-align: top;
          }

          .card{
            transition:0.5s;
            cursor:pointer;
          }
          .card-title{  
            font-size:15px;
            transition:1s;
            cursor:pointer;
          }
         
          .card:hover{
            transform: scale(1.05);
            box-shadow: 10px 10px 15px rgba(0,0,0,0.3);
          }
          .card-text{
            height:80px;  
          }
          
          .card::before, .card::after {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            transform: scale3d(0, 0, 1);
            transition: transform .3s ease-out 0s;
            background: rgba(255, 255, 255, 0.1);
            content: '';
            pointer-events: none;
          }
          .card::before {
            transform-origin: left top;
          }
          .card::after {
            transform-origin: right bottom;
          }
          .card:hover::before, .card:hover::after, .card:focus::before, .card:focus::after {
            transform: scale3d(1, 1, 1);
          }
          .boardCard{
            max-height:300px;
            width:100%;
          }
          .event_view_info{
              min-width: 800px;
              min-height: 800px;
              background-color: rgb(241, 241, 241);
          }
          .btn_event{
              float: right;
              font-size: 15px;
              width: 80px;
              height: 40px;
              
          }
          .statusBox{
          		text-align:left;
          }
          .event_view_info{
          		text-align:center;
          }
          .event_view_title{
	          height: 80px;
	          width: 80%;
	          border: none;
	          background-color:rgb(241, 241, 241);
          }
          .dateArea{
          		float:right;
          		height:0 auto;
          		padding-top: 15px;
          		padding-right: 20px;
          }
          .titleBox{
          		padding-top: 15px;
          		padding-bottom: 30px;
          		padding-left: 20px;
          }
         
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

	<div class="container mt-2 ">
        <h1>이벤트</h1>
        <br>
       <article class="event_view_title"> 
            <header class="statusBox">
                <p class="titleBox" style="font-size:30px"> ${ ev.eventTitle }
                	<span class="dateArea"> Goal : ${ fn:substring(ev.eventStart, 0,10) } ~ Start: ${ fn:substring(ev.eventStart, 0,10) } </span>
            	</p>
            </header>
        </article>
            <br>
            <br>
            <section class="event_view_wrap">
                <div class="event_view_info">
	                <div class="contentArea">
	               	<p> ${ ev.eventContent } </p>
	                	
	                </div>
	                <br>
                  	<br>
            		<br>
                </div>
                <br>
				<section id="replyArea" class="reply-container">
					<div id="reply-insert" class="container">
						<div id="reply-insert-info">
							<c:if test="${not empty loginUser}">
								<textarea type="text" id="replyContent" class="col-md-10"
									placeholder="댓글을 입력하세요" style="resize: none;"></textarea>
								<button type="button" id="addReply" class="btn-insert-reply" value="등록">등록</button>
							</c:if>
							<c:if test="${ empty loginUser}">
								<textarea type="text" id="replyContent" class="col-md-10"
									placeholder="로그인한 유저만 사용할 수 있는 서비스 입니다." style="resize: none;"
									disabled></textarea>
							</c:if>
							
						</div>
					</div>
					
					<div id="replyList">
					
					</div>
				</section>
            
            <br>
            <br>
            <div class="btn_event_wrap">
            	
	            	<c:if test="${ !empty loginUser }">
	            		<div>
	            			<button class="btn btn-primary" onclick="updateForm();">수정</button>
	            			<button class="btn btn-danger" onclick="deleteEvent();">삭제</button>
	            		</div>
		            	<form id="postForm" method="post" action="">
	            			<input type="hidden" name="eno" value="${ ev.eventNo }">
	            			<input type="hidden" name="fileName" value="${ ev.eventChange }"> 
						</form>
						<script>
						var post = $("#postForm");
	            		function updateForm(){
	            			post.attr("action", "updateForm.ev");
	            			post.submit();
	            		}
	            		function deleteEvent(){
	            			swal.fire({
	        	                title: '확인', 
	        	                text: "정말 게시글을 삭제하시겠습니까?", 
	        	                type: 'warning', 
	        	                confirmButtonText: '삭제', 
	        	                showCancelButton: true,     
	        	                cancelButtonText: '취소', 
	        	                cancelButtonColor: "#f3969a",
	        	                confirmButtonColor: "#3cb371"
	        	            }).then(function(result) { 
	        	                if(result.value) {             
	        	                
	        	                	post.attr("action", "delete.ev");
	        						swal.fire(
	        							{title: '삭제',
	        							 text: '성공적으로 삭제되었습니다.',
	        							 type: 'success',
	        							 confirmButtonColor: "#78c2ad"}).then(function(result){
	        			
	        						$("#postForm").submit();
	        					});
	        	                
	        	            } else if(result.dismiss === 'cancel') { 
	        	                swal.fire('취소', '삭제가 취소되었습니다.', 'error');
	        	         
	        	            }
	        	        });
	            		}
	            		</script>            		
	            	</c:if>
	            
                <input class="btn_event" type="button" value="목록" onclick="location.href='list.ev'">
            </div>
        </section>  
       
    </div>
   
<script>
		$(function() {
			selectReplyList();
			
			$("#addReply").click(function() {
				var eno = "${ev.eventNo}";

				if ($("#replyContent").val().trim().length != 0) {
					$.ajax({
						url : eno + "/rinsert.ev",
						type : "post",
						data : {
							eventReplyContent : $("#replyContent").val(),
							refEventNo : eno,
							eventReplyWriter : "${loginUser.userId}"
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
		function deleteReply(eno, replyNo) {
			if (confirm("댓글을 삭제하시겠습니까? 예: 삭제, 아니오:삭제 취소")) {
				$.ajax({
					url : eno + "/event/" + replyNo + "/deleteReply.ev",
					type : "get",
					data : {"eno":eno,
							"replyNo":replyNo},
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
			const eno = "${ev.eventNo}";
			const nowLink = document.location.href;
			console.log(nowLink);
			$.ajax({
						url : eno + "/rlist.ev",
						type : "get",
						success : function(eventReplyList) {
							var value = "";
							$.each(eventReplyList,function(i, r) {
												if("${loginUser.userId}" != r.eventReplyWriter){
													value +=`<div class="reply-group">
														<input type="hidden" name="replyNo" class="replyNo" value="`+r.eventReplyNo+`"/>
														&emsp;&emsp;<div style="display:inline-block; text-align:left;"><span class="replyWriterNickName">`+r.eventReplyWriter+`</span>&emsp; : &emsp;</div>
														<div style="display:inline-block;" class="replyContent">`+ r.eventReplyContent+ `</div>
													<div style="display:inline-block; text-align:right;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span class="replyCreateDate">`+ r.eventReplyDate+ `</span></div>`;
												}else if ("${loginUser.userId}" == r.eventReplyWriter) {
													value +=
														`<div class="reply-group">
														<input type="hidden" name="replyNo" class="replyNo" value="`+r.eventReplyNo+`"/>
															&emsp;&emsp;<div style="display:inline-block; text-align:left;"><span class="replyWriterNickName">`+r.eventReplyWriter+`</span>&emsp; : &emsp;</div>
															<div style="display:inline-block;" class="replyContent">`+ r.eventReplyContent+ `</div>
														<div style="display:inline-block; text-align:right;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span class="replyCreateDate">`+ r.eventReplyDate+ `</span></div>
														<div class="aArea" style="display:inline-block;"> <button class="btn-reply" onclick="updateReplyArea();">수정</button>
														<button class="btn-reply" onclick="deleteReply(`+ eno + `,`	+ r.eventReplyNo+ `);">삭제</button></div></div>`;
												}
												if(i< eventReplyList.length-1){
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
		const content=$('.replyContent').html();
		console.log(content);
		
		$(".reply-group").eq(idx).children('.replyContent').html(`<textArea style='width:100%;padding:4px;'>`+content.replaceAll('<br>','\n')+`</textArea>`);
		$(".reply-group").eq(idx).children('.aArea').html(`<button class="btn-reply" onclick="updateReply();">저장</button><button class="btn-reply" onclick="selectReplyList();">취소</button>`);
		
	}
	
	function updateReply(){
		if(confirm("정말로 수정하시겠습니까?")){
		const eno = "${ev.eventNo}";
		const idx=$(".reply-group").index(event.target.parentElement.parentElement);
		console.log(idx);
		const content=$(".reply-group").eq(idx).children('.replyContent').children("textArea").val().replaceAll('\n','<br>');
		console.log(content);
		const replyNo=$(".reply-group").eq(idx).children('.replyNo').val();
		console.log(replyNo);
		
		$.ajax({
			url : eno + "/event/" + replyNo + "/updateReply.ev",
			type : "post",
			data:{
				eventReplyContent:content
				
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
	</script>  
	<br>
	<br>
    <br>
	<br>

<jsp:include page="../common/footer.jsp" />
</body>
</html>