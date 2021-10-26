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
		.sidebar {
			width: 150px;
			height: 400px;
			margin-left: 25px;
			padding: 0;
			float: left;
			margin-top: 0;
		}
		
		#greenfont1 { margin-right: 45%; text-decoration: none; }
		
		 #faq { margin-right: 36px; }
#facetoface { margin-right: 70px; }
		
		#faq:hover, #facetoface:hover{ text-decoration : underline; color : #000000;}
		
		#wrap { margin-bottom: 7%; }
		
		#greenfont1, #faq, #facetoface { font-weight: bold; }
		
		/*helper*/
		
		#gethelp:hover{ text-decoration : underline;}
		
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
		#gethelp:hover{  : underline;}
		
#helparrow { margin-left: 48px; margin-top: 0px; }

        /* main main */
        #thelist{
            float: left;
            margin-left: 5%;
            margin-top: 4px;
            width: 800px;
        }

        #notice {
		font-size: 13px;
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

        #noticeTitle{
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
            width: 1050px; 
		 	margin-left: 150px;
        }


		/*align style
        span > b { margin-left: 52px; }

        span > p{ 
            margin-left: 136px;
            margin-top : -28px;
        }

        span > p > #boldPeriod{ margin-left : -4px; font-size: 22px; }

        span > mark { margin-left: 150px;  }

        #justGetThere{ margin-top: -35px; }

        #headjustify{ margin-top : -10px}
        
        #alignboi{ margin-left: 180px;  margin-top: -18px; }

		#justify{ margin-left: 243.5px;  margin-top: -18px; }
*/
        #greenline{
            margin-top: 4px;
            margin-bottom: 0;
            width: 800px;
            height: 1px;
            border : 1px solid rgb(30, 154, 40);
            background-color: rgb(30, 154, 40);
        }
        
       /* .thisimg{ width: 15px;  height: 15px; }*/


/*img*/

		#forThisImage{cursor:pointer; font-size:8px; color:rgb(187,187,187);}
				
		.clickable{display : flex;}
		
        .biggerimg{  width: 20px;  height: 20px; }
        
        #differ{/*img*/ margin-left: 85px; margin-top: -20px; }

        .shabbygrayline{
            margin-top: 1%;
            margin-bottom: 2%;
            margin-left: 8.5%;
            width: 700px;
            height: 0.001cm;
            border : 0.3px solid grey;
            background-color: grey;
        }

        #aLine{ /*span*/  margin-left: 265px;  margin-top: -17.5px; }


        /*footer align adjustment*/
        #gotoLEFT{ margin-left : -375px;}
        
        .goRound{
            height: 25px;
            width: 55px;
            border-radius: 7px;
            border-style: none;
            background-color: rgb(66, 178, 115);
			color : #ffffff;
			margin-right : 7px;
        }
        
        .goRound:hover{ background-color: rgb(232, 240, 214) ; color : #000000; }
       
        #buttons{
           margin-top: 2%;
           margin-left: 620px;
           margin-bottom: 3%;
        }
        
        #buttonSecondPart{
           margin-top: -48px;
           margin-left: 690px;
           
        
        }

	#support { color: #000000; font-weight: bolder; font-size : 16px;}
    
    /* img sneak*/
    
     #noticeContent{ margin-top : 2px; border : none;  height: 230px; }
    
    #imgViewArea{ 
    		margin-top: -15px;
            width: 670px;
            margin-left: 80px;
            height: 435px;
            border : 1px solid rgb(206,212,218);
            border-radius : 7px;
     }
     
     #imgArea{ border-radius : 7px; border : none; }
    
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
       <span id="notice">공지사항 추가</span>



        <!--관리자 메뉴 -->
       <div id="greenline"></div>

       <div id="sideGreenbar"></div>
       
     	  <div id= "getInThere">
          <form id="InsertGo" method="post" action="insert.no" enctype="multipart/form-data">
       
            <span id="headTitle"><label for="noticeTitle" >제목</label> 
            <input type="text" id="noticeWriter"  name="noticeWriter" value="${ loginUser.userId }" hidden="true">
            <input type="text" id="noticeTitle" name="noticeTitle"  maxlength="100" required></span>
            <div class="grayline"></div>

            <div id="headjustify">사진
            	<!--  kinda gave up
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
                        <span class="clickable"><img class="thisimg" src="${ pageContext.servletContext.contextPath }/resources/imgs/Left.png"></span>
                        <span class="clickable"><img class="thisimg" src="${ pageContext.servletContext.contextPath }/resources/imgs/Center.png"></span>
                        <span class="clickable"><img class="thisimg" src="${ pageContext.servletContext.contextPath }/resources/imgs/Right.png"></span>
                     </div>  
                    <div class="clickable" id="justify"><img class="biggerimg" src="${ pageContext.servletContext.contextPath }/resources/imgs/Justify.png"></div>
                    <div id="aLine"> | </div> -->
                    <div class="clickable" id="differ">
                    	<label for="noticeOrigin" id="forThisImage">
                    		<img class="biggerimg" src="${ pageContext.servletContext.contextPath }/resources/imgs/imgIcon.png">
                    		 업로드된 사진은 하단에서 확인 가능하며, 정사각형의 사진 업로드를 권장합니다.
                   		</label>
                    </div>
                    <input type="file" id="noticeOrigin" name="noticeOrigin" hidden="true" accept="image/*">
                    
            </div>

        <div class="shabbygrayline"></div>

		
        <span>내용</span> 
        <div id="imgViewArea">
        	<img id="imgArea" src="${ pageContext.servletContext.contextPath }/resources/imgs/empty.png" style="width : 200px; height : 200px;" onerror="imgAreaError()"/>
	        <textarea type="text" class="form-control" required id="noticeContent" name="noticeContent"  rows="10" style="resize:none;" maxlength="2000">
	        </textarea>
		</div>

        <div id="buttons">
             <button class="goRound" id="insertAlert" type="submit">게시</button>
        </div>  
        </form>
        
        
       <div id="buttonSecondPart">
	       <!-- <button class="goRound" onclick="dontUploadYet();">임시저장</button>  -->
	        <button class="goRound" onclick="backToList();">목록</button>
		</div>
</div>


<div id="gotoLEFT">
	<jsp:include page="../../common/footer.jsp" />
</div>

	<!-- 목록 -->
	<script>	
		function backToList(){ location.href="list.no"; }
	</script>
	
	
	<!-- 임시저장 
	<script>
		function dontUploadYet(){ location.href="insertSave.no"}
	</script>-->
	
	<!-- 파일 첨부 여부 스타일 -->
	<script type="text/javascript">
	// 콘텐츠 수정 :: 사진 수정 시 이미지 미리보기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#imgArea').attr('src', e.target.result); 
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$(":input[name='noticeOrigin']").change(function() {
		if( $(":input[name='noticeOrigin']").val() == '' ) {
			$('#imgArea').attr('src' , '');  
		}
		$('#noticeContent').css({ 'display' : '' });
		readURL(this);
	});

	// 이미지 에러 시 미리보기영역 미노출
	function imgAreaError(){
		$('#noticeContent').css({ 'display' : 'none' });
	}
	</script>
	
	<!-- 어딜 눌러도 텍스트영역으로 -->
	<script>
		$('#imgViewArea').on('click', function(){
			$('#noticeContent').focus();
		})
		
		$('#imgArea').on('click', function(){
			$('#noticeContent').focus();
		})
		
	</script>
	
</body>
</html>