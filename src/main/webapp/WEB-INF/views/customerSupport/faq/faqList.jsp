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

    <link href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap" rel="stylesheet">

    <style>
        *{
            /*border: 1px red solid;*/
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
		
		#greenfont1 { margin-right: 45%;}
		
		#faq { margin-right: 36px; color: rgb(30, 154, 40); text-decoration: none; }
		#facetoface { margin-right: 70px; }
		
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

        /*****detail for table****/
        .number{width: 100px;}
        .category{width: 200px;}
        .title{width : 600px;}

        .hidFirst{ display: none; }
        .detailAlter{margin-left : 40px; font-size : 12px}
        
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
		            width: 30px;
		            border-style:none;
		            border-radius: 7px;
		            color: white; 
		            background-color: rgb(66, 178, 115); 
		            
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
				<span><p id="help">도움이 필요하신가요?</p></span> 
				<span><a id="gethelp"  href="list.one">1:1 문의하기</a></span> 
				<span id="helparrow"> > </span>
			</div>
		</div>



    <div id="thelist">
       <span id="notice">자주 묻는 질문</span>
       <span id="subnote">가장 많이 문의하시는 질문을 모았습니다.</span>
       
       
       <div id="greenline"></div>
       
           <table id="faqList">
                <tr>
                   <td class="number">번호</td>
                   <td class="category">카테고리</td>
                   <td class="title">질문</td>
                </tr>
                <tbody>
                <c:if test="${!empty list}">
                	<c:forEach items="${ list }" var="faq" varStatus="status">
			                <tr class="head">
			                    <td class="number">${ faq.rowNum }</td>
			                    <td class="category">${ faq.faqTypeName }</td>
			                    <td class="title">${ faq.faqQuestion }</td>
			                 </tr>
			                 <tr class="hidFirst">
			                 	<td class="trueNumber" hidden="true">${ faq.faqNo }</td>
			                    <td colspan="3"><pre class="detailAlter">${ faq.faqAnswered } </pre></td>
			                 </tr>
						</c:forEach>
					</c:if>
                 </tbody>
                 
                 <c:if test="${empty list}">
						<tr>
							<td colspan="3">존재하는 공지사항이 없습니다. 이전 화면으로 돌아가시려면 <a href="${header.referer}"><b>여기</b></a>를 클릭하세요. </td>
						</tr> 
					</c:if>
           </table>


           <div id="buttons" align="center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage ne 1 }">
							<button class="page-item">
								<a class="page-link" href="list.faq?currentPage=${ pi.currentPage-1 }"> < </a>
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
									<a class="page-link" href="list.faq?currentPage=${ p }">${ p }</a>
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
								<a class="page-link" href="list.faq?currentPage=${ pi.currentPage+1 }"> > </a>
							</button>
						</c:when>
						<c:otherwise>
							<button class="page-item disabled">
								<a class="page-link" href="list.faq?currentPage=${ pi.currentPage+1 }"> > </a>
							</button>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			
			  
           <div id="grayline"></div>
           
           <form id="searchForm" method="post" action="search.faq">
			<div id="searchcategory">
				<label id="rightmargin"><b>검색구분</b></label>
				
				<input type="radio" name="searchtype" id="userquery" value="1" required> 
				<label class="radioAlign" for="userquery">회원문의</label> 
				
				<input type="radio"  name="searchtype" id="payrefund" value="2" required> 
				<label class="radioAlign" for="payrefund">결제/환불</label>
				
				<input type="radio" name="searchtype" id="etc" value="3" required> 
				<label class="radioAlign" for="etcs">서비스 이용 및 기타</label>
				
				<div id="searchbox">
					<button type="submit" id="searchmark">
						<img id="magnifier" src="${ pageContext.servletContext.contextPath }/resources/imgs/magnifier.png">
					</button>
					
					<input id="mInput" name="mInput" type="text" placeholder="검색어를 입력하세요" value="" required>
				</div>
			</div>
			</form>
    </div>
	<!-- admin menu -->
			<c:if test="${ loginUser.userRole eq 'D' }">
				<div id="administratorOption">
					<label id="administratorLabel">관리자</label>
					<button id="goRound" onclick="adminAdd();">추가</button>
				</div>
			</c:if>
</div>

			
			
<jsp:include page="../../common/footer.jsp" />
			
    
 <script>
    	$(function(){
    		$("#faqList tbody .head").click(function(){
    			
    			 var currentRow = $(this).closest('tr');
    	         var nextRow = currentRow.next('.hidFirst');
    	         if(nextRow.is(":visible")){
    	                nextRow/*.next('.hidFirst:nth-child(2n)')*/.hide();

    	            }else{
    	                nextRow.show();

    	            }
       		});
    	});
    </script> 
    
    <script>
    	function adminAdd(){
 			location.href="goAddForm.faq";
    	}
    </script>
    
    <c:if test="${ loginUser.userRole eq 'D' }">    	
    	<script>
    	$(function(){
    		$("#faqList tbody .hidFirst").click(function(){
    			location.href="goUpdateForm.faq?faqNo="+ $(this).children().eq(0).text();
       		});
    	});
    	</script>		
    </c:if>
    			
    
    
</body>
</html>