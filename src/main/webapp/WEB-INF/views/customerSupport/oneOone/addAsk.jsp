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
* {
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

#greenfont1 { margin-right: 45%; }

#faq { margin-right: 36px; }

#facetoface {
	margin-right: 70px;
	color: rgb(30, 154, 40);
	text-decoration: none;
}

#greenfont1:hover #facetoface:hover { text-decoration: underline; color: #000000; }

#wrap { margin-bottom: 7%; }

#greenfont1, #faq, #facetoface { font-weight: bold; }

/*helper*/
#gethelp:hover { text-decoration: underline; }

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

#gethelp:hover { color: #000000; text-decoration: underline; }

#helparrow { margin-left: 48px; margin-top: 0px; }

/* side bar */
#thelist {
	float: left;
	margin-left: 5%;
	margin-top: 0px;
	width: 800px;
}

#notice {
	margin-bottom: 0px;
	font-size: 13px;
	font-weight: bolder;
}

#subnote {
	font-size: 11px;
	font-weight: lighter;
	color: grey
}


#greenfont2 { color: rgb(30, 154, 40); }

/*writing box*/
#sideGreenbar {
	background-color: rgba(232, 240, 214, 0.5);
	height: 650px;
	width: 100px;
	margin-top: 100px;
}

#getInThere { margin-top: -640px; margin-left: 35px; }

.grayline {
	margin-top: 2%;
	margin-bottom: 2%;
	margin-left: 8.5%;
	width: 700px;
	height: 0.001cm;
	border: 0.3px solid grey;
	background-color: grey;
}

#whole { width: 1050px; margin-left: 150px; }

span>b { margin-left: 52px; }

span>p { margin-left: 136px; margin-top: -21px; }

span>p>#boldPeriod { margin-left: -3px; font-size: 22px; }

span>mark { margin-left: 153px; }

#justGetThere { margin-top: -27px; }

#headjustify { margin-top: -5px }

#greenline {
	margin-top: 4px;
	margin-bottom: -100px;
	width: 800px;
	height: 1px;
	border: 1px solid rgb(30, 154, 40);
	background-color: rgb(30, 154, 40);
}

/*head*/
#support {
	color: #000000;
	font-weight: bolder;
	font-size: 16px;
}

/*button*/
.goRound {
	height: 25px;
	width: 55px;
	border-radius: 7px;
	border-style: none;
	background-color: rgb(66, 178, 115);
	color: #ffffff;
	margin-right: 7px;
}

.goRound:hover {
	background-color: rgb(232, 240, 214);
	color: #000000;
}

#buttons {
	margin-top: 2%;
	margin-left: 625px;
	margin-bottom: 3%;
}

#buttonSecondPart {
	margin-top: -48px;
	margin-left: 695px;
}

/*content div*/
#askTitle {
	width: 670px;
	height: 25px;
	margin-left: 50px;
	border-radius: 7px;
	border: 1px solid rgb(206, 212, 218);
}

/*footer align adjustment*/
#gotoLEFT {
	margin-left: -375px;
}

/*img*/

		#forThisImage{cursor:pointer; font-size:8px; color:rgb(187,187,187);}
				
		.clickable{display : flex;}
		
        .biggerimg{  width: 20px;  height: 20px; }
        
        #differ{/*img*/ margin-left: 80px; margin-top: -25px; margin-bottom: -5px}

        #aLine{ /*span*/  margin-left: 265px;  margin-top: -17.5px; }
        
        #imgLabel{margin-top : 5px;}

/*radio style*/
.radioAlign { margin-right: 20px; }
#radioType { margin-right: 20px; }

#radios {
	margin-left: 80px;
	margin-top: -15px;
	margin-bottom: -3px;
}

/* img sneak*/	 	    
    #imgViewArea{ 
    		margin-top: -35px;
            width: 670px;
            margin-left: 80px;
            height: 467px;
            border : 1px solid rgb(206,212,218);
            border-radius : 7px;
     }
     
     
     #askContent{height : 261px;  margin-top: 2.5px; border : none;}
     
     #asktag{height : 261px;  margin-top: 2.5px; border : none;}
     
      /*사진 전부 정사각형으로 만들기*/
     #imgArea{ border-radius : 7px; border : none; }		
     
     .imgWrapper { position: relative; width: 200px; height: 200px; } 
     .imgWrapper img { position: absolute; top: 0; left: 0; transform: translate(20, 20); width: 100%; height: 100%; object-fit: cover; margin: auto; }
     
    
</style>

