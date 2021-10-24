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

<!-- CSS here -->
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/assets/css/slicknav.css">
<link rel="stylesheet" href="resources/assets/css/flaticon.css">
<link rel="stylesheet" href="resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="resources/assets/css/gijgo.css">
<link rel="stylesheet" href="resources/assets/css/animate.min.css">
<link rel="stylesheet" href="resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="resources/assets/css/slick.css">
<link rel="stylesheet" href="resources/assets/css/nice-select.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<title>도넷닷컴</title>
<style>
    .outer{
        width: 1050px;
        margin: auto;
    }
	#greenLine{
        background-color: rgb(60, 179, 113);
        width: 1000px;
        height: 3px;
        float: right;
	}
	.topTotop{
	    cursor: pointer;
	    color: white;
	    font-size: 14px;
	    background-color: rgb(60, 179, 113);
	    border-radius: 5px;
	    padding: 7px 5px 7px 7px;
	}
	#registration{
		cursor: pointer;
		color: rgb(60, 179, 113);
		font-size: 13px;
		font-weight: 500;
		background-color: white;
        width: 80px;
        height: 40px;
        border-radius: 5px;
        border-color: rgb(60, 179, 113);
        float: right;
        margin-right: 3%;		
	}
	.title{
		display: inline-block;
	}
	c{
		float:left; 
		font-size:30px;
		font-weight: 800;
	}
	.categoryBox{
        width: 900px;
        height: 80px;
        margin: auto;
        margin-top: 2%;
        margin-right: 10%;
        box-shadow: 10px 10px 10px;
	}
	.category{
		margin-top: 2%;
		margin-left: 2%;
		cursor: pointer;
		color: black;
		font-size: 13px;
		font-weight: 500;
		background-color: rgb(224, 224, 224);
        width: 80px;
        height: 40px;
        border-radius: 5px;
        border-color: rgb(224, 224, 224);
	}
	#environment{
		background-color: rgb(60, 179, 113);
		color: white;
		font-weight: 600;
	}

</style>
</style>
</head>
<body id="pageTop">
	<jsp:include page="../common/menubar.jsp"/>

	<div class="outer">
		<div class="title">
			<span><c>후원 > 후원 프로젝트</c></span>
			<span><button type="button" id="registration" onclick="location.href='reist.do'">등록하기</button></span>
			<div id="greenLine"></div>
		</div>
		<div class="categoryBox">
			<span><input type="button" class="category" id="global" value="지구촌" onclick="global()"/></span>
			<span><button class="category" id="environment" onclick="environment()">환경</button></span>
			<span><button class="category" id="animal" onclick="animal()">동물</button></span>
			<span><button class="category" id="child" onclick="child()">아동/청소년</button></span>
			<span><button class="category" id="vulnerable" onclick="vulnerable()">취약계층</button></span>
		</div>
		<div class="content">
			
		</div>
	</div>
	<script>
		function global(){
			location.href="global";			
		}
		function environment(){
			location.href="environment";			
		}
		function animal(){
			location.href="animal";			
		}
		function child(){
			location.href="child";			
		}
		function vulnerable(){
			location.href="vulnerable";			
		}
	</script>
	<jsp:include page="../common/footer.jsp" />
	<div style="display:scroll;position:fixed;bottom:10px;right:5px;"><a class="topTotop" href="#pageTop">TOP▲</a></div>
</body>
</html>