<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도넷닷컴</title>
    <link href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap" rel="stylesheet">

    <style>
        *{
            //border: 1px red solid;
            font-family: 'Nanum Gothic Coding', monospace;
            font-size: 12px;
        }
		
        /*sidebar*/        
        h3{
            font-size: 18px;
        }
        .sidebar{
             width: 150px;
             height: 400px;
             /*margin-left: 3%;*/
             padding: 0;
             float: left;
             margin-top: 0;

        }
        
        a:hover{
            text-decoration: underline;
        }

        #greenfont1 {margin-right: 46%; text-decoration: none;}
        #faq{margin-right: 18%;}
        #facetoface{margin-right: 44%; }
        #wrap{margin-bottom: 7%;}

        #greenfont1, #faq, #facetoface{
            font-weight: bolder;
        }
        
        .bottomfix {margin-bottom : 3%;}

        /*helper*/
        .needhelp{ 
            margin-top: 40%;
            border: 1px solid rgb(244, 244, 244);
            background-color: rgb(244, 244, 244);
            width: 140px;
            height: 40px;
            border-radius: 10px;
            margin-left : -3%;
        }

        #help{
           font-weight: bolder;
           margin-bottom: 5px;
           margin-top: 4px;
           width: 140px;
           margin-left: 3%;
        }

        #gethelp{ 
            margin-left: 3%;
        }

        #helparrow{
            margin-left: 29%;
            margin-top: 0px;
        }

        /* mainbody*/
        #thelist{
            float: left;
            margin-left: 5%;
            margin-top: 0.3%;
            width: 800px;
        }

        #notice{
            font-size: 14px; 
            font-weight: bolder;
        }
        #subnote{
            font-weight: 12px; 
            font-weight: lighter;
            color:grey    
        } 

        #greenfont1, #greenfont2{ color: rgb(30, 154, 40); }

       

        /*table*/
        #greenline{
            margin-top: 2%;
            margin-bottom: 0;
            width: 800px;
            height: 1px;
            border : 1px solid rgb(30, 154, 40);
            background-color: rgb(30, 154, 40);
        }

        #grayline{
            margin-top: 3%;
            margin-bottom: 2%;

            width: 800px;
            height: 0.001cm;
            border : 0.3px solid grey;
            background-color: grey;
        }

        table{ border-collapse: collapse; /*테두리간 간격 없앰*/ }

        td{
            text-align: center;
            padding-top: 1%;
            padding-bottom: 2%;
            border-bottom: 1px solid grey;
        }

        tr{
            margin-top: 1%;
            margin-bottom: 1%;
        }

        .number{ width: 120px;}
        .title{width: 350px;}
        .writer{width: 120px;}
        .date{width: 120px;}
        .viewed{ width: 120px;}

        .whole{
            width: 1210px;
            margin-left: 10%;
        }

        button{
            height: 20px;
            width: 30px;
            border-radius: 7px;
            border-style: none;
            background-color: rgb(244, 244, 244) ;
        }

        button:hover{
            color: white;
            background-color: rgb(66, 178, 115) ;
        }

        #buttons{
           margin-top: 3%;
           margin-left: 31%;
           margin-bottom: 1%;

        }

        #wrap>tr>td{ padding-bottom: 3%; }

        #rightmargin{ margin-right: 5%; }

        #administratorOption > button{
            width: 50px;
            height: 20px;
            margin-right: 0.5%;

        }

        #administratorLabel{
            font-weight: bold;
            margin-right: 5%;
        }

        /*searchbox*/
        #searchbox{
            width: 200px;
            height: 25px;
            border: 1px solid rgb(219, 217, 217);
            border-radius: 5px;
            margin-left: 77.5%;
            margin-top: -2.5%;
        }

        #searchmark{
            width: 30px;
            height: 25px;
            background-color: rgb(66, 178, 115);
            border-radius: 4px;
            border-bottom-right-radius: 0;
            border-top-right-radius: 0;
        }

        #magnifier{
            width: 15px;
            height: 15px;
            margin-top: 1%;
            margin-bottom: 1%;

        }

        #mInput{
            width: 165px;
            height: 21px;
            float: left;
            margin-left: 32.5px;
            margin-top: -12%;
            padding: 0;
            border-bottom-right-radius: 4px;
            border-top-right-radius: 4px;
            border-style: none;
        }
    </style>

