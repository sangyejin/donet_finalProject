<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    
<style>

*{ font-family: 'Noto Sans KR', sans-serif !important;
    font-size: 12px ;
    margin: 0;
	padding: 0;
}

#outline{
    width: 100%;
    height: 110px;
    box-shadow: 0px 10px 5px -3px rgb(244, 244, 244);
    margin-bottom: 5%;
   	position : inline;
   	margin-left : 0;
}

#insideOfOutline{ width: 1050px; height: 110px; margin : auto;}

ul>li{ list-style-type: none; }

.greenfont{
    margin-top: 15px;
    float: left;
    width : 115px;
    height : max-content;
    font-weight: bold;
    color : rgb(30, 154, 40);
    margin-left: 30px;
    line-height: 25px;
    position : block; 
}

li > a{  color : rgb(30, 154, 40); text-decoration : none;}

a:hover{ color : rgb(30, 154, 40);  text-decoration: underline; }

#right{ margin-right: 50px; }

.greenfont > ul > li {
    margin-top: 15px;
    float: left;
    font-size: 12px;
    width : 100px;
    height : max-content;
    text-align: center;
    line-height: 10px;
}

.greenfont > ul > li { display: none; }

.greenfont:hover > ul > li {  display: inline; }

.arrow_box{  position : absolute; }

#outline > #logoLine > li{  float : left; }

#logo{ margin-left: 25px;  width : 160px; height: 70px; margin-top : -5px; }

#userinfo{ margin-left: 700px; margin-top : -35px; }

#secondLine{  margin-top : -7px;overflow:auto;  }
#secondLine > ul{overflow:auto; }
.thisuser{ font-size : 10px; }

.noDecoration{font-size : 10px;  color : rgb(30, 154, 40);  text-decoration: none; }

