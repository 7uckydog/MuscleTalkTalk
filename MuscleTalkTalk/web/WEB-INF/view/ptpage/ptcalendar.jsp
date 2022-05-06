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
	<div id="pt_calendar_modal_div">
		<div id="pt_calendar_modal">
			<p id="pt_calendar_modal_content">정말 결제하시겠습니까?</p>
			<button type="button" class="btn" id="pt_calendar_modal_cancle">아니오</button>
			<button type="button" class="btn" id="pt_calendar_modal_check">예</button>
		</div>
	</div>
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
				<div id="pt_calendar_time_info"></div>
			</div>
			<hr id="pt_calendar_hr">
			<div id="pt_calendar_summary">
				<p id="pt_calendar_summary_timtle">예약 정보</p>
				<div id="pt_calendar_summary_container">
					<p class="summary_left">예약자</p>
					<p class="summary_right">${ssMvo.memberName }</p>
					<p class="summary_left">예약일</p>
					<p class="summary_right"></p>
					<p class="summary_left">예약시간</p>
					<p class="summary_right"></p>
					<p class="summary_left">프로그램명</p>
					<p class="summary_right">${pVo.ptName }</p>
					<p class="summary_left">헬스장명</p>
					<p class="summary_right">${pVo.ptGymName }</p>
					<p class="summary_left">헬스장 주소</p>
					<p class="summary_right">${pVo.ptLocation }</p>
					<p class="summary_left">가격(1시간 / 1회)</p>
					<p class="summary_right"></p>
				</div>
			</div>
			<div id="pt_calendar_trade_wrap"><button id="pt_calendar_tarde_btn" type="button">결제하기</button></div>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/footer.jsp"%>
	<script type="text/javascript">
	var ptCalendarVoJs = [];
	<c:forEach var="vo" items="${ptCalList}">
		var ptCalendarVoObj = {
			ptCalendarNo : '${vo.ptCalendarNo}',
			ptNo : '${vo.ptNo}',
			ptCalendarStartTime : '${vo.ptCalendarStartTime}'
		};
		ptCalendarVoJs.push(ptCalendarVoObj);
	</c:forEach>
		function getFormatDate(date) {
			var year = date.getFullYear(); //yyyy
			var month = (1 + date.getMonth()); //M
			month = month >= 10 ? month : '0' + month; //month 두자리로 저장
			var day = date.getDate(); //d
			day = day >= 10 ? day : '0' + day; //day 두자리로 저장
			return year + '-' + month + '-' + day; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
		}

		var calendar;
		var chkArray = [];
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
					left : 'prev,next',
					center : 'title',
					right : 'dayGridMonth'
				},


				dateClick : function(info) {
				}

			});
			inputCalendarEvent();
			calendar.render();
			calendar.changeView('dayGridMonth');
			dateClickFunc();
			calendarDayBackround();
			$('.fc-next-button').click(function() {
				dateClickFunc();
				calendar.changeView('dayGridMonth');
			});
			$('.fc-prev-button').click(function() {
				dateClickFunc();
				calendar.changeView('dayGridMonth');
			});
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
			<c:if test="${vo.ptCalendarReservationState == 'T'}">
				eventsArray.push({
					title: "예약 불가능",
					color: 'rgb(180,180,180)',
					start: varStartDate,
					end: varEndDate
				});
			</c:if>
			<c:if test="${vo.ptCalendarReservationState == 'F'}">
				eventsArray.push({
					title: "예약 가능",
					color: '#4B4DB2',
					start: varStartDate,
					end: varEndDate
				});
			</c:if>
			</c:forEach>
			calendar.addEventSource(eventsArray);
		}
		
		
		function chkFunction() {
			$('#pt_calendar_time_info i').off('mouseover');
			$('#pt_calendar_time_info i').off('mouseout');
			$('#pt_calendar_time_info i').off('click');
			$('#pt_calendar_time_info i').on({
				mouseover : function() {
					if(!chkArray[$('#pt_calendar_time_info i').index(this)]) {			
						$(this).css("border", "2px solid rgba(75, 77, 178, 0.7)");
					}
				},
				mouseout : function() {
					if(!chkArray[$('#pt_calendar_time_info i').index(this)]) {
						$(this).css("border", "2px solid rgba(75, 77, 178, 0.3)");
					}
				},
				click : function() {
					if(!chkArray[$('#pt_calendar_time_info i').index(this)]) {
						$('#pt_calendar_time_info i').css("color", 'white');
						$('#pt_calendar_time_info i').css("border", '2px solid rgba(75, 77, 178, 0.3)');
						$(this).css({
							'border' : '2px solid #4B4DB2',
							'color' : '#4B4DB2'
						});
						for(var i = 0; i < chkArray.length; i++) {
							if(i == $('#pt_calendar_time_info i').index(this)) {
								chkArray[$('#pt_calendar_time_info i').index(this)] = true;
								var splitTempStr = $('.pt_calendar_time_info_str:contains("예약 가능")').eq(i).text().split('시')[0];
								var splitReservationTime = splitTempStr + ':00 ~ ' + (Number(splitTempStr) + 1) + ':00'
 								$('.summary_right').eq(2).text(splitReservationTime);
 								console.log($('.pt_calendar_time_info_str').eq(i).text().split("시"));
							} else {
								chkArray[i] = false;
							}
						}
						var splitDateStrArray = $('#pt_calendar_time_info_title').text().split(" ");
						var splitDateStr = splitDateStrArray[0] + ' ' + splitDateStrArray[1] + ' ' + splitDateStrArray[2];
 						$('.summary_right').eq(1).text(splitDateStr);
						$('.summary_right').eq(6).text(numberWithCommas('${pVo.ptPrice}') + '원');
						$('#pt_calendar_summary').css("display", "block");
						$('#pt_calendar_hr').css("display", "block");
						$('#pt_calendar_trade_wrap').css("display", "block");
					} else {
						$(this).css({
							'border' : '2px solid rgba(75, 77, 178, 0.7)',
							'color' : 'white'
						});
						chkArray[$('#pt_calendar_time_info i').index(this)] = !chkArray[$('#pt_calendar_time_info i').index(this)];
						$('#pt_calendar_summary').css("display", "none");
						$('#pt_calendar_hr').css("display", "none");
						$('#pt_calendar_trade_wrap').css("display", "none");
					}
				}
			});
		}
		
		function formateDateTitle(date) {
			var weekArray = ['일', '월', '화', '수', '목', '금', '토'];
			var returnDateStr = date.getFullYear() + '년 ' + (date.getMonth()+1) + "월 " + date.getDate() + "일 "+ weekArray[date.getDay()]+"요일";
			return returnDateStr;
		}
		
		function dateClickFunc() {
			$('.fc-daygrid-day').off('click');
			$('.fc-daygrid-day').on('click',function() {
				$('#pt_calendar_time_info').empty();
				var $eventTime = $(this).find(".fc-event-time");
				var $eventTitle = $(this).find(".fc-event-title");
				$('#pt_calendar_time_info').append('<p id="pt_calendar_time_info_title">'+formateDateTitle(new Date($(this).attr('data-date')))+'</p>');
				chkArray = [];
				for(var i = 0; i < $eventTime.length; i++) {
					if($eventTitle.eq(i).text() != '예약 불가능'){						
						$('#pt_calendar_time_info').append('<div class="pt_calendar_time_info_select"><div class="pt_calendar_i_wrap"><i class="fa-solid fa-check"></i></div><p class="pt_calendar_time_info_str">'+$eventTime.eq(i).text()+' '+$eventTitle.eq(i).text()+'</p></div>');
					} else {
						$('#pt_calendar_time_info').append('<div class="pt_calendar_time_info_select"><div class="pt_calendar_i_wrap"></div><p class="pt_calendar_time_info_str">'+$eventTime.eq(i).text()+' '+$eventTitle.eq(i).text()+'</p></div>');						
					}
					chkArray.push(false);
				}
				chkFunction();
			});
		}
		
		function numberWithCommas(x) { 
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); 
		}
		
 		$('#pt_calendar_tarde_btn').click(function() {
			$('#pt_calendar_modal_div').css('display','block');
		});
		
		$('.btn').hover(
		function() {
			$(this).css({
				color: 'black',
				backgroundColor: 'white'
			});
		},
		function() {
			$(this).css({
				color: 'white',
				backgroundColor: '#4B4DB2'
			});
		});
		
		$('#pt_calendar_modal_cancle').click(function() {
			$('#pt_calendar_modal_div').css('display','none');
		});
		$('#pt_calendar_modal_check').click(function() {
			var checkDate = "";
			var yearMontDateTemp = $('.summary_right').eq(1).text().split(" ");
			for(var i = 0; i < yearMontDateTemp.length; i++) {
				checkDate += numberReg(yearMontDateTemp[i]);
				if(i != 2) {
					checkDate += '-';
				} else {
					checkDate += ' ';
				}
			}
			checkDate += numberReg($('.summary_right').eq(2).text().split(':')[0]);
			checkDate += ':00:00.0'
			var ptCalendarNo = 0;
			for(var i = 0; i < ptCalendarVoJs.length; i++) {
				if(ptCalendarVoJs[i].ptCalendarStartTime == checkDate) {
					console.log(ptCalendarVoJs[i].ptCalendarNo);
					ptCalendarNo = ptCalendarVoJs[i].ptCalendarNo;
				}
			}
			var memberNo = ${ssMvo.memberNo};
			var ptPrice = ${pVo.ptPrice};
			$.ajax({
				url  : 'ptreservaton.ax',
				type : 'post',
				data : 
				{
					memberNo : memberNo,
					ptPrice : ptPrice,
					ptCalendarNo : ptCalendarNo
				},
				success : function(result) {
					console.log(result);
					console.log(result == 'success');
					if(result == 'success') {
						alert("결제가 완료되었습니다.")
						location.href = "ptlist";
					} else {
						alert("결제가 실패했습니다.")
						location.href = "ptlist";
					}
				},
				error : function(request, status, error) {
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});
			
		});
		
		function numberReg(text) {
			var regex = /[^0-9]/g;
			var result = text.replace(regex, "");
			if(result.length == 1) {
				result = "0" + result;
			}
			return result;
		}
		

	</script>
</body>
</html>