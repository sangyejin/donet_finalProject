<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
       	
       	<form id="erollForm" method="post" action="insert.vo" enctype="multipart/form-data" onsubmit="getContent();">
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
       			<tr class="form-group">
       				<th><label for="thumImg">썸네일 이미지</label></th>
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
       				<td><textarea id="postContent" name="volContent" class="form-control" ></textarea></td>
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
       		<br>
       		<div class="submitBtn">
       			<input name="submitBtn" type="submit" class="btn btn-primary" value="등록하기"/>
       			<input type="reset" class="btn btn-danger" value="취소하기"/>
       		</div>
       	</form>
       
       </div>
    </div>
 </div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>