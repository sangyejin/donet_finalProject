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
<body>
    
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
			                                <a class="text-center"> <h2 id="loginTitle">로그인</h2></a>
			                                <form id="login" class="mt-5 mb-5 login-input" action="login.me" method="post" onsubmit="return loginValidate();">
			                                    <div class="form-group">
			                                        <input id="userId" name="userId" type="text" class="form-control" placeholder="아이디">
			                                    </div>
			                                    <div class="form-group">
			                                        <input id="userPwd" name="userPwd" type="password" class="form-control" placeholder="비밀번호">
			                                    </div>
			                                    <button class="btn btn-success w-100" type="submit">로그인</button>
			                                   <!--  <button id="loginBtn1" class="btn login-form__btn submit w-100" type="submit">로그인</button> -->
			                                </form>			                             
			                            	<p class="mt-5 login-form__footer" style="text-align: center;"><a href="findUserId.me" class="text-primary" data-toggle="modal" data-target="#findUserIdModal">아이디찾기</a> |
			                            	<a href="findUserPwd.me" class="text-primary" data-toggle="modal" data-target="#findUserPwdModal">비밀번호찾기</a> | 
			                            	<a href="enrollForm.me" class="text-primary"> 회원가입</a> </p>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
		    </div>
	    </div>
	
	<script src="bootstrap-modal-wrapper-factory.min.js"></script>	
	<!-- 아이디 찾기 모달 -->
	<div class="modal fade" id="findUserIdModal" >
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">아이디 찾기</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="findUserId.me" method="post">
            <!-- Modal Body -->
                <div class="modal-body">
                    <label for="email" class="mr-sm-2">이메일 :</label>
                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter Email" id="email" name="email"> <br>
                    <label for="phone" class="mr-sm-2">전화번호:</label>
                    <input type="tel" class="form-control mb-2 mr-sm-2" placeholder="Enter phone" id="phone" name="phone">
                </div>
                
                <!-- Modal footer data-toggle="modal" data-target="#findUserIdResultModal"-->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success w-100">확인</button>
                </div>
            </form>
            </div>
        </div>
    </div>
    
    <!-- 비밀번호 찾기 모달 -->
    <div class="modal fade" id="findUserPwdModal">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">비밀번호 찾기</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="findUserPwd.me" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                    <label for="userId" class="mr-sm-2">아이디 :</label>
                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter UserId" id="userId" name="userId"> <br>
                    <label for="userName" class="mr-sm-2">이름 :</label>
                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter UserName" id="userName" name="userName"> <br>
                    <label for="email" class="mr-sm-2">이메일 :</label>
                    <input type="email" class="form-control mb-2 mr-sm-2" placeholder="Enter Email" id="email" name="email">                    
                </div>
                
                <!-- Modal footer-->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success w-100">확인</button>
                </div>
            </form>
            </div>
        </div>
    </div>
	
	

	
		<script>
    	//==============================================
    	// 입력 확인
    	//==============================================
		/* function loginValidate(){
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
		} */
		
		</script>
	
     <jsp:include page="../common/footer.jsp"/>
</body>
</html>