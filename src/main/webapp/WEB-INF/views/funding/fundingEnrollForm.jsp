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
<!-- font -->
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">
<!-- favicon -->
<link rel="icon"
	href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png"
	type="image/x-icon">

<!-- 부트스트랩 	-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<style>
* {
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 1em !important;
}
#fpName {
	width: 800px;
}

.div-fpName {
	text-align: center;
}

.div-left, .div-right {
	display: inline-block;
	/* margin: 20px; */
}

#insertForm {
	text-align: center;
	width: 800px;
	margin: auto;
}

label {
	display: block !important;
}

#content {
	width: 800px;
	height: 700px;
}

.input-text, .btn-delete {
	height: 40px;
	border-radius: 4px;
	border: 1px solid rgb(85, 85, 85);
}

#category {
	height: 40px;
	border-radius: 4px;
	width: 370px;
	border: 1px solid rgb(85, 85, 85);
}

#goal {
	width: 350px;
}

#startDate, #closeDate {
	width: 165px;
}

.div-input, #content {
	margin-bottom: 20px;
}

.div-content label, .div-left label, .div-right label {
	text-align: left;
}

tbody tr td, thead tr th {
	text-align: center;
}

#check {
	margin: 0;
	height: 16px;
}

.btnArea {
	margin-bottom: 100px;
}

.div-content {
	padding: 20px 0 20px 0;
}

.div-left {
	padding-left: 0;
}

.div-contentImg:first-child {
	margin-left: 0px;
}

.div-contentImg:last-child {
	margin-right: 0px;
}

.div-contentImg {
	width: 100px;
	height: 100px;
	display: inline-block;
	border: 1px solid rgb(85, 85, 85);
	padding: 0;
	margin-left: 17.5px;
	margin-right: 17.5px;
}

.group-img {
	margin: auto;
	padding: 0;
	width: 370px;
	height: 120px;
	width: 370px
}

