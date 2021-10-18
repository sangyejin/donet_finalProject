<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <p style="text-align:left; margin-left:20px; font-size:30px">이벤트 제목</p>
                <span style="font-size:15px; float:right; margin-right:20px">2020-10-13</span>
            </header>
            <br>
            <br>
            <article>
                <div class="event_view_info">
                    <!-- image -->
                </div>
                
            </article>
            <br>
            <div class="btn_event_wrap">
                <input class="btn_event" type="button" value="목록">
            </div>
        </section>  
        
    </div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>