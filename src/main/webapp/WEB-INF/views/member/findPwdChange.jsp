<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	
	<style>
	
	#loginTitle {
		color: #ffce67;
		font-family: 'Lobster', cursive;
	}
	 /* 세부 페이지마다 공통적으로 유지할 style */
    .content{
        background-color:rgb(247, 245, 245);
        width:80%;
        margin:auto;
    }
    
	</style>
	</head>
<jsp:include page="../common/menubar.jsp"/>
	<div class="col-xs-12" style="width: 30%; float:none; margin:0 auto">
	<div class="content">

		    <div class="container-fluid">
			    <div class="form-group">			        
			            <div class="row justify-content-center h-100">
			                <div class="col-xl-8">
			                    <div class="form-input-content">
			                        <div class="card login-form mb-0 mt-5">
			                            <div class="card-body pt-5">
			                                <a class="text-center"> <h2 id="loginTitle">비밀번호 변경하기</h2></a>
			                                <form id="updatePwd" class="mt-5 mb-5 login-input" action="updatePwd.me" method="post">
			                                	<input type="hidden" name="userId" value="${userInfo.userId}">
			                                    <div class="form-group">
			                                        <input id="newPwd" name="newPwd" type="password" class="form-control" placeholder="새 비밀번호">
			                                    </div>
			                                    <div class="form-group">
			                                        <input id="newCheckPwd" name="newCheckPwd" type="password" class="form-control" placeholder="새 비밀번호 확인">
			                                    </div>
			                                    <button type="submit" id="changePwd" class="btn btn-success w-100">PWD 변경</button> <br>
			                                </form>			                             			                            	
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
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
	    
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>