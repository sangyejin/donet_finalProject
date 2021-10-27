<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
   	#eForm{
   		display: inline-block;
   		text-align: center;
   	}
   	table{
   		margin-left: auto;
   		margin-right: auto;
 		width:100%;
 		font-size: 80%;
 		text-align: center;
   	}
   	table tbody tr {
   		
   		height: 50px;
   	}
   	table tbody tr th {
   		border-right: 1re solid;
   		border-color: transparent;
   		width:20%;
   	}
  
    .row{
    	min-width:800px;
    }
   #postContent{
   		width:100%;
   		min-height: 600px;
   		display: inline-block;
   }
   .img{
   		width: 150px;
   		height: 150px;
   		margin: 10px;
   }
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" /> 
<div class="container">
	<div class="row text-center">
		<div class="col-md-12" style="float:none; margin:0 auto; " id="eForm">
        <h1>이벤트 생성하기</h1>
        <br>
       	
       	<form id="erollForm" method="post" action="insert.ev" enctype="multipart/form-data" onsubmit="getContent();">
       		<table align="center" >
       			<tr class="form-group" >
       				<th><label for="title">제목</label></th>
       				<td><input type="text" id="title" class="form-control" name="eventTitle"></td>
       			</tr>
       			<tr class="form-group">
       				<th><label for="datepickerStart">이벤트 시작</label>
       				<td><input type="text" id="datepickerStart" class="form-control" name="eventStart" autocomlete="off" readonly="readonly"></td>
       			</tr>
       			<tr class="form-group">
       				<th><label for="datepickerLast">이벤트 종료</label>
       				<td><input type="text" id="datepickerLast" class="form-control" name="eventLast" autocomlete="off" readonly="readonly"></td>
       			</tr>
       			
       			<tr class="form-group">
       				<th><label for="thum">썸네일 이미지</label></th>
       				<td><img alt="" src="" id="thumImg" class="img" ></td>
       			</tr>
       			<tr>
       				<th><label for="">추가 등록</label></th>
       				<td>
	       				<img class="img" id="plusImg1">
	       				<img class="img" id="plusImg2">
	       				<img class="img" id="plusImg3">
       				</td>       			
       			</tr>
       			
       			<tr class="form-group">
       				<th><label for="postContent">내용</label></th>
       				<td><textarea id="postContent" name="eventContent" class="form-control" ></textarea></td>
       			</tr>
       			</table>
       			<div id="fileArea">
       				<input type="file" name="thumFile" id="thumFile" onchange="thum(this, 0);">
       				<input type="file" name="plusFile" id="plusFile1" onchange="thum(this, 1);">
       				<input type="file" name="plusFile" id="plusFile2" onchange="thum(this, 2);">
       				<input type="file" name="plusFile" id="plusFile3" onchange="thum(this, 3);">
       			</div>
       			<script type="text/javascript">
	       			$(function(){
	       				$("#fileArea").hide();
	       				$("#thumImg").click(function(){
	       					$("#thumFile").click();
	       				});
	       				$("#plusImg1").click(function(){
	       					$("#plusFile1").click();
	       				});
	       				$("#plusImg2").click(function(){
	       					$("#plusFile2").click();
	       				});
	       				$("#plusImg3").click(function(){
	       					$("#plusFile3").click();
	       				});
	       			});
	       			
	       			function thum(inputFile, num){
	       				if(inputFile.files.length == 1){
	       					var reader = new FileReader();
	       					reader.readAsDataURL(inputFile.files[0]);
	       					reader.onload = function(e){
	       						switch(num){
	       							case 0:
	       								$("#thumImg").attr("src", e.target.result);
	       								break;
	       							case 1:
	       								$("#plusImg1").attr("src", e.target.result);
	       								break;
	       							case 2:
	       								$("#plusImg2").attr("src", e.target.result);
	       								break;
	       							case 3:
	       								$("#plusImg3").attr("src", e.target.result);
	       								break;
	       						}
	       					}
	       				}
	       			}
       		
       			
       				
       			</script>
       			
       			<!-- <div contentEditable="true" id="postContent" class="form-control" name="eventContent">
       				<img src="" class="Thum"/>
       			</div> 
       			<textarea style="display:none" id="content" > </textarea>-->
       		<br>
       		<div class="submitBtn">
       			<input name="submitBtn" type="submit" class="btn btn-primary" value="등록하기"/>
       			<input type="reset" class="btn btn-danger" value="취소하기"/>
       		</div>
       	</form>
       
       </div>
    </div>
 </div>
 <script>

	
  	$(document).ready(function () {
          $.datepicker.setDefaults($.datepicker.regional['ko']); 
          $( "#datepickerStart" ).datepicker({
               changeMonth: true, 
               changeYear: true,
               nextText: '다음 달',
               prevText: '이전 달', 
               dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
               dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
               monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
               monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
               dateFormat: "yy-mm-dd",
                            
               onClose: function( selectedDate ) {    
                    //시작일(startDate) datepicker가 닫힐때
                    //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                   $("#datepickerLast").datepicker( "option", "minDate", selectedDate );
               }    

          });
          $( "#datepickerLast" ).datepicker({
               changeMonth: true, 
               changeYear: true,
               nextText: '다음 달',
               prevText: '이전 달', 
               dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
               dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
               monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
               monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
               dateFormat: "yy-mm-dd",
                                      
               onClose: function( selectedDate ) {    
                   $("#datepickerStart").datepicker( "option", "maxDate", selectedDate );
               }    

          });    
  });
 
  	</script>


  

<jsp:include page="../common/footer.jsp" />
</body>
</html>