<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도넷닷컴</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 

<style>
	#pointLabel{color : gray; margin-left : 120px; margin-top : -22px; }
	#forPointPayment:hover{ text-decoration : underline;}
	#dvdLine{background : gray; width :455px; height : 0.01cm; margin-top : 5px; margin-bottom : 5px; margin-left : -15px;}
	
	#pointView{
		hieght: 40%;
		width: 100%; 
		/* float:none; */ 
		/* margin:0 auto; */
	}
	.main-container {
  width: 1280px;
  margin: auto;
  display: grid;
  grid-template-columns: 700px 400px; /* 각 행(세로줄)의 길이 */
  grid-template-rows: 900px 200px; /* 각 열(가로줄)의 길이 */
  gap: 10px; /* 자식요소간의 간격 */
}

.temp-box {
  background: #dee3eb;
  width: 100%;
  height: 100%;
  font-size: 40px;
  border: 1px solid #dee3eb;

}

.box-two {
  display: flex;
  flex-direction: column;
  border: none;
}
.box-two > div:first-child {
  flex: 1;
}
.box-two > div:last-child {
  flex: 1;
}
.gap-box {
  background: #f2f4f7;
  height: 10px;
}
.border-dee3eb {
  border: 1px solid #dee3eb;
}

#AdScroll {
	overflow-y : scroll;
	height : 150px;
}

#AdScroll::-webkit-scrollbar {
	width: 10px;
}

#AdScroll::-webkit-scrollbar-thumb{
	background-color: #78c2ad;
	border-radius:10px;
}

#AdScroll::-webkit-scrollbar-track{
	background-color: #ffe6f2;
	border-radius:10px;
	box-shadow : inset 0px 0px 5px white;
}

