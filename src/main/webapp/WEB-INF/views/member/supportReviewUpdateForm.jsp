<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도넷닷컴</title>
<style>
.outer {
	width: 1050px;
	margin: auto;
}

c {
	font-weight: 600;
	font-size: 15px;
}

.thumbnail {
	width: 350px;
	height: 350px;
	border: 1px solid grey;
	border-radius: 20%;
	text-align: center;
	box-shadow: 10px 10px 10px;
}

#reviewList {
	width: 300px;
	height: 40px;
}

#files {
	margin-left: 20%;
	margin-top: 5%;
}

e {
	font-weight: 600;
	font-size: 15px;
	margin-left: 12%;
}

table {
	width: 800px;
	height: 30px;
	margin: auto;
	margin-top: 1%;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

th {
	background-color: rgb(224, 224, 224);
	border-top: 2px solid #808080;
	border-bottom: 2px solid #808080;
	height: 30px;
}

td {
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

.btnDelete {
	border-radius: 5px;
	border-color: rgb(224, 224, 224);
}

#submit {
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

.attachFileLoad {
	width: 170px;
	margin-right: 3.5%;
}

.attach {
	width: 150px;
	height: 150px;
	border: 1px solid grey;
	border-radius: 20%;
	text-align: center;
	box-shadow: 10px 10px 10px;
	margin-top: 1%;
	margin-left: 5%;
	display: inline-block;
}

.thumbnail {
	width: 350px;
	height: 350px;
	border: 1px solid grey;
	border-radius: 20%;
	text-align: center;
	box-shadow: 10px 10px 10px;
}
</style>

<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">

<!-- favicon -->
<link rel="icon"
	href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png"
	type="image/x-icon">

<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 

	 <!-- 썸머 솔트 -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	<!-- 썸머노트 css, js -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/summernote-lite.css"> 
	
	



</head>
<body id="pageTop">
	<jsp:include page="../common/menubar.jsp"/>

	<div class="outer">
		<form id="insertForm" action="updateReview.me" method="post" enctype="multipart/form-data" autocomplete="off">
			<div style="text-align: center;" >
			<input type="hidden" name="reNo" value="${rv.reNo}">
			<span style="float:right; margin-right:15%;">
				<br><br>
					<c>후원한 프로젝트 </c>
					<div>
						
                   		 <input type="text" style="width:800px; height:40px; text-align:center;" id="reSuTitle" name="reSuTitle" value="${ rv.reSuTitle }" readonly ><br>
											
						 <br><br><br>
			
			<c>후원 후기 제목</c>
			<div><input type="text"  style="width:800px; height:40px; text-align:center; " id="reTitle" name="reTitle" value="${rv.reTitle}"></div><br><br><br>
			
			<span style="display:inline-block;">
			<c>썸네일 이미지</c>
			<div class="thumbnail">
			<img id="image" style="width:340px; height:340px; border-radius:20%;" src="${ pageContext.servletContext.contextPath}/resources/upload_files/donationReview/${rv.thumbnailChange}" />
			</div>
			<br>
       		<input type="file" id="thumbFile" name="thumbFile"/>
       		</span>
			<br><br>
			</div></div><br><br><br>
			<e>내  용</e>
			
  				<textarea id="reContent" class="form-control" name="reContent" placeholder="content" maxlength="140" rows="7">${ rv.reContent }</textarea>    
				
				<br><br><br><br>
							
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
				<div  style="margin-top:2%; margin-left:11%; width:1000px;">
					<input type="file" id="attach1" name="file1" class="attachFileLoad" style="float:left;"/>
					<input type="file" id="attach2" name="file2" class="attachFileLoad" style="float:left;"/>
					<input type="file" id="attach3" name="file3" class="attachFileLoad" style="float:left;"/>
					<input type="file" id="attach4" name="file4" class="attachFileLoad" style=""/>
				</div>
			</div><br><br><br><br><br><br>	
					
				<br><br><br><br>	
			<input type="submit" value="등록하기" id="submit">	
		</form>
	</div>
	
	
		<script>
	

	
	document.getElementById("thumbFile").onchange = function () {
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
	
	</script>
	
	<!-- 이미지 업로드를 위한 콜백 함수  -->
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
				
				 $("#reContent").summernote({
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
							url : "${pageContext.request.contextPath}/member/contentFile",
							cache : false,
							contentType : false,
							processData : false,
							enctype : "multipart/form-data",
							success : function(data){
								console.log(data);
								$(el).summernote('editor.insertImage', '${pageContext.request.contextPath}/'+data.url);
								
							}
						});
					}
	</script>
	
	
    	

	<jsp:include page="../common/footer.jsp" />
	<jsp:include page="../donation/subMenu.jsp" />
</body>
</html>