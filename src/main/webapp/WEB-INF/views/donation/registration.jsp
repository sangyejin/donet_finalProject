<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">

<!-- favicon -->
<link rel="icon"
	href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png"
	type="image/x-icon">

<title>도넷닷컴</title>
<style>
    .outer{
        width: 1050px;
        margin: auto;
    }
	.topTotop{
	    cursor: pointer;
	    color: white;
	    font-size: 14px;
	    background-color: rgb(60, 179, 113);
	    border-radius: 5px;
	    padding: 7px 5px 7px 7px;
	}
	c{
		font-weight: 600;
		font-size: 15px;
		
	}
	.thumbnail{
		width:350px; 
		height:350px;
		border: 1px solid grey;
		border-radius: 20%;
		text-align: center;
		box-shadow: 10px 10px 10px;
	}
	#detailCategory{
		width:300px;
		height:40px;
	}
	.attach{
		width:150px; 
		height:150px;
		border: 1px solid grey;
		border-radius: 20%;
		text-align: center;
		box-shadow: 10px 10px 10px;
		margin-top: 1%;
		margin-left:5%;
		display:inline-block;		
	}
	e{
		font-weight: 600;
		font-size: 15px;
		margin-left:12%;
	}
	table{
		width:800px;
		height: 30px;
		margin: auto;
		margin-top: 1%;
		border-top: 1px solid black;
		border-bottom: 1px solid black;
	}
	th{
		background-color: rgb(224, 224, 224);
		border-top: 2px solid #808080;
		border-bottom: 2px solid #808080;
		height: 30px;
	}
	td{
		border-top: 1px solid #808080;
		border-bottom: 1px solid #808080;
		height: 30px;		
	}
	#addRow{
		cursor: pointer;
		background-color: rgb(224, 224, 224);
        width: 50px;
        height: 28px;
        border-radius: 5px;
        border-color: rgb(224, 224, 224);
        margin-left: 2%;
	}
	#submit{
        width: 200px;
        height: 40px;
        border-radius: 5px;
        border-color: rgb(60, 179, 113);
        color: white;
        font-weight: 600;
        color: rgb(60, 179, 113);
        background-color: white;
        margin-left: 40%;
        transition: all 0.5s;		
	}
	#submit:hover {
	    width: 200px;
        height: 40px;
        border-radius: 5px;
        border-color: rgb(60, 179, 113);
        color: white;
        font-weight: 600;
        color: white;
        background-color: rgb(60, 179, 113);
        margin-left: 40%;
	}