</style>
</head>
<body>
	
     <jsp:include page="../common/menubar.jsp"/>
     
     <div class="main-container">
     <div class="row temp-box box-one" >
	 <div class="col-md-7" style="width: 30%; float:none; margin:0 auto">
     <div class="content ">
        <br><br>
        <div class="innerOuter ">
        
            <h2>마이페이지</h2>
           <!--  <div id="pointLabel">포인트 충전을 원하시면 <a id="forPointPayment" href="point.me">여기</a>를 클릭해주세요.</div> -->
            <div id="dvdLine"></div>
      
            <br>

            <form action="update.me" method="post" onsubmit="">
                <div class="form-group">
                    <label>* 아이디 :</label>
                    <input type="text" class="form-control" name="userId" value="${ loginUser.userId }" readonly ><br>
                    
                    <label for="userName">* 이름 :</label>
                    <input type="text" class="form-control" id="userName" name="userName" value="${ loginUser.userName }" readonly><br>                                                  
                    
                    <label for="userNick"> &nbsp; 닉네임 :</label>
                    <input type="text" class="form-control" id="userNick" name="userNick" value="${ loginUser.userNick }"><br>
                    
                    <label for="email"> &nbsp; 이메일 :</label>
                    <input type="email" class="form-control" id="email" name="email" value="${ loginUser.email }"><br>
                    
                    <label for="phone"> &nbsp; 전화번호 :</label>
                    <input type="tel" class="form-control" id="phone" name="phone" value="${ loginUser.phone }"><br>
                    
                    <label for="birthdate"> &nbsp; 생년월일 :</label>
                    <input type="text" class="form-control" id="birthdate" name="birthdate" value="${ loginUser.birthdate }"><br>
                    
                    <label for="address"> &nbsp; - 주소 - </label><br>
                  <%-- <input type="text" class="form-control" id="address" name="address" value="${ loginUser.address }"><br>--%>
                 
              	
				<c:forTokens var="addr" items="${ loginUser.address }" delims="/" varStatus="status">
					<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
						<c:set var="post" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
						<c:set var="address1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 1 }">
						<c:set var="address1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 2 }">
						<c:set var="address2" value="${ addr }"/>
					</c:if>
				</c:forTokens>
					<div class="form-inline">
					<label> &nbsp; 우편번호 : &nbsp;</label>
					<input type="text"  name="post" class="form-control mr-2 postcodify_postcode5" value="${ post }" size="6">
					<button type="button" class="btn btn-primary" id="postcodify_search_button">검색</button>
					</div>
					<br>
					<label> &nbsp; 도로명주소 : </label>
					<input type="text" name="address1" class="form-control postcodify_address" value="${ address1 }" size="30">
					<br>
				    <label> &nbsp; 상세주소 : </label>
					<input type="text" name="address2" class="form-control postcodify_extra_info" value="${ address2 }" size="30">
				
				
				<!-- jQuery와 Postcodify를 로딩한다. -->
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
					$(function(){
						$("#postcodify_search_button").postcodifyPopUp();
					});
				</script>
				
					<br><br>
					<label for=""> &nbsp; 역할 :</label>  &nbsp;&nbsp;
                    <%-- <input type="text" class="form-control" id="userRole" name="userRole" value="${ loginUser.userRole }"><br> --%>
                    <c:if test="${loginUser.userRole eq 'A' }">
                    <input type="radio" name="userRole" id="personal" value="A">
                    <label for="personal">개인</label> &nbsp;&nbsp;
                    </c:if>
                    <c:if test="${loginUser.userRole eq 'B' }">                                        
                    <input type="radio" name="userRole" id="group" value="B">
                    <label for="group">단체</label> &nbsp;&nbsp;
                    </c:if>
                    <c:if test="${loginUser.userRole eq 'C' }">                   
                    <input type="radio" name="userRole" id="Enterprise" value="C">
                    <label for="Enterprise">기업</label> <br>
                    </c:if>
                    
                    <script>
                    	$(function(){
                    		if("${loginUser.userRole}" == "A"){
                    			$("#personal").attr("checked", true);
                    		}else if("${loginUser.userRole}" == "B"){
                    			$("#group").attr("checked", true);
                    		}else if("${loginUser.userRole}" == "C"){
                    			$("#Enterprise").attr("checked", true);
                    		}
                    	});
                    </script> 
                    
                </div>
                <br>
                
                <div class="btns" align="center">             	
                	<c:if test="${ loginUser.userId eq 'admin' }">
                	<button href="userList.me" class="btn btn-primary">회원목록</button> 
                	</c:if>
                	<a href="calendar.at" class="btn btn-primary">출석체크</a>
                	<button class="btn btn-primary"><a data-toggle="modal" data-target="#chagePwdModal">Pwd변경</a></button>
                    <button type="submit" class="btn btn-success">수정하기</button>
                    <%-- <a href="delete.me?userId=${ loginUser.userId }" class="btn btn-danger">탈퇴하기</a> --%>
                    <button type="button" onclick="$('#postForm').submit();" class="btn btn-danger">탈퇴하기</button>
                </div>
            </form>

        </div>
        <br><br>
    </div>
   </div>
 </div>

