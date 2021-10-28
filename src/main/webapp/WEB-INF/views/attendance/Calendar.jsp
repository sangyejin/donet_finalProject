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
	
 <link href='/fullcalendar/core/main.css' rel='stylesheet' />
 <link href='/fullcalendar/daygrid/main.css' rel='stylesheet' />
 <link href='/fullcalendar/timegrid/main.css' rel='stylesheet' />

 <script src='/fullcalendar/core/main.js'></script>
 <script src='/fullcalendar/daygrid/main.js'></script>
 <script src='/fullcalendar/interaction/main.min.js'></script>
 <script src='/fullcalendar/timegrid/main.min.js'></script>
 <script src='/fullcalendar/core/locales/ko.js'></script>	
	
</head>



<body>

<jsp:include page="../common/menubar.jsp"/> 
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
	
	    <script src='resources/assets/js/fullCalendar.js'></script>
	   
	  </head>
	  <body>
	
	<div id="external-events">
	
		<c:set value="y" var="y"/>
		<c:if test="${mcheck ne y }">
    	<button id="ckbtn11" type="button" class="btnCheck1" name="memCheck" value="y" style="display: inline">출석체크</button>
 		</c:if>
 		<c:if test="${mcheck eq y }">
    	<button id="ckbtn22" type="button" class="btnCheck2" style="display: inline">출석완료</button>
		</c:if>
		
	    <input type="hidden" id="memNum" class="memNumber" name="memNum" value="${member.userId}">
	    	
	    <!--1.출석체크 -->	
		<!--스크립트에서 배열에 넣기위해 컨트롤에서 받은 출석날짜값이있는 ar을 반복문을돌림.-->
	    <c:forEach items="${getCheck}" var="gcheck">
	    	<input type="hidden" value="${gcheck.checkDate}" class="checkDate">
	    </c:forEach>
	    <!--  -->
	 
	  <p>　</p>
	  <p>출석체크 버튼을 눌러야 </p>
	  <p> 출석이 완료됩니다.</p>
	</div>
	
	<!-- <div class="container row" style="float: none; margin:100 auto;">
	<div class="col-xs-12" style="float: none; float:none; margin:0 auto">
	  <form id="fullcalendar">
	   
	  </form>
	</div>
	</div>
	 -->
	 <div class="container calendar-container">
			<div id="calendar" style="max-width:900px; margin:40px auto; width: 50%; height: 50%;"></div>
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
				memNum: $(".memNumber").val(),
				memCheck: $(".btnCheck1").val(),
				checkDate: currentDate
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
		
	    var check = [];
		$(".attDate").each(function(){
			var dateC = {};
			dateC.start = $(this).val();
			dateC.end = $(this).val();
			dateC.color="";
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