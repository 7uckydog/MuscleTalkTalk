<%@ include file="/WEB-INF/view/csslink.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.0,npm/fullcalendar@5.11.0/locales-all.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css' rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="/WEB-INF/view/font.jsp" %>

<style>
	#calendar-container{
		margin: 0 65px  ;
		box-sizing: border-box;
	}
	.fc-header-toolbar{
		margin: 65px 0 0 0;
	}
	#modal1{
      position: absolute;
		width: 250px;
		height: 200px;
		border-radius: 10px;
		display: none;
      background-color: white;
		z-index: 2;
      box-shadow: 0px 0px 7px 0px gray;
	}
	#modal2{
      position: absolute;
		width: 250px;
		min-height: 200px;
		border-radius: 10px;
		display: none;
      background-color: white;
		z-index: 2;
      box-shadow: 0px 0px 7px 0px gray;
	}
   .add_ex{
      z-index: 2;
      display: none;
      position: absolute;
      margin: 0px auto;
      top: 200px; 
      left: 50%;
      transform: translateX( -50% );
      width: 800px;
      min-height: 600px;
      background-color: white;
      box-shadow: 0px 0px 7px 0px gray;
      
   }
   .fc-daygrid-day-number:hover{
      opacity: 0.5;
   }
   
   .fc-daygrid-day-number{
      cursor: pointer;
   }
   .modal_content{
      display: inline-block;
      margin: 30px 20px 30px 20px;
   }

   #modal1_btns{
      display: inline;
   }

</style>

<style> /* 버튼들 */

   .modal_btn{
      color: white;
      border: 1px solid white;
      background-color: #4B4DB2;
      width: 90px;
      height: 28px;
      float: right;
      font-size: 12px;
      cursor: pointer;
      display: inline;
   }
   .modal_btn:hover{
      color: #4B4DB2;
      border: 1px solid #4B4DB2;
      background-color: white;
      width: 90px;
      height: 28px;
      float: right;
      font-size: 12px;
      cursor: pointer;
      display: inline;
   }
   .cal_main_button{
      color: white;
      border: 1px solid white;
      background-color: #4B4DB2;
      width: 120px;
      height: 28px;
      float: right;
      font-size: 12px;
      cursor: pointer;
      display: inline;
   }
   .modal_btn:hover{
      color: #4B4DB2;
      border: 1px solid #4B4DB2;
      background-color: white;
      width: 90px;
      height: 28px;
      float: right;
      font-size: 12px;
      cursor: pointer;
      display: inline;
   }
</style>
<style> /* 운동추가 */
   #routinecreat_main {
	/* margin-top: 65px; */
	/* margin-left: 65px; */
	padding-top: 65px;
	font-weight: bold;
	display: inline-block;
	margin-bottom: 60px;
	font-size: 15px;
	margin-left: 65px;
	margin-right: 65px;
}

.add_ex button {
	width: 155px;
	height: 30px;
	font-size: 12px;
	color: #4B4DB2;
	background-color: white ;
	border: 1px solid #4B4DB2;
	cursor: pointer;
}

.add_ex button.active {
	width: 155px;
	height: 30px;
	font-size: 12px;
	color: white;
	background-color: #4B4DB2 ;
	border: 1px solid #4B4DB2;
	cursor: pointer;
}

.week_routinecreat:default:focus {
	background-color: #4B4DB2;
	color: white;
}

.day_routinecreat:focus, .week_routinecreat:focus {
	background-color: #4B4DB2;
	color: white;
}



.routine_nameBox {
	width: 233px;
	/* margin-left: 65px; */
	height: 25px;
	border-radius: 5px;
	border: gray solid 1px;
}

.routine_tagetSelect {
	/* margin-left: 44px; */
	width: 163.5px;
	height: 30px;
	border-radius: 5px;
	border: gray solid 1px;
}

.routine_weekSelect {
	margin-left: 10px;
	width: 163.5px;
	height: 30px;
	border-radius: 5px;
	border: gray solid 1px;
}

.routine_daySelect {
	margin-left: 12px;
	width: 163.5px;
	height: 30px;
	border-radius: 5px;
	border: gray solid 1px;
}

.taget_timeDiv {
	margin-top: 50px;
	/* margin-left: 65px; */
}

.taget_sort>button {
	width: 50px;
	height: 30px;
	/* margin-left: 10px; */
	margin-top: 10px;
}

.taget_sort button:nth-child(1), .taget_sort button:nth-child(5) {
	margin-left: 0px;
}

.taget_sort>input:nth-child(1), .taget_sort>input:nth-child(2),
	.taget_sort>input:nth-child(3), .taget_sort>input:nth-child(4),
	.taget_sort>input:nth-child(5), .taget_sort>input:nth-child(6),
	.taget_sort>input:nth-child(7), .taget_sort>input:nth-child(8), .taget_sort>input:nth-child(9) {
	display: none;
}

.taget_sort>button:nth-child(9) {
	margin-left: 0px;
}

.taget_sort>label {
	width: 50px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	margin-right: 10px;
	margin-top: 10px;
	border-radius: 5px;
	border: gray solid 1px;
	color: black;
	background-color: rgb(224, 224, 224);
	display: inline-block;
}

.taget_sort ~ input[type=checkbox]:checked {
	background-color: #4B4DB2;
	color: white;
}

