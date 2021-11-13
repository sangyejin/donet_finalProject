<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href='resources/assets/css/fullCalendar.css' rel='stylesheet' />
 <link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
 <link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
	
<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>



<body>

<jsp:include page="../common/menubar.jsp"/> 
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
	
	    <script src='resources/assets/js/fullCalendar.js'></script>
	   
	  </head>
	  <body>
	
	<div class="card text-center">
  <div class="card-header" style="background-color:#E7FDEA;">
     도넷 닷컴에 오신걸 환영합니다.
  </div>
  <div class="card-body">
  	
    <h5 class="card-title" style="color:#F36FB5;">
    	출석체크 버튼을 눌러주세요!!
    </h5>
    <p class="card-text">
    	출석이 완료됨과 동시에 <span style="color:red">1500포인트</span>가 적립됩니다.
    </p>
    <c:set value="y" var="y"/>
    <c:if test="${attCheck ne 'y' }">
    	<button id="ckbtn11" type="button" class="btn btn-success" name="attCheck" value="y" style="display: inline; width:100px; height:40px; font-size:20px;">출석체크</button>
 	</c:if>
  	
  	<c:if test="${attCheck eq y }">
    	<button id="ckbtn22" type="button" class="btnCheck2" style="display: inline">출석완료</button>
	</c:if>

  </div>
  <div class="card-footer text-muted" style="background-color:#E7FDEA;" >
    
  </div>
</div>
	
	
	<div id="external-events">
	
				
	    <input type="hidden" id="userId" class="memberUserId" name="userId" value="${loginUser.userId}">
	    	
	    <!--1.출석체크 -->	
		<!--스크립트에서 배열에 넣기위해 컨트롤에서 받은 출석날짜값이있는 ar을 반복문을돌림.-->
	    <c:forEach items="${getCheck}" var="gcheck">
	    	<input type="hidden" value="${gcheck.attDate}" class="attDate">
	    </c:forEach>
	    <!--  -->
	 
	  <br><br><br><br><br><br>
	</div>
	
	<!-- <div class="container row" style="float: none; margin:100 auto;">
	<div class="col-xs-12" style="float: none; float:none; margin:0 auto">
	  <form id="fullcalendar">
	   
	  </form>
	</div>
	</div>
	 -->
	 <div class="container calendar-container">
			<div id="calendar" style="max-width:900px; margin:auto; width: 100%; height: 100%;"></div>
		</div>
	
	
	
	<script>
	      
	//출석체크 
	 $('#ckbtn11').click(function(){
		var d = new Date();
	    var currentDate = d.getFullYear() + "-" + ( d.getMonth() + 1 ) + "-" + d.getDate(); 
		$.ajax({
			url: "checkInsert",
			type: "POST",
			data:{
				userId: $(".memberUserId").val(),
				attCheck: $("#ckbtn11").val(),
				attDate: currentDate
			},
			success: function(data){
				alert(data);
				location.reload();	
			}
		});
	});

	

	  document.addEventListener('DOMContentLoaded', function() {
	    var Calendar = FullCalendar.Calendar;
	    var Draggable = FullCalendar.Draggable;

	    var containerEl = document.getElementById('external-events');
	    var calendarEl = document.getElementById('calendar');
	    var checkbox = document.getElementById('drop-remove');

	    // initialize the external events
	    // -----------------------------------------------------------------

	    new Draggable(containerEl, {
	      itemSelector: '.fc-event',
	      eventData: function(eventEl) {
	        return {
	          title: eventEl.innerText
	        };
	      }
	    });
	    
	    /*2.출석체크 */
	    //db에있는 출석날짜를 가져와서 화면에 출력하는 폼에 넣은 후 check라는 배열에 넣음(push).
	    var check = [];
		$(".attDate").each(function(){
			var dateC = {};
			dateC.start = $(this).val();
			dateC.end = $(this).val();
			dateC.color ="#5EE891";		
			dateC.title = "===== 출석완료 =====";	
			dateC.className="test";
			check.push(dateC);
			
		});
		
	    // initialize the calendar
	    // -----------------------------------------------------------------

	    var calendar = new Calendar(calendarEl, {
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	        
	      },
	      editable: false,
	      droppable: true, // this allows things to be dropped onto the calendar
	      
	      drop: function(info) {
	        // is the "remove after drop" checkbox checked?
	        if (checkbox.checked) {
	          // if so, remove the element from the "Draggable Events" list
	          info.draggedEl.parentNode.removeChild(info.draggedEl);
	        }
	      },
	      locale: 'ko',
	      events: check,
	      
    
	    });
	    
	    calendar.render();
	  });


	
	
	     /*   $(document).ready(function(){
	    	  $('#calendar').fullCalendar({
	    	    header: {
	    	      right: 'custom2 prevYear,prev,next,nextYear'
	    	    },
	            // 출석체크를 위한 버튼 생성
	    	    customButtons: { 
	    	        custom2: {
	    	          text: '출석체크하기',
	    	          id: 'check',
	    	          click: function() {	
	                        // ajax 통신으로 출석 정보 저장하기 
	                        // POST "/users/attendances" -> { status: "success", date:"2018-07-01"}
	                        // 통신 성공시 버튼 바꾸고, property disabled 만들기
	                        
	                        
	    	          }
	    	        }
	    	    },
	           // 달력 정보 가져오기 
	    	    eventSources: [
	    	    	{
	    				// ajax 통신으로 달력 정보 가져오기 
	                    // GET "/users/attendances" -> {dateList:[ date: "2016-03-21", ... ]}
	    				color: 'purple',   
	    			 	textColor: 'white' 
	    	    	}
	    	    ]
	    	  }); 
	    });
	 */
	    </script>
	
	
<jsp:include page="../common/footer.jsp"/> 


</body>
</html>