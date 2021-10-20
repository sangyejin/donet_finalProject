<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
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
            height:200px;
            width:100%;
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
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

	<div class="container mt-2 ">
        <h1>이벤트</h1>
        <br>
        <section class="event_view_wrap">
            <header class="statusBox">
                <p style="text-align:left; margin-left:20px; font-size:30px"> ${ ev.eventTitle } </p>
                <p style="font-size:15px; float:right; margin-right:20px">Start:<span> ${ ev.eventStart }</span></p>
                <p style="font-size:15px; float:right; margin-right:20px">Goal:<span> ${ ev.eventLast }</span></p>
            </header>
            <br>
            <br>
            <article> 
                <div class="event_view_info">
                	<p > ${ev.eventContent }</p>
                    <!-- image -->
                    <!-- <img src="${ ev.eventImg }" alt="" style="height:200px; background-color:rgb(241, 241, 241)"> -->
                </div>
                <!-- <div>
                	<p> 첨부파일 </p>
                	
                </div> -->
            </article>
            <br>
            
            <table id="replyArea" class="reply" align="center">
            	<thead>
            		<tr>
            			<c:if test="${ !empty loginUser }">
            				<th>
            					<textarea class="form-control" id="replyContent" row="2" style="resize:none; width:100%" />
            				</th>
            				<th>
            					<button class="btn btn-secondary" id="addReply">등록하기</button>
            				</th>
            			</c:if>
            			<c:if test="${ empty loginUser }">
                        	<th colspan="2" style="width:75%">
	                            <textarea class="form-control" readonly rows="2" style="resize:none; width:100%">로그인한 사용자만 사용가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
	                        </th>
	                        <th style="vertical-align: middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
                        </c:if>
                    </tr>
                    <tr>
                    	<td colspan="3">댓글 (<span id="rcount">0</span>)</td>
                    	
                    </tr>
            	</thead>
            	<tbody>
            	
            	</tbody>
            </table>
            
         
            <div class="btn_event_wrap">
            	<c:if test="${ loginUser.userRole eq 'D' }">
            		<div>
            			<button class="btn btn-primary" onclick="postFormBtn(1);">수정하기</button>
            			<button class="btn btn-danger" onclick="postFormBtn(2);">삭제하기</button>
            		</div>
            		<form id="postForm" method="post" action="">
            			<input type="hidden" name="eno" value="${ ev.eventNo }">
            			<!-- <input type="hidden" name="fileName" value="${ ev.eventNo }"> -->
            		</form>
            	</c:if>
                <input class="btn_event" type="button" value="목록">
            </div>
        </section>  
        
    </div>
   
   <script>
   /*
   		selectReplyList();
   		
   		$("#addReply").click(function(){
   			var eno = ${ev.eventNo};
   			if($("#replyContent").val().trim().length != 0){
   				$.ajax({
   					url:"rinsert.ev"
   				})
   			}
   		})
   		*/
   
   
   
   
   
   
   		function postFormBtn(num){
   			var postForm = ${"#postForm"};
   			if(num == 1){
   				postForm.attr("action", "update.ev");
   			}else {
   				postForm.attr("action", "delete.ev");
   			}
   			postForm.submit();
   		}
   </script>

<jsp:include page="../common/footer.jsp" />
</body>
</html>