.taget_sort>input[type=checkbox]:checked ~ label {
	background-color: #4B4DB2;
	color: white;
}
.dayroutine_tagetSelect {
	display: none;
	/* margin-left: 227.5px; */
	width: 163.5px;
	height: 30px;
	border-radius: 5px;
	border: gray solid 1px;
}

.routine_taget2 {
	display: none;
	/* margin-left: 403px; */
}

.dayroutine_daySelect {
	display: none;
	margin-left: 11.5px;
	width: 163.5px;
	height: 30px;
	border-radius: 5px;
	border: gray solid 1px;
}

.routine_day2 {
	display: none;
	/* margin-left: 127.5px; */
}

.active {
	background-color: #4B4DB2;
	color: white;
}

/* 세트-운동별 시간 css */

.set_timeup, .set_timedawn {
	width: 28px;
	height: 28px;
	vertical-align: bottom;
}

#count_settime {
	width: 98px;
	display: inline-block;
	vertical-align: bottom;
	font-size: 12px;
	border: gray solid 1px;
	box-sizing: border-box;
	text-align: center;
	height: 29px;
	line-height: 29px;
}

.set_timeup2, .set_timedawn2 {
	width: 28px;
	height: 28px;
	vertical-align: bottom;
}

.set_timeup2 {
	margin-left: 12px;
}

#count_settime2 {
	width: 98px;
	display: inline-block;
	vertical-align: bottom;
	font-size: 12px;
	text-align: center;
	border: gray solid 1px;
	box-sizing: border-box;
	text-align: center;
	height: 29px;
	line-height: 29px;
}



.week_import_Select {
	width: 163.5px;
	height: 30px;
	margin-left: 12px;
	border-radius: 5px;
	border: gray solid 1px;
}

.workout_main {
	/* margin: 45px 65px 0 65px; */
}

.worksearch {
	width: 167px;
	height: 25px;
	margin-bottom: 15px;
}

#btn_worksearch {
	width: 50px;
	margin-left: 5px;
   margin-right: 100px;
   color: #4B4DB2;
	background-color: white ;
	border: 1px solid #4B4DB2;
	cursor: pointer;
}

.workout_category {
	margin: 0 64px 0 64px;
	border: #4B4DB2 solid 1px;
	/* height: 170px; */
	border-top: 0px;
}

.tab_btn {
	display: inline-block;
	width: 600px;
	height: 28px;
	font-size: 12px;
	color: #4B4DB2;
	background-color: white;
	border: 1px solid #4B4DB2;
	cursor: pointer;
	text-align: center;
	line-height: 28px;
	margin-bottom: 10px;
	float: left;
}

.tab_btn:nth-child(1), .tab_btn:nth-child(2), .tab_btn:nth-child(3),
	.tab_btn:nth-child(4), .tab_btn:nth-child(5) {
	border-right: 0px;
}

.tab_btn:nth-child(1) {
	border-left: 0px;
}


.workoutSettingDiv {
	width: 600px;
	margin-left: 0;
	margin-right: 0;
	display: inline;
}

/* .workoutSettingTitle {
	margin-top: 30px;
	margin-left: 65px;
	margin-bottom: 25px;
} */

.workoutSettingName {
	/* margin-left: 65px; */
	background-color: #4B4DB2;
	color: white;
}

.workoutSettingName, .workoutSettingWeight, .workoutSettingNumber {
	width: 140px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	display: inline-block;
	float: left;
}

.workoutSettingWeight, .workoutSettingNumber {
	color: #4B4DB2;
	background-color: white;
	box-sizing: border-box;
	border: #4B4DB2 solid 1px;
}

.workoutSettingWeight {
	border-right: 0px;
}

.set_timeup3, .set_timedawn3 {
	width: 28px;
	height: 28px;
	line-height: 28px;
	vertical-align: bottom;
}


#count_settime3 {
	width: 88px;
	display: inline-block;
	vertical-align: bottom;
	font-size: 12px;
	border: gray solid 1px;
	box-sizing: border-box;
	text-align: center;
	height: 29px;
	line-height: 29px;
}

.allsettingBtn {
	/* margin-left: 20px; */
	font-size: 12px;
	height: 28px;
	width: 75px;
}

.timesettingBtn {
	padding-top: 5px;
	border-radius: 5px;
}

.workout_inputBtn {
	width: 60px;
	height: 28px;
	outline: 0px;
	border: 0px;
	background-color: #4B4DB2;
	color: white;
	margin-left: 20px;
	border-radius: 5px;
	cursor: pointer;
}

.addworkoutTitle {
	margin-top: 50px;
	/* margin-left: 65px; */
	margin-bottom: 20px;
}

.addworkoutDay {
	/* margin-left: 65px; */
	width: 140px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	background-color: #4B4DB2;
	color: white;
	/* display: none; */
	float: left;
}

.addworkoutPart {
	/* display: none; */
	margin-left: 10px;
	width: 50px;
	height: 26px;
	line-height: 26px;
	text-align: center;
	border: 1px solid #4B4DB2;
	background-color: white;
	color: #4B4DB2;
	border-radius: 2.5px;
	outline: none;
	float: left;
}

.addworkoutDiv {
	margin-left: 65px;
	overflow: hidden;
}

