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

	#greenfont1 { margin-right: 69px; }
		#faq { margin-right: 41px; color: rgb(30, 154, 40); }
		#facetoface { margin-right: 68px; }
		
		#faq:hover {text-decoration: none;}
		#facetoface:hover{ text-decoration : underline;}
		
		#wrap { margin-bottom: 7%; }
		
		#greenfont1, #faq, #facetoface { font-weight: bold; }
		
		/*helper*/
		.needhelp {
			margin-top: 50px;
			border: 1px solid rgb(244, 244, 244);
			background-color: rgb(244, 244, 244);
			width: 130px;
			height: 30px;
			border-radius: 10px;
		}
		
				#gethelp:hover{ text-decoration : underline;}

		#help {
			font-weight: bolder;
			margin-bottom: 0px;
			margin-top: 0px;
			width: 140px;
			margin-left: 3%;
		}
		
		#gethelp { margin-left: 3%; }
		#gethelp:hover{  color : #000000; text-decoration : underline;}
		
		#helparrow { margin-left: 48px; margin-top: 0px; }

 		/* main main */
        #thelist{  float: left; margin-left: 5%;  width: 710px; }

#notice { margin-bottom: 0px; font-size: 13px; font-weight: bolder; }

#greenfont2 { color: rgb(30, 154, 40); }

/*writing box*/
#sideGreenbar {
	background-color: rgba(232, 240, 214, 0.5);
	height: 550px;
	width: 100px;
}

     #getInThere{ margin-top: -530px;  margin-left: 35px; }

/*div lines*/
.grayline{
            margin-top: 10px;
            margin-bottom: 20px;
            margin-left: 65px;
            width: 610px;
            height: 0.001cm;
            border : 0.3px solid grey;
            background-color: grey;
        }
         
#greenline{ margin-top: 4px; margin-bottom: 0; width: 710px; height: 1px; border : 1px solid rgb(30, 154, 40); background-color: rgb(30, 154, 40);}
        
        
 #whole{  width: 1050px;  margin: auto; }

#justGetThere { margin-top: -27px; }

#headjustify { margin-top: -5px }



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

.goRound:hover { background-color: rgb(232, 240, 214); color: #000000;}
#buttons{  margin-top: 2%;  margin-left: 570px; margin-bottom: 3%;  }
#buttonSecondPart{ margin-top: -47px; margin-left: 640px; }
		
/*content div*/
#titleDiv{margin-top : -25px;}

#faqQuestion {
            width: 580px;
            height : 25px;
            margin-left: 80px;
            border-radius : 7px;
            border : 1px solid rgb(206,212,218);
        }

#faqAnswered { 
    		margin-top: -15px;
            width: 580px;
            margin-left: 80px;
            height: 440px;
            border : 1px solid rgb(206,212,218);
            border-radius : 7px;
     }

/*radio style*/
.radioAlign { margin-right: 20px;}

#radioType {margin-right: 20px;}

#radios {
	margin-left: 80px;
	margin-top: -20px;
	margin-bottom: 10px;
} 
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
					<td width: 300px;><a id="faq" class="bottomfix" >자주 묻는 질문</a></td>
                <td class="arrow"><span id="greenfont2" class="bottomfix"> > </span> </td>
            </tr>
				<br>
				<tr>
					<td width: 300px;><a id="facetoface" class="bottomfix"  href="list.one">1:1 문의</a></td>
                <td class="arrow"><span class="bottomfix"> > </span> </td>
            </tr>
			</div>
			<div class="needhelp">
				<span><p id="help">도움이 필요하신가요?</p></span> <span><a
					id="gethelp" href="goAskForm.one">1:1 문의하기</a></span> <span id="helparrow">
					> </span>
			</div>
		</div>

		<div id="thelist">
			<span id="notice">자주 묻는 질문 추가</span>



			<!--관리자 메뉴 -->
			<div id="greenline"></div>

			<div id="sideGreenbar"></div>
			<form id="InsertFAQ" method="post" action="insert.faq">
			
				<div id="getInThere">
					<span id="headTitle"><label for="faqQuestion">질문</label> 
						<div id="titleDiv">
							<input type="text" id="faqQuestion" name="faqQuestion" maxlength="30" required></span>
						</div>
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
					
					<label for="faqAnswered">답변</label>
						<textarea wrap=on  class="form-control" required id="faqAnswered" name="faqAnswered" rows="10" style="resize: none;" maxlength="1000" ></textarea>
					</div>

					<div id="buttons">
						<button class="goRound" id="insertAlert" type="submit">추가</button>
					</div>
					
			</form>

			<div id="buttonSecondPart">
				<button class="goRound" onclick="backToList();">목록</button>
			</div>
		</div>
	<br>
			<jsp:include page="../../common/footer.jsp" />
		
		<script>
	function backToList(){
		  location.href="list.faq";
	}
</script>
</body>
</html>