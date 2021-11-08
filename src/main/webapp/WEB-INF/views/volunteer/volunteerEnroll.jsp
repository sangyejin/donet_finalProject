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
	
	<!-- datepicker -->    
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- Summernote -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> 

<style>
	
   	#voForm{
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
		<div class="col-md-12" style="float:none; margin:0 auto; " id="voForm">
        <h1>선행활동 작성하기</h1>
        <br>
       	
       	<form id="erollForm" method="post" action="insert.vo" enctype="multipart/form-data" >
       		<table align="center" >
       			<tr class="form-group" >
       			
       				<th><label for="category">카테고리</label></th>
       				<td>
       					<select id="category" name="volCategory" class="btn btn-light dropdown-toggle">
       						<option class="dropdown-item" value="바다">바다</option>
       						<option class="dropdown-item" value="산">산</option>
       						<option class="dropdown-item" value="동네">동네</option>
       						<option class="dropdown-item" value="동물">동물</option>
       						<option class="dropdown-item" value="기타">기타</option>
       					</select>
       				</td>
       			</tr>
       			<tr class="form-group" >
       				<th><label for="writer">작성자</label></th>
       				<td><input type="text" id="writer" class="form-control" name="volWriter" value="${ loginUser.userId }" readonly></td>
       			</tr>
       			<tr class="form-group" >
       				<th><label for="title">제목</label></th>
       				<td><input type="text" id="title" class="form-control" name="volTitle"></td>
       			</tr>
       			<tr>
       				<th><labeL for="">썸네일 이미지</labeL>
       				<td><input type="file" id="file" class="form-control-file" name="file"></td>
       				<td><img id="thum" src=""></td>
       			</tr>
       			</table>
       			<textarea class="form-control" id="summernote" name="volContent" placeholder="content" maxlength="140" rows="7"></textarea>
       			
       			<script type="text/javascript">


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
    					url : "imageFile.vo",
    					cache : false,
    					contentType : false,
    					processData : false,
    					enctype : "multipart/form-data",
    					success : function(data){
    						$(el).summernote('editor.insertImage', data.url);
    						
    					}
    				});
    			}

       			
       			</script>
       		<br>
       		<div class="submitBtn">
       			<input name="submitBtn" type="submit" class="btn btn-primary" value="등록하기"/>
       			<input type="reset" class="btn btn-danger" value="취소하기"/>
       		</div>
       	</form>
       
       </div>
    </div>
 </div>
<script src="resources/js/bootstrap.min.js"></script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>