.addworkoutTable td {
	width: 140px;
	height: 30px;
	line-height: 30px;
	color: #4B4DB2;
	background-color: white;
	border: 1px solid #4B4DB2;
	text-align: center;
}
.addworkoutset{
border-left: 0px !important;
}

.addworkoutTable td:nth-child(2), .addworkoutTable td:nth-child(3),
	.addworkoutTable td:nth-child(4) {
	border-left: 0px;
}

.addworkoutTable {
	/* display: none; */
	box-sizing: border-box;
	height: auto;
	float: left;
}

.addworkoutAllDiv {
	overflow: hidden;
}

.addworkoutAllDivTop {
	overflow: hidden;
}


#routineinsertcancelBtn {
	width: 155px;
	height: 30px;
	font-size: 12px;
	color: #4B4DB2;
	background-color: white;
	border: 1px solid #4B4DB2;
}

#routineinsertBtn {
	width: 155px;
	height: 30px;
	font-size: 12px;
	color: white;
	background-color: #4B4DB2;
	border: 1px solid #4B4DB2;
}

.Btn_cancel_inset {
	margin-top: 62px;
	text-align: center;
}

.workout_AllList p {
	width: auto;
	cursor: pointer;
}
#x_icon > img{
   cursor: pointer;
}
#x_icon>img:hover{
   opacity: 0.7;
}
</style>
<style> /* 운동추가 진정 */
.add_ex > .modal_content{
   position:relative;
   top: 100px;
   margin: auto;
   background-color: white;
  
}
</style>
<style> /* grid */
   .container{
      display: grid;
      grid-template-rows: 1fr 1fr 1.5fr 2fr 3fr 1fr 2fr 1fr;
      grid-template-columns: 1;
      /* 1fr 1fr 1.5fr 5fr 1fr 2fr 1fr; */
        /* 40px 40px 70px 250px 50px 150px ; */
      grid-auto-flow:row;
   }
   #x_icon{
      grid-row: 1;
      text-align: right;
      grid-column: 1;
   }
   .grid_row_2{
      grid-row: 2;
      grid-column: 1;
      display: flex;
      height: 15px;
   }
   .grid_row_3{
      grid-row: 3;
      grid-column: 1;
      display: flex;
      justify-content: flex-start;
   }
 
   .grid_row_4{
      grid-row: 4;
      grid-column: 1;
   }
   .grid_row_5{
      grid-row: 5;
      grid-column: 1;
   }
   .grid_row_6{
      grid-row: 6;
      grid-column: 1;
   }
   .grid_row_7{
      grid-row: 7;
      grid-column: 1;
   }
   .grid_row_8{
      grid-row: 8;
      grid-column: 1;
   }
   .flex_c_1{
      margin-right: 300px;
   }
   .flex_c_2{
      margin-right: 92px;
   }

</style>
<style>
   .add_ex{
      font-size: 12px;
   }
</style>

