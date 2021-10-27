<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- font -->
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
<link rel="stylesheet"
	href="resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="resources/assets/css/gijgo.css">
<link rel="stylesheet" href="resources/assets/css/animate.min.css">
<link rel="stylesheet" href="resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="resources/assets/css/slick.css">
<link rel="stylesheet" href="resources/assets/css/nice-select.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
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
	margin-right: 1%;
}

#comment {
	font-size: 25px;
	font-weight: 600;
	color: black;
	float:left;
}

#partList {
	font-size: 25px;
	font-weight: 600;
	color: grey;
}
c{
	font-size: 25px;
	font-weight: 600;	
}
#commentSubmit{
    width: 100px;
    height: 40px;
    border-radius: 5px;
    border-color: rgb(60, 179, 113);
    font-weight: 600;
    color: white;
    background-color: rgb(60, 179, 113);
    margin-top: 5%;
    margin-left: 5%;
    transition: all 0.5s;		
}
#commentSubmit:hover {
    width: 100px;
    height: 40px;
    border-radius: 5px;
    border-color: rgb(60, 179, 113);
    font-weight: 600;
    color: rgb(60, 179, 113);
    background-color: white;
    margin-top: 5%;
    margin-left: 5%;
}
#commentInput{
	width: 700px;
	height: 40px;
	border-radius: 7px;
	font-size: 20px;
}
d{
	font-size: 20px;
	font-weight: 400;
}
#update{
    width: 40px;
    height: 20px;
    border-radius: 5px;
    border-color: rgb(60, 179, 113);
    font-weight: 600;
    color: white;
    background-color: rgb(60, 179, 113);	
}
#delete{
    width: 40px;
    height: 20px;
    border-radius: 5px;
    border-color: rgb(60, 179, 113);
    font-weight: 600;
    color: rgb(60, 179, 113);
    background-color: white;	
}
#commentTable{
	width:1000px;
	height: 30px;
	margin-top: 5%;	
	margin-left:1.8%;
	table-layout: fixed;
	word-break: break-all;
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
</style>
</head>
<body>
	<div class="outer">
		<div style="margin-top: 10%;">
			<span><a id="comment" href="">댓글&nbsp;&nbsp; </a></span>
			<span><c>|<c></span>  
			<span><a id="partList" href="">&nbsp;&nbsp; 참여내역</a></span>
			<div id="greenLine"></div>
			<div id="content">
			<c:if test="${ sessionScope.loginUser ne null }">
				<div>
					<span style=""><d>${ sessionScope.loginUser.userId}</d></span>
					<span style="margin-left:3%;"><input type="text" id="commentInput" placeholder="내용을 입력해주세요"></span>
					<span style=""><input type="submit" id="commentSubmit" value="댓글등록" style=""></span>
				</div>
			</c:if>
				<div>
					<table id="commentTable">
						<tr>
							<th>번호</th>
							<th>작성일</th>
							<th colspan="2">아이디</th>
							<th colspan="7">댓글</th>
							<th></th>
						</tr>
						<tr>
							<td>1</td>
							<td>2021-10-23</td>
							<td colspan="2">${c.scWriter }</td>
							<td colspan="7"">댓글 내용 구구절절절절절절절절절절절절절절절절절절</td>
							<td>
								<input type="submit" id="update" value="수정" style="">
								<input type="submit" id="delete" value="삭제" style="">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>