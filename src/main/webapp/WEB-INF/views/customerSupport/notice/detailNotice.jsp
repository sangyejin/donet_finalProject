<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도넷닷컴</title>
    <style>
    	/*footer align left*/
    	#gotoLEFT{ margin-left : -150px;}
    
        *{ /*border: 1px red solid;*/
            font-family: 'Nanum Gothic Coding', monospace;
            font-size: 12px;
        }

        /*sidebar*/        
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
		.needhelp {
			margin-top: 50px;
			border: 1px solid rgb(244, 244, 244);
			background-color: rgb(244, 244, 244);
			width: 140px;
			height: 40px;
			border-radius: 10px;
		}
		
		#help {
			font-weight: bolder;
			margin-bottom: 0px;
			margin-top: 0px;
			width: 140px;
			margin-left: 3%;
		}
		
		#gethelp { margin-left: 3%; }
		#gethelp:hover{ text-decoration : underline;}
		
		#helparrow { margin-left: 29%; margin-top: 0px; }

        /* main body */
        #thelist{
            float: left;
            margin-left: 5%;
            margin-top: 0;
            width: 800px;
        }

        #notice{
            font-size: 14px; 
            font-weight: bolder;
            margin-left: 360px;
            margin-top: 0px;

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

        #whole {
		width: 1050px;
		margin-left: 140px;
		}

        span > b { margin-left: 52px; }

        span > p{ 
            margin-left: 136px;
            margin-top : -21px;
        }
        
        #greenline{
            margin-top: 1%;
            margin-bottom: 0;
            width: 800px;
            height: 1px;
            border : 1px solid rgb(30, 154, 40);
            background-color: rgb(30, 154, 40);
        }

        #goRound{
            height: 25px;
            width: 40px;
            border-style:none;
            border-radius: 7px;
            color: white; 
            background-color: rgb(66, 178, 115); 
            
        }

        #goRound:hover{ background-color: rgb(232, 240, 214) ; color : #000000; }

        #buttons{
           margin-top: 2%;
           margin-left: 755px;
           margin-bottom: 3%;

        }

        table{border-collapse: collapse;}

        td{  border-bottom: 1px solid gray;  height: 25px; }

        .value{width: 350px;}

        .head{
            text-align: center;
            width: 100px;
            background-color: rgba(232, 240, 214, 0.5);
        }

        #yourContent{ margin-left: 25px;  font-size:12px;}
 
       #support { color: #000000; font-weight: bolder; font-size : 16px; margin-top:0px;}
       
       
       .thisDetail > .head:hover, .thisDetail > .theDetail:hover{ font-weight: bold; }
       
    </style>

</head>
<body>

	<jsp:include page="../../common/menubar.jsp" />

<div id="whole">

    <div class="sidebar">
		<h5 id="support">고객지원</h5>
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
       <table id="noteDetail">
            <tr>
                <td class="head">제목</td>
                <td class="value"> ${ no.noticeTitle }</td>
                <td class="head">작성일</td>
                <td class="value"> ${ no.noticeDate }</td>
            </tr>
            <tr>
                <td class="head">작성자</td>
                <td class="value"> ${ no.noticeWriter }</td>
                <td class="head">조회수</td>
                <td class="value"> ${ no.noticeCount }회</td>
            </tr>
            <tr>
            <td colspan="4"><br><p id="yourContent">${ no.noticeContent } </p><br></td>

            </tr>
            <tbody>
            <tr class="thisDetail">
                <td class="head">이전글</td>
                <td hidden="true">${prevNote.noticeNo}</td>
                <td class="theDetail" colspan="3"> ${prevNote.noticeTitle}</td>
               
            </tr>
            
            <tr class="thisDetail">
                <td class="head">다음글</td>
                 <td hidden="true">${nextNote.noticeNo}</td>
                <td class="theDetail" colspan="3"> ${nextNote.noticeTitle}</td>
            </tr>
            </tbody>


       </table>

       <div id="buttons">
            <button id="goRound" onclick="backToList();">목록</button>
        </div>

</div>
	<script>
    	$(function(){
    		$("#noteDetail > tbody > .thisDetail ").click(function(){
    			if($(this).children().eq(1).text() != ''){
        			location.href="detail.no?noticeNo=" + $(this).children().eq(1).text();
    			}
    		});
    	});
    </script>

	<script>
		function backToList(){
			location.href="list.no";
		}
	</script>

	<div id="gotoLEFT">
	<jsp:include page="../../common/footer.jsp" />
	</div>
	
</body>
</html>