<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>도넷 - 로그인</title>
	
	 <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	
	<style>
	#loginBtn1 {
    	color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	
	#loginBtn1:hover {
		color: #fff;
    	background-color: #f3969a;
    	border-color: #f3969a;
	}
	
	#loginTitle {
		color: #ffce67;
		font-family: 'Lobster', cursive;
	}
	</style>
</head>
<body>
    

	<div class="col-xs-12" style="width: 30%; float:none; margin:0 auto">
	<jsp:include page="../common/menubar.jsp"/>

				
		    <div class="container-fluid">
			    <div class="login-form-bg h-100">
			        <div class="container h-100">
			            <div class="row justify-content-center h-100">
			                <div class="col-xl-6">
			                    <div class="form-input-content">
			                        <div class="card login-form mb-0 mt-5">
			                            <div class="card-body pt-5">
			                                <a class="text-center"> <h2 id="loginTitle">로그인</h2></a>
			                                <form id="loginForm" class="mt-5 mb-5 login-input" action="login.me" method="post" onsubmit="return loginValidate();">
			                                    <div class="form-group">
			                                        <input id="userId" name="userId" type="text" class="form-control" placeholder="아이디">
			                                    </div>
			                                    <div class="form-group">
			                                        <input id="userPwd" name="userPwd" type="password" class="form-control" placeholder="비밀번호">
			                                    </div>
			                                    <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" type="submit">로그인</button>
			                                   <!--  <button id="loginBtn1" class="btn login-form__btn submit w-100" type="submit">로그인</button> -->
			                                </form>			                             
			                            	<p class="mt-5 login-form__footer" style="text-align: center;"><a href="findUserIdForm.me" class="text-primary">아이디찾기</a> |
			                            	<a href="findPwdForm.me" class="text-primary">비밀번호찾기</a></p> | 
			                            	<a href="enrollForm.me" class="text-primary"> 회원가입</a>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
		    </div>
	    </div>
	
		<!-- <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" type="submit">등록하기</button>
		 -->
	
		<script>
    	//==============================================
    	// 입력 확인
    	//==============================================
		function loginValidate(){
			if($("#userId").val().trim().length == 0){
				swal.fire({
					text: '아이디를 입력하세요.',
					icon: 'warning',
					confirmButtonColor: "#78c2ad"
				});
				$("#userId").focus();
				return false;
			}
			if($("#userPwd").val().trim().length == 0){
				swal.fire({
					text: '비밀번호를 입력하세요.',
					icon: 'warning',
					confirmButtonColor: "#78c2ad"
				});
				$("#userPwd").focus();
				return false;
			}
			
			return true;
		}
		
		</script>
	
     <jsp:include page="../common/footer.jsp"/>
</body>
</html>