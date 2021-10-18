<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도넷닷컴</title>
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">
<style>
    .outer{
        width: 1050px;
        margin: auto;
        text-align: center;
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
	


</style>
</style>
</head>
<body id="pageTop">
	<jsp:include page="../common/menubar.jsp"/>

	<div class="outer">
		<form>
			<c>후원 프로젝트 제목</c>
			<input type="text" placeholder="제목을 입력하세요">
		
		</form>
		
		
	</div>
	<jsp:include page="../common/footer.jsp" />
	<div style="display:scroll;position:fixed;bottom:10px;right:5px;"><a class="topTotop" href="#pageTop">TOP▲</a></div>
</body>
</html>