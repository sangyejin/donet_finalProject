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
       <article class="vol_view_title"> 
       		
        		<div class="vol_view_wrap">
        		<p style="display:none" > ${ vo.volNo } </p>
            		<div class="statusBox">
		                <!-- 게시글 제목 -->
		                <p style="text-align:left; margin-left:20px; font-size:30px">${vo.volTitle }</p>
		                <!-- 게시글 작성자 -->
		                <span style="font-size:15px; float:left; margin-left:23px">${ vo.volWriter } </span>
		                <!-- 게시글 작성일 -->
		                <span style="font-size:15px; float:left; margin-left:23px">${vo.volDate }</span>
		                <!-- 게시글 추천 & 조회수 -->
		                <span style="font-size:15px; float:right; margin-right:30px; padding-right:10px" class="likeP">추천 : 0 </span>
		                <span style="font-size:15px; float:right; margin-right:30px">조회수 : ${vo.volCount } </span>
            		</div>
        		</div>
        	
        </article>
            <br>
            <br>
            <section class="vol_view_wrap">
                <div class="vol_view_info">
	                <div class="contentArea">
	               		${vo.volContent }
	                	
	                	</div>
	                	<br>
                   
                    <div class="view_info_hashtag">
                        <!-- hashtag area-->
                        <span style="padding-right: 10px;">#해쉬태그</span>
                        <span style="padding-right: 10px;">#해쉬태그</span>
                        <span style="padding-right: 10px;">#해쉬태그</span>
                        <span style="padding-right: 10px;">#해쉬태그</span>
                        <span style="padding-right: 10px;">#해쉬태그</span>
                        <span style="padding-right: 10px;">#해쉬태그</span>
                        <button class="w3-button w3-black w3-round" id="likeBtn">
	                       	<i class="fa fa-heart" style="font-size:15px">&nbsp;</i>
	                    </button>
                        <!-- 
                        <c:choose>
                        	<c:when test="${ nLike == 0 }">
	                        	<button class="w3-button w3-black w3-round" id="likeBtn">
	                        	<i class="fa fa-heart-o" style="font-size:15px">&nbsp;</i>
	                        	</button>
	                        	<input type="hidden" id="likeCheck" value="${ nLike }" />
                        	</c:when>
                        	<c:when test="${ nLike == 1 }">
                        		<button class="w3-button w3-black w3-round" id="likeBtn">
	                        	<i class="fa fa-heart" style="font-size:15px">&nbsp;</i>
	                        	</button>
	                        	<input type="hidden" id="likeCheck" value="${ nLike }" />
                        	</c:when>
                        </c:choose>
                         -->
                        <br>
                        <hr align="center">
                    </div>
                </div>
               
                <br>
         
            <table id="replyArea" class="reply" align="center">
            	<thead>
            		<tr>
            			<c:if test="${ !empty loginUser }">
            				<th colspan="2" style="width:80%">
            					<textarea class="form-control" id="replyContent" row="2" style="resize:none; width:100%" ></textarea>
            					
            				</th>
            				<th>
            					<button class="btn btn-secondary" id="addReply">등록하기</button>
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
            	<tbody class="replyZone">
            	
            	</tbody>
            </table>
             <script>
   $(function(){
	   selectReplyList();
   		$("#addReply").click(function(){
   			var vno = "${vo.volNo}";
   			
   			if($("#replyContent").val().trim().length != 0){
   				$.ajax({
   					url:"rinsert.vo",
   					type:"post",
   					data:{eventReplyContent:$("#replyContent").val(),
   							volRefNo : vno,
   							eventReplyWriter:"${loginUser.userId}"   							
   					},
   					success:function(result){
   						if(result > 0){
   							$("#replyContent").val("");
   							selectReplyList();
   						}else{
   							alert("댓글등록실패 ");
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
	   var eno = "${vo.volNo}";
	   $.ajax({
		   url:"rlist.vo",
		   data:{vno:vno},
		   type:"get",
		   success:function(list){
			   $("#rcount").text(list.length);
			   
			   var value="";
			   
			   $.each(list, function(i, er){
				   value += "<tr>"
					    "<th>" + vr.volReplyWriter + "</th>" +
			   			"<td>" + vr.volReplyContent + "</td>" + 
			   			"<td>" + vr.volReplyDate + "</td>" ;
				   
				   if("${loginUser.userId}" == obj.volReplyWriter){
				   	value += "<td><input type='button' class='replyBtn' onclick='updateReply();' value='수정'></td>" +
							"<td><input type='button' class='replyBtn' onclick='deleteReply();' value='삭제'></td>" +
						   	"</tr>";
				   }else{
						value += "</tr>";
				   }
			   });
			   $(".replyZone").html(value);
		   }, 
		   error:function(){
			   console.log("댓글 리스트 조회용 ajax 통신실패 ");
		   }
	   });
   };
   
  
   </script>
         
            <div class="btn_event_wrap">
            	
	            	<c:if test="${ !empty loginUser }">
	            		<div>
	            			<button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
	            			<button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
	            		</div>
		            	<form id="postForm" method="post" action="">
	            			<input type="hidden" name="vno" value="${ vo.volNo }">
						</form>
						<script>
	            		function postFormSubmit(n){
	            			var post = $("#postForm");
	            			if(n == 1){
	            				post.attr("action", "updateForm.vo");
	            			}else{
	            				post.attr("action", "delete.vo");
	            			}
	            			post.submit();
	            		}
	            		</script>            		
	            	</c:if>
	            	
            	
                <input class="btn_event" type="button" value="목록" onclick="location.href='list.vo'">
            </div>
        </section>  
       
    </div>
   
  

<jsp:include page="../common/footer.jsp" />
</body>
</html>