.div-thumbImg {
	margin-left: 0;
	width: 340px;
	height: 340px;
	padding: 0;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">후원</a></li>
			<li class="breadcrumb-item"><a href="#">펀딩 프로젝트</a></li>
			<li class="breadcrumb-item active" aria-current="page">등록</li>
		</ol>
	</nav>
	<div class="main">
		<form id="insertForm" action="insert" method="post"
enctype="multipart/form-data">
			<div class="div-fpName">
				<label for="fpName" style="display: block;">펀딩 프로젝트 제목</label> <input
					type="text" placeholder="제목을 입력하세요" id="fpName" name="fpName" required>
			</div>
			<div class="div-content">
				<div class="div-left col-lg-6 col-xs-12">
					<label for="thumbImg">대표 사진</label>
					<div class="div-thumbImg" id="thumbImg">
						<img id="img0" width="370px" height="340px">
					</div>
				</div>
				<div class="div-right col-lg-6 col-xs-12">
					<div class="div-input">
						<label for="cateogry">카테고리</label> <select name="categoryNo"
							id="category">
							<c:forEach var="category" items="${category}">
								<option value="${category.categoryNo}">${category.categoryName}</option>
							</c:forEach>
						</select>
					</div>
					<div class="div-input">
						<label for="goal">목표 금액</label> <input type="text"
							placeholder="0,000,000" id="goal" name="goal" required> <span>원</span>
					</div>
					<div class="div-input">
						<label for="startDate">펀딩 기간</label> <input type="Date"
							placeholder="0000-00-00" id="startDate" name="startDate" required>
						<span style="margin: 0 10px;">~</span> <input type="Date"
							placeholder="0000-00-00" id="closeDate" name="closeDate" required>
					</div>
					<div class="div-input">
						<label for="">결제 예정 날짜</label> <input type="Date"
							placeholder="0000-00-00" id="paymentDate" name="paymentDate" required>
					</div>
					<div class="div-input">
						<label for="">추가사진</label>
						<div class="group-img">
							<div class="div-contentImg col-xs-4" id="contentImg1">
								<img class="contentImg" width="100px" id="img1">
							</div>
							<div class="div-contentImg col-xs-4" id="contentImg2">
								<img class="contentImg" width="100px" id="img2">
							</div>
							<div class="div-contentImg col-xs-4" id="contentImg3">
								<img class="contentImg" width="100px" id="img3">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="div-content col-xs-12"
				style="width: 800px; margin: auto;">
				<label for="content">내용</label>
				<textarea name="content" id="content" cols="140" rows="10"
					style="resize: none;" required></textarea>
				<label for="present">선물 <input id="btnInsertPresent"class="btn btn-default" type="button" value="+"></label>
				<table id="tablePresent" class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">이름</th>
							<th scope="col">가격</th>
							<th scope="col">내용</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="vertical-align: middle">1
								<input type='hidden' name='fgNo' value="1">
							</td>
							<td>
							<input class='input-text' type='text' name='fgName' required>
							</td>
							<td>
							<input class='input-text' type='text' name='fgPrice' required>
							</td>
							<td>
							<input class='input-text' type='text' name='fgContent' required>
							</td>
							<td>
							<button class="btn btn-default btnDeletePresent btn-delete" data-action="delete">-</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="btnArea">
				<button type="submit" id="btn-insert" class="btn btn-success">등록하기</button>
				<button type="button" id="btn-back" class="btn btn-default">돌아가기</button>
			</div>


			<div id="fileArea">
				<input type="file" name="thumbFile" id="thumbFile" onchange="loadImg(this, 0);"> 
					<input type="file"name="file1" id="file1" onchange="loadImg(this, 1);"> 
					<inputb type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
				<input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
			</div>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp" />

	<script>
        $(function () {
            $("#fileArea").hide();
            $("#thumbImg").click(function () {
                $("#thumbFile").click();
            });
            $("#contentImg1").click(function () {
                $("#file1").click();
            });

            $("#contentImg2").click(function () {
                $("#file2").click();
            });

            $("#contentImg3").click(function () {
                $("#file3").click();
            });
            
            
    		$("#btn-back").click(function(){
    			location.href="${pageContext.servletContext.contextPath}/funding";
    		});
    		$("#btn-insert").click(function(){
    			$("#tablePresent tbody tr").each( function (index) {
    		        $(this).find("input[name=fgNo]").attr("name", "fundingGoods[" + index + "].fgNo");
    		        $(this).find("input[name=fgName]").attr("name", "fundingGoods[" + index + "].fgName");
    		        $(this).find("input[name=fgContent]").attr("name", "fundingGoods[" + index + "].fgContent");
    		        $(this).find("input[name=fgPrice]").attr("name", "fundingGoods[" + index + "].fgPrice");
    		        console.log(index);
    		    });
    			$("#insertForm").submit();
    		});

        });

        function loadImg(inputFile, num) {
            if (inputFile.files.length == 1) { //파일 존재하면
                var reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
				console.log(inputFile.files[0]);
                reader.onload = function (e) {
                    switch (num) {
                        case 0:
                            $("#img0").attr("src", e.target.result);
                            break;
                        case 1:
                            $("#img1").attr("src", e.target.result);
                            break;
                        case 2:
                            $("#img2").attr("src", e.target.result);
                            break;
                        case 3:
                            $("#img3").attr("src", e.target.result);
                            break;
                    }
                }
            }
        }
        
        //선물 항목에서 + 버튼 누르면 row 추가
        $('#btnInsertPresent').click(function () {
            const table = document.getElementById('tablePresent');
            const totalRowCnt = table.rows.length;
            const len = String(table.tBodies[0].rows.length + 1);
           	
            var html = `<tr>
            			<td name='tdFgNo' style='vertical-align:middle'>`+len+`<input class='input-text' type='hidden' name='fgNo' value=`+len+`>
            			</td><td><input class='input-text' type='text' name='fgName' required></td>
                    	<td><input class='input-text' type='text' name='fgPrice' required></td>
                    	<td><input class='input-text' type='text' name='fgContent' required></td>
                    	<td><button class='btn btn-default btnDeletePresent btn-delete' data-action='delete'>-</button></td>
                		</tr>`;
              
            $("#tablePresent tbody").append(html);
            
        })
	
        //선물 항목에서 - 버튼 누르면 해당 row 삭제
        $('#tablePresent').on('click', function (event) {
            const totalRowCnt = document.getElementById('tablePresent').rows.length;
            if (event.target.tagName != 'BUTTON') return false; //-버튼누른게 아니면 return
            if (totalRowCnt <= 2) return false; //행이 한줄 이하면 return; 무조건 한줄이상이게 만들기위해서
            
            event.target.parentElement.parentElement.remove();

            const table = document.getElementById('tablePresent');
            console.log((document.getElementsByName("fgNo")));
            for (let i = 1; i < totalRowCnt - 1; i++) { //순번 재정렬 (삭제로 인한 빠진 순번 정리)
                table.rows[i].cells[0].innerHTML = i+`<input class='input-text' type='hidden' name='fgNo' value=`+i+`>`;
				
                (document.getElementsByName("fgNo"))[i-1]=i;
 
            }
        });

    </script>
</body>

</html>