</head>
<body>
	<%@ include file="/WEB-INF/view/template.jsp" %>
	<section>
	  <div id='calendar-container'>
         <div id="calendar"></div>
      </div>
      <div id="modal1">
         <div class="modal_content">
            <div id="date_info"></div>
            <div id="workout_info">오늘의 운동 일정</div>
            <div id="plan_none">일정 없음</div>
            <div id="modal1_btns">
               <button class="modal_btn add_workout" type="button">운동 추가</button>
               <button class="modal_btn import_routine" type="button">루틴 불러오기</button>
            </div>
         </div>
		</div>
		<div id="modal2">
         <div class="modal_content">
            <div id="date_info"></div>
            <div id="workout_info">오늘의 운동 일정</div>
            <div id="plan_none">일정 없음</div>
            <div id="modal2_btns">
               <button class="modal_btn add_workout" type="button">운동 추가</button>
               <button class="modal_btn import_routine" type="button">루틴 불러오기</button>
               <button class="modal_btn" id="add_workout" type="button">운동 시작</button>
               <button class="modal_btn" id="import_routine" type="button">결과 확인</button>
            </div>
         </div>
		</div>
      <div class="add_ex">
         <form>
         <div class="modal_content container">
            <div id="x_icon"><img src="<%= request.getContextPath() %>/cssfolder/images/x_icon.png"></div>
            <div class="workout_main grid_row_2">
               <div class="flex_c_1">운동 추가</div>
               <div class="set_time_title flex_c_2">세트별휴식시간</div>
               <div class="set_time_title2 flex_c_3">운동별 휴식시간</div>
            </div>
            <div class="taget_timeDiv grid_row_3">
               <!-- 세트별 시간 -->
               <input class="worksearch" type="text" placeholder="검색어를 입력하세요.">
               <button id="btn_worksearch" type="button">검색</button>
					<input type='button' class="set_timeup " onclick='count("plus")' value='+'> 
               <input type="text" class="" name="settime" maxlength="4" min="0초" id='count_settime' value="0초"> 
               <input type='button' class="set_timedawn " onclick='count("minus")' value='-'>
               <!-- 운동별 시간 -->
               <input type='button' class="set_timeup2 " onclick='count2("plus2")' value='+'> 
               <input type="text" name="worktime" maxlength="4" id='count_settime2' value="0초"> 
               <input type='button' class="set_timedawn2 " onclick='count2("minus2")' value='-'>
            </div>
            <div class="taget_sort grid_row_4">
               <div class="taget_btn">운동 부위 선택</div> 
               <input type="checkbox" name="taget_sort" value="B" id="taget_value1">
               <input type="checkbox" name="taget_sort" value="C" id="taget_value2"> 
					<input type="checkbox" name="taget_sort" value="S" id="taget_value3"> 
					<input type="checkbox" name="taget_sort" value="L" id="taget_value4"> 
					<input type="checkbox" name="taget_sort" value="A" id="taget_value5"> 
					<input type="checkbox" name="taget_sort" value="E" id="taget_value6"> 
					<input type="checkbox" name="taget_sort" value="H" id="taget_value7"> 
					<input type="checkbox" name="taget_sort" value="T" id="taget_value8">
               <button type="button" name="taget_sort" class="taget_value" value="B">등</button>
					<button type="button" name="taget_sort" class="taget_value" value="C">가슴</button>
					<button type="button" name="taget_sort" class="taget_value" value="S">어깨</button>
					<button type="button" name="taget_sort" class="taget_value" value="L">하체</button>
               <button type="button" name="taget_sort" class="taget_value" value="A">복근</button>
					<button type="button" name="taget_sort" class="taget_value" value="E">팔</button>
					<button type="button" name="taget_sort" class="taget_value" value="H">엉덩이</button>
					<button type="button" name="taget_sort" class="taget_value" value="T">유산소</button>
            </div>
            <div class="workout_category grid_row_5">
               <div class="workout_category_Name">선택 부위 운동 리스트</div>
               <div class="workouts">
                  <!--전체 카테고리 클릭시 보임-->
                  <div class="workout_All">
                     <div class="workout_AllList"></div>
                  </div>
                 
               </div>
            </div>
            <div class="workoutSettingDiv grid_row_6">
               <div class="workoutSettingTitle">선택한 운동 설정</div>
               <table id="workoutSettingTable">
                  <tr class="workoutSettingTr">
                     <td class="workoutSettingName" name="workoutSettingName">운동명</td>
                     <td><input maxlength="5" class="workoutSettingWeight" name="workoutSettingWeight"
                        value="0kg"></td>
                     <td><input maxlength="3" class="workoutSettingNumber" name="workoutSettingNumber"
                        value="0회"></td>
                  </tr>
               </table>
            </div>
            <div class="timesettingBtn grid_row_7">
               <input type='button' class="set_timeup3" onclick='count3("plus3")'
                  value='+'> <input type="text" readonly maxlength="10"
                  min="1세트" id='count_settime3' name="setNumber" value="1세트"> <input
                  type='button' class="set_timedawn3" onclick='count3("minus3")'
                  value='-'> <input class="allsettingBtn" type="button"
                  value="일괄적용"> <input type="button" class="workout_inputBtn"
                  value="추가">
            </div>

            <div class="addworkoutTitle grid_row_8">추가된 운동</div>
            <div class="Btn_cancel_inset grid_row_7">
               <button id="routineinsertcancelBtn" type="button">취소</button>
               <button id="routineinsertBtn" type="button" >운동추가</button>
            </div>
         </div>
      </form>
      </div>
	</section>
	<%@ include file="/WEB-INF/view/footer.jsp" %>
	
