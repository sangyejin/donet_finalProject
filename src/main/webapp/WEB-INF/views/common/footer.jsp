<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도넷닷컴</title>
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap" rel="stylesheet">


<style>
    #realBody > *{    	 	
     margin-left : 250px;
     color : gray ;
     }

    a{ text-decoration: none; }

    #snstap{
        height: 30px;
        margin-top: 5px;
    }

    #workinghour{ font-size: smaller; }

    #toright, #toleft{
       float: left;
       margin-left: 0px;
       margin-top: 0;
       position : inline;

    }
  
    #toright>p{ text-align: left; }

    #toleft>a, #home, h4{
    	text-decoration : none;
        font-weight: bolder;
        color : gray;
    }

    #happycustomers{ 
    	margin-top : 10px;
    	margin-bottom: 5px; 
    }

/*right part*/
    #tel{ margin-left:  -118px;  }
 
    #leftdiv{ /*is actually in the right part*/
        margin-left:  300px; 
        margin-top: 0;
        margin-bottom: 25px;
    }
    
    #copyRight{ margin-left:  180px;  }
    
    #toright{
     margin-top : -140px;
     margin-left: 250px; 
     width : 600px;
     }
    
    
    #address{ 
     margin-top: 30px;     
     margin-left: 180px;  
     }
    
    #line{
   		float : left;
        margin-left: 150px;
	    padding: 0;
        margin-top: 150px;
        margin-bottom: 10px;
        border: solid 1px rgb(244, 244, 244);
    	width : 1050px;
    }

    #toleft> a:hover, #home:hover{ text-decoration: underline; }

    #readyimg{ display: none;}
    
    #realBody{   
   	 	width:1050px; 
   	 	/*padding-bottom: 300px;*/
   	 }
   	 
   	 

</style>
</head>
<body>
<div id="realBody">
    <div id="line" align="left"></div>
	<div id="footer">
        <span id="toleft" align="left">
            <a href="#">회사소개</a> | 
            <a href="#">채용안내</a> | 
            <a href="#">윤리경영</a> | 
            <a href="#">약관</a> | 
            <a href="#">개선 의견 수렴</a>

            <br><br>

            <h4 id="happycustomers"><b>고객 행복 센터</b></h4>
            <span id="phonenumber">010-3371-5190 </span>
            <span id="workinghour">(24시 운영 00:00-24:00)</span>
            <br><br>
            <img  id="snstap" src="${ pageContext.servletContext.contextPath }/resources/imgs/snsbar.png" width="335px">
            
        </span>

       <!--  <img id="readyimg" src="/Users/wangsubin/FRONTEND/source_final/3EFFFBC2-CEAA-4568-A74D-89005E3F5570_1_105_c.jpeg" > -->

        <div id="toright" align="right">
           <span><a>사업자등록번호 : 123-45-6789 </a> | <a>서울 강남 제2000-09호</a> | <a>대표자 : 허은주</a></span> 
           
            <p id="address">주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F,3F,4F,5F,6F</p>
           
           <div id="leftdiv" align="left">
            <span id="tel">Tel : 1544-9970</span> |
            <span id="fax">Fax : 02-562-3478</span>
          </div>
            <p id="copyRight">Copyright © 2021 donet.com non-profit company. All Right Reserved</p>
        </div>
    </div>
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