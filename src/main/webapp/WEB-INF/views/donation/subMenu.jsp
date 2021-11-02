<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<link rel="stylesheet"
	href="resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="resources/assets/css/gijgo.css">
<link rel="stylesheet" href="resources/assets/css/animate.min.css">
<link rel="stylesheet" href="resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="resources/assets/css/slick.css">
<link rel="stylesheet" href="resources/assets/css/nice-select.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<title>도넷닷컴</title>
<style>
/* Dark Mode styles */
body.dark-theme {
	color: rgb(224, 224, 224);
	background: black;
}

body.dark-theme a {
	color: white;
}

body.dark-theme th {
	color: black;
}

body.dark-theme .btn-toggle {
	border-color: rgb(60, 179, 113);
}

body.light-theme {
	color: black;
	background: white;
}

body.light-theme a {
	color: rgb(60, 179, 113);
}

body.light-theme .top {
	color: white;
}

.outer {
	width: 1050px;
	margin: auto;
}

.top {
	cursor: pointer;
	color: white;
	font-size: 14px;
	background-color: rgb(60, 179, 113);
	border-radius: 5px;
	padding: 7px 5px 7px 7px;
}
.btn-toggle {
	height: 35px;
	cursor: pointer;
	color: rgb(60, 179, 113);
	font-size: 14px;
	background-color: white;
	border-radius: 5px;
	border-color: rgb(60, 179, 113);
	padding: 7px 5px 7px 7px;	
}

</style>
</head>
<body class="dark-theme || light-theme">

	<div class="subMenu">
	<div
		style="display: scroll; position: fixed; bottom: 10px; right: 5px;">
		<a href="#" class="top">Top▲</a>
	</div>
	<div
		style="display: scroll; position: fixed; bottom: 3px; right: 60px;">
		<button class="btn-toggle">Dark-Mode</button>
	</div>
	</div>
	<script type="text/javascript">
		$(window).scroll(function() {
			if ($(this).scrollTop() > 400) {
				$('.subMenu').fadeIn();
			} else {
				$('.subMenu').fadeOut();
			}
		});

		$('.top').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});

		const btn = document.querySelector('.btn-toggle');
		btn.addEventListener('click', function() {
			document.body.classList.toggle('light-theme');
		});
	</script>
</body>
</html>