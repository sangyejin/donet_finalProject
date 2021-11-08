<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도넷닷컴</title>
	
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- Latest compiled and minified CSS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	
      <style>
   		body{
   			width: 100%;
   		}
        .container{
            width: 100%;
           
        }
        
     
        #statusArea{
            height: 80px;
            width: 100%;
            border: none;
         
        }
        .active{
            background-color: rgb(142, 211, 173);
        }
        button, enrollBtn{
            transition:0.5s;
            cursor:pointer;
            float: center;
            width: 120px;
            height: 40px;
            border: none;
            background-color: rgb(241, 241, 241);
        }
        button:hover , enrollBtn:hover {
            transform: scale(1.05);
            box-shadow: 10px 10px 15px rgba(0,0,0,0.3);
        }
         #card-img{
            height:200px;
            width:100%;
            padding: 0;
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
          
          .card-title{  
            font-size:20px;
            transition:1s;
            cursor:pointer;
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
            border: none;
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
        #volCard{
        	transition:0.5s;
            cursor:pointer;
        	margin: 50px;
        	padding: 0;
        }
        #volCard:hover{
        	transform: scale(1.05);
            box-shadow: 10px 10px 15px rgba(0,0,0,0.3);
        }
         #searchBtn{
         	transition:0.5s;
         	cursor:pointer;
            padding: 0;
         }
         #searchBtn:hover{
         	transform: scale(1.05);
            box-shadow: 10px 10px 15px rgba(0,0,0,0.3);
        
         }
        #card-img img{
        	height:100%;
        	width:100%;
        }
        .card{
        	text-align:center;
        }
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

  <div class="container mt-2 ">
     <div class="container mt-2 ">
        <div class="col-md-2">
            <div class="col-md-2" id="titleText"><h1>선행활동</h1></div>
            <br>
            <form method="post" class="categoryForm">
	            <div id="statusArea">
	                <button type="button" id="allBtn" value="전체" class="active" > 전체 </button>
	                <button type="button" id="seaBtn" value="바다" > 바다 </button>
	                <button type="button" id="mountinBtn" value="산" > 산 </button>
	                <button type="button" id="villageBtn" value="동네" > 동네 </button>
	                <button type="button" id="animalBtn" value="동물" > 동물 </button>
	                <button type="button" id="etcBtn" value="기타" > 기타 </button>
	            </div>
            </form> 
            <div>
            	<form method="post">
                    <select id="selectBox" onchange="selectSort();">
                        <option type="button" id="newBtn" value="desc">최신순</option>
                        <option type="button" id="oldBtn" value="asc">오래된순</option>
                    </select>
                </form>
            </div>
            <br>
           
        </div>
        <br>
        <div class="row">
            <div class="card-deck" id="boardCard">
            <c:forEach items="${ list }" var="vo">
            	<p style="display:none" > ${ vo.volNo } </p>
                <div class="card col-md-8" id="volCard">
                    <div class="card-img-top col-md-4 col-lg-3 col-xl-3" id="card-img" >
                    	<img src="${pageContext.request.contextPath}/resources/upload_files/${vo.volChange}"  alt="" class="content-img" >
                    </div> 
                    <div class="card-body">
	       	        	<p class="card-title mt-3 mb-3">${ vo.volTitle }</p>
	                	<p class="card-user">${ vo.volWriter }</p>
	                	<p class="card-data">조회수 : ${ vo.volCount } <span>좋아요 : 0 </span></p> 
                	</div>
                </div>
        	</c:forEach>
            </div>
            <br>
	    </div>
	     <hr>
	     <br>
         <!-- Footer Search Area -->
        		<div class="header-left">
                    <div class="input-group icons">
                    <form id="searchForm" class="form-inline" method="post">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                        </div>
                        <div class="input-group text-center mb-3">
                        	<input name="keyword" type="search" class="form-control" placeholder="게시글 검색하기" aria-label="Search Dashboard">
                        	<div class="input-group-append">
                        		<input id="searchBtn" class="btn" type="submit" onclick="getSearchList()" value="검색">
                        	</div>
                        </div>
                    </form>    
                    </div>
                </div>
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
        <div class="btn btnArea">
        	<c:if test="${ !empty loginUser }">
            	<a class="btn btn-secondary" style="float:right" href="enroll.vo">선행활동 작성</a>
            </c:if>
        
        </div>
    </div>
</div>
    <script>
    function selectSort(){
    	var sort = document.getElementById("selectBox");
    	
    	sort = sort.options[sort.selectedIndex].value;
    	if(sort == "desc"){
    		$.ajax({
        		url: "list.vo",
        		type: "post",
        		cache: false,
        		data: {"sort": sort},
        		success: function(data){
        			console.log(data);
        			$("body").html(data);
        		},
        		error: function(data){
        			alert("error");
        		}
        	});	
    	}else{
    		$.ajax({
        		url: "sort.vo",
        		type: "post",
        		cache: false,
        		data: {"sort": sort},
        		success: function(data){
        			console.log(data);
        			$("body").html(data);
        		},
        		error: function(data){
        			alert("error");
        		}
        	});	
    	}
    	
    }
    
    
    $('#statusArea button').click(function(){
    	var chose = $(this).val();
    	if(chose == "전체"){
    		$.ajax({
        		url: "list.vo",
        		type: "post",
        		cache: false,
        		data: {"chose": chose},
        		success: function(data){
        			console.log(data);
        			$("body").html(data);
        		},
        		error: function(data){
        			alert("error");
        		}
        	});
    	}else{
    		$.ajax({
        		url: "choseList.vo",
        		type: "post",
        		cache: false,
        		data: {"chose": chose},
        		success: function(data){
        			console.log(data);
        			$("body").html(data);
        		},
        		error: function(data){
        			alert("error");
        		}
        	});
    	}
      });
    
    $(function() {
		$(".row #boardCard").click(function(){
			location.href="detail.vo?vno=" + $(this).children().eq(0).text();
		});
	});
    
    function getSearchList(){
    	var search = $(this).val();
    	$.ajax({
    		type: "post",
    		url : "search.vo",
    		cache: false,
    		data: {"search":search},
    		success : function(data){
    			$("body").html(data);
    		},
    		error: function(data){
    			alert("error");
    		}
    	});
    }
    </script>

<jsp:include page="../common/footer.jsp" />
</body>
</html>