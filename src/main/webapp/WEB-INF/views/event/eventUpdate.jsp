<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
   	#eForm{
   		display: inline-block;
   		text-align: center;
   	}
   	table{
   		margin-left: auto;
   		margin-right: auto;
 		width:80%;
 		font-size: 80%;
   	}
   	table tbody tr {
   		
   		height: 50px;
   	}
   	table tbody tr th {
   		border-right: 1re solid;
   		border-color: transparent;
   	}
  
    .row{
    	min-width:800px;
    }
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" /> 
<div class="container">
	<div class="row text-center">
		<div class="col-md-12" style="float:none; margin:0 auto; " id="eForm">
        <h1>이벤트 수정</h1>
        <br>
       	
       	<form id="updateForm" method="post" action="update.ev" enctype="multipart/form-data">
       		<input type="hidden" name="eventNo" value="${ ev.eventNo }">
       		<table align="center" >
       			<tr class="form-group" >
       				<th><label for="title">제목</label></th>
       				<td><input type="text" id="title" class="form-control" name="eventTitle" value="${ ev.eventTitle }" required></td>
       			</tr>
       			<tr class="form-group">
       				<th><label for="datepickerStart">이벤트 시작</label>
       				<td><input type="text" id="datepickerStart" class="form-control" name="eventStart" autocomlete="off" readonly="readonly" value="${ ev.eventStart }"></td>
       			</tr>
       			<tr class="form-group">
       				<th><label for="datepickerLast">이벤트 종료</label>
       				<td><input type="text" id="datepickerLast" class="form-control" name="eventLast" autocomlete="off" readonly="readonly" value="${ ev.eventLast }"></td>
       			</tr>
       			<tr class="form-group">
       				<th colspan="2"><label for="content">내용</label></th>
       			</tr>
       			<tr class="form-group">
       				<th colspan="2"><textarea rows="10" class="form-control" name="eventContent" id="content" style="resize:none" required>${ ev.eventContent }</textarea></th>
       			</tr>
       			<tr class="form-group">
       				<th><label for="upfile">첨부파일</label></th>
       				<td><input type="file" id="upfile" class="form-control-file border" name="uploadFile"></td>
       			</tr>
       		</table>
       		<br>
       		<div class="submitBtn">
       			<button type="submit" class="btn btn-primary">등록하기</button>
       			<button type="reset" class="btn btn-danger" onclick="javascript:history.back();">취소하기</button>
       		</div>
       	</form>
       
       </div>
    </div>
 </div>
  <script>
 
  $(document).ready(function () {
          $.datepicker.setDefaults($.datepicker.regional['ko']); 
          $( "#datepickerStart" ).datepicker({
               changeMonth: true, 
               changeYear: true,
               nextText: '다음 달',
               prevText: '이전 달', 
               dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
               dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
               monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
               monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
               dateFormat: "yymmdd",
               maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
               onClose: function( selectedDate ) {    
                    //시작일(startDate) datepicker가 닫힐때
                    //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                   $("#datepickerLast").datepicker( "option", "minDate", selectedDate );
               }    

          });
          $( "#datepickerLast" ).datepicker({
               changeMonth: true, 
               changeYear: true,
               nextText: '다음 달',
               prevText: '이전 달', 
               dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
               dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
               monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
               monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
               dateFormat: "yymmdd",
                                      
               onClose: function( selectedDate ) {    
                   $("#datepickerStart").datepicker( "option", "maxDate", selectedDate );
               }    

          });    
  });

  </script>

<jsp:include page="../common/footer.jsp" />
</body>
</html>