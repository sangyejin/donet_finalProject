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

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	<!-- Latest compiled JavaScript -->

	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">    
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->

    <style>
   		body{
   			width: 100%;
   		}
        .container{
            width: 100%;
           
        }
        
        .eventBox{
            height: 80px;
            width: 100%;
            border: none;
          
        }
        .statusBox{
            height: 80px;
            width: 80%;
            border: none;
            background-color:rgb(241, 241, 241);
         
        }
        .active{
            background-color: rgb(142, 211, 173);
        }
        button, enrollBtn{
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
        button:hover , enrollBtn:hover {
            transform: scale(1.05);
            box-shadow: 10px 10px 15px rgba(0,0,0,0.3);
        }
        .card-img{
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
              min-height: 400px;
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
            font-size:20px;
            transition:1s;
            cursor:pointer;
          }
         
          .card:hover{
            transform: scale(1.05);
            box-shadow: 10px 10px 15px rgba(0,0,0,0.3);
          }
          .card-text{
            height:30px;  
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
          .container_footer{
              margin-right:220px;
              float:right;
              min-height:100px;
          }
         #icon-search{
             float:left;
             margin:10px ;
         }
         .enrollBtn{
         	max-width:100px;
         	background-color: rgb(142, 211, 173);
         }
        #eventCard{
        	transition:0.5s;
            cursor:pointer;
        	border:1px solid gray;
        }
        #eventCard:hover {
        	transform: scale(1.05);
            box-shadow: 10px 10px 15px rgba(0,0,0,0.3);
        }
         
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
<div class="container mt-2 ">
	<div class="container mt-2 ">
        <div>
            <div id="titleText"><h1>이벤트</h1></div>
            <br>
            <div class="eventBox">
                <button type="button" id="evBox1" class="active" onclick="location.href='list.ev'">진행중인 이벤트</button>
                <button type="button" id="evBox2" onclick="location.href='afterList.ev'">지난 이벤트</button>
            </div> 
            <br>
            <div class="statusBox">
                <p style="text-align:left; margin-left:20px; font-size:30px">진행중인 이벤트</p>
            </div>  
        </div>
        <br>
        <!-- ========================= 
            Main Event Area 
        ========================= --> 
        
        <div class="row">
        	<c:forEach items="${ list }" var="list">
            <div class="col-md-6 col-lg-3 col-xl-3" id="eventCard">
            	<p style="display:none" > ${ list.eventNo } </p>
                <div class="card">
                    <div class="card-img">
                    	 <img src="#" alt="NoImage" >
                    </div>
                    <div class="card-content">
                    	<p class="card-title mt-3 mb-3">${ list.eventTitle }</p>
                        <p class="card-text" style="margin:0 auto" >Start: ${ fn:substring(list.eventStart, 0,10) }  ~  
                            Goal: ${ fn:substring(list.eventLast, 0,10) } </p>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>  
        <br>  
        <!-- ========================= 
            Paging Area 
        ========================= --> 
        
        <div id="pagingArea" style="align:center">
            <ul class="pagination">
                <c:choose>
                    <c:when test="${ pi.currentPage ne 1 }">
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                    </c:otherwise>
                </c:choose>
                
                <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    <c:choose>
                        <c:when test="${ pi.currentPage ne p }">
                            <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">${ p }</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                
                <c:choose>
                    <c:when test="${ pi.currentPage ne pi.maxPage }">
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item disabled"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
        
        <!-- Footer & Search Area -->
        <div class="container_footer">
            <div class="input-group icons">
            
                <form id="searchBoardForm" class="form-inline">
                    <div class="input-group text-center mb-3">
                        <p class="icon-searchBox">
                            <span id="icon-search" class="glyphicon glyphicon-search" ></span>
                            <input name="findBoard" type="search" class="form-control" placeholder="이벤트 검색하기" aria-label="Search Dashboard" style="margin:0 auto"> 
                        </p>
                    </div>
                    <br>
                    
                    <div >
                    	<!--<c:if test="${ loginUser.userRole eq 'D' }">
                    		<a class="btn btn-secondary" style="float:right" href="enroll.ev">이벤트 생성</a>
                    	</c:if>-->
                    	<br>
                    	<br>
                    	<br>
                    	<br>
                    	
                    	<c:if test="${ !empty loginUser }">
                    		<a class="btn btn-secondary" style="float:right" href="enroll.ev">이벤트 생성</a>
                    	</c:if>
                    	
                    </div>  
                                   
                </form>    
            </div>
        </div>
    </div>
</div>
	<script>
		$(function() {
			$(".row #eventCard").click(function(){
				location.href="detail.ev?eno=" + $(this).children().eq(0).text();
			});
		});
	</script>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>