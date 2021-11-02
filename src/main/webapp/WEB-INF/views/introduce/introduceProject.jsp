<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- font -->
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">

<!-- favicon -->
<link rel="icon"
	href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png"
	type="image/x-icon">

<!-- CSS here -->
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/assets/css/slicknav.css">
<link rel="stylesheet" href="resources/assets/css/flaticon.css">
<link rel="stylesheet" href="resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="resources/assets/css/gijgo.css">
<link rel="stylesheet" href="resources/assets/css/animate.min.css">
<link rel="stylesheet" href="resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="resources/assets/css/slick.css">
<link rel="stylesheet" href="resources/assets/css/nice-select.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<title>도넷닷컴</title>
<style>
    .outer{
        width: 1050px;
        margin: auto;
    }
    .sidebar{
    	width: 200px;
    	float: left;
    }
	.arrow{
		float: right;
	}
	.main{
		width: 800px;
	}
	#title{
		font-size: 18px;
		font-weight: 600;
	}
	#subTitle{
		color: grey;
	}
	#greenLine{
        background-color: rgb(60, 179, 113);
        width: 800px;
        height: 3px;
        float: right;
	}
	#content{
		text-align: center;
		width: 800px;
		float: right;
	}
	#hands, #chart{
		width: 500px;
		heigth: 400px;
	}
	.text{
		display: inline-block;
		width: 800px;
	}
	#appointed, #life{
		width: 300px;
		height: 200px;
	}
	#reason1{
		text-align: left;
	}
	#heart{
		width: 220px;
		height: 220px;
	}
	#reason2{
		text-align: left;
		margin-left: 15%;
		float: left;
	}
	.topTotop{
	    cursor: pointer;
	    color: white;
	    font-size: 14px;
	    background-color: rgb(60, 179, 113);
	    border-radius: 5px;
	    padding: 7px 5px 7px 7px;
	}


</style>
</style>
</head>
<body id="pageTop">
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer">
		<span class="sidebar">
			<h3 style="font-size: 18px; font-weight: 800;">소개</h3>
			<br>
			<div>
				<div>
					<span><a id="introduceProject" class="index1" href="introduce.pr" style="color: black;"><B>프로젝트 소개</B></a></span>
                	<span class="arrow"><B> > </B></span>
				</div>
				<br>
				<div>
					<span><a id="howtoDonation" class="index2" href="introduce.how" style="color: black;">후원 방법</a></span>
                	<span class="arrow"> > </span>
				</div>
				<br>
				<div>
					<span><a id="statistics" class="index3" style="color: black;">통계 조회</a></span>
               		<span class="arrow"> > </span>
               	</div>
			</div>
		</span>
		<span class="main">
				<span id="title">프로젝트 소개</span>
				<span id="subTitle"> | 도넷닷컴에 대해 소개합니다.</span>
				<div id="greenLine"></div>
				<div id="content">
					<br><br><br><br><br><br>
					<img id="hands" src="${ pageContext.servletContext.contextPath}/resources/imgs/introduceImgs/hands.PNG" alt="">
					<br><br><br><br><br><br><br><br><br><br><br><br>
					<h1 style="font-size:15px;">기부를 하지 않는 이유는 무엇일까요?</h1>
					<br><br><br>
					<img id="chart" src="${ pageContext.servletContext.contextPath}/resources/imgs/introduceImgs/chart.png" alt="">
					<br><br>
					<p>
						경제력 여력이 없음을 제외하고 대부분의 사람들이 기부를 하지 않는 이유를<br><br>
						
						후원단체에 신뢰가 가지 않아서,<br><br>
						
						기부하는 방법을 몰라서,<br><br>
						
						기부자체에 관심이 없어서 등<br><br> 
						
						<B>기부에 대한 무지</B>에 의해 파생되었습니다.<br><br>
						
						<B style="color: rgb(60, 179, 113);">접근하기 어려운 기부에 대한 인식을 새로이 도모</B>하고<br><br>
						
						돈을 기부하는 것 뿐만 아닌<br><br> 
						
						<B style="color: rgb(60, 179, 113);">사소한 행동으로도 따뜻한 나눔이 될 수 있는 환경</B>을 만들기 위해<br><br>
						
						<br><br><br><br>
						다양한 기부 관련 도전과제를 통해 동기를 부여하고<br><br>
						
						후원하고자 하는 종목을 선택하여,<br><br><br><br><br><br>
						
						<B style="color: rgb(192, 57, 43); font-size:15px;">"직접 참여하는 기부문화"</B>를 만드는 것이 저희 프로젝트의 목표입니다.<br><br><br><br><br><br><br><br>
						
						<h1 style="font-size:15px;">그렇다면 근본적인 이유로 돌아가서<br><br>기부를 왜 해야 할까요?</h1>
						
					</p><br><br><br><br><br><br><br><br>
					
					<div class="text">
						<img id="appointed" src="${ pageContext.servletContext.contextPath}/resources/imgs/introduceImgs/appointed.jpg" alt="">
						<br><br><br>
						<h3>1. 책임과 부의 나눔</h3>
						<p>
							현재 가지고 있는 부를 사회에 환원하며 경제 활동을 도와야 합니다.<br><br>
							 
    							부의 흐름을 좀 더 원활히 하는 것이 시민의 책임이자 <br><br>
    							
   							사회적 책임의 완성입니다.<br><br>
						</p>
		
					
						<br><br><br><br><br><br><br><br><br><br>
						
						<img id="heart" src="${ pageContext.servletContext.contextPath}/resources/imgs/introduceImgs/heart.jpg" alt="">
						<br><br>		
						<h3>2. 유산을 쌓기보다 현재의 기부가 투자적가치 있다.</h3><br><br>
						<p>
							로젠버그 법칙에 따르면,<br><br> 
							
							지금 기부하지 않음으로써  발생하는 사회적 손실이 <br><br>
							
							투자로 생기는 수익보다 클 수 있다며 <br><br>
							
							기부를 늦추지 말라고 설득했습니다. <br><br>
							
							100달러를 투자해 10년뒤 1억달러의 수익을 낸다해도, <br><br>
							
							그 돈으로 도움을 받은 아이들이 성장해 10년뒤에 낼 경제적 파급력은 <br><br>
							
							훨씬 클 수 있다는 로젠버그의 법칙을 상기합시다.<br><br>
						</p><br><br><br><br><br><br><br><br>
	
						<img id="life" src="${ pageContext.servletContext.contextPath}/resources/imgs/introduceImgs/life.jpg" alt="">
						<br><br><br>
						<h3>3. 자신의 기쁨을 찾을 수 있다.</h3>
						<p>
							중국 속담에 한 시간의 기쁨을 원하면 낮잠을 자고,<br><br> 
							
							평생 기쁨을 원하면 기부를 하라는 말이 있습니다.<br><br>
							
							살아있는 동안에 기부를 통해 기쁨을 누리고 살 수 있는 것은 <br><br>
							
							행운임을 주지해야합니다. <br><br>
						</p>
					</div>
					<p><br><br><br><br><br><br><br><br>
						이 외에도 더 다양한 이유가 분명 있을 것입니다.<br><br><br><br><br> 

						지금 이 순간에도 바로 시작할 수 있는<br><br> 
						
						<B>당신의 따스한 온기가<br><br> 
						
						저희 donet.com과 함께 하기를 바랍니다.</B><br><br> 
					</p>
			</div>
		</span>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	<jsp:include page="../donation/subMenu.jsp" />
</body>
</html>