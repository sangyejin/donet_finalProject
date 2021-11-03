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
        input{
            transition:0.5s;
            cursor:pointer;
            margin-top: 18px;
            margin-right: 30px;
            margin-left: 30px;
            float: center;
            width: 400px;
            height: 40px;
            border: none;
            background-color: rgb(241, 241, 241);
        }
        input:hover{
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
	                	<!--<c:if test="${ !empty at }">
		                	<c:forEach var="at" items="${ at }">
		                		
		                		<!-- <img src="${ pageContext.servletContext.contextPath }/resources/upload_files/event/${at.changeName}" alt="No" > -->
		                		<!--<br><br>
		                	</c:forEach>
	                	</c:if> -->
	                	</div>
	                	<br>
                    <!-- image -->
                    
                </div>
               
                <!-- <div>
                	<p> 첨부파일 </p>
                	
                </div> -->
                <br>
         
            <table id="replyArea" class="reply" align="center">
            	<thead>
            		<tr>
            			<c:if test="${ !empty loginUser }">
            				<th colspan="2" style="width:80%">
            					<textarea class="form-control" id="replyContent" row="2" style="resize:none; width:100%" ></textarea>
            					
            				</th>
            				<th>
            					<input type="button" class="btn col-md-offset-1 col" id="addReply" value="등록">
            				</th>
            			</c:if>
            			<c:if test="${ empty loginUser }">
                        	<th colspan="2" style="width:80%">
	                            <textarea class="form-control" rows="2" style="resize:none; width:100%" readonly>로그인한 사용자만 사용가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
	                        </th>
	                        <th style="vertical-align: middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
                        </c:if>
                    </tr>
                    <tr>
                    	<td colspan="3">댓글 (<span id="rcount">0</span>)</td>
                    	
                    </tr>
            	</thead>
            	<tbody id="replyZone">
            	
            	</tbody>
            </table>
             <script>
   $(function(){
	   selectReplyList();
	   
   		$("#addReply").click(function(){
   			var eno = ${ev.eventNo};
   			
   			if($("#replyContent").val().trim().length != 0){
   				$.ajax({
   					url:"rinsert.ev",
   					type:"post",
   					data:{eventReplyContent:$("#replyContent").val(),
   							refEventNo:eno,
   							eventReplyWriter:"${loginUser.userId}"   							
   					},
   					success:function(result){
   						if(result > 0){
   							console.log("댓글 작성성공 ");
   							$("#replyContent").val("");
   							selectReplyList();
   						}else{
   							alert("댓글등록실패 ");
   							console.log("댓글 작성실패 ");
   						}
   					},
   					error:function(){
   						console.log("댓글 작성 ajax 통신실패");
   					}
   				});
   			}else {
   				alert("댓글을 등록 하세요");
   			}
   		});
   });
   
   function selectReplyList(){
	   var eno = "${ev.eventNo}";
	   $.ajax({
		   url:"rlist.ev",
		   data:{eno:eno},
		   type:"get",
		   success:function(replyList){
			   $("#rcount").text(replyList.length);
			   
			   var value="";
			   
			   $.each(replyList, function(i, er){
				   value += "<tr class='replyArea'>" +  
					    "<th class='replyWriter'>" + er.eventReplyWriter + "</th>" +
			   			"<td class='replyContent'>" + er.eventReplyContent + "</td>" + 
			   			"<td class='replyDate'>" + er.eventReplyDate + "</td>" +
			   			"<td class='replyNo' style='display:none;'>"+ er.eventReplyNo +"</td>";
				   
				   if("${loginUser.userId}" == obj.eventReplyWriter){
				   	value += "<td><input type='button' class='replyBtn' onclick='updateReplyForm();' value='수정'></td>" +
							"<td><input type='button' class='replyBtn' onclick='deleteReply("eno + ',' + er.eventReplyNo");' value='삭제'></td>" +
						   	"</tr>";
				   }else{
						value += "</tr>";
				   }
			   });
			   $("#replyZone").html(value);
		   }, 
		   error:function(){
			   console.log("댓글 리스트 조회용 ajax 통신실패 ");
		   }
	   });
   };
   function updateReplyForm(){
	   const idx = $(".replyArea").index(event.target.parentElement.parentElement);
	   const content = $(".replyArea").eq(idx).children('replyContent').html();
	   
	   $(".replyArea").eq(idx).children(".replyContent").html('<textarea style="width100%">' + content.replaceAll('<br>', '\n') + '</textarea>');
	   $(".replyArea").eq(idx).children(".replyDate").html('<input type="button" class="replyBtn" onclick="updateReply();" value="수정"> <input type="button" class="replyBtn" onclick="selectReplyList();" value="취소">'); 
	   
   }
   function updateReply(){
	   var eno = "${ev.eventNo}";
	   var idx = $(".replyArea").index(event.target.parentElement.parentElement);
	   var content = $(".replyArea").eq(idx).children(".replyContent").children("textarea").val().replaceAll("\n", "<br>");
	   var replyNo = $(".replyArea").eq(idx).children(".replyNo").val();
	   console.log(replyNo);
	   
	   $.ajax({
		   url :"updateReply.ev",
		   type : "post",
		   data : { replyContent:content },
		   success : function(){
			   alert("댓글이 수정되었습니다");
			   selectReplyList();
		   },
		   error : function(){
			   console.log("댓글 수정실패 ajax ");
		   }
	   });
   }
   function deleteReply(eno, replyNo){
	   if(confirm("댓글을 삭제하시겠습니까?")){
		   $.ajax({
			   url :"deleteReply.ev",
			   type : "get",
			   success : function(){
				   alert("댓글이 삭제되었습니다 ");
				   selectReplyList();
			   },
			   error : function(){
				   console.log("댓글 삭제 ajax 실패 ");
			   }
		   });
	   }else {
		   alert("댓글 삭제가 취소되었습니다 ");
	   }
   }
  
   </script>
         
            <div class="btn_event_wrap">
            	
	            	<c:if test="${ !empty loginUser }">
	            		<div>
	            			<button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
	            			<button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
	            		</div>
		            	<form id="postForm" method="post" action="">
	            			<input type="hidden" name="eno" value="${ ev.eventNo }">
	            			<!-- <input type="hidden" name="fileName" value="${ ev.eventNo }"> -->
						</form>
						<script>
	            		function postFormSubmit(n){
	            			var post = $("#postForm");
	            			if(n == 1){
	            				post.attr("action", "updateForm.ev");
	            			}else{
	            				post.attr("action", "delete.ev");
	            			}
	            			post.submit();
	            		}
	            		</script>            		
	            	</c:if>
	            	
            	
                <input class="btn_event" type="button" value="목록" onclick="location.href='list.ev'">
            </div>
        </section>  
       
    </div>
   
  

<jsp:include page="../common/footer.jsp" />
</body>
</html>