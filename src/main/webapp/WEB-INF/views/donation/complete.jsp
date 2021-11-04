<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon -->
<link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png" type="image/x-icon">

<!-- font -->
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap" rel="stylesheet">
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<title>도넷닷컴</title>
<style>
.outer {
	width: 1050px;
	margin: auto;
}
#greenLine {
	background-color: rgb(60, 179, 113);
	width: 1050px;
	height: 3px;
	float: right;
}
.labelAdd{
	font-size: 30px;
	font-weight: 600;
	margin-right:3%;
	verticla-align: middle;
}
.man{
	background-color:white;
	width:50px;
	height: 30px;
	border: 1px solid #808080;
	border-radius: 5px;
	verticla-align: middle;
	
}
#addPrice{
	width: 200px;
	height: 35px;
	font-size: 25px;
	text-align:right;
	verticla-align: middle;
}
#addBtn {
	width: 100px;
	height: 35px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-size: 15px;
	font-weight: 600;
	color: rgb(60, 179, 113);
	background-color: white;
	float:right;
	margin-right:35%;
	margin-top:0.8%;
}
#addBtn:hover {
	width: 100px;
	height: 35px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-size: 15px;
	font-weight: 600;
	color: white;
	background-color: rgb(60, 179, 113);
	transition: all 0.5s;
	float:right;
	margin-right:35%;
	margin-top:0.8%;
}
#supportBtn {
	width: 100px;
	height: 35px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-size: 15px;
	font-weight: 600;
	color: white;
	background-color: rgb(60, 179, 113);
	transition: all 0.5s;
}
#supportBtn:hover {
	width: 100px;
	height: 35px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-size: 15px;
	font-weight: 600;
	color: rgb(60, 179, 113);
	background-color: white;
}
#back {
	width: 150px;
	height: 35px;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	font-size: 15px;
	font-weight: 600;
	color: rgb(60, 179, 113);
	background-color: white;
}




</style>
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />

	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>