<script type="text/javascript"> //캘린더

    // $(window).click(function(){
    //     $('body').children();
    //     $('body').find();
    //     console.log($('body').children());
    //     console.log($('body').find('.fc-daygrid-day'));
    // });

    

   // $(window).resize(function(){
   //    $("#modal1").css({
   //                   top: $('.fc-event-main-frame').offset().top,
   //                   left: $('.fc-event-main-frame').offset().left + $('.fc-event-main-frame').width()
   //                });
   // })
      var eventIndex = 1;
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
               left : 'prev,next',
               center : 'title',
               right : '.cal_main_button'
            },
            events : [{
               title : 'test',
               start : '2022-05-10'
            }],
            dateClick : function(info) {
               console.log("test4");
               console.log(calendar.event);
               console.log(info);
               console.log(info.dateStr);
               var inputText = "";
               inputText += $(this).attr('aria-label');
               //$("#date_info").text(inputText);
               calendar.event;
               $("#date_info").text($('.fc-daygrid-day[data-date = '+info.dateStr+']').find('.fc-daygrid-day-number').attr('aria-label'));
               //$('.fc-daygrid-day[data-date = '+info.dateStr+']').find('.fc-event-title');
               //$('.fc-daygrid-day[data-date = '+info.dateStr+']').find('.fc-event-title').length  == 0
               var titleLength = $('.fc-daygrid-day[data-date = '+info.dateStr+']').find('.fc-event-title').length;
               $('.fc-day-sun, .fc-day-mon, .fc-day-tue, .fc-day-wed .fc-daygrid-day-number').click(function(){
                  console.log("날짜찍으면나오나?");
                  if($(titleLength) == 0){
                     $("#modal1").css({
                        top: $(this).offset().top,
                        left: $(this).offset().left + $(this).width()+10,
                        display: 'block'
                     });
                  }else{
                     $("#modal2").css({
                        top: $(this).offset().top,
                        left: $(this).offset().left + $(this).width()+10,
                        display: 'block'
                     });
                  }
               });
               $('.fc-day-thu, .fc-day-fri, .fc-day-sat .fc-daygrid-day-number').click(function(){
                  console.log("날짜찍으면나오나?");
                  if($(titleLength) == 0){
                     $("#modal1").css({
                        top: $(this).offset().top,
                        left: $(this).offset().left - $(this).width()-35,
                        display: 'block'
                     });
                  }else{
                     $("#modal2").css({
                        top: $(this).offset().top,
                        left: $(this).offset().left + $(this).width()-35,
                        display: 'block'
                     });
                  }
               });
               eventIndex++;
            },
            eventClick : function(info) {
               console.log(info.event.title);
               console.log(info.jsEvent.pageX +',' + info.jsEvent.pageY);
            },



         });
         console.log('test1');
         calendar.render();

         $('.add_workout').click(function(){
            $('.add_ex').css({
               display: 'block'
            });
         }); 
         $('#x_icon').click(function(){
            $('.add_ex').css({
               display: 'none'
            });
         });

      });

   </script>
   <script>
   $(".day_routinecreat").click(function () {
            $(".routine_taget").hide();
            $(".routine_tagetSelect").hide();
            $(".routine_week").hide();
            $(".routine_weekSelect").hide();
            $(".routine_day").hide();
            $(".routine_daySelect").hide();
            $(".dayroutine_tagetSelect").show();
            $(".routine_taget2").show();
            $(".dayroutine_daySelect").show();
            $(".routine_day2").show();
            // $(".week_routinecreat").hide();
        });
        $(".week_routinecreat").click(function () {
            $(".routine_taget").show();
            $(".routine_tagetSelect").show();
            $(".routine_week").show();
            $(".routine_weekSelect").show();
            $(".routine_day").show();
            $(".routine_daySelect").show();
            $(".dayroutine_tagetSelect").hide();
            $(".routine_taget2").hide();
            $(".dayroutine_daySelect").hide();
            $(".routine_day2").hide();
        });
        
        // 부위선택시 색변경
        $(".taget_sort")>$("button").click(function () {
            $(this).toggleClass("active");
        });
        // $(".taget_sort")>$("label").click(function () {
        //     $(this).toggleClass("active");
        // });
        // $(".taget_value1").click(function () {
        //     $(this).toggleClass("active");
        // });

        //타이머
        function count(type) {

            const resultElement = document.getElementById('count_settime');

            let number = resultElement.value;
            
            if (type === 'plus' && resultElement.value !== "180초") {
                number = parseInt(number) + 10+'초';
            } else if (type === 'minus' && resultElement.value !== "0초") {
                number = parseInt(number) - 10+'초';
            }
            resultElement.value = number;
        }

        function count2(type) {

            const resultElement2 = document.getElementById('count_settime2');

            let number2 = resultElement2.value;

            if (type === 'plus2' && resultElement2.value !== "300초") {
                number2 = parseInt(number2) + 30+'초';
            } else if (type === 'minus2' && resultElement2.value !== "0초") {
                number2 = parseInt(number2) - 30+'초';
            }
            resultElement2.value = number2;
        }
        //세트카운트
        function count3(type) {

            const resultElement3 = document.getElementById('count_settime3');

            let number3 = resultElement3.value;

            if (type === 'plus3' && resultElement3.value !== "10세트") {
                number3 = parseInt(number3) + 1 +'세트';
            } else if (type === 'minus3' && resultElement3.value !== "1세트") {
                number3 = parseInt(number3) - 1 +'세트';
            }
            resultElement3.value = number3;
        }
        //세트 늘어남
        $(".set_timeup3").on("click",function(){
            // $(".workoutSettingTr");
            var str = $("#count_settime3").val();
            var num = str.replace(/[^0-9]/g,'');
            console.log(num);
            $(".workoutSettingTr").eq(length - 1).after($(".workoutSettingTr").eq(length - 1).clone());
            if(num < 10){
            };

            //console.log($(".workoutSettingTr").get());
            //console.log($($(".workoutSettingTr").get(0)));
            //console.log($(".workoutSettingTr").get()[0]);
            //$("#workoutSettingTable").find();
            //$("#workoutSettingTable").children();
            //parent
            //parents
            //prev
            //next
            //console.log($("body").find("div"));
            //console.log($("#workoutSettingTable").children("tr"));
        });



        // 선택한 운동 설정
        $(".workoutAll").on({
            click : function(){
                // console.log($(this));
                // console.log($(this).position());
                // console.log($(this).index());
            $('.workoutSettingName').text($(this).text());
            }
        });
        $(".workout_AllList p").on({
            click : function(){
                // console.log($(this));
                // console.log($(this).position());
                // console.log($(this).index());
            $('.workoutSettingName').text($(this).text());
            }
        });
        $(".workoutfreeweight").on({
            click : function(){
                // console.log($(this));
                // console.log($(this).position());
                // console.log($(this).index());
            $('.workoutSettingName').text($(this).text());
            }
        });
        $(".workoutmachine").on({
            click : function(){
                // console.log($(this));
                // console.log($(this).position());
                // console.log($(this).index());
            $('.workoutSettingName').text($(this).text());
            }
        });
        $(".workoutbody").on({
            click : function(){
                // console.log($(this));
                // console.log($(this).position());
                // console.log($(this).index());
            $('.workoutSettingName').text($(this).text());
            }
        });
        $(".workoutaerobic").on({
            click : function(){
                // console.log($(this));
                // console.log($(this).position());
                // console.log($(this).index());
            $('.workoutSettingName').text($(this).text());
            }
        });

        // 루틴요일 클릭 이벤트 - 요일 
        // $(".routine_daySelect").change(function(){
        //     if($(".addworkoutDay").html() =="요일"){
        //     $(".addworkoutDay").html($(".routine_daySelect").val());
        //     // console.log("확인용"+$(".routine_daySelect").val());
        //     }

        // });
        // show -요일 - 부위 -선택부위를 true,faluse로 알아냄 *중요*
        var partArray = [false,false,false,false,false,false,false,false];
        $(".taget_value").click(function(){
			var $tagetValueThis = $(this);
            var partBtnIndex = 0;
            for(var i = 0; i<$(".taget_value").length; i++){
                if($(".taget_value").eq(i)[0]==$(this)[0]){  //왜 .eq(i)[0] 이렇게 써야하는지 .eq(i)로 비교하면 안되는지
                    partBtnIndex = i;
/* 		            console.log($(".taget_value").eq(i)[0]);
		            console.log($(this)[0]);
		            console.log("파트어레이1"+!($(partArray)[partBtnIndex])); */

                }
            }
            partArray[partBtnIndex] = !partArray[partBtnIndex];
            /* console.log("파트어레이2"+$(partArray)[1]); */
            
            
            //부위 선택 
           
       	   	$.ajax({
       	   		url:"exerciseread",
       	   		type:"post",
       	   		dataType: 'json',
       	   		data:{tagetValue:$(this).val()},
       	   		success: function(result) {
       				console.log("부위에이작스 성공시");
       				/* console.log(result); */
       				/* console.log($(this)[0]);
       				console.log($(partArray).eq(0)[0]);
       				console.log($(partArray).length); */
       				var exerciseNameEqual = false;
       				var workoutAllListLength = $('.workout_AllList p').length;
       				// 운동 추가 
       				for(var i=0; i<result.length; i++){
       					if(workoutAllListLength  == 0) {
       						$('.workout_AllList').append('<p>'+result[i].exerciseName+'</p>');
       					} else {
	       					for(var j=0; j<workoutAllListLength;j++){
		       					if(result[i].exerciseName == $('.workout_AllList p').eq(j).text()){
		       						exerciseNameEqual = true;
		       					}
	       					}// 중복으로 클릭시 해당부위의 운동종목이 없다면 추가함
	       					if(exerciseNameEqual == false) {
	       						$('.workout_AllList').append('<p>'+result[i].exerciseName+'</p>');
	       					}
       					}
       				}
       				// 운동 중복 제거 
       				var deleteTempIndex = -1;
       			 	for(var k =0; k<partArray.length;k++){
 				 		if($(".taget_value").eq(k)[0] ==$tagetValueThis[0]){
 				 			deleteTempIndex = k;
				 		} 
					}
       			 	if(partArray[deleteTempIndex] == false) {  
	       			 	for(var i=0; i<result.length; i++) {
		       			 	for(var j=0; j<$('.workout_AllList p').length;j++){
		       					if(result[i].exerciseName == $('.workout_AllList p').eq(j).text()){
		       						$('.workout_AllList p').eq(j).remove();
		       						break;
		       					}
	       					}
	       			 	}
       			 	}
       			 	// 추가된 p태그에 이벤트 걸기
       			 	$(".workout_AllList p").off('click');
	       			$(".workout_AllList p").on({
	       	            click : function(){
	       	                // console.log($(this));
	       	                // console.log($(this).position());
	       	                // console.log($(this).index());
	       	            $('.workoutSettingName').text($(this).text());
	       	            }
	       	       });
       			 	
       			}
       	   	});
        	
        });
        
        
        // show -요일 - 부위 -위를 토대로 선택부위를 보여줌
        // 추가버튼 클릭 이벤트 - 요일, - 추가된 운동명
        $(".workout_inputBtn").on("click",function(){
/*             console.log($(".routine_daySelect").val());
            console.log(partArray);
            console.log($(".taget_value")[0]); */
            if($(".routine_daySelect").val()=="none" && $(".dayroutine_daySelect").val()=="none"){
                alert("일자/요일을 선택해주세요");
                return;
            }

 
            var arrayLength = $(".workoutSettingTr").length;
/*             console.log($(".workoutSettingTr").length); */
            var chkEqualDay = true;
            var dayTemp = -1;
            if($(".addworkoutAllDiv").length ==0){
                $(".addworkoutTitle").after('<div class="addworkoutAllDiv" name="addworkoutAllDiv"></div>');
                $(".addworkoutAllDiv").append('<div class="addworkoutAllDivTop" name="addworkoutAllDivTop"></div>');
            }else{
                for(var i = 0; i < $(".addworkoutAllDiv").length; i++) {
                    if($(".addworkoutDay").eq(i).text() == $(".routine_daySelect").val()) {
                        chkEqualDay = false;
                        dayTemp = i;
                    }
                }
                if(chkEqualDay) {
                    $('.addworkoutDiv').eq($('.addworkoutDiv').length-1).after('<div class="addworkoutAllDiv name="addworkoutAllDiv""><div class="addworkoutAllDivTop" name="addworkoutAllDivTop"></div></div>');
                }
            }
            if($(".dayroutine_daySelect").val()=="none"){ //요일
                if(chkEqualDay) {
                    $(".addworkoutAllDivTop").eq($(".addworkoutAllDivTop").length-1).append('<div class="addworkoutDay" name="addworkoutDay">'+($(".routine_weekSelect").val())+'&nbsp;'+'&nbsp;'+'&nbsp;'+($(".routine_daySelect").val())+'</div>');
                 	// 주차 인풋생성 및 담기
                    $('.addworkoutAllDivTop').eq($(".addworkoutAllDivTop").length-1).append('<input class=addworkoutDayweekinput name="addworkoutDayweekinput"></input>');
                    $('.addworkoutDayweekinput').eq($(".addworkoutAllDivTop").length-1).val($(".routine_weekSelect").val());
                 	// 요일 인풋생성 및 담기
                    $('.addworkoutAllDivTop').eq($(".addworkoutAllDivTop").length-1).append('<input class=addworkDayinput name="addworkDay"></input>');
                    $('.addworkDayinput').eq($(".addworkoutAllDivTop").length-1).val($(".routine_daySelect").val());
                }
            }else if($(".routine_daySelect").val()=="none"){ //1,2,3day
                $(".addworkoutAllDivTop").eq($(".addworkoutAllDivTop").length-1).append('<div class="addworkoutDay" name="addworkoutDay">'+($(".dayroutine_daySelect").val())+'</div>');
             	// day 인풋생성 및 담기
                $('.addworkoutAllDivTop').eq($(".addworkoutAllDivTop").length-1).append('<input class=addworkoutDayinput name="addworkoutoneDay"></input>');
                $('.addworkoutDayinput').eq($(".addworkoutAllDivTop").length-1).val($(".dayroutine_daySelect").val());
            }
            
            if(chkEqualDay) {
                for(var i = 0; i < partArray.length; i++){
                    if(partArray[i]){
                        $(".addworkoutAllDivTop").eq($(".addworkoutAllDivTop").length-1).append('<div class="addworkoutPart" name="addworkoutPart">'+($(".taget_value").eq(i).text())+'</div>');
                    }
                }
                $(".addworkoutAllDivTop").eq($(".addworkoutAllDivTop").length-1).after('<div class="addworkoutDiv" name="addworkoutDiv"><table class="addworkoutTable" name="addworkoutTable"></table></div>');
            } else {
                var $divTopPark = $(".addworkoutAllDivTop").eq(dayTemp).children('.addworkoutPart');
                for(var i = 0; i < partArray.length; i++){
                    if(partArray[i]){
                        for(var j = 0; j < $divTopPark.length; j++) {
                            if($divTopPark.eq(j).text() != $(".taget_value").eq(i).text()) {
                                $(".addworkoutAllDivTop").eq(dayTemp).append('<div class="addworkoutPart" name="addworkoutPart">'+($(".taget_value").eq(i).text())+'</div>');
                            }
                        }
                    }
                }
            }
            if(dayTemp == -1) {
                var prevTrLength = $(".addworkoutTr").length;
                for(var i = 0; i < arrayLength; i++) {
                    $('.addworkoutTable').eq($(".addworkoutTable").length-1).append('<tr class="addworkoutTr" name="addworkoutTr"></tr>');
                    $('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutname" name="addworkoutname">'+($(".workoutSettingName").eq(i).text())+'</td>');                 
                    $('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutweight" name="addworkoutweight">'+($(".workoutSettingWeight").eq(i).val())+'</td>');
                    $('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutsettingname" name="addworkoutsettingname">'+($(".workoutSettingNumber").eq(i).val())+'</td>');
                    $('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutset" name="addworkoutset">'+(i+1)+'세트</td>');
                    // 운동명 인풋생성 및 담기
                    $('.addworkoutTr').eq(prevTrLength+i).append('<input class=addworkoutnameinput name="addworkoutname"></input>');
                    $('.addworkoutnameinput').eq(prevTrLength+i).val($(".workoutSettingName").eq(i).text());
                    // 무게 인풋생성 및 담기
                    $('.addworkoutTr').eq(prevTrLength+i).append('<input class=addworkoutweightinput name="addworkoutweight"></input>');
                    $('.addworkoutweightinput').eq(prevTrLength+i).val($(".workoutSettingWeight").eq(i).val());
                    // 횟수 인풋생성 및 담기
                    $('.addworkoutTr').eq(prevTrLength+i).append('<input class=addworkoutsettingnameinput name="addworkoutsettingname"></input>');
                    $('.addworkoutsettingnameinput').eq(prevTrLength+i).val($(".workoutSettingNumber").eq(i).val());
                    // 세트 인풋생성 및 담기
                    $('.addworkoutTr').eq(prevTrLength+i).append('<input class=addworkoutsetinput name="addworkoutset"></input>');
                    $('.addworkoutsetinput').eq(prevTrLength+i).val((i+1)+"세트");
                    //$('.Btn_cancel_inset').after('<input type="text" value="" class="routineAllData" name="routineAllData">');
                }
            } else {
                console.log("여기????");
                var prevTrLength = $('.addworkoutTable').eq(dayTemp).children('.addworkoutTr').length;
/*                 console.log(prevTrLength); */
                for(var i = 0; i < arrayLength; i++) {
                    $('.addworkoutTable').eq(dayTemp).append('<tr class="addworkoutTr"></tr>');
                    $('.addworkoutTable').eq(dayTemp).children('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutname" name="addworkoutname">'+($(".workoutSettingName").eq(i).text())+'</td>');
                    $('.addworkoutTable').eq(dayTemp).children('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutweight" name="addworkoutweight">'+($(".workoutSettingWeight").eq(i).val())+'</td>');
                    $('.addworkoutTable').eq(dayTemp).children('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutsettingname" name="addworkoutsettingname">'+($(".workoutSettingNumber").eq(i).val())+'</td>');
                    $('.addworkoutTable').eq(dayTemp).children('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutset" name="addworkoutset">'+(i+1)+'세트</td>');
                    // 운동명 인풋생성 및 담기
                    $('.addworkoutTr').eq(dayTemp).append('<input class=addworkoutnameinput name="addworkoutname"></input>');
                    $('.addworkoutnameinput').eq(dayTemp).val($(".workoutSettingName").eq(i).text());
                    // 무게 인풋생성 및 담기
                    $('.addworkoutTr').eq(dayTemp).append('<input class=addworkoutweightinput name="addworkoutweight"></input>');
                    $('.addworkoutweightinput').eq(dayTemp).val($(".workoutSettingWeight").eq(i).val());
                 	// 횟수 인풋생성 및 담기
                    $('.addworkoutTr').eq(dayTemp).append('<input class=addworkoutsettingnameinput name="addworkoutsettingname"></input>');
                    $('.addworkoutsettingnameinput').eq(dayTemp).val($(".workoutSettingNumber").eq(i).val());
                    // 세트 인풋생성 및 담기
                    $('.addworkoutTr').eq(dayTemp).append('<input class=addworkoutsetinput name="addworkoutset"></input>');
                    $('.addworkoutsetinput').eq(dayTemp).val((i+1)+"세트");
                    //$('.Btn_cancel_inset').after('<input type="text" value="" class="routineAllData" name="routineAllData">');
                }
            }
/*             	// 운동이름 담을 인풋박스 만들기
                $('.addworkoutname').eq($('.addworkoutname').length-1).append('<input class="addworkoutnameinput" name="addworkoutname"></input>');
	            // 운동이름 담기
	            $(".addworkoutnameinput").val($('.addworkoutname').eq(0).text()); */
/*             console.log($("#count_settime").eq(0).val());
            console.log($(".addworkoutAllDiv").text()); */

            console.log('운동이름'+$(".addworkoutname").eq(0).text());
            console.log('운동부위'+$(".addworkoutPart").text());
            console.log('운동무게'+$(".addworkoutweight").text());
            console.log('운동횟수'+$(".addworkoutsettingname").text());
            console.log('운동세트'+$(".addworkoutset").text());
            console.log("시리얼"+$('.routineForm').serialize());

            
            
            
/*             console.log($(".routineAllData").val()); //배열로 들어옴 */

            // 루틴생성정보담기
/*             for(var j =0; j < arrayLength; j++){
                $(".routineAllData").eq(j).val($(".addworkoutname").text());
                $(".routineAllData").eq(j+1).val($(".addworkoutset").text());
            }; */


            // 시간초기화
            $("#count_settime").val("0초");
            $("#count_settime2").val("0초");
			
            //무게 및 횟수 초기화
            $(".workoutSettingWeight").val("0kg");
            $(".workoutSettingNumber").val("0회");
            
            for(var i = 0;i<arrayLength - 1;i++){
                //tr 삭제
                count3("minus3");
                $(".workoutSettingTr").eq(length).remove();
            }
            $(".workoutSettingName").text('운동명');
            return;
        });


        $("#routineinsertBtn").on("click",function(){
            if($(".addworkoutTable").length == 0){
                alert("추가된 운동이 없습니다.");
            } 
        });
        
        console.log("div네임");

        var name_by_class = $('div[name="addworkoutname"]');
        console.log("네임으로가져옴"+name_by_class);

        var aWN = $(".addworkoutname").attr('name');
        
        
        
    	// form  serialize()
    	function formSubmit() {
    	    var params = $('.routineForm').serialize();
    	    console.log(params);
    	     $.ajax({
    	    	url: "routineinsert.a",
    	    	type: "post",
    	    	data: params,
    	    	success:function(result){
    	    		console.log(result);
    	    		alert("루틴이 생성되었습니다.");
    	    	},
    	    	error:{
    	    		
    	    	}
    	   	});
    	    
    	}
    	
        //세트삭제
        $(".set_timedawn3").on("click",function(){
            //console.log("test =");
            var str = $("#count_settime3").val();
            //console.log("test =" + str);
            var num = str.replace(/[^0-9]/g,'');
            //console.log("num ="+num)
            if(num > 0){
                $(".workoutSettingTr").eq(length + 1).remove();
            }
            // if(num > 1){
            // $(".workoutSettingTr").eq(length - 1).after($(".workoutSettingTr").eq(length - 1).remove());
            // }
        });

    </script>
</body>
</html>