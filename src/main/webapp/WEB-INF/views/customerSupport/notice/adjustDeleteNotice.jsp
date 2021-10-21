<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도넷닷컴</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap" rel="stylesheet">

    <style>
        *{ /*border: 1px red solid;*/
            font-family: 'Nanum Gothic Coding', monospace;
            font-size: 12px;
        }

        /*sidebar*/        
        h3{ font-size: 22px; }
        .sidebar{
             width: 150px;
             height: 400px;
             margin-left: 3%;
             padding: 0;
             float: left;
             margin-top: 0;

        }
        
        a:hover{ text-decoration: underline; }

        #greenfont1 {margin-right: 45%; text-decoration: none;}
        #faq{margin-right: 18%;}
        #facetoface{margin-right: 43.5%; }
        #wrap{margin-bottom: 7%;}

        #greenfont1, #faq, #facetoface{ font-weight: bolder; }

        /*helper*/
        .needhelp{ 
            margin-top: 40%;
            border: 1px solid rgb(244, 244, 244);
            background-color: rgb(244, 244, 244);
            width: 140px;
            height: 40px;
            border-radius: 10px;
        }

        #help{
           font-weight: bolder;
           margin-bottom: 5px;
           margin-top: 3px; /*need help?*/
           width: 140px;
           margin-left: 3%;
        }

        #gethelp{ margin-left: 3%; }

        #helparrow{
            margin-left: 29%;
            margin-top: 0px;
        }

        /* side bar */
        #thelist{
            float: left;
            margin-left: 5%;
            margin-top: 2%;
            width: 800px;
        }

        #notice{
            font-size: 16px; 
            font-weight: bolder;
        }
        
        #greenfont1, #greenfont2{ color: rgb(30, 154, 40); }

       

        /*writing box*/
        #sideGreenbar{
            background-color: rgba(232, 240, 214, 0.5);
            height: 555px;
            width: 100px;
            margin-top: -0.5px;
        }

        #getInThere{
            margin-top: -545px;
            margin-left: 35px;
        }

        #inputTitle{
            width: 670px;
            margin-left: 50px;
        }

        .grayline{
            margin-top: 2%;
            margin-bottom: 2%;
            margin-left: 8.5%;

            width: 700px;
            height: 0.001cm;
            border : 0.3px solid grey;
            background-color: grey;
        }

        #whole{
            width: 1210px;
            margin-left: 90px;
        }

        span > b { margin-left: 52px; }

        span > p{ 
            margin-left: 136px;
            margin-top : -21px;
        }

        span > p > #boldPeriod{ /*margin-top : -9px;*/ margin-left : -3px; font-size: 22px; }

        span > mark { margin-left: 153px; }

        #justGetThere{ margin-top: -27px; }

        #headjustify{ margin-top : -5px}

        #greenline{
            margin-top: 2%;
            margin-bottom: 0;
            width: 800px;
            height: 1px;
            border : 1px solid rgb(30, 154, 40);
            background-color: rgb(30, 154, 40);
        }


        .thisimg{ 
            width: 15px;
            height: 15px;
        }

        .biggerimg{
            width: 18px;
            height: 18px;
        }

        .shabbygrayline{
            margin-top: 1%;
            margin-bottom: 2%;
            margin-left: 8.5%;

            width: 700px;
            height: 0.001cm;
            border : 0.3px solid grey;
            background-color: grey;
        }

        #alignboi{
            margin-left: 180px;
            margin-top: -14px;
        }
        
        #justify{/*justify*/
            margin-left: 243.5px;
            margin-top: -19.5px;


        }

        #aLine{ /*span*/
            margin-left: 265px;
            margin-top: -17.5px;
        }

        #differ{/*img*/
            margin-left: 273px;
            margin-top: -14px;

        }

        #contentText{
            margin-top: -15px;
            width: 670px;
            margin-left: 80px;
            height: 447px;
        }
        /* .clickable:hover{} 아래에 대화상자뜨게 기능*/

        /*point*/

        input{ color: gray; }

        

       
        button{
            height: 25px;
            width: 60px;
            border-radius: 7px;
            border-style: none;
            background-color: rgb(244, 244, 244) ;
        }

        button:hover{
            color: white;
            background-color: rgb(66, 178, 115) ;
        }

        #buttons{
           margin-top: 2%;
           margin-left: 558px;
           margin-bottom: 3%;

        }

       
    </style>

</head>
<body>
<div id="whole">

    <div class="sidebar">
        <h3>고객지원</h3>
        <div id="wrap">
            <tr>
                <td width: 300px;><a id="greenfont1" class="bottomfix">공지사항</a></td>
                <td class="arrow"><span id="greenfont2" class="bottomfix"> > </span></td>
            </tr>
            <br>
            <tr>
                <td width: 300px;><a id="faq" class="bottomfix">자주 묻는 질문</a></td>
                <td class="arrow"><span class="bottomfix"> > </span> </td>
            </tr>
            <br>
            <tr>
                <td width: 300px;><a id="facetoface" class="bottomfix">1:1 문의</a></td>
                <td class="arrow"><span class="bottomfix"> > </span> </td>
            </tr>
        </div>
        <div class="needhelp">
            <span><p id="help">도움이 필요하신가요?</p></span>
            <span><a id="gethelp">1:1 문의하기</a></span>
            <span id="helparrow"> > </span>
        </div>
    </div>

    <div id="thelist">
       <span id="notice">공지사항 수정</span>



        <!--관리자 메뉴 -->
       <div id="greenline"></div>

       <div id="sideGreenbar"></div>
       <div id= "getInThere">
            <span id="headTitle"><label for="inputTitle">제목</label> <input type="text" id="inputTitle" name="inputTitle"></span>
            <div class="grayline"></div>

            <div id="headjustify">서식
                <span class="clickable"><b>B</b></span>
                <span class="clickable"><i>I</i></span>
                <span class="clickable"><u>U</u></span>
                <span class="clickable"><del>T</del></span>
                <span class="clickable"><p>T<b id="boldPeriod">.</b></p></span>

                <div id="justGetThere">
                    <span class="clickable"><mark>T</mark></span>
                    <span> | </span>
                </div>
                     <div id="alignboi">
                        <span class="clickable"><img class="thisimg" src="/Users/wangsubin/FRONTEND/source_final/Left.png"></span>
                        <span class="clickable"><img class="thisimg" src="/Users/wangsubin/FRONTEND/source_final/Center.png"></span>
                        <span class="clickable"><img class="thisimg" src="/Users/wangsubin/FRONTEND/source_final/Right.png"></span>
                     </div>  
                    <div class="clickable" id="justify"><img class="biggerimg" src="/Users/wangsubin/FRONTEND/source_final/Justify.png"></div>
                    <div id="aLine"> | </div>
                    <div class="clickable" id="differ"><img class="biggerimg" src="/Users/wangsubin/FRONTEND/source_final/imgIcon.png"></div>
                    
            </div>

        <div class="shabbygrayline"></div>

        <span>내용</span>

        <input type="text" id="contentText" name="contentText">


        <div id="buttons">
             <button onclick="">수정</button>
             <button onclick="">임시저장</button>
             <button onclick="">삭제</button>

        </div>  
</div>

<!--
<script>
    $(function(){
        $('.clickable').hover(function(){
            $('.clickable').text("선택")
        })
    })

</script>-->

</body>
</html>