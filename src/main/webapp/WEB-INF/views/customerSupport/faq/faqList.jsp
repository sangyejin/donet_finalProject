<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도넷닷컴</title>
    <!---->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap" rel="stylesheet">

    <style>
        *{
            /*border: 1px red solid;*/
            font-family: 'Nanum Gothic Coding', monospace;
            font-size: 12px;
        }

        /*sidebar*/        
        h3{
            font-size: 22px;
        }
        .sidebar{
             width: 150px;
             height: 400px;
             margin-left: 3%;
             padding: 0;
             float: left;
             margin-top: 0;

        }
        
        a:hover{
            text-decoration: underline;
        }

        #greenfont1 {margin-right: 45%; text-decoration: none;}
        #faq{margin-right: 18%;}
        #facetoface{margin-right: 43.5%; }
        #wrap{margin-bottom: 7%;}

        #greenfont1, #faq, #facetoface{
            font-weight: bolder;
        }

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
            margin-top: 2%;
            width: 800px;
        }

        #notice{
            font-size: 16px; 
            font-weight: bolder;
        }
        #subnote{
            font-weight: 12px; 
            font-weight: lighter;
            color:grey    
        } 

        #greenfont1, #greenfont2{
            color: rgb(30, 154, 40);
        }

       
        /*selectbox*/
        select{
            margin-left: 299.5px;
        }

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
            margin-top: 5%;
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

        /*detail for table*/
        .number{width: 50px;}
        .category{width: 150px;}
        .title{width : 600px;}

        /*.hidFirst{display: none;}*/

        #whole{
            width: 1210px;
            margin-left: 90px;
        }


        /*buttonx*/
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
           margin-top: 2%;
           margin-left: 31%;
           margin-bottom: 3%;

        }

        #wrap>tr>td{ padding-bottom: 3%; }

        #rightmargin{ margin-right: 5%; }

        pre{ 
            margin-left: -100px;
            text-align: left;
        }

        /*searchbox*/
        #searchbox{
            width: 200px;
            height: 25px;
            border: 1px solid rgb(219, 217, 217);
            border-radius: 5px;
            margin-left: 75%;
            margin-top: 0%;
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
                <td width: 300px;><a id="faq" class="bottomfix"  href="list.faq">자주 묻는 질문</a></td>
                <td class="arrow"><span class="bottomfix"> > </span> </td>
            </tr>
            <br>
            <tr>
                <td width: 300px;><a id="facetoface" class="bottomfix"  href="list.one">1:1 문의</a></td>
                <td class="arrow"><span class="bottomfix"> > </span> </td>
            </tr>
        </div>
        <div class="needhelp">
            <span><p id="help">도움이 필요하신가요?</p></span>
            <span><a id="gethelp" href="list.one">1:1 문의하기</a></span>
            <span id="helparrow"> > </span>
        </div>
    </div>
    <!---->
    <div id="thelist">
       <span id="notice">자주 묻는 질문</span>
       <span id="subnote">가장 많이 문의하시는 질문을 모았습니다.</span>
        <select name="dropdownCategory">
            <option value="전체">카테고리를 선택하세요</option>
            <option value="회원 문의">회원 문의</option>
            <option value="결제/환불">결제/환불</option>
            <option value="서비스 이용 및 기타">서비스 이용 및 기타</option>
        </select>
       <div id="greenline"></div>
       
           <table>
                <tr>
                   <td class="number">번호</td>
                   <td class="category">카테고리</td>
                   <td class="title">제목</td>
                </tr>
                <tbody>
                <tr class="head">
                    <td class="number">1</td>
                    <td class="category">회원 문의</td>
                    <td class="title">도넷닷컴은 어떤 회사인가요? 믿고 펀딩, 후원을 할 수 있나요?</td>
                 </tr>
                 <tr>
                    <td class="hidFirst" colspan="3"><pre>
                        저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해 문제점을 느껴 설립하게 
                       
                        된 5명의 개발자로 이루어진 비영리 단체입니다. 펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는
                       
                        방식으로 진행하고 있사오니, 안심하시고 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 
                       
                        귀는 생의 찬미를 듣는다 그것은 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 
                       
                        뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 
                       
                        얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 살 수 있는 것이다.
                       
                        석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 
                       
                        위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?
                        
                        감사합니다.
                    </pre></td>
                 </tr>

                 <tr class="head">
                    <td class="number">2</td>
                    <td class="category">회원 문의</td>
                    <td class="title">도넷닷컴은 어떤 회사인가요? 믿고 펀딩, 후원을 할 수 있나요?</td>
                 </tr>
                 <tr>
                    <td class="hidFirst" colspan="3"><pre>
                        저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해 문제점을 느껴 설립하게 
                       
                        된 5명의 개발자로 이루어진 비영리 단체입니다. 펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는
                       
                        방식으로 진행하고 있사오니, 안심하시고 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 
                       
                        귀는 생의 찬미를 듣는다 그것은 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 
                       
                        뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 
                       
                        얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 살 수 있는 것이다.
                       
                        석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 
                       
                        위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?
                        
                        감사합니다.
                    </pre></td>
                 </tr>
                 <tr class="head">
                    <td class="number">3</td>
                    <td class="category">회원 문의</td>
                    <td class="title">도넷닷컴은 어떤 회사인가요? 믿고 펀딩, 후원을 할 수 있나요?</td>
                 </tr>
                 <tr>
                    <td class="hidFirst" colspan="3"><pre>
                        저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해 문제점을 느껴 설립하게 
                       
                        된 5명의 개발자로 이루어진 비영리 단체입니다. 펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는
                       
                        방식으로 진행하고 있사오니, 안심하시고 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 
                       
                        귀는 생의 찬미를 듣는다 그것은 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 
                       
                        뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 
                       
                        얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 살 수 있는 것이다.
                       
                        석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 
                       
                        위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?
                        
                        감사합니다.
                    </pre></td>
                 </tr>
                 <tr class="head">
                    <td class="number">4</td>
                    <td class="category">결제/환불</td>
                    <td class="title">도넷닷컴은 어떤 회사인가요? 믿고 펀딩, 후원을 할 수 있나요?</td>
                 </tr>
                 <tr>
                    <td class="hidFirst" colspan="3"><pre>
                        저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해 문제점을 느껴 설립하게 
                       
                        된 5명의 개발자로 이루어진 비영리 단체입니다. 펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는
                       
                        방식으로 진행하고 있사오니, 안심하시고 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 
                       
                        귀는 생의 찬미를 듣는다 그것은 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 
                       
                        뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 
                       
                        얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 살 수 있는 것이다.
                       
                        석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 
                       
                        위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?
                        
                        감사합니다.
                    </pre></td>
                 </tr>
                 <tr class="head">
                    <td class="number">5</td>
                    <td class="category">결제/환불</td>
                    <td class="title">도넷닷컴은 어떤 회사인가요? 믿고 펀딩, 후원을 할 수 있나요?</td>
                 </tr>
                 <tr>
                    <td class="hidFirst" colspan="3"><pre>
                        저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해 문제점을 느껴 설립하게 
                       
                        된 5명의 개발자로 이루어진 비영리 단체입니다. 펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는
                       
                        방식으로 진행하고 있사오니, 안심하시고 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 
                       
                        귀는 생의 찬미를 듣는다 그것은 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 
                       
                        뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 
                       
                        얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 살 수 있는 것이다.
                       
                        석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 
                       
                        위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?
                        
                        감사합니다.
                    </pre></td>
                 </tr>
                 <tr class="head">
                     <td class="number">6</td>
                     <td class="category">결제/환불</td>
                     <td class="title">도넷닷컴은 어떤 회사인가요? 믿고 펀딩, 후원을 할 수 있나요?</td>
                  </tr>
                  <tr>
                    <td class="hidFirst" colspan="3"><pre>
                        저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해 문제점을 느껴 설립하게 
                       
                        된 5명의 개발자로 이루어진 비영리 단체입니다. 펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는
                       
                        방식으로 진행하고 있사오니, 안심하시고 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 
                       
                        귀는 생의 찬미를 듣는다 그것은 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 
                       
                        뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 
                       
                        얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 살 수 있는 것이다.
                       
                        석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 
                       
                        위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?
                        
                        감사합니다.
                    </pre></td>
                 </tr>
                  <tr class="head">
                     <td class="number">7</td>
                     <td class="category">서비스 이용 및 기타</td>
                     <td class="title">도넷닷컴은 어떤 회사인가요? 믿고 펀딩, 후원을 할 수 있나요?</td>
                  </tr>
                  <tr>
                    <td class="hidFirst" colspan="3"><pre>
                        저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해 문제점을 느껴 설립하게 
                       
                        된 5명의 개발자로 이루어진 비영리 단체입니다. 펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는
                       
                        방식으로 진행하고 있사오니, 안심하시고 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 
                       
                        귀는 생의 찬미를 듣는다 그것은 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 
                       
                        뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 
                       
                        얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 살 수 있는 것이다.
                       
                        석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 
                       
                        위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?
                        
                        감사합니다.
                    </pre></td>
                 </tr>
                  <tr class="head">
                     <td class="number">8</td>
                     <td class="category">서비스 이용 및 기타</td>
                     <td class="title">도넷닷컴은 어떤 회사인가요? 믿고 펀딩, 후원을 할 수 있나요?</td>
                  </tr>
                  <tr>
                    <td class="hidFirst" colspan="3"><pre>
                        저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해 문제점을 느껴 설립하게 
                       
                        된 5명의 개발자로 이루어진 비영리 단체입니다. 펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는
                       
                        방식으로 진행하고 있사오니, 안심하시고 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 
                       
                        귀는 생의 찬미를 듣는다 그것은 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 
                       
                        뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 
                       
                        얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 살 수 있는 것이다.
                       
                        석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 
                       
                        위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?
                        
                        감사합니다.
                    </pre></td>
                 </tr>
                  <tr class="head">
                     <td class="number">9</td>
                     <td class="category">서비스 이용 및 기타</td>
                     <td class="title">도넷닷컴은 어떤 회사인가요? 믿고 펀딩, 후원을 할 수 있나요?</td>
                  </tr>
                  <tr>
                    <td class="hidFirst" colspan="3"><pre>
                        저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해 문제점을 느껴 설립하게 
                       
                        된 5명의 개발자로 이루어진 비영리 단체입니다. 펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는
                       
                        방식으로 진행하고 있사오니, 안심하시고 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 
                       
                        귀는 생의 찬미를 듣는다 그것은 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 
                       
                        뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 
                       
                        얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 살 수 있는 것이다.
                       
                        석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 
                       
                        위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?
                        
                        감사합니다.
                    </pre></td>
                 </tr>
                  <tr class="head">
                    <td class="number">10</td>
                    <td class="category">서비스 이용 및 기타</td>
                    <td class="title">도넷닷컴은 어떤 회사인가요? 믿고 펀딩, 후원을 할 수 있나요?</td>
                 </tr>
                 <tr>
                    <td class="hidFirst" colspan="3"><pre>
                        저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해 문제점을 느껴 설립하게 
                       
                        된 5명의 개발자로 이루어진 비영리 단체입니다. 펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는
                       
                        방식으로 진행하고 있사오니, 안심하시고 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 
                       
                        귀는 생의 찬미를 듣는다 그것은 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 
                       
                        뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 
                       
                        얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 살 수 있는 것이다.
                       
                        석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 
                       
                        위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?
                        
                        감사합니다.
                    </pre></td>
                 </tr>
                 </tbody>
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
                <div id="searchbox">
                    <button onclick="" id="searchmark"><img id="magnifier" src="/Users/wangsubin/FRONTEND/source_final/magnifier.png"></button>
                    <input id="mInput" type="text" placeholder="검색어를 입력하세요" value="">
                </div>
           </div>
    </div>

</div>

<!--
<script>
    $(document).ready(function() {

    $(".head").on('click',function(){
        var currentRow = $(this).closest('tr');
        var nextRow = currentRow.next('tr');
        var nextAllRow = nextRow.nextAll('.hidFirst');

        switch(!nextRow.is(":visible")){
            case true:
            nextAllRow.style.display="none";
            nextRow.style.display="block";
                break;
            case false:
            nextRow.style.display="none";
            nextAllRow.style.display="none";
            break;

        }
    })  
});
  </script>-->

  
<script>
    $(document).ready(function() {
       // $(".hidFirst").hide();

       $(".head").on('click',function(){
            var currentRow = $(this).closest('tr');
            var nextRow = currentRow.next('tr');

            if(nextRow.is(":visible")){
                nextRow/*.next('.hidFirst:nth-child(2n)')*/.hide();

            }else{
                nextRow.show();

            }
        })
     });
</script>
</body>
</html>