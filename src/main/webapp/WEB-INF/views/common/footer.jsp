<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도넷닷컴</title>
<style>
	/*전체설정*/
	 #All > *{font-size: 12px; color: gray; }
    
  	#toleft > a{  text-decoration: none; color: gray; }
  	
  	#All{ width: 100%; 	 margin : 0; padding : 0; margin-bottom : 0; margin-top : 1000px; border-top: solid 1px rgb(244, 244, 244); }

	/*SNS 바*/
    #snstap{  width: 335px;  height: 30px;  margin-top: -5px; }

	/*좌우 짜잘 설정들*/
    #workinghour{ font-size: smaller; }
    
    #happycustomers{margin-top: -5px;}

    #toright, #toleft{
       float: left;
       margin-left: 9%;
       margin-top: 0;

    }

    #toright{ margin-left: 14%; }

    #toright>p{  text-align: left; }

    #toleft>a{ font-weight: bolder; }
    
    #topmargin{  margin-top: 7%; }
    
    #toleft> a:hover{ text-decoration: underline; }

    #footer{ width: 1050px; margin : auto; margin-top : 10px; height : 50px; position : relative; }
    
    #rightMiddleFooter{margin-top : 15px; margin-bottom : 15px;}

</style>
</head>
<body>
	<div id="All">
	<div id="footer">
		<div id="toleft" align="left"> <a href="#">회사소개</a> | <a
			id="noVacancy">채용안내</a> | <a href="moral.fo">윤리경영</a> | <a
			href="terms.fo">이용약관</a> | <a href="goAskForm.one">개선 의견 수렴</a> <br>
			<br>

			<div id="happycustomers">
				<b>고객 행복 센터</b>
			</div>010-3371-5190<span id="workinghour">(24시 운영 00:00-24:00)</span> 
			<br><br> 
			<img id="snstap" src="${ pageContext.servletContext.contextPath }/resources/imgs/snsbar.png">
		</div>

		<div id="toright">
			<p id="informations"> 사업자등록번호 : 123-45-6789 | 서울 강남 제2000-09호 | 대표자 : 허은주</p>
			<div id="rightMiddleFooter">
			<p id="address">주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F,3F,4F,5F,6F</p>
			<p id="telAndFax"> Tel : 1544-9970 | Fax : 02-562-3478 </p>
			</div>
			<p id="copyRight">Copyright © 2021 donet.com non-profit company. All Right Reserved</p>
		</div>
		
	</div>
	</div>
	
	<script>
		$(function(){
			$("#noVacancy").on('click', function(){
				alert("현재 도넷닷컴은 채용중이 아닙니다.")
			})
			
			$("#snstap").on('click', function(){
				alert("준비중입니다.")
			})
		})
	</script>
</body>
</html>