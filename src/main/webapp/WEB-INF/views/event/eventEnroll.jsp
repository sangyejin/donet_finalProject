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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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
        <h1>이벤트 생성하기</h1>
        <br>
       	
       	<form id="erollForm" method="post" action="insert.ev" enctype="multipart/form-data">
       		<table align="center">
       			<tr>
       				<th><label for="eventTitle">제목</label></th>
       				<td><input type="text" id="title" class="form-control" name="eventTitle"></td>
       			</tr>
       			<tr>
       				<th><label for="eventStart">이벤트 시작</label>
       				<td><input type="text" id="datepickerStart" name="eventStart"></td>
       			</tr>
       			<tr>
       				<th><label for="eventLast">이벤트 종료</label>
       				<td><input type="text" id="datepickerLast" name="eventLast"></td>
       			</tr>
       			<tr>
       				<th colspan="2"><label for="content">내용</label></th>
       			</tr>
       			<tr>
       				<th colspan="2"><textarea rows="10" class="form-control" name="eventContent" id="content" style="resize:none" required></textarea>
       			</tr>
       			<tr>
       				<th><label for="upfile">첨부파일</label></th>
       				<td><input type="file" id="upfile" class="form-control-file border" name="uploadFile"></td>
       			</tr>
       		</table>
       		<br>
       		<div class="submitBtn">
       			<button type="submit" class="btn btn-primary">등록하기</button>
       			<button type="reset" class="btn btn-danger">취소하기</button>
       		</div>
       	</form>
       
       
    </div>
   <script>
   		$("#datepickerStart").datepicker();
   		$("#datepickerLast").datepicker();
   </script>

<jsp:include page="../common/footer.jsp" />
</body>
</html>