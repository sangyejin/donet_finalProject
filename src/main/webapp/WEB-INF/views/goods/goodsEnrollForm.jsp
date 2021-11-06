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

#goodsName {
	width: 1050px;
}

.div-goodsName{
	text-align: center;
}

.div-left, .div-right {
	display: inline-block;
	/* margin: 20px; */
}

#insertForm {
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

/*
#category,#addBeneficiary {
	height: 40px;
	border-radius: 4px;
	width: 500px;
	border: 1px solid rgb(85, 85, 85);
}
*/
#category+.nice-select ,#category+.nice-select>.list{
	float: none;
	display: block;
	width:100%;
}
#addBeneficiary+.nice-select, #addBeneficiary+.nice-select>.list{
	float: none;
	display: inline-block;
	width:462px;
	text-align:left;
	vertical-align:top;
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
	padding: 20px 0 20px 0;
	/*overflow: hidden;*/
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
	width: 500px;
	height: 450px;
	padding: 0;
}
.inputText {
	border: 1px solid #e8e8e8;
	height: 42px;
	width: 400px;
	padding-left: 20px;
}

/* select 일정 길이 이상되면 scroll */
.nice-select .list{
	overflow:scroll;
	overflow-x:hidden;
	max-height:200px;
}
/* 후원처 테이블 */
#beneficiaryTable thead th,#beneficiaryTable tbody td{
	border:1px solid #e8e8e8;
	border-collapse: collapse;
	padding-top:2px;
	padding-bottom:2px;
} 

#beneficiaryTable > input{
	border:none;
}

/*테이블 헤더 고정 */
.beneDiv {
    overflow: auto;
}

#beneficiaryTable {
    border-collapse: collapse;
    border: 1px solid #e8e8e8;
    width:100%;
}

#beneficiaryTable thead {
    position: sticky;
    top: 0px;
    background-color:white;
}



#btnInsertBeneficiary{
	width:42px;
	display: inline-block;
	height:42px;
	border: 1px solid #e8e8e8;
}
#goodsPrice{
	width:490px;
}
.label-text{
	margin-top:0.8em;
}
#img0 {
	border: 1px solid #e8e8e8;
	height: 500px;
	width: 500px;
}

#beneDiv {
	margin-top: 2em;
	overflow: scroll;
	overflow-x: hidden;
	width: 510px;
	height: 256px;
	margin-bottom: 0;
}
/* input number의 증가감소 버튼 안보이게 */
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}


</style>

</head>