</head>
<body>
<div class="whole">

    <div class="sidebar">
        <h3>고객지원</h3>
        <br>
        <div id="wrap">
        		<div class="bottomfix">
                <span width: 300px;><a id="greenfont1" class="arrowbottomfix">공지사항</a></span>
                <span id="greenfont2" class="arrowbottomfix"> > </span>
           		</div>
           		
           		<div class="bottomfix">
                <span width: 300px;><a id="faq" class="arrowbottomfix">자주 묻는 질문</a></span>
                <span class="arrowbottomfix"> > </span>
                </div>
                
                <div class="bottomfix">
                <span width: 300px;><a id="facetoface" class="arrowbottomfix">1:1 문의</a></span>
               	<span class="arrowbottomfix"> > </span>
               	</div>
        </div>
        
        <div class="needhelp">
            <span><p id="help">도움이 필요하신가요?</p></span>
            <span><a id="gethelp">1:1 문의하기</a></span>
            <span id="helparrow"> > </span>
        </div>
    </div>

    <div id="thelist">
       <span id="notice">공지사항</span>
       <span id="subnote">도넷닷컴의 새로운 소식을 한눈에 확인하세요</span>
       <div id="greenline"></div>
       
           <table>
               <tr>
                   <td class="number">번호</td>
                   <td class="title">제목</td>
                   <td class="writer">작성자</td>
                   <td class="date">작성일</td>
                   <td class="viewed">조회</td>
               </tr>
               
               <tr>
                <td class="number">1</td>
                <td class="title">고종 황제 즉위 기념 커피 쏜다!</td>
                <td class="writer">관리자</td>
                <td class="date">1894-10-12</td>
                <td class="viewed">915</td>
            </tr>
            
            <tr>
                <td class="number">2</td>
                <td class="title">고종 황제 즉위 기념 커피 쏜다!</td>
                <td class="writer">관리자</td>
                <td class="date">1894-10-12</td>
                <td class="viewed">915</td>
            </tr>
            
            <tr>
                <td class="number">3</td>
                <td class="title">고종 황제 즉위 기념 커피 쏜다!</td>
                <td class="writer">관리자</td>
                <td class="date">1894-10-12</td>
                <td class="viewed">915</td>
            </tr>
           
            <tr>
                <td class="number">4</td>
                <td class="title">고종 황제 즉위 기념 커피 쏜다!</td>
                <td class="writer">관리자</td>
                <td class="date">1894-10-12</td>
                <td class="viewed">915</td>
            </tr>
            
            <tr>
                <td class="number">5</td>
                <td class="title">고종 황제 즉위 기념 커피 쏜다!</td>
                <td class="writer">관리자</td>
                <td class="date">1894-10-12</td>
                <td class="viewed">915</td>
            </tr>
           
            <tr>
                <td class="number">6</td>
                <td class="title">고종 황제 즉위 기념 커피 쏜다!</td>
                <td class="writer">관리자</td>
                <td class="date">1894-10-12</td>
                <td class="viewed">915</td>
            </tr>
           
            <tr>
                <td class="number">7</td>
                <td class="title">고종 황제 즉위 기념 커피 쏜다!</td>
                <td class="writer">관리자</td>
                <td class="date">1894-10-12</td>
                <td class="viewed">915</td>
            </tr>
            
            <tr>
                <td class="number">8</td>
                <td class="title">고종 황제 즉위 기념 커피 쏜다!</td>
                <td class="writer">관리자</td>
                <td class="date">1894-10-12</td>
                <td class="viewed">915</td>
            </tr>
            
            <tr>
                <td class="number">9</td>
                <td class="title">고종 황제 즉위 기념 커피 쏜다!</td>
                <td class="writer">관리자</td>
                <td class="date">1894-10-12</td>
                <td class="viewed"> 915</td>
            </tr>
           
            <tr>
                <td class="number">10</td>
                <td class="title">고종 황제 즉위 기념 커피 쏜다!</td>
                <td class="writer">관리자</td>
                <td class="date">1894-10-12</td>
                <td class="viewed">915</td>
            </tr>
           </table>
           <div id="buttons">
             <button onclick=""> << </button>
             <button onclick=""> < </button>

                <button onclick="">1</button>
                <button onclick="">2</button>
                <button onclick="">3</button>
                <button onclick="">4</button>
                <button onclick="">5</button>

                <button onclick="">></button>

                <button onclick="">>></button>
           </div>    
           <div id="grayline"></div>
           <div id="searchcategory">
               <label id="rightmargin"><b>검색어</b></label>
               <input type="radio" name="searchtype" id="thistitle" value="title">
               <label for="thistitle">제목</label>
               <input type="radio" name="searchtype" id="thiswriter" value="writer">
               <label for="thiswriter">작성자</label>
               <input type="radio" name="searchtype" id="thiscontent" value="content">
               <label for="thiscontent">내용</label>
            <!--checkbox 하나만 선택되게 : 스크립트에서 해결
                radio 하나만 선택되게 : 이름을 같은 걸 주면 된다.-안되면 말고-->
                <div id="searchbox">
                    <button onclick="" id="searchmark"><img id="magnifier" src="${ pageContext.servletContext.contextPath }/resources/imgs/magnifier.png"></button>
                    <input id="mInput" type="text" placeholder="검색어를 입력하세요" value="">
                </div>
           </div>
           <br>
           <!--관리자 메뉴 : 사용자가 관리자 일 때만 숨김해제-->
           <div id="administratorOption" hidden="true">
            <label id="administratorLabel">관리자</label>
            <button onclick="">추가</button>
            <button onclick="">수정</button>
            <button onclick="">삭제</button>
           </div>


    </div>

</div>
</body>
</html>