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
   .editor{
   		width: 100%;
   		hieght: 600px;
   }
</style>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- Latest compiled and minified CSS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	
	<!-- datepicker -->    
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- Summernote -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> 

	
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
<div class="container">
	<div class="row text-center">
		<div class="col-md-12" style="float:none; margin:0 auto; " id="eForm">
        <h1>이벤트 생성하기</h1>
        <br>
       	
       	<form id="erollForm" method="post" action="insert.ev" enctype="multipart/form-data" >
       		<table align="center" >
       			<tr class="form-group" >
       				<th><label for="title">제목</label></th>
       				<td><input type="text" id="title" class="form-control" name="eventTitle" required></td>
       			</tr>
       			<tr class="form-group">
       				<th><label for="datepickerStart">이벤트 시작</label>
       				<td><input type="text" id="datepickerStart" class="form-control" name="eventStart" autocomlete="off" readonly="readonly" required></td>
       			</tr>
       			<tr class="form-group">
       				<th><label for="datepickerLast">이벤트 종료</label>
       				<td><input type="text" id="datepickerLast" class="form-control" name="eventLast" autocomlete="off" readonly="readonly" required></td>
       			</tr>
       			<tr>
       				<th><labeL for="">썸네일 이미지</labeL>
       				<td><input type="file" id="file" class="form-control-file" name="file" onchange="loadImg(this)" required></td>
       				<td><img id="thum" src="" style="width:150px; height:150px"></td>
       			</tr>
       		</table>
       		<textarea class="form-control" id="summernote" name="eventContent" placeholder="content" maxlength="140" rows="7" required></textarea>
       				
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
 
 
	function loadImg(){
		if(inputFile.files.length == 1){
			var reader = new FileReader();
			
			reader.onload = function(e){
				$("#thum").attr("src", e.target.result);
			}
			reader.readAsDataURL(inputFile.files[0]);
		}
	}
 
			$("#summernote").summernote({
				height: 500, 
				width: 1000,
		    	minHeight: null,            
		    	maxHeight: null,            
		    	focus: true,           
		    	disableResizeEditor: true,
   	   		callbacks: {
		    		onImageUpload: function(files, editor, welEditable){
			    		for(var i = files.length - 1; i>=0; i--){
			    			sendFile(files[i],this);	  
			    		}	
		    		}
   	   			}
			});
		
		function sendFile(file, el){
				var data = new FormData();
				data.append("file", file);	
				$.ajax({
					data : data,
					type : "POST",
					url : "imageFile.ev",
					cache : false,
					contentType : false,
					processData : false,
					enctype : "multipart/form-data",
					success : function(data){
						$(el).summernote('editor.insertImage', data.url);
						
					}
				});
			}
	
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
<script src="resources/js/bootstrap.min.js"></script>

  

<jsp:include page="../common/footer.jsp" />
</body>
</html> 