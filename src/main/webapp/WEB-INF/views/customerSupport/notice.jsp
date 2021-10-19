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
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic+Coding&family=Song+Myung&display=swap"
	rel="stylesheet">

<style>
* {
	/*border: 1px red solid;*/
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 10px;
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

#greenfont1 { margin-right: 45%; text-decoration: none; }

#faq { margin-right: 18%; }

#facetoface { margin-right: 43.5%; }

#faq:hover, #facetoface:hover{ text-decoration : underline; color : #000000;}

#wrap { margin-bottom: 7%; }

#greenfont1, #faq, #facetoface { font-weight: bold; }

/*helper*/
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
#gethelp:hover{ text-decoration : underline;}

#helparrow { margin-left: 29%; margin-top: 0px; }

/* mainbody*/
#thelist {
	float: left;
	margin-left: 5%;
	margin-top: 0px;
	width: 800px;
}

#notice {
	font-size: 13px;
	font-weight: bolder;
}

#subnote {
	font-size: 11px;
	font-weight: lighter;
	color: grey
}

#greenfont1, #greenfont2 {
	color: rgb(30, 154, 40);
}

/*table*/
#greenline {
	margin-top: 7px;
	margin-bottom: 0;
	width: 800px;
	height: 1px;
	border: 1px solid rgb(30, 154, 40);
	background-color: rgb(30, 154, 40);
}

#grayline {
	margin-top: 5%;
	margin-bottom: 2%;
	width: 800px;
	height: 0.001cm;
	border: 0.3px solid grey;
	background-color: grey;
}

table { border-collapse: collapse; /*테두리간 간격 없앰*/ }

td {
	text-align: center;
	padding-top: 1%;
	padding-bottom: 2%;
	border-bottom: 1px solid grey;
}

tr {
	margin-top: 1%;
	margin-bottom: 1%;
}

.number { width: 120px; }

.title { width: 350px; }

.writer { width: 120px; }

.date { width: 120px; }

.viewed { width: 120px; }

#whole {
	width: 1050px;
	margin-left: 150px;
}

button {
	height: 20px;
	width: 30px;
	border-radius: 10px;
	border-style: none;
	background-color: rgb(244, 244, 244);
}

button:hover {
	color: white;
	background-color: rgb(66, 178, 115);
}

#buttons {
	margin-top: 2%;
	margin-bottom: 3%;
	margin-left : 330px;
}

#wrap>tr>td { padding-bottom: 3%; }

#rightmargin { margin-right: 5%; }

#administratorOption>button {
	width: 50px;
	height: 20px;
	margin-right: 0.5%;
}

#administratorLabel {
	font-weight: bold;
	margin-right: 5%;
}

/*searchbox*/
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

#support { color: #000000; font-weight: bolder; font-size : 16px;}
</style>

</head>
<body>

	<jsp:include page="../common/menubar.jsp" />


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
					<td width: 300px;><a id="faq" class="bottomfix">자주 묻는 질문</a></td>
                <td class="arrow"><span class="bottomfix"> > </span> </td>
            </tr>
				<br>
				<tr>
					<td width: 300px;><a id="facetoface" class="bottomfix">1:1 문의</a></td>
                <td class="arrow"><span class="bottomfix"> > </span> </td>
            </tr>
			</div>
			<div class="needhelp">
				<span><p id="help">도움이 필요하신가요?</p></span> 
				<span><a id="gethelp">1:1 문의하기</a></span> 
				<span id="helparrow"> > </span>
			</div>
		</div>

		<div id="thelist">
			<span id="notice">공지사항</span> <span id="subnote">도넷닷컴의 새로운 소식을
				한눈에 확인하세요</span>
			<div id="greenline"></div>

			<table>
				<thead>
					<tr>
						<td class="number">번호</td>
						<td class="title">제목</td>
						<td class="writer">작성자</td>
						<td class="date">작성일</td>
						<td class="viewed">조회</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty list}">
						<c:forEach items="${ list }" var="n"  varStatus="status">
							<tr>
								<!--  다음 페이지로 넘어가면 숫자가 연속해서 카운트 되도록 -->
								<td class="number"><c:out value="${status.count}"/></td>
								<td class="title">${ n.noticeTitle }</td>
								<td class="writer">${ n.noticeWriter }</td>
								<td class="date">${ n.noticeDate }</td>
								<td class="viewed">${ n.noticeCount }</td>

							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty list}">
						<tr>
							<td colspan="5" readonly>존재하는 공지사항이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>

			<div id="buttons">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage ne 1 }">
							<button class="page-item">
								<a class="page-link" href="list.no?currentPage=${ pi.currentPage-1 }"> < </a>
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
									<a class="page-link" href="list.no?currentPage=${ p }">${ p }</a>
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
								<a class="page-link" href="list.no?currentPage=${ pi.currentPage+1 }"> > </a>
							</button>
						</c:when>
						<c:otherwise>
							<button class="page-item disabled">
								<a class="page-link" href="list.no?currentPage=${ pi.currentPage+1 }"> > </a>
							</button>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>

			<div id="grayline"></div>
			<div id="searchcategory">
				<label id="rightmargin"><b>검색어</b></label> <input type="radio"
					name="searchtype" id="thistitle" value="title"> <label
					for="thistitle">제목</label> <input type="radio" name="searchtype"
					id="thiswriter" value="writer"> <label for="thiswriter">작성자</label>
				<input type="radio" name="searchtype" id="thiscontent"
					value="content"> <label for="thiscontent">내용</label>
				<!--checkbox 하나만 선택되게 : 스크립트에서 해결
                radio 하나만 선택되게 : 이름을 같은 걸 주면 된다.-안되면 말고-->
				<div id="searchbox">
					<button id="searchmark">
						<img id="magnifier"
							src="${ pageContext.servletContext.contextPath }/resources/imgs/magnifier.png">
					</button>
					<input id="mInput" type="text" placeholder="검색어를 입력하세요" value="">
				</div>
			</div>
			<br>
			<!--관리자 메뉴 : 사용자가 관리자 일 때만 숨김해제-->
			<div id="administratorOption" hidden="true">
				<label id="administratorLabel">관리자</label>
				<button onclick="">추가</button>
				<button onclick="">수정</button>
				<button onclick="">삭제</button>
			</div>


		</div>

	</div>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>