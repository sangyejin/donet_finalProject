<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도넷닷컴</title>

<!-- favicon -->
<link rel="icon"
	href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png"
	type="image/x-icon">


<!-- include libraries(jQuery, bootstrap) --> 
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js">
</script>

<!-- CDN 한글화 --> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>



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
	#files{
		margin-left: 20%;
		margin-top: 5%;
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
	#addRow {
		cursor: pointer;
		background-color: rgb(224, 224, 224);
        width: 50px;
        height: 28px;
        border-radius: 5px;
        border-color: rgb(224, 224, 224);
        margin-left: 2%;
	}
	.btnDelete{
        border-radius: 5px;
        border-color: rgb(224, 224, 224);	
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
.attachFileLoad{
	width:170px;
	margin-right:3.5%;
}


</style>
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

	<div class="outer">
		<form id="insertForm" action="insert.bo" method="post" enctype="multipart/form-data">
			<div style="text-align: center;">
			<c>후원 프로젝트 제목</c>
			<div><input type="text" placeholder=" 제목을 입력하세요" style="width:800px; height:40px" id="suTitle" name="suTitle"></div><br><br><br>
			<div>
				<span style="display:inline-block;">
					<c>대표 사진</c>
					<div class="thumbnail">
						<div>
							<img id="image" style="width:350px; height:350px; border-radius: 20%;"/>
						</div>
					</div>
						    <input type="file" id="files" name="thumbFile"/>
				</span>
				<span style="float:right; margin-right:15%;">
				<br><br>
					<c>상세 카테고리</c>
					<div>
						<select id="detailCategory" name="categoryNo">
						    <option value="1">지구촌</option>
					        <option value="2">환경</option>
					        <option value="3">동물</option>
						    <option value="4">아동/청소년</option>
						    <option value="5">취약계층</option>
						</select>
					</div><br><br><br>
					<c>후원 주최자</c>
					<div><input type="text" placeholder=" 후원 단체명을 입력하세요" style="width:300px; height:40px" id="suWriter" name="suWriter"></div><br><br><br>
					<c>후원 기간</c>
					<div>
						<input type=date id="start" name="suStart" required style="width:150px; height:40px">
						<c> ~ </c><input type=date id="end" name="suLast" required style="width:150px; height:40px">
					</div>
				</span>
			</div></div><br><br><br>
			<e>내  용</e>
			<div style="text-align: center;"><textarea id=content name="content" placeholder=" 내용을 입력하세요" style="width:800px; height:400px; resize: none;"></textarea></div><br><br><br><br>
			<e>첨부 이미지</e><br>
			<div style="text-align: center;">
				<span class="attach" style="margin-left:0;">
					<img id="img1" style="width:150px; height:150px;border-radius: 20%;"/>
				</span>
				<span class="attach">
					<img id="img2" style="width:150px; height:150px;border-radius: 20%;"/>
				</span>
				<span class="attach">
					<img id="img3" style="width:150px; height:150px;border-radius: 20%;"/>
				</span>
				<span class="attach">
					<img id="img4" style="width:150px; height:150px;border-radius: 20%;"/>
				</span>
				<div  style="margin-top:1%; width:1000px;">
					<span><input type="file" id="attach1" name="file1" class="attachFileLoad" style="margin-left:8%;"/></span>
					<span><input type="file" id="attach2" name="file2" class="attachFileLoad" /></span>
					<span><input type="file" id="attach3" name="file3" class="attachFileLoad" /></span>
					<span><input type="file" id="attach4" name="file4" class="attachFileLoad" /></span>
				</div>
			</div><br><br><br><br><br><br>
			<e>기부금 사용계획</e>
			<button id="addRow" type="button"> 행 추가 </button>
			<div style="text-align: center;">
				<table id="useplan">
				<thead>
					<tr id="addTr"> 
					<th>번호</th>
					<th>구분</th>
					<th>상세 내용</th>
					<th>사용 금액</th>
					<th>삭제</th>
					
			</tr>
			</thead>
			<tbody>
			<tr>
				<td style="vertical-align: middle">1
					<input type='hidden' name='upNo' value="1">
				</td>
				<td><input type="text" class="useplanTd" name="division" placeholder="구분"></td>
				<td><input type="text" class="useplanTd" name="content" placeholder="상세내용"></td>
				<td><input type="number" class="useplanTd" name="amount" min="1000" step="100" placeholder="사용금액"></td>
				<td><button class="btnDelete" name="btnDelete">삭제</button></td>
			</tr>
			</tbody>
				</table>
			</div><br><br><br><br><br><br><br>
			<e>프로젝트 상세정보</e>
			<div style="text-align: center;">
				<table id="projectInfo">
					<tr>
						<th style="width:180px;">사업 대상</th>
						<td><input type="text" id="target" name="target" style="width:650px; height:30px;"></td>
					</tr>
					<tr>
						<th style="width:180px;">사업 기간</th>
						<td>
							<input type=date id="bstart" name="bstart" required style="width:150px; height:40px">
						<c> ~ </c><input type=date id="bend" name="blast" required style="width:150px; height:40px">
						</td>
					</tr>
				</table>
			</div><br><br><br><br><br><br><br><br><br><br>
			<input type="submit" value="등록하기" id="submit">	
		</form>
	</div>
	
	<script type="text/javascript">
        $('#addRow').click(function () {
            const table = document.getElementById('useplan');
            const totalRowCnt = table.rows.length;
            const len = String(table.tBodies[0].rows.length + 1);
           	
            var html = `<tr>
            			<td name='tdUpNo' style='vertical-align:middle'>`+len+`<input class='useplanTd' type='hidden' name='upNo' value=`+len+`>
            			</td><td><input class='useplanTd' type='text' name='division' placeholder='구분' required></td>
                    	<td><input class='useplanTd' type='text' name='content' placeholder='상세내용' required></td>
                    	<td><input class='useplanTd' type='number' name='amount' min='1000' step='100' placeholder='사용금액' required></td>
                    	<td><button class='btnDelete'  name='btnDelete'>삭제</button></td>
                		</tr>`;
              
            $("#useplan tbody").append(html);
            
        });
	 	
	    
	    //삭제 버튼
	    $(document).on("click","button[name=btnDelete]",function(){
	        
	        var trHtml = $(this).parent().parent();
	        
	        trHtml.remove();
	        
	    });
	</script>
	<script> 
	document.getElementById("files").onchange = function () {
	    var reader = new FileReader();

	    reader.onload = function (e) {
	        document.getElementById("image").src = e.target.result;
	    };

	    reader.readAsDataURL(this.files[0]);
	};
	
	document.getElementById("attach1").onchange = function () {
	    var reader = new FileReader();

	    reader.onload = function (e) {
	        document.getElementById("img1").src = e.target.result;
	    };

	    reader.readAsDataURL(this.files[0]);
	};
	
	document.getElementById("attach2").onchange = function () {
	    var reader = new FileReader();

	    reader.onload = function (e) {
	        document.getElementById("img2").src = e.target.result;
	    };

	    reader.readAsDataURL(this.files[0]);
	};
	
	document.getElementById("attach3").onchange = function () {
	    var reader = new FileReader();

	    reader.onload = function (e) {
	        document.getElementById("img3").src = e.target.result;
	    };

	    reader.readAsDataURL(this.files[0]);
	};
	
	document.getElementById("attach4").onchange = function () {
	    var reader = new FileReader();

	    reader.onload = function (e) {
	        document.getElementById("img4").src = e.target.result;
	    };

	    reader.readAsDataURL(this.files[0]);
	};
	
	$("#submit").click(function(){
		$("#useplan tbody tr").each( function (index) {
	        $(this).find("input[name=upNo]").attr("name", "supportUsePlan[" + index + "].upNo");
	        $(this).find("input[name=division]").attr("name", "supportUsePlan[" + index + "].division");
	        $(this).find("input[name=content]").attr("name", "supportUsePlan[" + index + "].content");
	        $(this).find("input[name=amount]").attr("name", "supportUsePlan[" + index + "].amount");
	        console.log(index);
	    });
		$("#insertForm").submit();
	});
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
	    var start2 = document.getElementById('bstart');
	    var end2 = document.getElementById('bend');
	
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
	<jsp:include page="../donation/subMenu.jsp" />
	

</body>
</html>