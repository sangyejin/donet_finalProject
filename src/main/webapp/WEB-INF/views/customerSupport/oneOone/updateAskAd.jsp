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
 *{ font-size: 12px;  }

       /*sidebar*/
		.sidebar {
			width: 150px;
			height: 400px;
			margin-left: 60px;
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

		/* main main */
        #thelist{  float: left; margin-left: 5%;  width: 710px; }


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
	height: 615px;
	width: 100px;
}

#getInThere { margin-top: -605px; margin-left: 35px; }

/*div lines*/
.grayline{
            margin-top: 2%;
            margin-bottom: 2%;
            margin-left: 65px;
            width: 610px;
            height: 0.001cm;
            border : 0.3px solid grey;
            background-color: grey;
        }
        
#greenline{ margin-top: 4px; margin-bottom: 0; width: 710px; height: 1px; border : 1px solid rgb(30, 154, 40); background-color: rgb(30, 154, 40);}
        
#whole{  width: 1050px;  margin: auto; }

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
#buttons{  margin-top: 2%;  margin-left: 530px; margin-bottom: 3%;  }
#buttonSecondPart{ margin-top: -46px; margin-left: 600px; }

/*content div*/
#askTitle {
            width: 580px;
            height : 25px;
            margin-left: 80px;
            border-radius : 7px;
            border : 1px solid rgb(206,212,218);
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
    		margin-top: -36px;
            width: 580px;
            margin-left: 80px;
            height: 440px;
            border : 1px solid rgb(206,212,218);
            border-radius : 7px;
     }
     #asktag{height : 234px;  margin-top: 2.5px; border : none;}
     
      /*사진 전부 정사각형으로 만들기*/
     #imgArea{ border-radius : 7px; border : none; }		
     
     .imgWrapper { position: relative; width: 200px; height: 200px; } 
     .imgWrapper img { position: absolute; top: 0; left: 0; transform: translate(20, 20); width: 100%; height: 100%; object-fit: cover; margin: auto; }
     
     /*content div*/
	 #titleDiv{margin-top : -25px; margin-left : -5px;}
     
    /*푸터 tlqkfTHING*/
    #footerAdjust{ margin : 0; padding : 0; position : absolute;}
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
			<span id="notice">1:1문의 답변</span>

			<div id="greenline"></div>

			<div id="sideGreenbar"></div>

			<form id="UpdateOne" method="post" action="update.one"
				enctype="multipart/form-data">
				<div id="getInThere">
					<span id="headTitle"><label for="askTitle">질문</label> <input
						type="text" id="askNo" name="askNo" value="${ask.askNo}"
						hidden="true">
						<p id="askTitle">${ask.askTitle}</p>
						<div class="grayline"></div>

						<div id="headjustify">
							<label>질문<br>구분
							</label>
							<div id="questionType">${ask.askTypeName}</div>
						</div>

						<div class="grayline"></div> <span> <label
							class="askContent" for="askContent">문의<br>내용
						</label>
					</span>


						<div id="imgBox">
							<c:if test="${ ! empty ask.askNewImg  }">
								<img id="imgArea"
									src="${ pageContext.servletContext.contextPath }/resources/notice_uploadFiles/${ask.askNewImg}"
									style="width: 200px; height: 200px;" onerror="imgAreaError()" />
							</c:if>

							<p id="askContent">${ask.askContent}</p>

						</div>

						<div class="contentLine"></div> <span> <label
							class="askContent" for="answered">답변</label>
					</span> <textarea class="form-control" id="answered" name="answered"
							rows="10" style="resize: none;" maxlength="1000" wrap="on"
							required>${ask.answered}</textarea>


						<div id="buttons">
							<button class="goRound" type="submit">답변</button>
						</div>
			</form>




			
			
				<form id="deleteOne" method="post" action="delete.one">
					<input type="text" id="askNo" name="askNo" value="${ask.askNo}"
						hidden="true">
					<button class="goRound" type="submit">삭제</button>
				</form>
				
				<div id="buttonSecondPart">
				<button id="backToList"class="goRound" onclick="backToList();">목록</button>
				</div>

		</div>

		<div id="gotoLEFT">
			<jsp:include page="../../common/footer.jsp" />
		</div>

		<script>
			function backToList() {
				location.href = "list.one";
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
				if ($(":input[name='askOriginImg']").val() == '') {
					$('#imgArea').attr('src', '');
				}
				$('#imgArea').css({
					'display' : ''
				});
				readURL(this);
			});

			// 이미지 에러 시 미리보기영역 미노출
			function imgAreaError() {
				$('#imgArea').css({
					'display' : 'none'
				});
			}
		</script>

		<!-- 어딜 눌러도 텍스트영역으로 -->
		<script>
			$('#imgViewArea').on('click', function() {
				$('#asktag').focus();
			})

			$('#imgArea').on('click', function() {
				$('#asktag').focus();
			})
		</script>
</body>
</html>