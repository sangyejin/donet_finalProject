<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
    <style>
        .container{
            width: 80%;
           
        }
        
        .eventBox{
            height: 80px;
            width: 80%;
            border: 1px solid black;
          
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
          .container_footer{
              margin-right:220px;
              float:right;
              min-height:100px;
             
          }
         #icon-search{
             float:left;
             margin:10px ;
             
         }
         .icon-searchBox{
             background-color: rgb(142, 211, 173);
         }
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
   <div class="container mt-2 ">
        <!--   <div class="card card-block mb-2">
            <h4 class="card-title">Card 1</h4>
            <p class="card-text">Welcom to bootstrap card styles</p>
            <a href="#" class="btn btn-primary">Submit</a>
          </div>   -->
        <div >
            <div id="titleText"><h1>이벤트</h1></div>
            <br>
            <div class="eventBox">
                <input type="button" id="evBox1" value="진행중인 이벤트" class="active"></input>
                <input type="button" id="evBox2" value="지난 이벤트"></input>
            </div> 
            <br>
            <div class="statusBox">
                <p style="text-align:left; margin-left:20px; font-size:30px">진행중인 이벤트</p>
            </div>  
        </div>
        <br>
        <div class="row">
            <div class="col-md-6 col-lg-3 col-xl-3">
                <div class="card ">
                    <div class="boardCard">
                        <div style="height: 200px; background-color:rgb(241, 241, 241);"><h2>Image</h2></div> <!-- img area -->
                        <h5 class="card-title mt-3 mb-3">Sierra Web Development • Owner</h5>
                        <p class="card-text">This is a company that builds websites, web apps and e-commerce solutions.</p> 
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 col-xl-3">
                <div class="card ">
                    <div class="boardCard">
                        <div style="height: 200px; background-color:rgb(241, 241, 241);"><h2>Image</h2></div> <!-- img area -->
                        <h5 class="card-title mt-3 mb-3">Sierra Web Development • Owner</h5>
                        <p class="card-text">This is a company that builds websites, web apps and e-commerce solutions.</p> 
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 col-xl-3">
                <div class="card ">
                    <div class="boardCard">
                        <div style="height: 200px; background-color:rgb(241, 241, 241);"><h2>Image</h2></div> <!-- img area -->
                        <h5 class="card-title mt-3 mb-3">Sierra Web Development • Owner</h5>
                        <p class="card-text">This is a company that builds websites, web apps and e-commerce solutions.</p> 
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 col-xl-3">
                <div class="card ">
                    <div class="boardCard">
                        <div style="height: 200px; background-color:rgb(241, 241, 241);"><h2>Image</h2></div> <!-- img area -->
                        <h5 class="card-title mt-3 mb-3">Sierra Web Development • Owner</h5>
                        <p class="card-text">This is a company that builds websites, web apps and e-commerce solutions.</p> 
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 col-xl-3">
                <div class="card ">
                    <div class="boardCard">
                        <div style="height: 200px; background-color:rgb(241, 241, 241);"><h2>Image</h2></div> <!-- img area -->
                        <h5 class="card-title mt-3 mb-3">Sierra Web Development • Owner</h5>
                        <p class="card-text">This is a company that builds websites, web apps and e-commerce solutions.</p> 
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 col-xl-3">
                <div class="card ">
                    <div class="boardCard">
                        <div style="height: 200px; background-color:rgb(241, 241, 241);"><h2>Image</h2></div> <!-- img area -->
                        <h5 class="card-title mt-3 mb-3">Sierra Web Development • Owner</h5>
                        <p class="card-text">This is a company that builds websites, web apps and e-commerce solutions.</p> 
                    </div>
                </div>
            </div>
            
        </div>    
        <div class="container_footer">
            <div class="input-group icons">
                <form id="searchBoardForm" class="form-inline">
                    <div class="input-group text-center mb-3">
                        <p class="icon-searchBox">
                            <span id="icon-search" class="glyphicon glyphicon-search" ></span>
                            <input name="findBoard" type="search" class="form-control" placeholder="전체 게시글 검색하기" aria-label="Search Dashboard" style="margin:0 auto"> 
                        </p>
                    </div>                    
                </form>    
            </div>
        </div>
    </div>
    <script>
    $('input').click(function(){
        if($(this).hasClass("active")){
          $(this).removeClass("active");
        }else{
          $(this).addClass("active");  
        }
      });
    </script>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>