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
            width: 100%;
           
        }
       
        .statusBox{
            height: 80px;
            width: 88%;
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
            height: 40px;
            border: none;
            background-color: none;
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

          .event_view_info{
              min-width: 800px;
              min-height: 800px;
              
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
          .contentArea{
          		min-height: 400px;
          }
         .btn_vol{
         	margin-right:150px;
            float: right;
            width: 100px;
         }
         #addPoint, #pointBtn{
         	height: 30px;
         }
        
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

	<div class="container mt-2 ">
        <h1 style="margin-left:20px; ">선행활동</h1>
        <br>
       <article class="vol_view_title"> 
        		<div class="vol_view_wrap">
        		<p style="display:none" > ${ vo.volNo } </p>
            		<div class="statusBox">
		                <!-- 게시글 제목 -->
		                <p style="text-align:left; margin-left:20px; font-size:30px">${vo.volTitle }
		                	<c:if test="${not empty loginUser}">
			                	<span style="float:right; margin-right:40px;"> 
					                <c:if test="${ vo.volPoint == 0 }">
									    <button type="button" id="pointBtn" >포인트지급</button> 	
									</c:if>
								</span>
								<span >
								    <c:if test="${ vo.volPoint > 0 }">
								      	<img src="${pageContext.request.contextPath}/resources/imgs/full_logoearth.png" style="width:30px; height:30px;">
								    </c:if>
						        </span>
						    </c:if>
		                </p>
		                <!-- 게시글 작성자 -->
		                <span style="font-size:15px; float:left; margin-left:23px">${ vo.volWriter } </span>
		                <!-- 게시글 작성일 -->
		                <span style="font-size:15px; float:left; margin-left:23px">${vo.volDate }</span>
		                <!-- 게시글 조회수 -->
		                <span style="font-size:15px; float:right; margin-right:30px">조회수 : ${vo.volCount } </span>
            		</div>
        		</div>
        </article>
            <br>
           
            <br>
            <section class="vol_view_wrap">
                <div class="vol_view_info">
	                <div class="contentArea"> ${vo.volContent }</div>
	            <br>
                </div>
                <br>
            <section id="replyArea" class="reply-container">
				<div id="reply-insert" class="container" style="margin:0">
					<div id="reply-insert-info">
						<c:if test="${not empty loginUser}">
							<textarea type="text" id="replyContent" class="col-md-10"
								placeholder="댓글을 입력하세요" style="resize: none;"></textarea>
								
							<button type="button" id="addReply" class="btn-insert-reply">등록</button>
						
						</c:if>
						<c:if test="${ empty loginUser}">
							<textarea type="text" id="replyContent" class="col-md-10"
								placeholder="로그인한 유저만 사용할 수 있는 서비스 입니다." style="resize: none; margin-right:800px;"
								disabled></textarea>
						</c:if>
					
					</div>
				</div>
				<br>
				<br>
				
				<div id="replyList">
				
				</div>
			</section>
         	<br>
         	<br>
         	<br>
         	
            <div class="btn_event_wrap">
            	
	            	<c:if test="${ !empty loginUser}">
	            		<c:if test="${ vo.volPoint <= 0 }">
	            		<div>
	            			<button class="btn btn-primary" onclick="updateForm();">수정</button>
	            			<button class="btn btn-danger" onclick="deleteVol();">삭제</button>
	            			<button class="btn_vol" type="button" onclick="location.href='list.vo'">목록</button>
	            		</div>
		            	<form id="postForm" method="post" action="">
	            			<input type="hidden" name="vno" value="${ vo.volNo }">
	            			<input type="hidden" name="fileName" value="${ vo.volChange }"> 
	            			
						</form>
						<script>
	            		var post = $("#postForm");
	            		function updateForm(){
	            			post.attr("action", "updateForm.vo");
	            			post.submit();
	            		}
	            		function deleteVol(){
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
	        	                
	        	                	post.attr("action", "delete.vo");
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
	            		<c:if test="${ vo.volPoint > 0 }">
	            			<button class="btn btn-danger" disabled>인증받은 글은 수정및 삭제가 불가능합니다.</button>
	            			
		            		<button class="btn_vol" type="button" onclick="location.href='list.vo'">목록</button>
            			</c:if>         		
	            	</c:if>
	            	
                
            </div>
        </section>  
       
    </div>
   
<script>
	$(function(){
		$("#pointBtn").click(function(){
			var vno = "${vo.volNo}";
			var point = "${vo.volPoint}"
			if(confirm('포인트를 지급하시겠습니까?')){
				$.ajax({
					url: vno + "/addPoint.vo",
					type: "post",
					data: {volPoint : point, volNo : vno},
					success: function(result){
						alert("포인트 지급이 완료되었습니다. 더이상 수정 및 삭제가 불가능합니다.");
					},
					error: function(){
						alert("포인트 지급 실패 ");
					}
				});
			}
			
		});
	})

	
		$(function() {
			selectReplyList();
			
			$("#addReply").click(function() {
				var vno = "${vo.volNo}";

				if ($("#replyContent").val().trim().length != 0) {
					$.ajax({
						url : vno + "/rinsert.vo",
						type : "post",
						data : {
							volReplyContent : $("#replyContent").val(),
							volRefNo : vno,
							volReplyWriter : "${loginUser.userId}"
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
		function deleteReply(vno, replyNo) {
			if (confirm("댓글을 삭제하시겠습니까? 예: 삭제, 아니오:삭제 취소")) {
				$.ajax({
					url : vno + "/volunteer/" + replyNo + "/deleteReply.vo",
					type : "get",
					data : {"vno":vno,
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
			const vno = "${vo.volNo}";
			const nowLink = document.location.href;
			console.log(nowLink);
			$.ajax({
						url : vno + "/rlist.vo",
						type : "get",
						success : function(volReplyList) {
							var value = "";
							$.each(volReplyList,function(i, r) {
												if("${loginUser.userId}" != r.volReplyWriter){
													value +=`<div class="reply-group">
														<input type="hidden" name="replyNo" class="replyNo" value="`+r.volReplyNo+`"/>
														&emsp;&emsp;<div style="display:inline-block; text-align:left;"><span class="replyWriterNickName">`+r.volReplyWriter+`</span>&emsp; : &emsp;</div>
														<div style="display:inline-block;" class="replyContent">`+ r.volReplyContent+ `</div>
													<div style="display:inline-block; text-align:right;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span class="replyCreateDate">`+ r.volReplyDate+ `</span></div>`;
												}else if ("${loginUser.userId}" == r.volReplyWriter) {
													value +=
														`<div class="reply-group">
														<input type="hidden" name="replyNo" class="replyNo" value="`+r.volReplyNo+`"/>
															&emsp;&emsp;<div style="display:inline-block; text-align:left;"><span class="replyWriterNickName">`+r.volReplyWriter+`</span>&emsp; : &emsp;</div>
															<div style="display:inline-block;" class="replyContent">`+ r.volReplyContent+ `</div>
														<div style="display:inline-block; text-align:right;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span class="replyCreateDate">`+ r.volReplyDate+ `</span></div>
														<div class="aArea" style="display:inline-block;"> <button class="btn-reply" onclick="updateReplyArea();">수정</button>
														<button class="btn-reply" onclick="deleteReply(`+ vno + `,`	+ r.volReplyNo+ `);">삭제</button></div></div>`;
												}
												if(i< volReplyList.length-1){
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
		const vno = "${vo.volNo}";
		const idx=$(".reply-group").index(event.target.parentElement.parentElement);
		console.log(idx);
		const content=$(".reply-group").eq(idx).children('.replyContent').children("textArea").val().replaceAll('\n','<br>');
		console.log(content);
		const replyNo=$(".reply-group").eq(idx).children('.replyNo').val();
		console.log(replyNo);
		
		$.ajax({
			url : vno + "/volunteer/" + replyNo + "/updateReply.vo",
			type : "post",
			data:{
				volReplyContent:content
				
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
  

<jsp:include page="../common/footer.jsp" />
</body>
</html>

