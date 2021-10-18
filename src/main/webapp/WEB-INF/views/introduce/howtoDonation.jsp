<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도넷닷컴</title>
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">
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
	#goodthings, #goodthing{
		width: 300px;
		display: inline-block;
		vertical-align: top;
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
	<jsp:include page="../common/menubar.jsp"/>

	<div class="outer">
		<span class="sidebar">
			<h3 style="font-size: 18px; font-weight: 800;">소개</h3>
			<br>
			<div>
				<div>
					<span><a id="introduceProject" class="index1" href="introduce.pr" style="color: black;">프로젝트 소개</a></span>
                	<span class="arrow"> > </span>
				</div>
				<br>
				<div>
					<span><a id="howtoDonation" class="index2" href="introduce.how" style="color: black;"><B>후원 방법</B></a></span>
                	<span class="arrow"><B> > </B></span>
				</div>
				<br>
				<div>
					<span><a id="statistics" class="index3" style="color: black;">통계 조회</a></span>
               		<span class="arrow"> > </span>
               	</div>
			</div>
		</span>
		<span class="main">
			<span id="title">후원 방법</span>
			<span id="subTitle"> | 도넷닷컴의 후원방법에 대해 알아봅시다.</span>
			<div id="greenLine"></div>
			<div id="content">
				<br><br><br><br><br><br>
				<h1 style="font-size:15px;">도넷닷컴은 사용자의 직접 참여하는 후원방식을 지원합니다.</h1><br><br><br>
				<p>
					금전적인 지원 뿐만 아니라 사이트 내에 진행중인 다양한 이벤트에 참여하고<br><br>
					
					사소한 습관, 재능기부 등 자신의 선행활동을 다이어리처럼 기록하여<br><br>
					
					획득하는 포인트로 다양한 프로젝트에 후원할 수 있습니다!<br><br>
					
					이러한 다양한 활동으로 색다른 기부의 성취감을 느껴보세요!<br><br>
				</p>
					
				<br><br><br><br><br><br><br><br><br><br>
				<h1 style="font-size:15px;">1. 진행 중인 다양한 이벤트에 참여해 포인트를 획특하세요!</h1><br><br>
				<img id="event" src="${ pageContext.servletContext.contextPath}/resources/imgs/introduceImgs/event.PNG" alt="">
				<br><br>
				<p>
					전시회 방문, 게임, 심리테스트 등 다양한 이벤트에 참여하는 것만으로도 <br><br>
					
					후원할 수 있는 포인트를 얻을 수 있습니다.<br><br>
				</p>
				
				<br><br><br><br><br><br>
				<h1 style="font-size:15px;">2. 자신의 선행활동 기록해 포인트를 획득하세요!</h1><br><br>
				<div class="imgs">
					<span><img id="goodthing" src="${ pageContext.servletContext.contextPath}/resources/imgs/introduceImgs/goodthing.PNG" alt=""></span>
					<span><img id="goodthings" src="${ pageContext.servletContext.contextPath}/resources/imgs/introduceImgs/goodthings.PNG" alt=""></span>
				</div>
				<br><br>
				<p>
					봉사활동, 재능기부 등 자신의 선행활동을 다이어리처럼 남겨주세요.<br><br>
					
					꼭 거창한 것이 아니어도 좋습니다.<br><br>
					
					길가는 쓰레기를 주웠다던지, 힘들어하는 친구에게 격려의 말을 건냈다던지<br><br>
					
					아주 사소한 오지랖에서 비롯되어 주변 사람들에게 관심을 가지는 것만으로도 충분합니다!<br><br><br><br><br><br>
					
					
					
					이러한 게시글을 다른 사람들과 공유하며 커뮤니티를 형성해 소통할 수 있습니다.<br><br>
					
					게시글 인증 후 포인트를 획득할 수 있고<br><br>
					
					 더 나아가 생활 속에 깆든 기부습관을 들일 수 있습니다.<br><br>
				</p>				
				
				<br><br><br><br><br><br>
				<h1 style="font-size:15px;">3. 포인트 결제 충전</h1><br><br>
				<p>
					도넷닷컴의 회원이 되어 <br><br>

					마이페이지에서 직접 포인트를 충전 할 수 있습니다!<br><br>
				</p>
	
				
			</div>
		</span>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<div style="display:scroll;position:fixed;bottom:10px;right:5px;"><a class="topTotop" href="#pageTop">TOP▲</a></div>
</body>
</html>