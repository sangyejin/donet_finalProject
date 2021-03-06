<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도넷닷컴</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <style>
    	/*administrator*/
    	#administratorOption>button {
			width: 50px;
			height: 20px;
			margin-right: 0.5%;
			margin-top : 10px;
			margin-left : 10px;
		}
		
		#administratorLabel {
			font-weight: bold;
			margin-right: 5%;
		}
    
        *{ /*border: 1px red solid;*/
            font-size: 12px;
        }

        /*sidebar*/
		.sidebar {
			width: 150px;
			height: 400px;
			margin-left: 60px;
			padding: 0;
			float: left;
			margin-top: 0;
		}
		
		#greenfont1 { margin-right: 69px; text-decoration: none; }
	#faq { margin-right: 41px; }
	#facetoface { margin-right: 68px; }
	
	#faq:hover, #facetoface:hover{ text-decoration : underline; color : #000000;}
	
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

        /* main body */
        #thelist{
            float: left;
            margin-left: 5%;
            margin-top: 0;
            width: 710px;
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

        #whole { width: 1050px; margin : auto;}

        #greenline{
            margin-top: 1%;
            margin-bottom: 0;
            width: 710px;
            height: 1px;
            border : 1px solid rgb(30, 154, 40);
            background-color: rgb(30, 154, 40);
        }

        /*single button style*/
		 #goRound{ 	height: 20px;
		            width: 50px;
		            border-style:none;
		            border-radius: 7px;
		            color: white; 
		            background-color: rgb(66, 178, 115); 
		 }
		 #goRound:hover{ background-color: rgb(232, 240, 214) ; color : #000000; }      
		   
        #buttons{
           margin-top: 10px;
           margin-left: 650px;
           margin-bottom: 3%;
           width : 50px;
           position : absolute;
        }

        table{border-collapse: collapse;}

        td{  border-bottom: 1px solid gray;  height: 25px; }

        .leftValue{width: 400px;}
        .value{width: 200px;}

        .head{  text-align: center;  width: 100px; background-color: rgba(232, 240, 214, 0.5); }

        #yourContent{ margin-left: 25px;  font-size:12px; margin-right: 25px; }
 
       #support { color: #000000; font-weight: bolder; font-size : 16px; margin-top:0px;}
       
       .thisDetail > .head:hover{font-weight : bold;} 
       .thisDetail > .theDetail:hover{ text-decoration : underline; }
       
       /*사진 불러오는 영역*/
       #imgArea{ border-radius : 7px; border : none;  margin-left: 25px; margin-bottom: 15px; }
       
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
            <span><a id="gethelp" href="goAskForm.one">1:1 문의하기</a></span>
            <span id="helparrow"> > </span>
        </div>
    </div>

    <div id="thelist">
       <div id="notice">공지사항</div>
       <div id="greenline"></div>
       <table id="noteDetail">
            <tr>
                <td class="head">제목</td>
                <td class="leftValue"> ${ no.noticeTitle }</td>
                <td class="head">작성일</td>
                <td class="value"> ${ no.noticeDate }</td>
            </tr>
            <tr>
                <td class="head">작성자</td>
                <td class="leftValue"> ${ no.noticeWriter }</td>
                <td class="head">조회수</td>
                <td class="value"> ${ no.noticeCount }회</td>
            </tr>
            <tr>
            <td colspan="4"><br>
            	<c:if test="${ ! empty no.noticeNew  }">
            		<img id="imgArea" src="${ pageContext.servletContext.contextPath }/resources/notice_uploadFiles/${no.noticeNew}" style="width : 200px; height : 200px;" onerror="imgAreaError()"/>
            	</c:if>

            	<p id="yourContent">${ no.noticeContent } </p><br></td>

            </tr>
            <tbody>
           
               
                	<c:if test="${ ! empty prevNote  }">
                	 <tr class="thisDetail">
                		<td class="head">이전글</td>
		                <td hidden="true">${prevNote.noticeNo}</td>
		                <td class="theDetail" colspan="3"> ${prevNote.noticeTitle}</td>
		               </tr>
               		</c:if>
               		
               		<!-- 이전글 없으면 -->
               		<c:if test="${ empty prevNote  }">
               		</c:if>
               		
           
            
           
               <c:if test="${ ! empty nextNote  }">
                 <tr class="thisDetail">
                	<td class="head">다음글</td>
		                 <td hidden="true">${nextNote.noticeNo}</td>
		                 <td class="theDetail" colspan="3"> ${nextNote.noticeTitle}</td>
	                 </tr>
	                 </c:if>
	                 
	                <!-- 다음글 없으면 -->
	                 <c:if test="${ ! empty nextNote  }">
	                 </c:if>
           
            </tbody>


       </table>

			 <div id="buttons">
            	<button id="goRound" onclick="backToList();">목록</button>
       		 </div>
       		 
       		 <!-- admin menu -->
			<c:if test="${ loginUser.userRole eq 'D' }">
				<div id="administratorOption">
					<label id="administratorLabel">관리자</label>
					<button id="goRound" onclick="adminUpdate();">수정</button>
					<button id="goRound" onclick="adminDelete();">삭제</button>
				</div>
			</c:if>
			
		</div>
		<br>
	<!-- 수정 -->	
	 <script>
    	function adminUpdate(){ location.href="goUpdateForm.no?noticeNo=" + ${no.noticeNo}; }
    </script>

    <!-- 삭제 -->
    <script>
    	function adminDelete(){ 
    		if(confirm("해당 게시글을 삭제합니다.")){
    			/* 삭제 하겠다고 하면 분부대로 처리해줌,,,,*/
    			alert ("게시글 삭제가 완료되었습니다.");
        		location.href="goDelete.no?noticeNo=" + ${no.noticeNo}; 
    		}else{
    			alert("삭제를 취소합니다.");
    		}
    			
    	}
    </script>

	<!-- 이전글, 다음글 -->
	<script>
    	$(function(){
    		$("#noteDetail > tbody > .thisDetail ").click(function(){
    			if($(this).children().eq(1).text() != ''){
        			location.href="detail.no?noticeNo=" + $(this).children().eq(1).text();
    			}
    		});
    	});
    </script>

	<!-- 목록  -->
	<script>
		function backToList(){ location.href="list.no"; }
	</script>
	
	<!--이미지 에러 시 사진 미노출-->
	<script>
	function imgAreaError(){
		$('#imgArea').css({ 'display' : 'none' });
	}
	</script> 
	
	<jsp:include page="../../common/footer.jsp" />	
	
</body>
</html>