<body>
	<jsp:include page="../common/menubar.jsp" />

	<div class="main">
		<form id="insertForm" action="insert" method="post" enctype="multipart/form-data">
			<div class="div-content">
				<div class="div-goodsName">
						<label for="goodsName" style="display: block;" class="label-text">구호물품 이름</label> 
						<input type="text" placeholder="제목을 입력하세요"  class="rounded-pill inputText"  aria-describedby="button-addon2" id="goodsName" name="goodsName" required>
				</div>
				<div class="div-left col-lg-6 col-xs-12">
					<label for="thumbImg" class="label-text">대표 사진</label>
					<div class="div-thumbImg" id="thumbImg">
						<img id="img0">
					</div>
				</div>
				<div class="div-right col-lg-6 col-xs-12" style="padding-right: 0px;">
					<div class="div-input">
						<label for="cateogry" class="label-text">카테고리</label> 
						<select name="goodsCategoryNo" id="category">
							<c:forEach var="category" items="${categoryList}">
								<option value="${category.goodsCategoryNo}">${category.goodsCategoryName}</option>
							</c:forEach>
						</select>
					</div>
					<div class="div-input">
						<label for="goodsPrice" class="label-text" >가격</label> 
						<input type="number" placeholder="0,000,000" step="1000" class="rounded-pill inputText"  id="goodsPrice" name="goodsPrice" required> <span>원</span>
					</div>
					<div class="div-input">
						<label for="cateogry" class="label-text">후원처</label> 
						<div style="height:42px;">
						<select name="addBeneficiary" id="addBeneficiary">
							<c:forEach var="beneficiary" items="${beneficiaryList}">
								<option value="${beneficiary.beNo},${beneficiary.beName}">${beneficiary.beName}</option>
							</c:forEach>
						</select>
						<input id="btnInsertBeneficiary"class="btn btn-default" type="button" value="+">
						</div>
						<div id="beneDiv">
							<table id="beneficiaryTable">
								<colgroup>
									<col width = "10%">
									<col width = "20%">
									<col width = "50%">
									<col width = "20%">
								</colgroup>
								<thead>
									<th>순번</th>
									<th>후원처번호</th>
									<th>후원처이름</th>
									<th>삭제</th>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="div-content col-xs-12"
				style="width:100%; margin: auto;">
				<label for="content" class="label-text" >내용</label>
				<textarea id="content" name="content" placeholder=""></textarea>
				
				<!-- <textarea name="content" id="content" cols="140" rows="10"
					style="resize: none;" required></textarea> -->
			</div>

			<div class="btnArea">
				<button type="button" id="btn-insert" class="btn btn-success">등록하기</button>
				<button type="button" id="btn-back" class="btn btn-default">돌아가기</button>
			</div>


			<div id="fileArea">
				<input type="file" name="thumbFile" id="thumbFile" onchange="loadImg(this, 0);"> 
			</div>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp" />

	<script>
    $('#beneficiaryTable').on('click', function (event) {
        const totalRowCnt = document.getElementById('beneficiaryTable').rows.length;
        if (event.target.tagName != 'BUTTON') return false; //-버튼누른게 아니면 return
        if (totalRowCnt <= 2) return false; //행이 한줄 이하면 return; 무조건 한줄이상이게 만들기위해서
        
        event.target.parentElement.parentElement.remove();

        const table = document.getElementById('beneficiaryTable');
        for (let i = 1; i < totalRowCnt - 1; i++) { //순번 재정렬 (삭제로 인한 빠진 순번 정리)
            table.rows[i].cells[0].innerHTML = i;
			
            (document.getElementsByName("fgNo"))[i-1]=i;

        }
    });
		$("#btnInsertBeneficiary").click(function(){
			const bene=$("#addBeneficiary").val();
			const splitData=bene.split(",");
			
			//같은 후원처 리스트에 여러개 추가 불가능 처리
			var size = $("input[class='notInput']").length;
		    for(i=0;i< size; i++){
				if($("input[class='notInput']").eq(i).attr("value")==splitData[0]){
					alert("이미 추가된 후원처입니다.");
		        	return;
		        }
		    }
		    
            const table = document.getElementById('beneficiaryTable');
			const len = String(table.tBodies[0].rows.length + 1);
			
			const temp=`<tr>
							<td>`+len+`</td>
							<td><input class="notInput" name="beneficiaryNo" type="text" value="`+splitData[0]+`" style="border:none;" readonly></td>
							<td>`+splitData[1]+`</td>
							<td><button class='btn btn-default btn-delete' data-action='delete'>-</button></td>
						</tr>`;
			$("#beneficiaryTable tbody").append(temp);
			$(".notInput").css({"border":"none","outline": "none","width":"100%","height":"100%","padding":"0","text-align":"center"});
		});
	
        $(function () {
            $("#fileArea").hide();
            $("#thumbImg").click(function () {
                $("#thumbFile").click();
            });
            
    		$("#btn-back").click(function(){
    			location.href="${pageContext.servletContext.contextPath}/goods";
    		});
    		$("#btn-insert").click(function(){
    			$("#beneficiaryTable tbody tr").each( function (index) {
    		        $(this).find("input[name=beneficiaryNo]").attr("name", "requiredGoods[" + index + "].beneficiaryNo");
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
                    }
                }
            }
        }
        
		$("#content").summernote({
			height: 500, 
			width: 1050,
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