<div class="temp-box box-two">
<!-- 유저 포인트 뷰 -->
	<div id="pointView" class="card text-center bg-light mb-3 h-30 border-dee3eb"> 				
  			<div class="card-body">
    			<h4 class="card-title">&nbsp;&nbsp; <h3 class="text-left">&nbsp;&nbsp;&nbsp;&nbsp;${ sessionScope.loginUser.userName } 님의 페이 포인트</h3> </h4> <br>   			   			
    				<h4 class="text">${ sessionScope.loginUser.point } pt.</h4>  <a href="point.me" class="btn btn-primary " style="position: relative; left:120px; top:-30px;">포인트 충전</a>   			
    				<br>
    				<div class="">
    					
  					</div>
  			</div>
	  	<div class="card-footer text-muted">
	    <a class="btn btn-success" href="${ pageContext.servletContext.contextPath }/list.do">후원 하기</a> &emsp; &emsp; 
	    <a class="btn btn-success" href="${ pageContext.servletContext.contextPath }/goods">물품 후원</a> &emsp; &emsp; 
	    <a class="btn btn-success" href="${ pageContext.servletContext.contextPath }/funding">펀딩 후원</a>
	  </div>
	  <ul class="list-group list-group-flush">
    	<li class="list-group-item"><button class="btn btn-secondary w-100" href="">포인트 상세내역</button></li>
   	  </ul>
	</div>
	
	<div class="gap-box"></div>
	
	<div class="panel panel-default">
	  <!-- Default panel contents -->
	  <div class="panel-body">
	    <div class="row">               
                    <div class="col-lg-10 mt-5" >
                        <div class="card" style="width:400px; height:200px;">
                            <div class="card-body" style="width:400px; height:200px;">
                                <div class="card-title text-center">
                                    <h5>후원 내역</h5>
                                    		 <div class="table-responsive" id="AdScroll">
                                    <table id="" class="table table-hover text-center">
                                        <thead>
                                            <tr>                                                
                                                <th>아이디</th>
                                                <th>결제 번호</th>
                                                <th>후원 포인트</th>
                                                <th>후원 날짜</th>                                              
                                             </tr>
                                        </thead>
                                        <tbody>                                                                                
                                            <c:forEach items="${sponsorList}" var="sp" varStatus="status">
                                            
                                            <tr>
                                                <td>${ sp.userId }</td>
                                                <td>${ sp.payNo }</td> 
                                                <td>${ sp.amount }</td>
                                                <td>${ sp.payDate }</td>                                                                             
                                            </tr>
                                            
                                           </c:forEach> 
                                        </tbody>
                                    </table>
                                    <br>
                                 </div>
                                </div>
                               
                            </div>
                        </div>
                    </div>                    
                 </div>
	  </div>
	
	</div>

	<div class="gap-box"></div>

		<div class="panel panel-default">
	  	
	  	 <div class="row">               
                    <div class="col-lg-10 mt-5" >
                        <div class="card" style="width:400px; height:200px;">
                            <div class="card-body" style="width:400px; height:200px;">
                                <div class="card-title text-center">
                                    <h5>펀딩 내역</h5>
                                    		 <div class="table-responsive" id="AdScroll">
                                    <table id="" class="table table-hover text-center">
                                        <thead>
                                            <tr>                                                
                                                <th>아이디</th>
                                                <th>프로젝트 번호</th>
                                                <th>후원 포인트</th>
                                                <th>후원 날짜</th>                                              
                                             </tr>
                                        </thead>
                                        <tbody>                                                                                
                                            <c:forEach items="${fundingSupporterList}" var="fp" varStatus="status">
                                            
                                            <tr>
                                                <td>${ fp.fpSupporter }</td>
                                                <td>${ fp.fpNo }</td> 
                                                <td>${ fp.fpPrice }</td>
                                                <td>${ fp.fpSupportDate }</td>                                                                             
                                            </tr>
                                            
                                           </c:forEach> 
                                        </tbody>
                                    </table>
                                    <br>
                                 </div>
                                </div>
                               
                            </div>
                        </div>
                    </div>                    
                 </div>
	  	
	</div>
	  	  
	</div>

</div>
		
		
</div>
    
    <!-- 비밀번호 변경 클릭 시 뜨는 모달  -->
    <div class="modal fade" id="chagePwdModal">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">비밀번호 변경</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="updatePwd.me" id="updatePwd" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                <!--  
                    <label for="userPwd" class="mr-sm-2">현재 비밀번호 :</label>
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter PWD" id="oldPwd" name="oldPwd"> <br>
                    
                 -->   
                    <input type="hidden" name="userId" value="${loginUser.userId}">
                    
                    <label for="userPwd" class="mr-sm-2">새 비밀번호:</label>
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="newPwd" name="newPwd">
                    <label for="userPwd" class="mr-sm-2">새 비밀번호 확인:</label>
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="newCheckPwd" name="newCheckPwd">
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" id="changePwd" class="btn btn-success">PWD 변경</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </form>
            </div>
        </div>
    </div>
	
	
	
	<script>
	
	$("changePwd").click(function(){
			var newPwd = $("#updatePwd input[name=newPwd]");
			var newCheckPwd = $("#updatePwd input[name=newCheckPwd]");
			
			if(newPwd.val() != "" && newCheckPwd.val() != "" && newPwd.val() != newCheckPwd.val()){
				alert("비밀번호가 일치하지 않습니다.")
				newPwd.val();
				newCheckPwd.val();
			}
			
	})
	
	</script>
    
    
    <form action="delete.me" method="post" id="postForm">
    	<input type="hidden" name="userId" value="${ loginUser.userId }">
    </form>
		

		
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>