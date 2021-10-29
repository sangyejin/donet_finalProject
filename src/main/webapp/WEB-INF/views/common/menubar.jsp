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
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">    
   
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	    
	<!-- datepicker -->    
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	 
<style>

*{
	font-family: 'Noto Sans KR', sans-serif;
    font-size: 12px;
    margin: 0;
	padding: 0;
}

#outline{
    width: 1050px;
    height: 110px;
    box-shadow: 0px 10px 5px -3px rgb(244, 244, 244);
    margin-bottom: 5%;
   	position : inline;
   	margin-left : 150px;
}

ul>li{ list-style-type: none; }

.greenfont{
    margin-top:0px;
    float: left;
    width : 140px;
    height : max-content;
    font-weight: bold;
    color : rgb(30, 154, 40);
    margin-left: 30px;
    line-height: 25px;
    position : block; 
}

li > a{  color : rgb(30, 154, 40); text-decoration : none;}

a:hover{ color : rgb(30, 154, 40);  text-decoration: underline; }

#right{ margin-right: 50px; }

.greenfont > ul > li {
    margin-top: 15px;
    float: left;
    font-size: 12px;
    width : 100px;
    height : max-content;
    text-align: center;
    line-height: 10px;
}

.greenfont > ul > li { display: none; }

.greenfont:hover > ul > li {  display: inline; }

.arrow_box{  position : absolute; }

#outline > #logoLine > li{  float : left; }

#logo{
    margin-left: 25px;
    width : 160px;
    height: 70px;
    margin-top : -5px;
}

#userinfo{
 	margin-left: 700px;
 	margin-top : -35px;
}

#secondLine{  margin-top : -7px; }

.thisuser{ font-size : 10px; }

.noDecoration{font-size : 10px;  color : rgb(30, 154, 40);  text-decoration: none; }

a{ color : #000000;  text-decoration: none; }

.smallerFonts{
	color : rgb(30, 154, 40);  
	text-decoration: none;
	font-size : 10px;
}
.loginDiv{
color : rgb(30, 154, 40);  
width : 300px;
height : 30px;
}

</style>
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
    <div id="outline" align="center">
            <div id = "right" rowspan="8"><img id="logo" src="${ pageContext.servletContext.contextPath }/resources/imgs/logo1.png" alt=""></div>
               
            <!-- 로그인 전 -->
            <c:if test="${ empty sessionScope.loginUser }">
       		<div class="loginDiv" id="userinfo"><a class="noDecoration" href="enrollForm.me" >회원가입</a> | <a class="noDecoration" href="loginForm.me" >로그인</a></div>
       		</c:if>
       		
       		<!-- 로그인 후  -->
       		<c:if test="${ !empty sessionScope.loginUser }">
       		<div class="loginDiv" id="userinfo"><label class="smallerFonts" >${ sessionScope.loginUser.userName }님</label> |  <a class="smallerFonts"  href="myPage.me">마이페이지</a>  |  <a class="smallerFonts"  href="logout.me">로그아웃</a> </div>
            </c:if>
        <br>
        
       <%--  <!-- 로그인 전 -->
                                
                <c:if test="${ empty sessionScope.loginUser }"> 
                <li class="greenfont" id="7">             
	                <a href="enrollForm.me" >회원가입</a>  | 	            
	                <a href="" data-toggle="modal" data-target="#loginModal">로그인</a> </li>
                </c:if>
                <a  class="noDecoration" href="" data-toggle="modal" data-target="#loginModal">로그인</a>
         <!-- 로그인 후  -->
                 
                <c:if test="${ !empty sessionScope.loginUser }">
                <li class="greenfont" id="7">	
	                <label>${ sessionScope.loginUser.userName }님</label> |
	                <a href="myPage.me">마이페이지</a>  |
	                <a href="logout.me">로그아웃</a> </li>
                </c:if> --%>
        
        <div id="secondLine"> 
            <ul>
                 <li class="greenfont" id="1"><a href="introduce.pr">도넷 닷컴 소개</a>
                    <ul class="arrow_box">
                        <li><a href="introduce.pr">프로젝트 소개</a></li>
                        <li><a href="introduce.how">후원 방법</a></li>
                        <li><a>통계 조회</a></li>
                    </ul> 
                </li>
                <li class="greenfont" id="2"><a href="list.do">후원 프로젝트</a>
                    <ul class="arrow_box">
                        <li><a href="global?suCategoryNo=1">지구촌</a></li>
                        <li><a href="environment?suCategoryNo=2">환경</a></li>
                        <li><a href="animal?suCategoryNo=3">동물</a></li>
                        <li><a href="child?suCategoryNo=4">아동/청소년</a></li>
                        <li><a href="vulnerable?suCategoryNo=5">취약계층</a></li>
                    </ul> 
                </li>
                <li class="greenfont" id="3"><a>이벤트</a>
                    <ul class="arrow_box">
                        <li><a href="list.ev">진행중인이벤트</a></li>
                        <li><a href="afterList.ev">지난이벤트</a></li>
                        
                    </ul> 
                </li>
                <li class="greenfont" id="4"><a href="${ pageContext.servletContext.contextPath }/funding">펀딩 프로젝트</a>
                
                </li>
                <li class="greenfont" id="5"><a>고객지원</a>
                    <ul class="arrow_box">
                        <li><a href="list.no">공지사항</a></li>
                        <li><a href="list.faq">자주 묻는 질문</a></li>
                        <li><a href="list.one">1:1 문의</a></li>
                    </ul> 
                </li>
                <li class="greenfont" id="6"><a>커뮤니티</a>
                    <ul class="arrow_box"> 
                        <li><a>선행활동</a></li>
                        <li><a>?</a></li>
                    </ul> 
                </li>                
                
                

			</ul>
            </div>
    </div>
    
     <!-- 로그인 클릭 시 뜨는 모달  -->
    <!-- <div class="modal fade" id="loginModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            Modal Header
            <div class="modal-header">
                <h4 class="modal-title">로그인하기</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="login.me" method="post">
                Modal Body
                <div class="modal-body">
                    <label for="userId" class="mr-sm-2">아이디 :</label>
                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="userId" name="userId"> <br>
                    <label for="userPwd" class="mr-sm-2">비밀번호:</label>
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="userPwd" name="userPwd">
                </div>
                
                Modal footer
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success ">로그인</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </form>
            </div>
        </div>
    </div> -->
    
    <script>
    
    	$("#logo").on('click', function(){
    		location.href="/donet"
    	})
    </script>
    
</body>
</html>