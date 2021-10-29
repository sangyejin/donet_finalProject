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
    <style>
        *{font-size: 12px;}
        
        /*sidebar*/
		.sidebar {
			width: 150px;
			height: 400px;
			margin-left: 25px;
			padding: 0;
			float: left;
			margin-top: 0;
		}
		
		#greenfont1 { margin-right: 45%;}
		
		#faq { margin-right: 36px; }
		#facetoface { margin-right: 70px; color: rgb(30, 154, 40); text-decoration: none; }
		
		#greenfont1:hover #facetoface:hover{ text-decoration : underline; color : #000000;}
		
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
		#gethelp:hover{  color : #000000; text-decoration : underline;}
		
		#helparrow { margin-left: 48px; margin-top: 0px; }

        /* mainbody*/
		#thelist {
			float: left;
			margin-left: 5%;
			margin-top: 0px;
			width: 800px;
		}
		
		#notice { font-size: 13px; font-weight: bolder; }
		
		#subnote { font-size: 11px; font-weight: lighter; color: grey }
		
		#greenfont2 { color: rgb(30, 154, 40); }
       
        /*selectbox*/
        select{  margin-left: 299.5px; }

        /*table*/
        #greenline{
            margin-top: 4px;
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

        tr{  margin-top: 1%; margin-bottom: 1%; }

       
        
       #whole { width: 1050px; margin-left: 150px; }

        /*buttons*/
        button{
            height: 25px;
            width: 60px;
            border-radius: 7px;
            border-style: none;
            background-color: rgb(244, 244, 244) ;
        }
	
	     #buttons{
           margin-top: 2%;
           margin-left : 300px;
           margin-bottom: 3%;
        }
        
        /*single button style*/
		 #goRound{
		            height: 25px;
		            width: 60px;
		            border-style:none;
		            border-radius: 7px;
		            color: white; 
		            background-color: rgb(66, 178, 115); 
		            margin-left : 740px;
		            
		        }
		        
		 #goRound:hover{ background-color: rgb(232, 240, 214) ; color : #000000; }
		      

        #wrap>tr>td{ padding-bottom: 3%; }

        #rightmargin{ margin-right: 5%; }

        pre{ 
            margin-left: -100px;
            text-align: left;
        }

