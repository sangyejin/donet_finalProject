<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도넷닷컴</title>
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap" rel="stylesheet">


<style>
    *{
       /* margin: 0;
	    padding: 0;*/
       
        font-family: 'Nanum Gothic Coding', monospace;
        font-size: 12px;
        /*font-weight: bold;*/
        
    }
    
    span >*{
            color: rgb(53, 73, 93);
    }
    div{
        margin-top: 1%;
        margin-left: 3%;
        margin-right: 3%;
    }

    a{
      text-decoration: none;
    }

    #snstap{
        width: 335px;
        height: 30px;
        margin-top: 1%;
    }

    #workinghour{
        font-size: smaller;
    }

    #toright, #toleft{
       float: left;
       margin-left: 9%;
       margin-top: 0;

    }

    #toright{
        margin-left: 14%;
    }

    #toright>p{
        text-align: left;
    }

    #toleft>a, #home, h4{
        font-weight: bolder;
    }

    h4{
        margin-bottom: 3%;
    }

    #tel, #fax{
        text-align: left;

    }

    #leftdiv{
        margin-left: 0;
        margin-top: 0;
        margin-bottom: 5%;
    }
    #topmargin{
        margin-top: 7%;
    }
    
    #line{
        margin: 0;
	    padding: 0;
        margin-top: 10%;
        border: solid 1px rgb(244, 244, 244);
        margin-bottom: 0;
    }

    #toleft> a:hover, #home:hover{ text-decoration: underline; }

    #readyimg{ display: none;}

</style>
</head>
<body>
    <div id="line"></div>
	<div id="footer">
        <span id="toleft" align="left">
            <a href="#">회사소개</a> | 
            <a href="#">채용안내</a> | 
            <a href="#">윤리경영</a> | 
            <a href="#">약관</a> | 
            <a href="#">개선 의견 수렴</a>

            <br><br>

            <h4><b>고객 행복 센터</b></h4>
            <span id="phonenumber">010-3371-5190 </span>
            <span id="workinghour">(24시 운영 00:00-24:00)</span>
            <br><br>
            <img id="snstap" src="/Users/wangsubin/donet_finalProject/src/main/resources/imgs/snsbar.png">
        </span>

       <!--  <img id="readyimg" src="/Users/wangsubin/FRONTEND/source_final/3EFFFBC2-CEAA-4568-A74D-89005E3F5570_1_105_c.jpeg" > -->

        <span id="toright" align="right">
            <a href="#" id="home"><b>도넷닷컴</b></a> | 
            <a>사업자등록번호 : 123-45-6789 </a> | 
            <a>서울 강남 제2000-09호</a> | 
            <a>대표자 : 허은주</a> 
           
            <p id="topmargin">주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F,3F,4F,5F,6F</p>
           
            <div id="leftdiv" align="left">
            <span id="tel">Tel : 1544-9970</span> |
            <span id="fax">Fax : 02-562-3478</span>
            </div>
            <p>Copyright © 2021 donet.com non-profit company. All Right Reserved</p>
        </span>
    </div>

    <!--sns 바 선택하면 어쩔지 고민중
    <script>
         $(function(){
            $("#snstap").click(function(){
                $("#readyimg").removeAttr();
            })
        })
    </script> -->
 

</body>
</html>