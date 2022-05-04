<%@ include file="/WEB-INF/view/csslink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/cssfolder/css/ptpage.css">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>템플릿 테스트</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/view/font.jsp"%>
<script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.0,npm/fullcalendar@5.11.0/locales-all.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css' rel='stylesheet' />
</head>
<body>
	<%@ include file="/WEB-INF/view/template.jsp"%>
	<section id="pt_calendar_page_section">
		<div id="pt_calendar_page_div">
			<div id="pt_calendar_title">
				<p>PT 프로그램 예약</p>
			</div>
			<div id="pt_calendar_page_container">
				<div id="calendar_wrap">
					<div id="pt_reservation_calendar"></div>
				</div>
				<div id="pt_calendar_time_info">
					<i class="fa-solid fa-check"></i>
				</div>
			</div>
			<hr id="pt_calendar_hr">
			<div id="pt_calendar_summary">
				<p id="pt_calendar_summary_timtle">예약 정보</p>
				<div id="pt_calendar_summary_container">
					<p class="summary_left">예약자</p>
					<p class="summary_right">이진정</p>
					<p class="summary_left">예약일</p>
					<p class="summary_right">2022년 5월 4일</p>
					<p class="summary_left">예약시간</p>
					<p class="summary_right">15:00 ~ 16:00</p>
					<p class="summary_left">프로그램명</p>
					<p class="summary_right">민승택의 헬린이 탈출</p>
					<p class="summary_left">헬스장명</p>
					<p class="summary_right">민승택의 헬스장</p>
					<p class="summary_left">헬스장 주소</p>
					<p class="summary_right">서울시 어딘가</p>
					<p class="summary_left">가격(1시간 / 1회)</p>
					<p class="summary_right">100,000원</p>
				</div>
			</div>
			<div id="pt_calendar_trade_wrap"><button id="pt_calendar_tarde_btn" type="button">결제하기</button></div>
			<div id="pt_reservation_data">
				<c:forEach var="vo" items="${ptCalList }">
					${vo }
				</c:forEach>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/footer.jsp"%>
	<script type="text/javascript">

		function getFormatDate(date) {
			var year = date.getFullYear(); //yyyy
			var month = (1 + date.getMonth()); //M
			month = month >= 10 ? month : '0' + month; //month 두자리로 저장
			var day = date.getDate(); //d
			day = day >= 10 ? day : '0' + day; //day 두자리로 저장
			return year + '-' + month + '-' + day; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
		}

		var calendar;

		$(function() {

			var calendarEl = $('#pt_reservation_calendar')[0];
			calendar = new FullCalendar.Calendar(calendarEl, {
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
					$('#pt_calendar_time_info').empty();
					var $eventTime = $(".fc-daygrid-day[data-date="+info.dateStr+"]").find(".fc-event-time");
					var $eventTitle = $(".fc-daygrid-day[data-date="+info.dateStr+"]").find(".fc-event-title");
					for(var i = 0; i < $eventTime.length; i++) {
						$('#pt_calendar_time_info').append('<div class="pt_calendar_time_info_select"><i class="fa-solid fa-check"></i><p>'+$eventTime.eq(i).text()+' '+$eventTitle.eq(i).text()+'</p></div>');
					}
					chkFunction();
				}

			});
			inputCalendarEvent();
			calendar.render();

			calendarDayBackround();
		});
		
		$("#calendar_wrap").click(function() {
			calendarDayBackround();
		});
		
		function calendarDayBackround() {
			var calendarDateArray = [];
			for(var i = 0; i < $(".fc-daygrid-day").length; i++) {
				calendarDateArray.push($(".fc-daygrid-day").eq(i).attr("data-date"));
			}
			var inputDateArray = [];
			<c:forEach var="vo" items="${ptCalList}">
			var inputDateSplit = "${vo.ptCalendarStartTime }".split(" ");
			inputDateArray.push(inputDateSplit[0]);
			</c:forEach>
 			for(var i = 0; i < calendarDateArray.length; i++) {
				for(var j = 0; j < inputDateArray.length; j++) {
					if(calendarDateArray[i] = inputDateArray[j]) {
						$('.fc-daygrid-day[data-date='+calendarDateArray[i]+']').css('backgroundColor', "rgba(255,220,40,.15)");
						$('.fc-daygrid-day[data-date='+calendarDateArray[i]+']').css('cursor', "pointer");
					}
				}
			}
 			
		}
		
		function inputCalendarEvent() {
			var eventsArray = [];
			<c:forEach var="vo" items="${ptCalList}">
			var varStartDate = new Date('${vo.ptCalendarStartTime }');
			var varEndDate = new Date('${vo.ptCalendarStartTime }');
			varEndDate.setHours(varEndDate.getHours() + 1);
			eventsArray.push({
				title: "예약 가능",
				color: '#4B4DB2',
				start: varStartDate,
				end: varEndDate
			});
			</c:forEach>
			calendar.addEventSource(eventsArray);
		}
		
		
		function chkFunction() {
			$('#pt_calendar_time_info i').off('mouseover');
			$('#pt_calendar_time_info i').off('mouseout');
			$('#pt_calendar_time_info i').off('click');
			$('#pt_calendar_time_info i').on({
				mouseover : function() {
					var iIsChk = $(this).css("color") == 'rgb(255, 255, 255)';
					if(iIsChk) {			
						$(this).css("border", "2px solid rgba(75, 77, 178, 0.7)");
					}
				},
				mouseout : function() {
					var iIsChk = $(this).css("color") == 'rgb(255, 255, 255)';
					if(iIsChk) {
						$(this).css("border", "2px solid rgba(75, 77, 178, 0.3)");
					}
				},
				click : function() {
					var iIsChk = $(this).css("color") == 'rgb(255, 255, 255)';
					if(iIsChk) {
						$('#pt_calendar_time_info i').css("color", 'white');
						$('#pt_calendar_time_info i').css("border", '2px solid rgba(75, 77, 178, 0.3)');
						$(this).css({
							'border' : '2px solid #4B4DB2',
							'color' : '#4B4DB2'
						});
					} else {
						$(this).css({
							'border' : '2px solid rgba(75, 77, 178, 0.7)',
							'color' : 'white'
						});
					}
				}
			});
		}
		

		
	</script>
</body>
</html>