/******************************************************************************************/

       /*searchbox*/
       	#searchcategory{ margin-top : 20px; margin-bottom : 5px;}
  
		#searchbox {
			width: 200px;
			height: 25px;
			border: 1px solid rgb(219, 217, 217);
			border-radius: 5px;
			margin-left: 75%;
			margin-top: -2.5%;
		}
		
		#searchmark {
			width: 30px;
			height: 25px;
			margin-top:-1px;
			margin-left:-1px;
			background-color: rgb(66, 178, 115);
			border-radius: 4px;
			border-bottom-right-radius: 0;
			border-top-right-radius: 0;
		}
		
		#searchmark:hover{ background-color: rgb(232, 240, 214); }
		
		#magnifier {
			width: 15px;
			height: 15px;
			margin-top: 1%;
			margin-bottom: 1%;
		}
		
		#mInput {
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
		
			/*admin*/
			#administratorOption>button { width: 50px; height: 20px; }
			
			#administratorLabel { font-weight: bold; margin-right: 52px; }
			
			#administratorOption{margin-left : 227px;}
			
		        
        /*head*/
        #support { color: #000000; font-weight: bolder; font-size : 16px;}
        
        
        /*radio style*/
        .radioAlign{margin-right : 20px;}
        
        <c:if test="${ loginUser.userRole eq 'D' }">
        .hidFirst:hover{background-color: rgba(232, 240, 214, 0.5);}	 
    	</c:if>
    	
    	 /*****detail for table****/    	 
        .number{ width: 100px;}
        .category{width: 120px;}
        .title{width : 380px;}
		.writer{width: 100px;}
		.date{width: 100px;}
		.answered{width: 100px;}
       	.hidFirst{ display: none; }
        .detailAlter{margin-left : 40px; font-size : 12px}
        
        #emptyAnswer{color : gray;}
        #question{color : rgb(66, 178, 115);}
        /*#answer{color : b;}*/
       
        
        /*footer*/
        #footerBox{margin-left:-150px;}
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
				<span><p id="help">도움이 필요하신가요?</p></span> 
				<span><a id="gethelp"  href="goAskForm.one">1:1 문의하기</a></span> 
				<span id="helparrow"> > </span>
			</div>
		</div>



    <div id="thelist">
       <span id="notice">1:1 문의</span>       
       
       <div id="greenline"></div>
       
           <table id="oneList">
                <tr>
                   <td class="number">번호</td>
                   <td class="category">카테고리</td>
                   <td class="title">질문</td>
                   <td class="writer">작성자</td>
                   <td class="date">작성일</td>
                   <td class="answered">답변여부</td>
                </tr>
                
              <tbody>  
                <c:if test="${!empty list}">
                	<c:forEach items="${ list }" var="one">
                	
			                 <tr class="head">
			                   <td class="number">${one.rowNum}</td>
			                   <td class="category">${one.askTypeName}</td>
			                   <td class="title">${one.askTitle}</td>
			                   <td class="writer">${one.askId}</td>
			                   <td class="date">${one.askDate}</td>
			                   <td class="answered">${one.askStatus}</td>
			                </tr>
			                
			                 <tr class="hidFirst">
			                 	<td class="trueNumber" hidden="true">${one.askNo}</td>
			                    <td style="word-break:break-all" colspan="6" ><pre class="detailAlter" id="question">Q. ${one.askContent}</pre>
			                  <c:if test="${ !empty one.answered }">
			                    <br><pre  class="detailAlter" id="answer">A. ${one.answered}</pre></td>
			                  </c:if>
			                  
			                  <c:if test="${ empty one.answered }">
			                  	<br><pre id="emptyAnswer" class="detailAlter">아직은 답변이 없네요! 주말 제외 5영업일 이내 답변 드리겠습니다.</pre></td>
			                  </c:if>
			                  
			                    
			                 </tr>
						</c:forEach>
					</c:if>
              	 </tbody>
                 
                 <c:if test="${empty list}">
						<tr>
							<td colspan="6">존재하는 문의내역이 없습니다.</td>
						</tr> 
				</c:if>
           </table>


           <div id="buttons" align="center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage ne 1 }">
							<button class="page-item">
								<a class="page-link" href="list.one?currentPage=${ pi.currentPage-1 }"> < </a>
							</button>
						</c:when>
						<c:otherwise>
							<button class="page-item disabled">
								<a class="page-link" href=""> < </a>
							</button>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:choose>
							<c:when test="${ pi.currentPage ne p }">
								<button class="page-item">
									<a class="page-link" href="list.one?currentPage=${ p }">${ p }</a>
								</button>
							</c:when>
							<c:otherwise>
								<button class="page-item disabled">
									<a class="page-link" href="">${ p }</a>
								</button>
							</c:otherwise>
						</c:choose>
					</c:forEach>


					<c:choose>
						<c:when test="${ pi.currentPage ne pi.maxPage }">
							<button class="page-item">
								<a class="page-link" href="list.one?currentPage=${ pi.currentPage+1 }"> > </a>
							</button>
						</c:when>
						<c:otherwise>
							<button class="page-item disabled">
								<a class="page-link" href="list.one?currentPage=${ pi.currentPage+1 }"> > </a>
							</button>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			
			  
           <div id="grayline"></div>
           
         <c:if test="${ loginUser.userRole ne 'D' }">   	
           <button id="goRound" onclick="goAsk();">문의하기</button>
          </c:if> 
</div>

			
<div id="footerBox">			
	<jsp:include page="../../common/footer.jsp" />
</div>
    
 <script>
    	$(function(){
    		$("#oneList tbody .head").click(function(){
    			
    			 var currentRow = $(this).closest('tr');
    	         var nextRow = currentRow.next('.hidFirst');
    	         if(nextRow.is(":visible")){
    	                nextRow.hide();
    	            }else{
    	                nextRow.show();
    	            }
       		});
    	});
    </script> 
    
    <c:if test="${ loginUser.userRole eq 'D' }">    	
    	<script>
    	$(function(){
    		$("#oneList tbody .hidFirst").click(function(){
    			location.href="goUpdateForm.one?askNo="+ $(this).children().eq(0).text();
       		});
    	});
    	</script>		
    </c:if>
    
    <!-- 로그인 안했으면 하고 와리! -->
    <c:if test="${ empty sessionScope.loginUser }">
		<script>
			alert("로그인이 필요한 서비스 입니다.");
			location.href="loginForm.me";
		</script>
    </c:if>
    			
    <script>
    	$(function(){
    		$('.answered:contains("N")').text("부").css('color','gray');
    		$('.answered:contains("Y")').text("여").css('color','rgb(66, 178, 115)');
       	})
    	
    </script>
    
    <script>
    	function goAsk(){
    		location.href="goAskForm.one";
    	}
    </script>
    
    
</body>
</html>