</style>
</style>
</head>
<body id="pageTop">
	<jsp:include page="../common/menubar.jsp"/>

	<div class="outer">
		<form method="post" enctype="multipart/form-data">
			<div style="text-align: center;">
			<c>후원 프로젝트 제목</c>
			<div><input type="text" placeholder=" 제목을 입력하세요" style="width:800px; height:40px"></div><br><br>
			<div>
				<span style="display:inline-block;">
					<c>대표 사진</c>
					<div class="thumbnail">
						<div>
						    <input type="file" id="files" />
							<img id="image" />
						</div>
						
						<div>
						    <img src="" id="output">
						</div>
					</div>
				</span>
				<span style="float:right; margin-right:15%;">
					<c>상세 카테고리</c>
					<div>
						<select id="detailCategory">
						    <option value="지구촌">지구촌</option>
					        <option value="환경">환경</option>
					        <option value="동물">동물</option>
						    <option value="아동/청소년">아동/청소년</option>
						    <option value="취약계층">취약계층</option>
						</select>
					</div><br><br>
					<c>후원 주최자</c>
					<div><input type="text" placeholder=" 후원 단체명을 입력하세요" style="width:300px; height:40px"></div><br><br>
					<c>후원 기간</c>
					<div>
						<input type=date id="start" required style="width:150px; height:40px">
						<c> ~ </c><input type=date id="end" required style="width:150px; height:40px">
					</div>
				</span>
			</div></div><br><br>
			<e>내  용</e>
			<div style="text-align: center;"><textarea id=content placeholder=" 내용을 입력하세요" style="width:800px; height:400px; resize: none;"></textarea></div><br><br>
			<e>첨부 이미지</e><br>
			<div style="text-align: center;">
				<span class="attach" style="margin-left:0;">
					<input type="file" id="image" accept="image/*" onchange="setAttach1(event);"/> 
				    <div id="attach1" style></div>
				</span>
				<span class="attach">
					<input type="file" id="image" accept="image/*" onchange="setAttach2(event)"/> 
				    <div id="attach2" style></div>
				</span>
				<span class="attach">
					<input type="file" id="image" accept="image/*" onchange="setAttach3(event)"/> 
				    <div id="attach3" style></div>
				</span>
				<span class="attach">
					<input type="file" id="image" accept="image/*" onchange="setAttach4(event)"/> 
				    <div id="attach4" style></div>
				</span>
			</div><br><br>
			<e>기부금 사용계획</e>
			<button id="addRow" name="addRow"> 행 추가 </button>
			<div style="text-align: center;">
				<table id="useplan">
					<th>구분</th>
					<th>상세 내용</th>
					<th>사용 금액</th>
					<th>삭제</th>
				</table>
			</div><br><br>
			<e>프로젝트 상세정보</e>
			<div style="text-align: center;">
				<table id="projectInfo">
					<tr>
						<th style="width:180px;">사업 대상</th>
						<td><input type="text" id="target" style="width:650px; height:30px;"></td>
					</tr>
				</table>
			</div><br><br><br><br>
			<input type="submit" value="등록하기" id="submit">	
		</form>
	</div>
	
	<script type="text/javascript">
	 	$(document).on("click","button[name=addRow]",function(){
	        
	        var addText = '<tr name="addTr">'+
	                           '<td><input type="text" class="division" name="division" placeholder="구분"></td>'+
	                           '<td><input type="text" class="useplanDetail" name="useplanDetail" placeholder="상세내용"></td>'+
	                           '<td><input type="text" class="price" name="price" placeholder="사용금액"></td>'+
	                           '<td><button class="btnDelete" name="btnDelete">삭제</button></td>'+
	                           '</tr>';
	            
	        var trHtml = $( "tr[name=addTr]:last" ); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
	        
	        trHtml.after(addText); //마지막 trStaff명 뒤에 붙인다.
	        
	    });
	    
	    //삭제 버튼
	    $(document).on("click","button[name=btnDelete]",function(){
	        
	        var trHtml = $(this).parent().parent();
	        
	        trHtml.remove(); //tr 테그 삭제
	        
	    });
	</script>
	<script> 
	document.getElementById("files").onchange = function () {
	    var reader = new FileReader();

	    reader.onload = function (e) {
	        // get loaded data and render thumbnail.
	        document.getElementById("image").src = e.target.result;
	    };

	    // read the image file as a data URL.
	    reader.readAsDataURL(this.files[0]);
	};
	</script>
    <script>
	    var start1 = document.getElementById('start');
	    var end1 = document.getElementById('end');
	
	    start1.addEventListener('change', function() {
	        if (start1.value)
	            end1.min = start1.value;
	    }, false);
	    end1.addEventLiseter('change', function() {
	        if (end1.value)
	            start1.max = end1.value;
	    }, false);
   </script>
    <script>
	    var start2 = document.getElementById('bustart');
	    var end2 = document.getElementById('buend');
	
	    start2.addEventListener('change', function() {
	        if (start2.value)
	            end2.min = start2.value;
	    }, false);
	    end2.addEventLiseter('change', function() {
	        if (end2.value)
	            start2.max = end2.value;
	    }, false);
   </script>
	<jsp:include page="../common/footer.jsp" />
	<div style="display:scroll;position:fixed;bottom:10px;right:5px;"><a class="topTotop" href="#pageTop">TOP▲</a></div>
</body>
</html>