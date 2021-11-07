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
<!-- CSS here -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/nice-select.css">


<!-- CDN 파일 summernote css/js --> 
<!-- 
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
 -->
<!-- CDN 한글화 --> 
 <!-- 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
 -->
<!-- Summernote -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> 

<style>

.div-fpName {
	text-align: center;
}

.div-left, .div-right {
	display: inline-block;
	/* margin: 20px; */
}

#updateForm {
	text-align: center;
	width: 1050px;
	margin: auto;
}

label {
	display: block !important;
}

#content {
	width: 1050px;
	height: 700px;
}

.input-text, .btn-delete {
	height: 40px;
	border-radius: 4px;
	border: 1px solid rgb(85, 85, 85);
}

#goal {
	width: 350px;
}

#startDate, #closeDate {
	width: 244px;
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
	clear:both; 
}

.div-content {
	padding-top: 0;

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
	width: 30%;
	height: 100%;
	display: inline-block;
	border: 1px solid #c8c8c8;
	padding: 0;
	margin-left: 10px;
	margin-right: 10px;
}

.group-img {
	margin: auto;
	padding: 0;
	width: 100%;
	height: 160px;
}

.div-thumbImg {
	margin-left: 0;
	width: 500px;
	height: 500px;
	padding: 0;
}
/* input number의 증가감소 버튼 안보이게 */
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

#category+.nice-select ,#category+.nice-select>.list{
	float: none;
	display: block;
	width:100%;
}
.inputText {
	border: 1px solid #e8e8e8;
	height: 42px;
	width: 400px;
	padding-left: 20px;
}
#fpName {
	width: 1050px;
}
#div-fpName,#div-content{
	margin-bottom:50px;
}
.label-text{
	margin-top:0.8em;
}
#paymentDate{
	width:100%;
}
#goal{
	width:500px;
}
</style>


</head>

<body>
	<jsp:include page="../common/menubar.jsp" />

	<div class="main">
		<form id="updateForm" action="update" method="post"
