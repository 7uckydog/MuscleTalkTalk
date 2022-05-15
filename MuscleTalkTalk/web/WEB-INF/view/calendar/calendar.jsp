<%@ include file="/WEB-INF/view/csslink.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/cssfolder/css/calendar.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머슬톡톡</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/view/font.jsp"%>
<script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.0,npm/fullcalendar@5.11.0/locales-all.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css' rel='stylesheet' />

</head>
<body>
	<div id="calendar_modal">
		<div id="calendar_modal_div">
			<p id="modal_title" class="font_THEmpgtB font_15px">예약 정보</p>
			<i class="fa-solid fa-x" id="close_btn"></i>
			<div id="modal_grid">
			</div>
			<div id="modal_btn_wrap">
			</div>
			<form name="cal_form">
				<input type="hidden" id="ptCalendarNo" name="ptCalendarNo">
				<input type="hidden" id="ptNo" name="ptNo">
			</form>
		</div>
	</div>
    <%@ include file="/WEB-INF/view/template.jsp" %>
        <section id="calendar_section">
			<div id="calendar_section_div">
				<div>
					<div class="option_wrap">
						<i class="fa-solid fa-check font_20px option_check" chk="false"></i>
						<p class="option_title font_12px font_THEmpgtM font_color_rgb">PT 예약</p>
					</div>
					<div class="option_wrap">
						<i class="fa-solid fa-check font_20px option_check" chk="false"></i><p class="option_title font_12px font_THEmpgtM font_color_rgb">주간루틴1</p>
					</div>
					<div class="option_wrap">
						<i class="fa-solid fa-check font_20px option_check" chk="false"></i><p class="option_title font_12px font_THEmpgtM font_color_rgb">주간루틴1</p>
					</div>
					<div class="option_wrap">
						<i class="fa-solid fa-check font_20px option_check" chk="false"></i><p class="option_title font_12px font_THEmpgtM font_color_rgb">주간루틴1</p>
					</div>
					<div class="option_wrap">
						<i class="fa-solid fa-check font_20px option_check" chk="false"></i><p class="option_title font_12px font_THEmpgtM font_color_rgb">주간루틴1</p>
					</div>
					<div class="option_wrap">
						<i class="fa-solid fa-check font_20px option_check" chk="false"></i><p class="option_title font_12px font_THEmpgtM font_color_rgb">주간루틴1</p>
					</div>
					<div class="option_wrap">
						<i class="fa-solid fa-check font_20px option_check" chk="false"></i><p class="option_title font_12px font_THEmpgtM font_color_rgb">주간루틴1</p>
					</div>
					<div class="option_wrap">
						<i class="fa-solid fa-check font_20px option_check" chk="false"></i><p class="option_title font_12px font_THEmpgtM font_color_rgb">주간루틴1</p>
					</div>
				</div>
				<div id="calendar">
				</div>
			</div>
        </section>

    <%@ include file="/WEB-INF/view/footer.jsp" %>
    <script type="text/javascript">
    

    var ptCalList = [];
    <c:forEach var="vo" items="${ptCalList}">
    	var vo = {
    		ptCalendarNo : ${vo.ptCalendarNo},
    		ptNo : ${vo.ptNo},
    		memberNo : ${vo.memberNo},
    		ptCalendarStartTime : new Date('${vo.ptCalendarStartTime}'),
    		ptCalendarReservationState : '${vo.ptCalendarReservationState}',
    		ptName : '${vo.ptName}'
    	};
    	ptCalList.push(vo);
    </c:forEach>
	console.log(ptCalList);   
    var reservEventSource = [];
	for(var i = 0; i < ptCalList.length; i++) {
		var temp = 'ptCalendarNo-'+ptCalList[i].ptCalendarNo;
		var temp2 = 'ptNo-'+ptCalList[i].ptNo;
		var vo = {
			title: ptCalList[i].ptName,
			color: 'rgb(180,180,180)',
			start: ptCalList[i].ptCalendarStartTime,
			className : ["event_pt", temp, temp2]
		}
		reservEventSource.push(vo);
	}
    
    var calendar;
		$(function() {
			var calendarEl = $('#calendar')[0];
			calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth',
				locale : 'ko',
				headerToolbar : {
					left : 'prev next',
					center : 'title',
					right : 'customButtons readStatistics'
				},
				eventDisplay : 'block',
				customButtons: {
					customButtons: {
						text: '루틴불러오기',
						click : function() {
							calendar.getEventSourceById('pt').remove();
						}
					},
					readStatistics : {
						text: '통계조회',
						click : function() {
							alert("click");
						}
					}
				},
				eventClick : function(info) {
					console.log(info);
					console.log($(info.el));
					var classList = $(info.el).attr('class').split(" ");
					if(classList.includes("event_pt")) {
						for(var i = 0; i < classList.length; i++) {
							if(classList[i].search('ptCalendarNo') != -1) {
								var ptCalNoTemp = classList[i].split("-")[1];
								var ptNoTemp = classList[i+1].split("-")[1];
								$("#ptNo").val(ptNoTemp);
								$('#ptCalendarNo').val(ptCalNoTemp);
								$.ajax({
									url : "ptcalread.ax",
									type : 'post',
									data : 
									{
										ptCalNoTemp : ptCalNoTemp,
									},
									dataType : 'json',
									success : function(result) {
										console.log(result);
										var dateTemp = new Date(result.ptCalendarStartTime);
										var startTemp = dateTemp.getHours();
										var endTemp = startTemp + 1;
										console.log(startTemp);
										console.log(endTemp);
										if(startTemp < 10) {
											startTemp = "0" + startTemp;
										}
										if(endTemp < 10) {
											endTemp = "0" + endTemp;
										}
										$("#modal_grid").append('<p class="font_THEmpgtM font_12px">예약자</p>');
										$("#modal_grid").append('<p class="font_THEmpgtB font_12px">'+result.memberName+'</p>');
										$("#modal_grid").append('<p class="font_THEmpgtM font_12px">예약일</p>');
										$("#modal_grid").append('<p class="font_THEmpgtB font_12px">'+formateDateTitle(dateTemp)+'</p>');
										$("#modal_grid").append('<p class="font_THEmpgtM font_12px">예약시간</p>');
										$("#modal_grid").append('<p class="font_THEmpgtB font_12px">'+startTemp + '시 ~ '+endTemp+'시</p>');
										$("#modal_grid").append('<p class="font_THEmpgtM font_12px">프로그램명</p>');
										$("#modal_grid").append('<p class="font_THEmpgtB font_12px">'+result.ptName+'</p>');
										$("#modal_grid").append('<p class="font_THEmpgtM font_12px">헬스장명</p>');
										$("#modal_grid").append('<p class="font_THEmpgtB font_12px">'+result.gymName+'</p>');
										$("#modal_grid").append('<p class="font_THEmpgtM font_12px">헬스장 위치</p>');
										$("#modal_grid").append('<p class="font_THEmpgtB font_12px">'+result.gymLocation+'</p>');
										$("#modal_grid").append('<p class="font_THEmpgtM font_12px">가격(1시간/1회)</p>');
										$("#modal_grid").append('<p class="font_THEmpgtB font_12px">'+numberWithCommas(result.ptPrice)+'원</p>');
										$("#modal_btn_wrap").append('<button id="reservation_update_btn" type="button">예약 수정</button>');
										$("#modal_btn_wrap").append('<button id="reservation_cancle_btn" type="button">예약 취소</button>');
										$('#reservation_update_btn, reservation_cancle_btn').off('click');
										$('#reservation_update_btn').on('click', function() {
											cal_form.action = "ptreservationupdate";
											cal_form.method = 'post';
											cal_form.submit();
										});
										$('#reservation_cancle_btn').on('click', function() {
											$.ajax({
												url : 'membercancelreservation.ax',
												type : 'post',
												data : {
													ptCalendarNo : $('#ptCalendarNo').val(),
													memberNo : ${ssMvo.memberNo}
												},
												success : function(result) {
													console.log(result);
													if(result == 1) {
														alert("예약 취소를 성공했습니다.");
														location.href = "calendar";
													} else {
														alert("예약을 취소를 실패했습니다.");
														location.href = "calendar";
													}
												}
											});
										});
									},
									error : function(request, status, error) {
										console.log(request);
										console.log(status);
										console.log(error);
									}
								});
								$("#calendar_modal").css("display","block");
								$(window).off('click');
								$(window).on('click', function(event) {
									if(event.target == $("#calendar_modal")[0]) {
										console.log("???????")
										$("#calendar_modal").css("display", "none");
										$("#modal_grid").empty();
										$("#modal_btn_wrap").empty();
									}
								});
							}
						}		
					}
				}

				
			});
			calendar.render();
			$(".fc-prev-button, .fc-next-button").css({
				width : '50px',
				height : '40px',
				backgroundColor : '#4B4DB2',
				color : 'white',
				border : '1px solid #4B4DB2',
				'font-size' : '12px'
			});
			
			$(".fc-customButtons-button, .fc-readStatistics-button").css({
				width : '150px',
				height : '40px',
				backgroundColor : '#4B4DB2',
				color : 'white',
				border : '1px solid #4B4DB2',
				'font-family' :'THEmpgtM',
				'font-size' : '12px'
			})
			
			
			$(".fc-button").hover(function() {
				$(this).css({
					backgroundColor : 'white',
					color : '#4B4DB2'
				})
			}, function() {
				$(this).css({
					backgroundColor : '#4B4DB2',
					color : 'white',
				})
			});
			
			$(".fc-toolbar-title").css({
				'font-family' : 'THEmpgtB',
				'font-size' : '15px',
				width : '100px',
				'text-align': 'center',
				position : 'absolute',
				left : '415px',
				top : '70px',
				height : '20px',
				'line-height' : '20px'
			});
			
			
			
			
			
			
		});
		
		
		$(function() {
			
			$('.option_check').on('mouseenter', function() {
				$(this).css('border', '2px solid rgba(75, 77, 178, 0.7)');
			});
			
			$('.option_check').on('mouseleave', function() {
				$(this).css('border', '2px solid rgba(75, 77, 178, 0.3)');
			});
			
			$('.option_check').on('click', function() {
				if($(this).attr('chk') == 'false') {					
					$(this).attr('chk','true');
					$(this).css({
						border : '2px solid rgba(75, 77, 178, 1)',
						backgroundColor : 'rgba(75, 77, 178, 1)'
					});
				} else if($(this).attr('chk') == 'true') {
					$(this).attr('chk','false');
					$(this).css({
						border : '2px solid rgba(75, 77, 178, 0.7)',
						backgroundColor : 'white'
					});
				}
				if($(this).next().text() == 'PT 예약') {
					if($(this).attr('chk') == 'true') {
						ptAdd();
					} else if ($(this).attr('chk') == 'false') {
						ptDelete();
					}
				}
				
			});
			

			
		});
		
		function ptAdd() {
			calendar.addEventSource({
				id : 'pt',
				events : reservEventSource
			});
		}
		function ptDelete() {
			calendar.getEventSourceById('pt').remove();
		}
		
		$("#close_btn").click(function() {
			$("#calendar_modal").css("display", "none");
			$("#modal_grid").empty();
			$("#modal_btn_wrap").empty();
		});
		
		function formateDateTitle(date) {
			var weekArray = ['일', '월', '화', '수', '목', '금', '토'];
			var returnDateStr = date.getFullYear() + '년 ' + (date.getMonth()+1) + "월 " + date.getDate() + "일 "+ weekArray[date.getDay()]+"요일";
			return returnDateStr;
		};
		
		function numberWithCommas(x) { 
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); 
		};
    </script>
</body>
</html>