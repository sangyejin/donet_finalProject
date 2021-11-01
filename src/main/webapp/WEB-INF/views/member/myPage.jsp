<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
     <jsp:include page="../common/menubar.jsp"/>
	 <div class="col-xs-12" style="width: 30%; float:none; margin:0 auto">
     <div class="content">
        <br><br>
        <div class="innerOuter">
        
            <h2>마이페이지</h2>
            <br>

            <form action="update.me" method="post" onsubmit="">
                <div class="form-group">
                    <label>* 아이디 :</label>
                    <input type="text" class="form-control" name="userId" value="${ loginUser.userId }" readonly><br>
                    
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
                    
                    <label for="address"> &nbsp; 주소 :</label><br>
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
                    <input type="radio" name="userRole" id="personal" value="A">
                    <label for="personal">개인</label> &nbsp;&nbsp;                    
                    <input type="radio" name="userRole" id="group" value="B">
                    <label for="group">단체</label> &nbsp;&nbsp;
                    <input type="radio" name="userRole" id="Enterprise" value="C">
                    <label for="Enterprise">기업</label> <br>
                   
                    
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
                	<a href="supportReply.me" class="text-primary">후프젝댓글</a> &nbsp;
                	<a href="userList.me" class="text-primary">회원목록</a> &nbsp;
                	<a href="calendar.at" class="text-primary">출석체크</a>
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
    <!-- div를 생성하여 나머지 정보들을 가져 올 수 있도록 함 포인트 만들기 -->
    
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