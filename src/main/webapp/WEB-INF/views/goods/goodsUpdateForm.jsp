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
#goodsName {
	width: 800px;
}

.div-goodsName{
	text-align: center;
}

.div-left, .div-right {
	display: inline-block;
	/* margin: 20px; */
}

#updateForm {
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
#beneficiaryTable,#beneficiaryTable thead th{
	border:1px solid black;
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
			<li class="breadcrumb-item active" aria-current="page">수정</li>
		</ol>
	</nav>
	<div class="main">
		<form id="updateForm" action="update" method="post" enctype="multipart/form-data">
			<div class="div-content">
				<div class="div-goodsName">
						<label for="goodsName" style="display: block;">구호물품 이름</label> 
						<input type="text" placeholder="이름을 입력하세요" id="goodsName" name="goodsName" value="${goods.goodsName }" required>
				</div>
				<div class="div-left col-lg-6 col-xs-12">
					<label for="thumbImg">대표 사진</label>
					<div class="div-thumbImg" id="thumbImg">
						<img id="img0" width="370px" height="340px" src="${pageContext.request.contextPath}/resources/upload_files/goods/${goods.thumbnailChangeName}">
					</div>
				</div>
				<div class="div-right col-lg-6 col-xs-12">
					<div class="div-input">
						<label for="cateogry">카테고리</label> <select name="goodsCategoryNo" id="category">
							<c:forEach var="category" items="${goodsCategoryList}">
								<c:if test="${goods.goodsCategoryNo eq category.goodsCategoryNo}">
									<option value="${category.goodsCategoryNo}" selected>${category.goodsCategoryName}</option>
								</c:if>
								<c:if test="${goods.goodsCategoryNo ne category.goodsCategoryNo}">
									<option value="${category.goodsCategoryNo}">${category.goodsCategoryName}</option>
								</c:if>
								
							</c:forEach>
						</select>
					</div>
					<div class="div-input">
						<label for="goodsPrice">가격</label> 
						<input type="text" placeholder="0,000,000" id="goodsPrice" name="goodsPrice" readOnly value="${goods.goodsPrice }"> <span>원</span>
					</div>
					<div class="div-input">
						<label for="cateogry">후원처</label> 
						<div style="overflow:scroll; width:350px; height:200px;">
							<table id="beneficiaryTable">
								<thead>
									<th>순번</th>
									<th>후원처번호</th>
									<th>후원처이름</th>
								</thead>
								<tbody>
								<c:forEach items="${ beneficiaryList}" var="beneficiary" varStatus="status">
									<tr>
										<td>${status.count}</td>
										<td>${beneficiary.beneficiaryNo}</td>
										<td>${beneficiary.beneficiaryName }</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="div-content col-xs-12"
				style="width: 800px; margin: auto;">
				<label for="content">내용</label>
				<textarea name="content" id="content" cols="140" rows="10"
					style="resize: none;" required>${goods.content}</textarea>
				
			</div>

			<div class="btnArea">
				<button type="button" id="btn-update" class="btn btn-success">수정하기</button>
				<button type="button" id="btn-back" class="btn btn-default">돌아가기</button>
			</div>


			<div id="fileArea">
				<input type="file" name="thumbFile" id="thumbFile" onchange="loadImg(this, 0);"> 
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
            
    		$("#btn-back").click(function(){
    			location.href="${pageContext.servletContext.contextPath}/goods";
    		});
    		$("#btn-update").click(function(){
    			$("#updateForm").submit();
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
                    }
                }
            }
        }
        
		
    </script>
</body>

</html>