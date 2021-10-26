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
 		width:80%;
 		font-size: 80%;
 		text-align: center;
   	}
   	table tbody tr {
   		
   		height: 50px;
   	}
   	table tbody tr th {
   		border-right: 1re solid;
   		border-color: transparent;
   	}
  
    .row{
    	min-width:800px;
    }
   #postContent{
   		width:100%;
   		min-height: 600px;
   		
   		display: inline-block;
   }
</style>
<script>
	function getContent(){
		document.getElementById("content").value = document.getElementById("postContent").innerHTML;
		return true;
	}

</script>
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
       				<th><label for="upfile">첨부파일</label></th>
       				
       				<td><input id="iFile" multiple="multiple" type="file" name="uploadFile" multiple/></td> 
       				
       			</tr>
       			
       			<tr class="form-group">
       				<th><label for="postContent">내용</label></th>
       				<td><textarea id="postContent" name="eventContent" class="form-control" ></textarea></td>
       			</tr>
       			</table>
       			<div id="imgArea">
       				
       			</div>
       			<script type="text/javascript">
       			/*
       				$("#iFile").change(function(){
       					if(this.files && this.files[0]) {
       						var reader = new FileReader;
       						reader.onload = function(data){
       							$("#imgArea img").attr("src", data.target.result).width(500);
       						}
       						reader.readAsDataURL(this.files[0]);
       					}
       				});
       			*/
       				
       				function readMultipleImage(input){
       					const multipleContainer = document.getElementById("imgArea");
       					//인풋태그에 이미지(파일)이 있는 경우 
       					if(input.files){
       						console.log(input.files);
       						
       						const fileArr = Array.from(input.files);
       						const $colDiv1 = document.createElement("div");
       						const $colDiv2 = document.createElement("div");
       						
       						$colDiv1.classList.add("column");
       						$colDiv2.classList.add("column");
       						
       						fileArr.forEach((file, index) => {
       							const reader = new FileReader();
       							const $imgDiv = document.createElement("div");
       							const $img = document.createElement("img");
       							
       							$img.classList.add("image");
       							
       							const $label = document.createElement("label");
       							$label.classList.add("image-label");
       							$label.textContent = file.name;
       							
       							$imgDiv.appendChild($img);
       							$imgDIv.appendChild($label);
       							
       							reader.onload = e => {
       								$img.src = e.target.result;
       								
       								$imgDiv.style.width = ($img.naturalWidth) * 0.2 + "px";
       								$imgDiv.style.height = ($img.naturalWidth) * 0.2 + "px";
       							}
       							
       							console.log(file.name);
       							
       							if(index % 2 == 0){
       								$colDiv1.appendChild($imgDiv);
       							}else{
       								$colDiv2.appendChild($imgDiv);
       							}
       							reader.readAsDataURL(file);
       							
       						})
       						multipleContainer.appendChild($colDiv1);
       						multipleContainer.appendChild($colDiv2);
       						
       					}
       					
       				};
       				const inputMultipleImage = document.getElementById("iFile");
       				inputMultipleImage.addEventListener("change", e => {
       					readMultipleImage(e.target);
       				});
       				
       				
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