enctype="multipart/form-data">
			<div class="div-fpName">
				<label for="fpName" style="display: block;" class="label-text">펀딩 프로젝트 제목</label> <input
					type="text" class="inputText" placeholder="제목을 입력하세요" id="fpName" name="fpName" value="${funding.fpName }" required>
			</div>
			<div class="div-content">
				<div class="div-left col-lg-6 col-xs-12">
					<label for="thumbImg" class="label-text">대표 사진</label>
					<div class="div-thumbImg" id="thumbImg">
						<img id="img0" width="500px" height="500px" src="${pageContext.request.contextPath}/resources/upload_files/funding/${funding.thumbnailChangeName}">
					</div>
				</div>
				<div class="div-right col-lg-6 col-xs-12" style="padding-left: 0px; padding-right: 0px;">
					<div class="div-input">
						<label for="cateogry" class="label-text">카테고리</label> <select name="categoryNo"
							id="category">
							<c:forEach var="category" items="${category}">
								<c:choose>
								<c:when test="${funding.categoryNo eq category.categoryNo}">
									<option value="${category.categoryNo}" selected>${category.categoryName}</option>
								</c:when>
								<c:otherwise>
									<option value="${category.categoryNo}">${category.categoryName}</option>
								</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<div class="div-input">
						<label for="goal" class="label-text">목표 금액</label> <input type="text"class="inputText" 
							placeholder="0,000,000" id="goal" name="goal" value="${funding.goal }" readonly> <span>원</span>
					</div>
					<div class="div-input">
						<label for="startDate" class="label-text">펀딩 기간</label> <input type="Date" class="inputText" 
							placeholder="0000-00-00" id="startDate" name="startDate" value="${funding.startDate }" readonly>
						<span style="margin: 0 10px;">~</span> <input type="Date" class="inputText" 
							placeholder="0000-00-00" id="closeDate" name="closeDate"  value="${funding.closeDate }" readonly>
					</div>
					<div class="div-input">
						<label for="" class="label-text">결제 예정 날짜</label> <input type="Date" class="inputText" 
							placeholder="0000-00-00" id="paymentDate" name="paymentDate" value="${funding.paymentDate }" readonly>
					</div>
					<div class="div-input">
						<label for="" class="label-text">추가사진</label>
						<div class="group-img">
							<div class="div-contentImg col-xs-4" id="contentImg1">
								<img class="contentImg"  id="img1">
							</div>
							<div class="div-contentImg col-xs-4" id="contentImg2">
								<img class="contentImg" id="img2">
							</div>
							<div class="div-contentImg col-xs-4" id="contentImg3">
								<img class="contentImg" id="img3">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="div-content col-xs-12"
				style="width: 1050px;margin: auto;padding-left: 0px;">
				<label for="content" class="label-text">내용</label>
			
  				<textarea id="content" name="content" placeholder="">${funding.content}</textarea>

				<label for="present">선물 </label>
				<table id="tablePresent" class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">이름</th>
							<th scope="col">가격</th>
							<th scope="col">내용</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="f" items="${fundingGoodsList}" varStatus="status">
						<tr>
							<td style="vertical-align: middle">${status.count }</td>
							<td>${f.fgName}</td>
							<td>${f.fgPrice}</td>
							<td>${f.fgContent}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="btnArea">
				<button type="submit" id="btn-update" class="btn btn-success">수정</button>
				<button type="button" id="btn-delete" class="btn btn-default">삭제</button>
			</div>


			<div id="fileArea">
				<input type="file" name="thumbFile" id="thumbFile" onchange="loadImg(this, 1);"> 
					<input type="file"name="file1" id="file1" onchange="loadImg(this, 2);"> 
					<input type="file" name="file2" id="file2" onchange="loadImg(this, 3);">
				<input type="file" name="file3" id="file3" onchange="loadImg(this, 4);">
			</div>
			<div id="imgArea" style="display:none;">
				
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
            
            
    		$("#btn-delete").click(function(){
    			location.href="${pageContext.servletContext.contextPath}/funding/${funding.fpNo}/delete";
    		});
    		$("#btn-update").click(function(){
    			location.href="${pageContext.servletContext.contextPath}/funding/${funding.fpNo}/update";
    		});

        });

        function loadImg(inputFile, num) {
        	console.log(inputFile.files.length );
            if (inputFile.files.length == 1) { //파일 존재하면
                var reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
				console.log(inputFile.files[0]);
                reader.onload = function (e) {
                    switch (num) {
                        case 1:
                            $("#img0").attr("src", e.target.result);
                            break;
                        case 2:
                            $("#img1").attr("src", e.target.result);
                            break;
                        case 3:
                            $("#img2").attr("src", e.target.result);
                            break;
                        case 4:
                            $("#img3").attr("src", e.target.result);
                            break;
                    }
                }
            }
        }
        
		$("#content").summernote({
			placeholder: '',
			height: 500, 
			width: 1050,
	    	minHeight: null,            
	    	maxHeight: null,            
	    	focus: true,           
	    	disableResizeEditor: true,
	    	toolbar: [
	              ['style', ['style']],
	              ['font', ['bold', 'underline', 'clear']],
	              ['color', ['color']],
	              ['para', ['ul', 'ol', 'paragraph']],
	              ['table', ['table']],
	              ['insert', ['link', 'picture', 'video']],
	              ['view', ['fullscreen', 'codeview', 'help']]
	            ],
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
				url : "contentFile",
				cache : false,
				contentType : false,
				processData : false,
				enctype : "multipart/form-data",
				success : function(data){
					$(el).summernote('editor.insertImage', '${pageContext.request.contextPath}/'+data.url);
					console.log(data.url);
				}
			});
		}
        
    </script>
	<!-- Jquery Mobile Menu -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/animated.headline.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.magnific-popup.js"></script>


	<!-- Nice-select, sticky -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.sticky.js"></script>



	<!-- Jquery Plugins, main Jquery -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>

</html>