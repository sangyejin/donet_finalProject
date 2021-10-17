<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선행활동</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <style>
         .container{
            width: 80%;
           
        }
        
        .btn_volunteer{
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
            width: 100px;
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
         hr{
            margin: 0 auto;
            width: 50%;
            color:black;
            border: 0.5px solid;
            
          }
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

  <div class="container mt-2 ">
     <div class="container mt-2 ">
        <!--   <div class="card card-block mb-2">
            <h4 class="card-title">Card 1</h4>
            <p class="card-text">Welcom to bootstrap card styles</p>
            <a href="#" class="btn btn-primary">Submit</a>
          </div>   -->
        <div >
            <div id="titleText"><h1>선행활동</h1></div>
            <br>
            <div class="btn_volunteer">
                <input type="button" id="allBtn" value="전체" class="active" />
                <input type="button" id="seaBtn" value="바다" />
                <input type="button" id="mountinBtn" value="산" />
                <input type="button" id="villageBtn" value="동네" />
                <input type="button" id="animalBtn" value="동물" />
                <form>
                    <section>
                        <option value="최신순"></option>
                        <option value="오래된순"></option>
                    </section>
                </form>
            </div> 
            <br>
            <!--
            <div class="statusBox">
                <p style="text-align:left; margin-left:20px; font-size:30px"></p>
            </div>  
            -->
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
            <br>
        <!-- ========================= 
            Paging Area 
        ========================= --> 
        <div id="pagingArea">
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
            <hr>
            <br>

            <!-- Footer Search Area -->
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