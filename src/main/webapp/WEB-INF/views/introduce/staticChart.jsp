<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon -->
<link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png" type="image/x-icon">

<!-- font -->
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap" rel="stylesheet">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- google chart -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawMultSeries1);
google.charts.setOnLoadCallback(drawMultSeries2);
google.charts.setOnLoadCallback(drawMultSeries3);
google.charts.setOnLoadCallback(drawMultSeries4);
 
function drawMultSeries1() {

	 var data = google.visualization.arrayToDataTable([
	 		["title", "누적금액","목표금액" ],
	    	
	 		<c:forEach items="${s}" var="list" varStatus="status"> 
		 		["${list.suTitle}",Number("${list.totalamount}"), Number("${list.goal}")],
		 		
		 		<c:if test="${status.end}">
		 			["${list.suTitle}",Number("${list.totalamount}"), Number("${list.goal}")]
		 		</c:if>
			</c:forEach>
	]);
	
	var view = new google.visualization.DataView(data);
	view.setColumns([0,1,2]);

	var options = {
	  title: "후원 프로젝트 별 누적금액 차트",
	  colors: ['GoldenRod','ForestGreen']
	};
	
	var chart = new google.visualization.BarChart(document.getElementById("column_chart_div1"));
	chart.draw(view, options);
}

 
function drawMultSeries2() {
    
	var data = google.visualization.arrayToDataTable([
		["title","달성률"],
		<c:forEach items="${s}" var="list" varStatus="status">  
 			["${list.suTitle}",Number("${list.totalamount/list.goal}")],
 			
 			<c:if test="${status.end}">
 				["${list.suTitle}",Number("${list.totalamount/list.goal}")]
 			</c:if>
		</c:forEach>
	]);
 
	var options = {
        title: '후원프로젝트 별 달성률 차트',
        hAxis: {
          title: '달성률',
          minValue: 0
        },
        vAxis: {
          title: '후원 프로젝트'
        },
        colors: ['ForestGreen']
      };
 
	var chart = new google.visualization.ColumnChart(document.getElementById('column_chart_div2'));
	chart.draw(data, options);
}
    
 
function drawMultSeries3() {
	var data = google.visualization.arrayToDataTable([
		["title", "누적금액","목표금액" ],
		<c:forEach items="${f}" var="list" varStatus="status"> 
			["${list.fpName}",Number("${list.raised}"), Number("${list.goal}")],
			
 			<c:if test="${status.end}">
 				["${list.fpName}",Number("${list.raised}"), Number("${list.goal}")]
			</c:if>
		</c:forEach>
	]);
 
	 var view = new google.visualization.DataView(data);
     view.setColumns([0,1,2]);

     var options = {
       title: "펀딩 프로젝트 별 누적금액 차트",
       colors: ['GoldenRod','ForestGreen']
     };
     var chart = new google.visualization.BarChart(document.getElementById("column_chart_div3"));
     chart.draw(view, options);
}

function drawMultSeries4() {
    
	var data = google.visualization.arrayToDataTable([
		["title","달성률"],
		<c:forEach items="${f}" var="list" varStatus="status">  
 			["${list.fpName}",Number("${list.raised/list.goal}")],
 			
 			<c:if test="${status.end}">
 				["${list.fpName}",Number("${list.raised/list.goal}")]
 			</c:if>
		</c:forEach>
	]);
 
	var options = {
        title: '펀딩프로젝트 별 달성률 차트',
        hAxis: {
          title: '달성률',
          minValue: 0
        },
        vAxis: {
          title: '펀딩 프로젝트'
        },
        colors: ['ForestGreen']
      };
 
	var chart = new google.visualization.ColumnChart(document.getElementById('column_chart_div4'));
	chart.draw(data, options);
}
   </script>
<title>도넷닷컴</title>
<style>
.outer {
	width: 1050px;
	margin: auto;
}

#title {
	font-size: 18px;
	font-weight: 600;
	margin-left: 9.5%;
	color: black;
}

#greenLine {
	background-color: rgb(60, 179, 113);
	width: 800px;
	height: 3px;
	float: right;
}

#content {
	text-align: center;
	width: 800px;
	float: right;
}

</style>
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<div class="outer">
		<jsp:include page="../introduce/sideBar.jsp" />

		<span class="main"> <span id="title">통계 조회</span> <span
			id="subTitle"> | 도넷닷컴의 주요 통계를 조회합니다.</span>
			<div id="greenLine"></div>
			<div id="content">
				<br><br><br><br><br><br>
				<div id="column_chart_div1" style="width: 900px; height: 500px;"></div>
				<div id="column_chart_div2" style="width: 900px; height: 500px;"></div>
				<div id="column_chart_div3" style="width: 900px; height: 500px;"></div>
				<div id="column_chart_div4" style="width: 900px; height: 500px;"></div>

			</div>
		</span>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<jsp:include page="../donation/subMenu.jsp" />

	<!-- JS here -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/animated.headline.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- Date Picker -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/gijgo.min.js"></script>
	<!-- Nice-select, sticky -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.sticky.js"></script>
	<!-- Progress -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.barfiller.js"></script>

	<!-- counter , waypoint,Hover Direction -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.counterup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/hover-direction-snake.min.js"></script>

	<!-- contact js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/contact.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.form.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/mail-script.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>