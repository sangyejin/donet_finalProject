<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
    <style>
        .container{
            width: 80%;
            text-align: center;
            
        }
        
        .eventBox{
            height: 80px;
            width: 80%;
            border: 1px solid black;
          
        }
        .vol_view_wrap{
            height: 80px;
            display: inline-block;
            width: 80%;
            border: none;
            background-color:rgb(241, 241, 241);
         
        }
        .active{
            background-color: rgb(142, 211, 173);
        }
        .form-group{
            text-align: left;
        }
        .replyBtn{
            transition:0.5s;
            cursor:pointer;
            width: 100px;
            height: 40px;
            border: none;
            background-color: rgb(235, 235, 235);
            float: left;
        }
        .replyBtn:hover{
            transform: scale(1.05);
            box-shadow: 10px 10px 15px rgba(0,0,0,0.3);
        }
        #replyContent_Input{
            min-width: 400px;
            width: 700px;
            height: 40px;
            border: none;
            background-color: rgb(241, 241, 241);
        }
       
        img{
            height:200px;
            width:100%;
          }
          
          div[class^="col-"]{
            margin : 15px;
            padding: 0;
            width: 100%;
            
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
          .view_info{
              min-width: 800px;
              min-height: 800px;
              background-color: rgb(241, 241, 241);
          }
          .btn_list{
              float: right;
              font-size: 15px;
              width: 80px;
              height: 40px;
              margin-right: 150px;
          }
          .view_info_main{
              height: 90%;
              background-color: bisque;
             
          }
          .view_info_hashtag{
              width: 80%;
              position: absolute;
              bottom: 0;
              text-align: left;
              margin-left: 50px;
              
          }
          hr{
            margin-right: 580px;
            width: 50%;
            color:black;
            border: 0.5px solid;
          }
        td{
            padding-left: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

	 <div class="container mt-2 ">
        <h1 style="float:left; margin-left:175px">선행활동</h1>
        <br>
        <br>
        <br>
        <section class="vol_view_wrap">
            <header class="statusBox">
                <!-- 게시글 제목 -->
                <p style="text-align:left; margin-left:20px; font-size:30px">선행활동 게시글 제목</p>
                <!-- 게시글 작성자 -->
                <span style="font-size:15px; float:left; margin-left:23px">작성자 </span>
                <!-- 게시글 작성일 -->
                <span style="font-size:15px; float:left; margin-left:23px">2020-10-13</span>
                <!-- 게시글 추천 & 조회수 -->
                <span style="font-size:15px; float:right; margin-right:30px; padding-right:10px">추천 : </span>
                <span style="font-size:15px; float:right; margin-right:30px">조회수 : </span>
            </header>
            <br>
            <br>
            <article>
                <div class="view_info">
                    <div class="view_info_main">
                        <!-- image -->    
                    </div>
                    <div class="view_info_hashtag">
                        <!-- hashtag area-->
                        <span style="padding-right: 10px;">#해쉬태그</span>
                        <span style="padding-right: 10px;">#해쉬태그</span>
                        <span style="padding-right: 10px;">#해쉬태그</span>
                        <span style="padding-right: 10px;">#해쉬태그</span>
                        <span style="padding-right: 10px;">#해쉬태그</span>
                        <span style="padding-right: 10px;">#해쉬태그</span>
                        <br>
                        <hr align="center">
                    </div>
                </div>
            </article>
            <br>
            
        </section>  
        <section id="replyArea" class="reply">
            <div class="container aos-init aos-animate" data-aos="fade-up">
                <div class="row">
                    <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
                        <form action="" method="post" role="form" class="replyForm">
                            <div class="row">
                                <div class="form-item">
                                    <input type="text" id="replyContent_Input" class="col-md-8" placeholder="댓글을 입력하세요" required>
                                </div>
                                <div class="form-item">
                                    <input type="button" class="replyBtn" value="등록">
                                </div>
                            </div>
                        </form>
                        <form>
                            <div class="row">
                                <div class="reply-group">
                                    <table class="replyArea">
                                        <td type="text" class="col">작성자</td>
                                        <td type="text" class="col-md-9">댓글 내용</td>
                                        <td type="text" class="col">2021-10-01</td>
                                        <td type="text" class="col"><a href="#">수정</a></td>
                                        <td type="text" class="col"><a href="#">삭제</a></td>
                                    </table>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <br><br>


        <div class="btn_list_wrap">
            <input class="btn_list" type="button" value="목록" >
        </div>
    </div>
    <br>

<jsp:include page="../common/footer.jsp" />
</body>
</html>