</head>
<body>
	<jsp:include page="../../common/menubar.jsp" />

	<div id="whole">

		<div class="sidebar">
			<h5 id="support">고객지원</h5>
			<div id="wrap">
				<tr>
					<td width: 300px;><a id="greenfont1" class="bottomfix" href="list.no">공지사항</a></td>
                <td class="arrow"><span  class="bottomfix"> > </span></td>
            </tr>
				<br>
				<tr>
					<td width: 300px;><a id="faq" class="bottomfix" href="list.faq">자주 묻는 질문</a></td>
                <td class="arrow"><span  class="bottomfix"> > </span> </td>
            </tr>
				<br>
				<tr>
					<td width: 300px;><a id="facetoface" class="bottomfix">1:1 문의</a></td>
                <td class="arrow"><span id="greenfont2" class="bottomfix"> > </span> </td>
            </tr>
			</div>
			<div class="needhelp">
				<span><p id="help">도움이 필요하신가요?</p></span> <span><a
					id="gethelp" href="goAskForm.one">1:1 문의하기</a></span> <span id="helparrow">
					> </span>
			</div>
		</div>


		<div id="thelist">
			<span id="notice">1:1문의 작성</span>
			<span id="subnote">부적절한 언어 사용시 무통보 삭제처리 됩니다. 수정 및 삭제가 불가능하니 신중하게 작성해주세요.</span>
			<div id="greenline"></div>

			<div id="sideGreenbar"></div>
			
			<form id="InsertOne" method="post" action="insert.one" enctype="multipart/form-data">
				<div id="getInThere">
					<span id="headTitle"><label for="askTitle">질문</label> 
					<input type="text" id="askTitle" name="askTitle"  maxlength='30' required></span>
					<div class="grayline"></div>

					<div id="radioType">구분</div>

					<div id="radios">
						<input type="radio" name="searchtype" id="userquery" value="1"
							required> <label class="radioAlign" for="userquery">회원문의</label>

						<input type="radio" name="searchtype" id="payrefund" value="2"
							required> <label class="radioAlign" for="payrefund">결제/환불</label>

						<input type="radio" name="searchtype" id="etc" value="3" required>
						<label class="radioAlign" for="etcs">서비스 이용 및 기타</label>
					</div>
					
					<div class="grayline"></div>

					<div id="headjustify">
						<label id="imgLabel" id="askOriginImg">사진</label>
						<div class="clickable" id="differ">
							<label for="askOriginImg" id="forThisImage" > <img
								class="biggerimg"
								src="${ pageContext.servletContext.contextPath }/resources/imgs/imgIcon.png">
								업로드된 사진은 하단에서 확인 가능합니다.
							</label>
						</div>
						<input type="file" id="askOriginImg" name="askOriginImg"
							hidden="true" accept="image/*">

					</div>

					<div class="grayline"></div>


					<span><label class="askContent" for="askContent">문의<br>내용</label></span>
					<div id="imgViewArea">
						
						<div class="imgWrapper">
							<img id="imgArea" src="${ pageContext.servletContext.contextPath }/resources/imgs/empty.png" style="width : 200px; height : 200px;" onerror="imgAreaError()"/>
						</div>
						
						
						<textarea class="form-control" id="asktag" name="askContent" rows="10"
							style="resize: none;" maxlength="1000" wrap=on  required>
	       				 </textarea>
					</div>

				<div id="buttons">
					<button class="goRound" id="insertAlert" type="submit">문의</button>
				</div>

			</form>

			<div id="buttonSecondPart">
				<button class="goRound" onclick="backToList();">목록</button>
			</div>
		</div>

		<div id="gotoLEFT">
			<jsp:include page="../../common/footer.jsp" />
		</div>

<script>
	function backToList(){
		  location.href="list.one";
	}
</script>

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

	$(":input[name='askOriginImg']").change(function() {
		if( $(":input[name='askOriginImg']").val() == '' ) {
			$('#imgArea').attr('src' , '');  
		}
		$('#asktag').css({ 'display' : '' });
		readURL(this);
	});

	// 이미지 에러 시 미리보기영역 미노출
	function imgAreaError(){
		$('#asktag').css({ 'display' : 'none' });
	}
	</script>
	
	<!-- 어딜 눌러도 텍스트영역으로 -->
	<script>
		$('#imgViewArea').on('click', function(){
			$('#asktag').focus();
		})
		
		$('#imgArea').on('click', function(){
			$('#asktag').focus();
		})
		
	</script>
</body>
</html>