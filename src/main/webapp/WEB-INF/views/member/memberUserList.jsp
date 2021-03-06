<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>


<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 

<style>
	#writeBtn {
    	color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	#writeBtn:hover {
		color: #78c2ad;
		background-color: #fff;
	}
	#pageTag {
		color: #fff;
		background-color: #78c2ad;
		border-color: #78c2ad;
	}
	#pageTag:hover {
		color: #fff;
    	background-color: #f3969a;
    	border-color: #f3969a;
	}
	#pageDisable {
		color: gray;
    	background-color: #ced4da;
    	border-color: #ced4da;
	}
	#categoryCreateBtn {
		color: #fff;
		background-color: #78c2ad;
		border-color: #78c2ad;
	}
	#size1 {
		height: 110%
	}
	#pagingArea{width:fit-content;margin:auto;}
</style>
</head>
<body>
	

			<jsp:include page="../common/menubar.jsp"/>
			
                <div class="row">               
                    <div class="col-lg-10 mt-5" style="margin-left: auto; margin-right: auto;">
                        <div class="card" >
                            <div class="card-body">
                                <div class="card-title text-center">
                                    <h4>회원 목록</h4>
                                </div>
                                <div class="table-responsive">
                                    <table id="" class="table table-hover text-center">
                                        <thead>
                                            <tr>                                                
                                                <th>유저ID</th>
                                                <th>이름</th>
                                                <th>닉네임</th>
                                                <th>생년월일</th>
                                                <th>전화번호</th>
                                                <th>이메일</th>                                         
                                                <th>생성일</th>
                                                <th>역할</th>
                                                <th>유저 상태</th>                                          
                                             </tr>
                                        </thead>
                                        <tbody>
                                                                                
                                            <c:forEach items="${list}" var="m" varStatus="status">
                                            <tr>
                                                <td>${ m.userId }</td>
                                                <td>${ m.userName }</td> 
                                                <td>${ m.userNick }</td>
                                                <td>${ m.birthdate }</td>
                                                <td>${ m.phone }</td>
                                                <td>${ m.email }</td>
                                                <td>${ m.enrollDate }</td>
                                                <th>${ m.userRole }</th>
                                                <th>${ m.status }</th>                                             
                                            </tr>
                                           </c:forEach> 
                                        </tbody>
                                    </table>
                                    <br>
                                    <div id="pagingArea">
						                <ul class="pagination">
						                	<c:choose>
						                		<c:when test="${ pi.currentPage ne 1 }">
						                			<li class="page-item"><a class="page-link" href="userList.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
						                		</c:otherwise>
						                	</c:choose>
						                	
						                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						                    	<c:choose>
							                		<c:when test="${ pi.currentPage ne p }">
						                    			<li class="page-item"><a class="page-link" href="userList.me?currentPage=${ p }">${ p }</a></li>
							                		</c:when>
							                		<c:otherwise>
							                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
							                		</c:otherwise>
							                	</c:choose>
						                    </c:forEach>
						                    
						                    
						                    <c:choose>
						                		<c:when test="${ pi.currentPage ne pi.maxPage }">
						                			<li class="page-item"><a class="page-link" href="userList.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled"><a class="page-link" href="userList.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
						                		</c:otherwise>
						                	</c:choose>
						                </ul>
						            </div>
                                </div>
                             	<div class="general-button" align="right">
                             		
								</div>
                            </div>
                        </div>
                    </div>                    
                 </div>
			
				
			
		<jsp:include page="../common/footer.jsp"/>
</body>
</html>