a{ color : #000000;  text-decoration: none; }

.smallerFonts{ color : rgb(30, 154, 40);   text-decoration: none; font-size : 10px; }
.loginDiv{ color : rgb(30, 154, 40); width : 300px; height : 30px; }


/*event*/
#eventBox{z-index : 1; position : fixed}
#eventLocation{ margin-left:88%;  margin-top : -30px; width : 50px; height : 50px; position : fixed;}
 
 .balloon {
        position: relative;
        display: inline-block;
       margin-left : 1175px;
       margin-top : -20px;
       display : none;
 }
    .balloon span {
        display: inline-block;
        padding: 10px;
        color: #fff;
        background: rgb(30, 154, 40);
        border-radius: 20px;
    }
 
    .balloon:after {
        content: '';
        position: absolute;
        width: 0;
        height: 0;
        border-style: solid;
    }
 
    .balloon.right:after{
        border-width: 10px 15px;
        top: 50%;
        margin-top: -10px;
    }
    
    .balloon.right:after {
        border-color: transparent transparent transparent rgb(30, 154, 40);
        right: -25px;
    }
    
    
    
</style>
</head>
<body>

	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	
    <div id="outline" align="center">
    	<div id="insideOfOutline" >
            <div id = "right" rowspan="8"><img id="logo" src="${ pageContext.servletContext.contextPath }/resources/imgs/logo1.png" alt=""></div>
               
            <!-- ????????? ??? -->
            <c:if test="${ empty sessionScope.loginUser }">
       		<div class="loginDiv" id="userinfo"><a class="noDecoration" href="${ pageContext.servletContext.contextPath }/enrollForm.me" >????????????</a> | <a class="noDecoration" href="${ pageContext.servletContext.contextPath }/loginForm.me" >?????????</a></div>
       		</c:if>
       		
       		<!-- ????????? ???  -->
       		<c:if test="${ !empty sessionScope.loginUser }">
       		<div class="loginDiv" id="userinfo"><label class="smallerFonts" >${ sessionScope.loginUser.userName }???</label> |  <a class="smallerFonts"  href="${ pageContext.servletContext.contextPath }/myPage.me?userId=${ loginUser.userId }" >???????????????</a>  |  <a class="smallerFonts"  href="${ pageContext.servletContext.contextPath }/logout.me">????????????</a> </div>
            </c:if>
        <br>
        
        <%-- onclick="location.href = 'myPage.me?userId=${ loginUser.userId }'" --%>
        
       <%--  <!-- ????????? ??? -->
                                
                <c:if test="${ empty sessionScope.loginUser }"> 
                <li class="greenfont" id="7">             
	                <a href="enrollForm.me" >????????????</a>  | 	            
	                <a href="" data-toggle="modal" data-target="#loginModal">?????????</a> </li>
                </c:if>
                <a  class="noDecoration" href="" data-toggle="modal" data-target="#loginModal">?????????</a>
         <!-- ????????? ???  -->
                 
                <c:if test="${ !empty sessionScope.loginUser }">
                <li class="greenfont" id="7">	
	                <label>${ sessionScope.loginUser.userName }???</label> |
	                <a href="myPage.me">???????????????</a>  |
	                <a href="logout.me">????????????</a> </li>
                </c:if> --%>
        
        <div id="secondLine"> 
            <ul>
                 <li class="greenfont" id="1"><a href="${ pageContext.servletContext.contextPath }/introduce.pr">?????? ?????? ??????</a>
                    <ul class="arrow_box">
                        <li><a href="${ pageContext.servletContext.contextPath }/introduce.pr">???????????? ??????</a></li>
                        <li><a href="${ pageContext.servletContext.contextPath }/introduce.how">?????? ??????</a></li>
                        <li><a href="${ pageContext.servletContext.contextPath }/introduce.chart">?????? ??????</a></li>
                    </ul> 
                </li>
                <li class="greenfont" id="2"><a href="${ pageContext.servletContext.contextPath }/list.do">?????? ????????????</a>
                
                	<!--  ???????????? ??????
                    <ul class="arrow_box">
                        <li><a href="global?suCategoryNo=1">?????????</a></li>
                        <li><a href="environment?suCategoryNo=2">??????</a></li>
                        <li><a href="animal?suCategoryNo=3">??????</a></li>
                        <li><a href="child?suCategoryNo=4">??????/?????????</a></li>
                        <li><a href="vulnerable?suCategoryNo=5">????????????</a></li>
                    </ul> 
                     -->
                    <ul class="arrow_box">
                    <li><a href="${ pageContext.servletContext.contextPath }/list.do">?????? ????????????</a></li>
                    <li><a href="${ pageContext.servletContext.contextPath }/supportReviewList.me">?????? ?????? ?????????</a></li>
                    </ul> 
                </li>
                <li class="greenfont" id="3"><a href="${ pageContext.servletContext.contextPath }/funding">?????? ????????????</a>
                <li class="greenfont" id="4"><a href="${ pageContext.servletContext.contextPath }/goods">?????? ??????</a>
                
                <li class="greenfont" id="5"><a>?????????</a>
                    <ul class="arrow_box">
                        <li><a href="${ pageContext.servletContext.contextPath }/list.ev">?????????????????????</a></li>
                        <li><a href="${ pageContext.servletContext.contextPath }/afterList.ev">???????????????</a></li>
                        
                    </ul> 
                </li>
                
                </li>
                <li class="greenfont" id="6"><a>????????????</a>
                    <ul class="arrow_box">
                        <li><a href="${ pageContext.servletContext.contextPath }/list.no">????????????</a></li>
                        <li><a href="${ pageContext.servletContext.contextPath }/list.faq">?????? ?????? ??????</a></li>
                        <li><a href="${ pageContext.servletContext.contextPath }/list.one">1:1 ??????</a></li>
                    </ul> 
                </li>
                <li class="greenfont" id="7"><a href="list.vo">????????????</a>
                   <!--  <ul class="arrow_box"> 
                        <li><</li> ???????????? ???????????? ??? ????????? ???????????????
                        <li><a>?</a></li>
                    </ul>  -->
                </li>                
                
                

			</ul>
            </div>
            </div>
    </div>
    
   
    <!-- ????????? ?????? -->
    <div id="eventBox">
   		 <img id="eventLocation" src="${ pageContext.servletContext.contextPath }/resources/imgs/logoearth.png" alt="">
	    <div class="balloon right" id="eventToolTip"><span>?????????????</span></div>
    </div>
    
     <!-- ????????? ?????? ??? ?????? ??????  -->
    <!-- <div class="modal fade" id="loginModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            Modal Header
            <div class="modal-header">
                <h4 class="modal-title">???????????????</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="login.me" method="post">
                Modal Body
                <div class="modal-body">
                    <label for="userId" class="mr-sm-2">????????? :</label>
                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="userId" name="userId"> <br>
                    <label for="userPwd" class="mr-sm-2">????????????:</label>
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="userPwd" name="userPwd">
                </div>
                
                Modal footer
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success ">?????????</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">??????</button>
                </div>
            </form>
            </div>
        </div>
    </div> -->
    
    <script>
    	const logo = document.getElementById("logo");
    	logo.onclick = function() { 
    		location.href="${ pageContext.servletContext.contextPath }";
    	}

    </script>
    
    <!-- ????????? ?????? -->
    <script>
    	const eventLocation = document.getElementById("eventLocation");

    	eventLocation.addEventListener('mouseover', function() { 
    		document.getElementById("eventToolTip").style.display=("block");
    	});
    	
    	eventLocation.addEventListener('mouseout', function() {
    		document.getElementById("eventToolTip").style.display=("none");
    	});
    	
    	eventLocation.onclick = function(){
    		location.href = "faceRecognition.ev";
    	}

    </script>
    
    
</body>
</html>