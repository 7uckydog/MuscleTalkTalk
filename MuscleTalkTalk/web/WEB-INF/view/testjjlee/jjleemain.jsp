<%@ include file="/WEB-INF/view/csslink.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>템플릿 테스트</title>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.0,npm/fullcalendar@5.11.0/locales-all.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css' rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="/WEB-INF/view/font.jsp"%>

<style type="text/css">
	#modal1{
		width: 250px;
		height: 300px;
		border: solid black;
		
		
	}
</style>

</head>
<body>
   <%@ include file="/WEB-INF/view/template.jsp"%>
   <section>
      <div id='calendar-container'>
         <div id="calendar"></div>
      </div>
		<div id="modal1">
			모달챵
		</div>


   </section>
   <%@ include file="/WEB-INF/view/footer.jsp"%>
   <script type="text/javascript">
   $(function() {

      var calendarEl = $('#calendar')[0];
      var calendar = new FullCalendar.Calendar(calendarEl, {
         initialView : 'dayGridMonth',
         locale : 'ko',
         selectable : false,
         editable : false,
         eventDurationEditable : false,
         eventStartEditable : false,
         navLinks : false,
         eventDisplay : 'block',
         dayMaxEventRows : false, // for all non-TimeGrid views
         eventTimeFormat : {
            hour : '2-digit',
            hour12 : false
         },
         slotLabelFormat : {
            hour : '2-digit',
            minute: '2-digit',
            meridiem: false,
            hour12 : false
         },
         allDaySlot : false,
         headerToolbar : {
            left : 'prev,next today',
            center : 'title',
            right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
         },

         eventClick : function(info) {
         },

         dateClick : function(info) {
         }

      });

      calendar.render();


   });


   </script>
</body>
</html>