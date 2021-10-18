<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
            <h2>회원가입</h2>
            <br>

            <form id="enrollForm" action="insert.me" method="post" >
                <div class="form-group">
                    <label for="userId">* 아이디 :</label>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="Please Enter ID" required>
                    <div id="checkResult" style="display:none; font-size:0.8em"></div>
                    <br>
                    
                    <label for="userPwd">* 비빌번호 :</label>
                    <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="Please Enter Password" required><br>
                    
                    <label for="checkPwd">* 비밀번호 확인 :</label>
                    <input type="password" class="form-control" id="checkPwd" placeholder="Please Enter Password" required><br>
                    
                    <label for="userName">* 이름 :</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="Please Enter Name" required><br>
                    
                    <label for="userNick">* 닉네임 :</label>
                    <input type="text" class="form-control" id="userNick" name="userNick" placeholder="Please Enter ID" required>
                    <div id="checkResult" style="display:none; font-size:0.8em"></div>
                    <br>
                    
                    <label for="email"> &nbsp; 이메일 :</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Please Enter Email"><br>
                    
                    <!-- <label for="age"> &nbsp; 나이 :</label>
                    <input type="number" class="form-control" id="age" name="age" placeholder="Please Enter Age"><br>
                    --> 
                    <br>
                    
                    <label for="birthday"> &nbsp; 생년월일 :</label> &nbsp;
                    <select name="year" id="year"></select>년
                    <select name="month" id="month"></select>월
                    <select name="day" id="day"></select>일
                    <input type="hidden" name="birthdate" id="birthdate" value=""/>
                    <!-- <input size="20" name="time" id="time" />  -->
                    <br><br>
                    
                    <label for="phone"> &nbsp; 전화번호 :</label>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="Please Enter Phone (-없이)"><br>
                    
                    <label for="address"> &nbsp; 주소 :</label>
                   <%--  <input type="text" class="form-control" id="address" name="address" placeholder="Please Enter Address"><br>--%>
             		<div class="form-inline">
					<label> &nbsp; 우편번호 : &nbsp;</label>
					<input type="text"  name="post" class="form-control mr-2 postcodify_postcode5"  size="6">
					<button type="button" class="btn btn-primary" id="postcodify_search_button">검색</button>
					</div>
					<br>
					<label> &nbsp; 도로명주소 : </label>
					<input type="text" name="address1" class="form-control postcodify_address" size="30">
					<br>
				    <label> &nbsp; 상세주소 : </label>
					<input type="text" name="address2" class="form-control postcodify_extra_info"  size="30">
					<br>
					
					<label for="role"> &nbsp; 회원유형 :</label> 
					<select name="userRole" id="userRole">
						<option value="">--유형을 선택해주세요--</option>
						<option value="A">개인</option>
						<option value="B">단체</option>
						<option value="C">기업</option>
					</select>
				<br><br>	
				
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
					$(function(){
						$("#postcodify_search_button").postcodifyPopUp();
					});
				</script>
				
				<!-- jQuery와 Postcodify를 로딩한다. -->
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<!-- <script>
					// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
					$(function(){
						$("#postcodify_search_button").postcodifyPopUp();
					});
				</script>
                    <label for=""> &nbsp; Gender : </label> &nbsp;&nbsp;
                    <input type="radio" name="gender" id="Male" value="M">
                    <label for="Male">남자</label> &nbsp;&nbsp;
                    <input type="radio" name="gender" id="Female" value="F">
                    <label for="Female">여자</label><br> -->
                    
                <!-- 생년월일 선택 함수 -->    
                <script>
             
                	$(document).ready(function(){            
                	    var now = new Date();
                	    var year = now.getFullYear();
                	    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
                	    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());   
						
                	    
                	    //년도 selectbox만들기               
                	    for(var i = 1900 ; i <= year ; i++) {
                	        $('#year').append('<option value="' + i + '">' + i + '</option>');    
                	    }

                	    // 월별 selectbox 만들기            
                	    for(var i=1; i <= 12; i++) {
                	        var mm = i > 9 ? i : "0"+i ;            
                	        $('#month').append('<option value="' + mm + '">' + mm + '</option>');    
                	    }
                	    
                	    // 일별 selectbox 만들기
                	    for(var i=1; i <= 31; i++) {
                	        var dd = i > 9 ? i : "0"+i ;            
                	        $('#day').append('<option value="' + dd + '">' + dd+ '</option>');    
                	    }
                	    // 현재 날짜로 설정해줍니다.
                	    $("#year  > option[value="+year+"]").attr("selected", "true");        
                	    $("#month  > option[value="+mon+"]").attr("selected", "true");    
                	    $("#day  > option[value="+day+"]").attr("selected", "true");  
                	    /*
                	    var yy = $("#year").val();
                	    var mm = $("#mon").val();
                	    var dd = $("#day").val();
                	    var birthdate = "";
                	    
                 	    birthdate = addZero(yy)+"-"+addZero(mm)+"-"+addZero(dd);
                	    console.log(birthdate) 
                	                   	 
                	    $("#birthdate").val(birthdate); //선택한 생년월일을 합친 값 */

                	})
                						
                	function birthdateInput() {
                		 $('#time').val($('#year').val()+"-"+$('#month').val()+"-"+$('#day').val());
                		 $('#birthdate').val($('#year').val()+"-"+$('#month').val()+"-"+$('#day').val());
                	}
                	$('#day').change(function() {
                		birthdateInput();
                	})
                </script> 
                    
                </div>
                <br>
                <div class="btns" align="center">
                    <button type="submit" id="enrollBtn" class="btn btn-success" >회원가입</button><!-- disabled  중복처리하고나서-->
                    <button type="reset" class="btn btn-danger"> 초기화</button>
                </div>
            </form>
        </div>
        <br><br>
    </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>