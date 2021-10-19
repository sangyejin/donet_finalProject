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
            font-size: 14px; 
            font-weight: bolder;
            margin-left: 360px;
            margin-top: 18px;

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
            margin-top: 1%;
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
            width: 670px;
            margin-left: 80px;
            height: 447px;
        }
        /* .clickable:hover{} 아래에 대화상자뜨게 기능*/

        /*point*/

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
           margin-left: 735px;
           margin-bottom: 3%;

        }

        table{border-collapse: collapse;}

        td{ 
            border-bottom: 1px solid gray; 
            height: 25px;
        }

        .value{width: 350px;}

        .head{
            text-align: center;
            width: 100px;
            background-color: rgba(232, 240, 214, 0.5);
        }

        pre{
            margin-left: -110px;
        }

        #cat{
            width: 400px;
            height: 400px;
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
       <div id="notice">공지사항</div>



       <div id="greenline"></div>
       <table>
            <tr>
                <td class="head">제목</td>
                <td class="value"> 개인정보보호방침 개정 안내</td>
                <td class="head">작성일</td>
                <td class="value"> 2000-03-21</td>
            </tr>
            <tr>
                <td class="head">작성자</td>
                <td class="value"> 관리자</td>
                <td class="head">조회수</td>
                <td class="value"> 915회</td>
            </tr>
            <tr>
                <td colspan="4"><pre>
                    안녕하세요 관리자다옹.

                   <img  id="cat" src="/Users/wangsubin/FRONTEND/source_final/meow.jpeg">
                    
                    대충 공지사항에 대한 어쩌구 저쩌구
                    그래서 그렇습니다 안녕하세요 감사합니다 봉주르
                    학이시습지면 불역열호아 암튼 그렇습니다.
                    
                    ∙새들은 왜 날고 바람은 왜 불고 인간은 왜 존재할까요?
                    ∙면허를 따도 차는 없는데 차가워 차 자전차왕엄복동
                    ∙즐겁네요 즐거움 즐거움은 무엇인가 안녕하세요 감사합니다.
                    
                    ☛뉴욕에서 살고싶다 그린카드 주세요 주지마 내맘대로 할게요.
                      ☛자 이제 이거 다 하면 이케아 다녀올 심산입니다. 
                        ☛차가 없으니 어디 가려면 불편한데 뭐 어쩔거야
                          ☛그렇습니다 그래요 그냥 아무말 채우기 위해서 쓰기 
                              ☛주사위굴려서 나온 말 쓰기 자소서 쓰기 자소서는 다 거짓말로 차있다.
                                  ☛자소서는 사실 자소서가 아닙니다 가나다라마바사
                    
                    대충 공지사항에 대한 어쩌구 저쩌구
                    그래서 그렇습니다 안녕하세요 감사합니다 봉주르
                    학이시습지면 불역열호아 암튼 그렇습니다.
                    
                    사용자님들의 협조에 감사할까?
                    
                    관리자 드림.
                    </pre>
                    </td>
            </tr>
            <tr>
                <td class="head">이전글</td>
                <td colspan="3"> 100주년 기념 이벤트 응모방법 공지</td>
            </tr>
            <tr>
                <td class="head">다음글</td>
                <td colspan="3"> 고종황제 즉위 기념 이벤트! 무료커피를 쏜다</td>
            </tr>


       </table>

       <div id="buttons">
            <button onclick="">목록</button>
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