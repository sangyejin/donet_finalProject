<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도넷닷컴</title>
    <link href="https://fonts.googleapis.com/css2?family=Gugi&family=Song+Myung&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<style>
/*
body{
    background-color: rgb(248,250,244);
}*/

*{
   /* font-family: 'Gugi', cursive;*/
   /*font-family: 'Song Myung', serif;*/
    font-family: 'Nanum Gothic Coding', monospace;
    font-size: 12px;
    margin: 0;
	padding: 0;

}

#outline{
    width: 1300px;
    height: 110px;
    box-shadow: 0px 10px 5px -3px rgb(244, 244, 244);
    margin-bottom: 5%;
   	position : inline;
}

ul>li{ list-style-type: none; }

.greenfont{
    margin-top: 13px;
    float: left;
    font-size: 14px;
    width : 180px;
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
    /*background-color: rgb(244, 244, 244);*/
    margin-top: 18px;
    float: left;
    font-size: 12px;
    width : 100px;
    height : max-content;
   /*margin-left: 6px;*/
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
 	margin-left: 1060px;
 	margin-top : -39px;
}

#secondLine{  margin-top : -7px; }

.thisuser{ font-size : 10px; }

</style>
</head>
<body>
    <div id="outline" align="center">
            <div id = "right" rowspan="8"><img id="logo" src="${ pageContext.servletContext.contextPath }/resources/imgs/logo1.png" alt=""></div>
       		<div class="greenfont" id="userinfo"><a class="thisuser">OOO님</a> | <a class="thisuser">로그아웃</a></div>
        <br>
        <div id="secondLine"> 
            <ul>
                <li class="greenfont" id="1"><a>도넷 닷컴 소개</a>
                    <ul class="arrow_box">
                        <li><a>프로젝트 소개</a></li>
                        <li><a>후원 방법</a></li>
                        <li><a>통계 조회</a></li>
                    </ul> 
                </li>

                <li class="greenfont" id="2"><a>후원 프로젝트</a>
                    <ul class="arrow_box">
                        <li><a>출판</a></li>
                        <li><a>게임/취미</a></li>
                        <li><a>뷰티</a></li>
                        <li><a>패션/잡화</a></li>
                        <li><a>소셜/컨설팅</a></li>
                    </ul> 
                </li>

                <li class="greenfont" id="3"><a>이벤트</a>
                    <ul class="arrow_box">
                        <li><a href="list.ev">진행중인 이벤트</a></li>
                        <li><a href="afterList.ev">지난 이벤트</a></li>
                        
                    </ul> 
                </li>
                <li class="greenfont" id="4"><a>펀딩 프로젝트</a>
                  <ul class="arrow_box">
                        <li><a>출판</a></li>
                        <li><a>게임/취미</a></li>
                        <li><a>뷰티</a></li>
                        <li><a>패션/잡화</a></li>
                        <li><a>소셜/컨설팅</a></li>
                    </ul> 
                </li>
                <li class="greenfont" id="5"><a>고객지원</a>
                    <ul class="arrow_box">
                        <li><a href="list.no">공지사항</a></li>
                        <li><a>자주 묻는 질문</a></li>
                        <li><a>1:1 문의</a></li>
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
    <!--
    맨 위로 돌아가기 아이디어

    <a href="#menu">메뉴로 돌아가기</a>
    <span>gday</span>
    span{ 
        background-color: blue;
        width: 100px;
        height : 100px; /*스팬은 이게 안먹어서 디스플레이 먹여줘야 크기 조정이 된다*/
        /* position  : absolute;*/
        position : fixed;
        top : 100px;
        left : 100px;
    }   
    -->
</body>
</html>